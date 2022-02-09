package study.spring.simplespring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import study.spring.simplespring.helper.RegexHelper;
import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.Manager;
import study.spring.simplespring.model.ReqMatch;
import study.spring.simplespring.model.SucMatch;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.ManagerService;
import study.spring.simplespring.service.ReqMatchService;
import study.spring.simplespring.service.SucMatchService;
import study.spring.simplespring.service.UserService;

@Controller
public class SucMatchController {
   
   @Autowired
   WebHelper webHelper;

   @Autowired
   RegexHelper regexHelper;

   @Autowired
   UserService userService;

   @Autowired
   ReqMatchService reqMatchService;

   @Autowired
   SucMatchService sucMatchService;
   
   @Autowired
   ManagerService managerService;

   @Value("#{servletContext.contextPath}")
   String contextPath;
   
   // 인연찾기 컨트롤러 (달력)
   @RequestMapping(value = "/_mypage/search_SE.do", method = RequestMethod.GET)
   public ModelAndView Searchview(Model model) {
      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }
      if (loginInfo == null) {
         String redirectUrl = contextPath + "/_login/login_HG.do";
         return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
      }
      
      // 상대방 MemberId searchRequestConfirm_SE 에서 던져줬음
      int otherMemberId = webHelper.getInt("MemberId");
      
      // 상대방 MemberId 가 0 이 아닐때만 이 로직이 실행되야 함
      if (otherMemberId == loginInfo.getMemberId()){
         String redirectUrl = contextPath + "/_mypage/searchview_SE.do";
         return webHelper.redirect(redirectUrl,"인연을 다시 찾아주세요."+ loginInfo.getUserName() + "님 과 데이트 할 수 없어요!");
      }

      if (otherMemberId != 0) {
         // User에 otherUser 객체 만든 후 상대방 MemberId 넣어줌
         User otherUser = new User();
         otherUser.setMemberId(otherMemberId);
         
         int userGender = loginInfo.getGender();
         
         int otherGender = 0;
         
         try {
            otherGender = userService.selectGender(otherUser);
         } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
         }
         
         if (userGender == otherGender) {
            String redirectUrl = contextPath + "/_mypage/search_SE.do";
            return webHelper.redirect(redirectUrl,"인연을 다시 찾아주세요. 동성과는 데이트 할 수 없어요!");
         }
         
         int Date_Rest = loginInfo.getDate_Rest();
         loginInfo.setDate_Rest(Date_Rest - 1);
         int MemberId = loginInfo.getMemberId();
         
         User input = new User();
         input.getDate_Rest();
         input.setMemberId(MemberId);
         
