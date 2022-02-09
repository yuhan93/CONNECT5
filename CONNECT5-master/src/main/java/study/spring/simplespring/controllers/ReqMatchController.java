package study.spring.simplespring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import study.spring.simplespring.helper.RegexHelper;
import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.ReqMatch;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.ReqMatchService;
import study.spring.simplespring.service.UserService;

@Controller
public class ReqMatchController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	UserService userService;

	@Autowired
	ReqMatchService reqMatchService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	@ResponseBody
	@RequestMapping(value = "/_admin/searchAdmin_ok.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String searchAdminOk() {
		String start = webHelper.getString("start");

		User input1 = new User();
		input1.setStart(start);

		// 조회결과를 저장할 객체 선언
		List<User> output1 = null;

		try {
			// 데이터 조회
			output1 = userService.getreqUserList(input1);
		} catch (Exception e) {
			System.out.println("에러발생");
		}

		Gson gson = new Gson();
		return gson.toJson(output1);
	}

	@ResponseBody
	@RequestMapping(value = "/_admin/sucModal_ok.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String sucModalOk() {
		String start = webHelper.getString("start");

		User input = new User();
		input.setStart(start);

		// 조회결과를 저장할 객체 선언
		List<User> output = null;

		try {
			// 데이터 조회
			output = userService.getsucUserList(input);
		} catch (Exception e) {
			System.out.println("에러발생");
		}

		Gson gson = new Gson();
		return gson.toJson(output);
	}

	
	// 인연 찾기 컨트롤러 (Ajax에서 날짜를 받은 후 날짜 값을  User에 넣고 해당 날짜 값을 가진 User를 추출한다. 추출한 User List를 Json으로 변환 후 Ajax로 넘긴다.)
	@ResponseBody
	@RequestMapping(value = "/_mypage/search_ok.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String searchOk() {
		User loginInfo = (User) webHelper.getSession("loginInfo");
		int member_lv = loginInfo.getMember_Lv();
		int reqSpService = loginInfo.getReqSpService();

		String start = webHelper.getString("start");

		User input1 = new User();
		input1.setStart(start);
		input1.setMember_Lv(member_lv);
		input1.setReqSpService(reqSpService);

		// 조회결과를 저장할 객체 선언
		List<User> output1 = null;

		if (member_lv == 1) {
			if (reqSpService == 1) {
				try {
					// 데이터 조회
					output1 = userService.getreqUserList1_1(input1);
				} catch (Exception e) {
					System.out.println("에러발생1_1");
				}
			}
			try {
				// 데이터 조회
				output1 = userService.getreqUserList1(input1);
			} catch (Exception e) {
				System.out.println("에러발생1");
			}
		} else if (member_lv == 2) {
			if (reqSpService == 1) {
				try {
					// 데이터 조회
					output1 = userService.getreqUserList2_1(input1);
				} catch (Exception e) {
					System.out.println("에러발생2_1");
				}
			}
			try {
				// 데이터 조회
				output1 = userService.getreqUserList2(input1);
			} catch (Exception e) {
				System.out.println("에러발생2");
			}
		} else if (member_lv == 3) {
			if (reqSpService == 1) {
				try {
					// 데이터 조회
					output1 = userService.getreqUserList3_1(input1);
				} catch (Exception e) {
					System.out.println("에러발생3_1");
				}
			}
			try {
				// 데이터 조회
				output1 = userService.getreqUserList3(input1);
			} catch (Exception e) {
				System.out.println("에러발생3");
			}
		} else {
			try {
				// 데이터 조회
				output1 = userService.getreqUserList4(input1);
			} catch (Exception e) {
				System.out.println("에러발생4");
			}
		}

		Gson gson = new Gson();
		return gson.toJson(output1);
	}
	// -------------------------------------------------------------------------------------------------
	
	// datepicker 컨트롤러 
	@RequestMapping(value = "/_mypage/searchDateOpen_SE.do", method = RequestMethod.GET)
	public ModelAndView dateOpen(Model model) {

		int ReqSpService = webHelper.getInt("ReqSpService");

		model.addAttribute("ReqSpService", ReqSpService);

		return new ModelAndView("_mypage/searchDateRequest_SE");
	}
	//----------------------------------------------------------------------------
	
	
	// 인연찾기 컨트롤러 (datepicker 에서 선택 한 날짜 addOk)
	@RequestMapping(value = "/_mypage/searchDateRequest_SE.do", method = RequestMethod.GET)
	public ModelAndView dateReq(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");

		loginInfo.setIsSpUser(1);
		webHelper.setSession("loginInfo", loginInfo);

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		int MemberId = loginInfo.getMemberId();
		String start = webHelper.getString("start");
		String Select_Date = webHelper.getString("Select_Date");
		int isSpUser = loginInfo.getIsSpUser();
		int ReqSpService = webHelper.getInt("ReqSpService");

		User input1 = new User();
		input1.setIsSpUser(isSpUser);
		input1.setMemberId(MemberId);

		ReqMatch input = new ReqMatch();
		input.setMemberId(MemberId);
		input.setStart(start);
		input.setSelect_Date(Select_Date);
		input.setReqSpService(ReqSpService);

		try {
			reqMatchService.addReqMatch(input);
			userService.editreqMatch_User(input1);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		if (ReqSpService == 1) {
			try {
				reqMatchService.editReqSpService(input);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}

		String redirectUrl = contextPath + "/_mypage/searchview_SE.do?start=" + input.getStart();
		return webHelper.redirect(redirectUrl, input.getStart() + " 선택 하셨습니다. ");
	}
	//-----------------------------------------------------------------------------
	
	
	// 인연 찾기 컨트롤러 view (선택 날짜 확인)
	@RequestMapping(value = "/_mypage/searchview_SE.do", method = RequestMethod.GET)
	public ModelAndView reqConfirm(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		int MemberId = loginInfo.getMemberId();
		int member_lv = loginInfo.getMember_Lv();
		int reqSpService = loginInfo.getReqSpService();

		ReqMatch input = new ReqMatch();
		input.setMemberId(MemberId);
		input.setReqSpService(reqSpService);

		List<ReqMatch> output = null;

		if (member_lv == 1) {
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

		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("jsonList", jsonList);
		return new ModelAndView("_mypage/searchview_SE");
	}
	//-----------------------------------------------------------------------------
	
	
	// 인연찾기 컨트롤러 상대방(OtherMember) 상세보기
	@RequestMapping(value = "/_mypage/searchRequestConfirm_SE.do", method = RequestMethod.GET)
	public ModelAndView confirm(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		int MemberId = webHelper.getInt("MemberId");
		int Gender = webHelper.getInt("Gender");
		String Style = webHelper.getString("Style");
		String Personality = webHelper.getString("Personality");
		String BirthDate = webHelper.getString("BirthDate");
		String Sal_Annual = webHelper.getString("Sal_Annual");
		String UserName = webHelper.getString("UserName");
		String User_Img = webHelper.getString("User_Img");

		User input = new User();
		input.setMemberId(MemberId);
		input.setStyle(Style);
		input.setSal_Annual(Sal_Annual);
		input.setPersonality(Personality);
		input.setGender(Gender);
		input.setBirthDate(BirthDate);
		input.setUserName(UserName);
		input.setUser_Img(User_Img);

		User output = null;

		try {
			output = userService.getUserItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);
		return new ModelAndView("_mypage/searchRequestConfirm_SE");
	}
	//------------------------------------------------------------------------------------------
	

	@ResponseBody
	@RequestMapping(value = "/_Reqdate.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String reqdate(Model model) {

		int memberid = webHelper.getInt("MemberId");

		User input = new User();
		User output = null;

		input.setMemberId(memberid);

		try {
			output = userService.getUserItem(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("output = " + output);
		model.addAttribute("output", output);

		Gson gson = new Gson();

		return gson.toJson(output);
	}

}