         try {
            userService.editUserSucMatch(input);
         } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
         }
         
         
         // SucMatch DB 에 유저에서 객체 만들어서 넣어야 하니까 상대방 MemberId 와 내꺼 MemberId 넣어줌
         SucMatch sucMatch = new SucMatch();
         sucMatch.setMemberId(loginInfo.getMemberId());
         sucMatch.setOtherMemberId(otherUser.getMemberId());

         // ReqMatchId 가 없기 때문에 ReqMatch 객체 하나 더 만들어서
         // 내가 데이트 신청하는 날짜는
         // 상대방의 등록한 날짜 이기 때문에 상대방 ReqMatchId 를 가져오고
         // 내가 그사람 한테 신청 한거기 때문에 ReqMatch는 otherMemberId 를 가져와서 add 한것
         ReqMatch reqMatch = new ReqMatch();
         reqMatch.setMemberId(otherMemberId);
         
         try {
            // ReqMatch 를 검색해서 상대방 ReqMatchId SucMatch 테이블에 ReqMatchId 에 넣어줌
            reqMatch = reqMatchService.getReqMatchItem(reqMatch);
            sucMatch.setReqMatchId(reqMatch.getReqMatchId());

            // 클릭한 사람의 MemberId가 넘어왔을시에 본인의 MemberId와 상대방의 MemberId를 SucMatch 테이블에 저장
            sucMatchService.addSucMatch(sucMatch);
         } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
         }
         // 신청이 완료 되면 MyPage에 MyInfo 페이지로 이동
         String redirectUrl = contextPath + "/_mypage/myInfo_GD.do?MemberId=" + loginInfo.getMemberId();
         return webHelper.redirect(redirectUrl, "신청이 완료 되었습니다.");
      }
      
      int isSpUser = loginInfo.getIsSpUser();
      int MemberId = loginInfo.getMemberId();
      String name = (String) loginInfo.getUserName();
      Integer date_rest = (Integer) loginInfo.getDate_Rest();
      int member_lv = loginInfo.getMember_Lv();
      int reqSpService = loginInfo.getReqSpService();
   
      /** 데이터 조회하기 */
      // 데이터 조회에 필요한 조건값을 Beans에 저장하기
      ReqMatch input = new ReqMatch();
      input.setMemberId(MemberId);
      input.setReqSpService(reqSpService);

      // 조회결과를 저장할 객체 선언
      List<ReqMatch> output = null;
      if (member_lv == 0) {
         String redirectUrl = contextPath + "/_payment/mustInput_SE.do";
         return webHelper.redirect(redirectUrl,"정회원만 이용 가능 합니다.");
      } else if (member_lv == 1) {
         if (reqSpService == 1) {
            try {
               // 데이터 조회
               output = reqMatchService.getReqMatchList1_1(input);
            } catch (Exception e) {
               System.out.println("에러발생1_1");
            }
         }
         try {
            // 데이터 조회
            output = reqMatchService.getReqMatchList1(input);
         } catch (Exception e) {
            System.out.println("에러발생1");
         }
      } else if (member_lv == 2) {
         if (reqSpService == 1) {
            try {
               // 데이터 조회
               output = reqMatchService.getReqMatchList2_1(input);
            } catch (Exception e) {
               System.out.println("에러발생2_1");
            }
         }
         try {
            // 데이터 조회
            output = reqMatchService.getReqMatchList2(input);
         } catch (Exception e) {
            System.out.println("에러발생2");
         }
      } else if (member_lv == 3) {
         if (reqSpService == 1) {
            try {
               // 데이터 조회
               output = reqMatchService.getReqMatchList3_1(input);
            } catch (Exception e) {
               System.out.println("에러발생3_1");
            }
         }
         try {
            // 데이터 조회
            output = reqMatchService.getReqMatchList3(input);
         } catch (Exception e) {
            System.out.println("에러발생3");
         }
      } else {
         try {
            // 데이터 조회
            output = reqMatchService.getReqMatchList4(input);
         } catch (Exception e) {
            System.out.println("에러발생4");
         }
      }

      Gson gson = new Gson();
      String jsonList = gson.toJson(output);

      ReqMatch output2 = null;

      if (isSpUser == 1) {
         try {
            // 데이터 조회
            output2 = reqMatchService.getReqMatchItem(input);

         } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
         }

         String redirectUrl = contextPath + "/_mypage/searchview_SE.do?Start=" + output2.getStart();
         return webHelper.redirect(redirectUrl, " 선택한 날짜가 있네요! 확인해보세요! ");
      }

      /** 3) View 처리 */
      model.addAttribute("output", output);
      model.addAttribute("jsonList", jsonList);
      model.addAttribute("username", name);
      model.addAttribute("date_rest", date_rest);
      model.addAttribute("member_lv", member_lv);

      return new ModelAndView("_mypage/search_SE");
   }
   //------------------------------------------------------------------------------------
   
   
   // My 현황 컨트롤러 
   @RequestMapping(value = "/_mypage/myInfo_GD.do", method = RequestMethod.GET)
   public ModelAndView myinfo(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");
      List<Manager> managerList = null;
      

      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      if (loginInfo == null) {
         String redirectUrl = contextPath + "/_login/login_HG.do";
         return webHelper.redirect(redirectUrl, "로그인후 이용 하실수 있습니다.");
      } 
      
         String name = (String) loginInfo.getUserName();
         Integer memberid = (Integer) loginInfo.getMemberId();
         Integer date_rest = (Integer) loginInfo.getDate_Rest();
         Integer memberlv = (Integer) loginInfo.getMember_Lv();
         Integer managerid = (Integer) loginInfo.getManagerId();

         model.addAttribute("username", name);
         model.addAttribute("date_rest", date_rest);
         model.addAttribute("memberlv", memberlv);
         model.addAttribute("managerid", managerid);
         
         ReqMatch reqmatch = new ReqMatch();
         SucMatch sucmatch = new SucMatch();
         
         
         SucMatch suc1 = null;
         List<SucMatch> suc0 = null;
         List<SucMatch> sucuser = null;
         ReqMatch requser = null;   
   
      try {
      
         managerList = managerService.getManagerList(null);
         
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

         reqmatch.setMemberId(memberid);
         sucmatch.setMemberId(memberid);
         
         try {
            suc1 = sucMatchService.getSucMatchItemStatus(sucmatch);
         } catch (Exception e) {
            e.printStackTrace();
         }
         try {
            requser = reqMatchService.getReqMatchItem(reqmatch);
         } catch (Exception e) {
            e.printStackTrace();
         }
         try {
            sucuser = sucMatchService.getSucMatchList(sucmatch);
         } catch (Exception e) {
            e.printStackTrace();
         }
         
            try {
               suc0 = sucMatchService.getSucMatchItemStatus0(sucmatch);
            } catch (Exception e) {
               e.printStackTrace();
            }
         
            model.addAttribute("requser", requser);
            model.addAttribute("sucuser",sucuser);
            model.addAttribute("suc1", suc1);
            model.addAttribute("suc0", suc0);
            model.addAttribute("memberid", memberid);
         
            
            System.out.println("suc1 = " + suc1);
            System.out.println("req = " + requser);
            System.out.println("suc = "+sucuser);
            System.out.println("suc0 = "+suc0);
      
            model.addAttribute("managerList", managerList);
            
      return new ModelAndView("_mypage/myInfo_GD");
   }
   //------------------------------------------------------------------------------
   
   
   // My현황 컨트롤러 (데이트 신청 수락 버튼 클릭)
   @RequestMapping(value = "/_mypage/DateConfirm.do", method = RequestMethod.GET)
   public ModelAndView dateconfirm(Model model) {
      
      
      User loginInfo = (User) webHelper.getSession("loginInfo");
      
      SucMatch sucmatch = new SucMatch();
      
      
      int Date_Rest = loginInfo.getDate_Rest();
      loginInfo.setDate_Rest(Date_Rest - 1);
      if(Date_Rest <=  0) {
         return webHelper.redirect(contextPath + "/_mypage/myInfo_GD.do", "잔여 횟수가 부족합니다.");
         
      }
      
      User user = new User();
      int memberid = loginInfo.getMemberId();
      
      int sucmatchid = webHelper.getInt("SucMatchId");
      
      sucmatch.setSucMatchId(sucmatchid);
      sucmatch.setMemberId(memberid);
      user.setMemberId(memberid);
            
      try {
         sucMatchService.editSucMatch(sucmatch);
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      try {
         userService.editUserRest(user);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      return webHelper.redirect(contextPath + "/_mypage/myInfo_GD.do", "매칭이 성사 되었습니다.");
   }
   //------------------------------------------------------------------------------
   
   // 인연 찾기 컨트롤러 (신청취소) DeleteOk
   @RequestMapping(value = "/_mypage/deleteOk.do", method = RequestMethod.GET)
	public ModelAndView ex(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		int MemberId = loginInfo.getMemberId();
		int isSpUser = loginInfo.getIsSpUser();
		int ReqMatchId = webHelper.getInt("ReqMatchId");

		ReqMatch input = new ReqMatch();
		input.setMemberId(MemberId);
		input.setReqMatchId(ReqMatchId);

		ReqMatch output = null;

		User input1 = new User();
		input1.setMemberId(MemberId);
		input1.setIsSpUser(isSpUser);

		if (isSpUser == 1) {
			try {
				// 데이터 조회
				output = reqMatchService.getReqMatchItem(input);
				if (output.getReqMatchId() != 0) {

					loginInfo.setIsSpUser(0);
					webHelper.setSession("loginInfo", loginInfo);

					try {
						// 데이터 삭제
						userService.editreqMatch_isSpUserupdateUser(input1);
						reqMatchService.deleteReqMatch(output);
					} catch (Exception e) {
						return webHelper.redirect(null, e.getLocalizedMessage());
					}

					return webHelper.redirect(contextPath + "/_mypage/search_SE.do", "데이트 신청 날짜가 취소 되었습니다.");

				}
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}

		return webHelper.redirect(contextPath + "/_mypage/search_SE.do", "신청 취소 되었습니다.");
	}
   //-----------------------------------------------------------------------------------------------
   
   
   // My 현황 컨트롤러 (데이트 신청 거절 버튼 클릭)
   @RequestMapping(value = "/_mypage/DateConfirm1.do", method = RequestMethod.GET)
   public ModelAndView datecancel(Model model) {
      
      
      User loginInfo = (User) webHelper.getSession("loginInfo");
      
      SucMatch sucmatch = new SucMatch();
      

      int memberid = loginInfo.getMemberId();
      
      int sucmatchid = webHelper.getInt("SucMatchId");
      
      User user = new User();
      int pmemberid = webHelper.getInt("MemberId");

      sucmatch.setSucMatchId(sucmatchid);
      user.setMemberId(pmemberid);
      sucmatch.setMemberId(memberid);
            
      try {
         sucMatchService.editSucMatch1(sucmatch);

      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      try {
         userService.editUserRestUp(user);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      return webHelper.redirect(contextPath + "/_mypage/myInfo_GD.do", "데이트 신청을 거절 하셨습니다.");
   }
   //-----------------------------------------------------------------------------------
   
   
   // My현황 컨트롤러 (상대방 Modal에서 데이트 취소 버튼 클릭)
   @RequestMapping(value = "/_mypage/DateConfirm2.do", method = RequestMethod.GET)
   public ModelAndView datecancel1(Model model) {
      
      
      User loginInfo = (User) webHelper.getSession("loginInfo");
      
      SucMatch sucmatch = new SucMatch();
      
      int Date_Rest = loginInfo.getDate_Rest();
      loginInfo.setDate_Rest(Date_Rest + 1);
      
      User user = new User();
      
      int memberid = loginInfo.getMemberId();
      
      int sucmatchid = webHelper.getInt("SucMatchId");
      int pmemberid = webHelper.getInt("MemberId");
      
      user.setMemberId(pmemberid);
      sucmatch.setSucMatchId(sucmatchid);
      sucmatch.setMemberId(memberid);
           
      try {
         sucMatchService.editSucMatch1(sucmatch);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      try {
         userService.editUserRestUp(user);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return webHelper.redirect(contextPath + "/_mypage/myInfo_GD.do", "데이트 일정이 취소 되셨습니다.");
   }
   //----------------------------------------------------------------------------------

}