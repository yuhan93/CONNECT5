package study.spring.simplespring.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import study.spring.simplespring.helper.MailHelper;
import study.spring.simplespring.helper.RegexHelper;
import study.spring.simplespring.helper.UploadItem;
import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.UserService;

@Controller
public class UserController {
   @Autowired
   WebHelper webHelper;

   @Autowired
   RegexHelper regexHelper;

   @Autowired
   MailHelper mailHelper;

   @Autowired
   UserService userService;

   @Value("#{servletContext.contextPath}")
   String contextPath;

   // 정회원 필수 입력 항목 컨트롤러
   @RequestMapping(value = "/_payment/mustInput_SE.do", method = RequestMethod.GET)
   public ModelAndView mustinput(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo == null) {
         String redirectUrl = contextPath + "/_login/login_HG.do";
         return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
      }
      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      Integer memberlv = (Integer) loginInfo.getMember_Lv();

      if (memberlv != 0) {
         String redirectUrl = contextPath + "/_payment/payment_GD.do";
         return webHelper.redirect(redirectUrl, "결제페이지로 이동합니다.");
      } else if (memberlv == 0) {
         return new ModelAndView("_payment/mustInput_SE");
      }
      return new ModelAndView("_payment/mustInput_SE");
   }
   //---------------------------------------------------------------------------------
   
   // 정회원 필수 입력 항목 addOk
   @ResponseBody
   @RequestMapping(value = "/_payment/mustInputok.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
   public ModelAndView mustInputok(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      Integer memberid = (Integer) loginInfo.getMemberId();

      try {
         webHelper.upload();
      } catch (Exception e1) {
         // TODO Auto-generated catch block
         return webHelper.redirect(null, "업로드에 실패");

      }
      List<UploadItem> fileList = webHelper.getFileList();
      Map<String, String> paramMap = webHelper.getParamMap();

      String job = paramMap.get("job");
      String edu_lv = paramMap.get("edu_lv");
      String height = paramMap.get("height");
      String bldtype = paramMap.get("blood");
      String date_loc = paramMap.get("place");
      String personality = paramMap.get("personality");
      String sal_annual = paramMap.get("income");
      String style = paramMap.get("style");

      String user_img = fileList.get(0).getFilePath();

      User input = new User();
      input.setMemberId(memberid);
      input.setJob(job);
      input.setEdu_Lv(edu_lv);
      input.setHeight(height);
      input.setBldType(bldtype);
      input.setDate_Loc(date_loc);
      input.setSal_Annual(sal_annual);
      input.setUser_Img(user_img);
      input.setPersonality(personality);
      input.setStyle(style);

      System.out.println(fileList.size() + "dddd");

      try {
         userService.specialEditUser(input);
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      return new ModelAndView("_payment/payment_GD");
   }
   //----------------------------------------------------------------------------------
   
   
   // 회원탈퇴 컨트롤러 (비밀번호 입력)
   @RequestMapping(value = "/_mypage/withdrawal1_HG.do", method = RequestMethod.GET)
   public ModelAndView withdrawal1(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");
      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      if (loginInfo == null) {
         String redirectUrl = contextPath + "/_login/login_HG.do";
         return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요");
      }
      int MemberId = loginInfo.getMemberId();
      String UserId = loginInfo.getUserId();
      String UserPw = webHelper.getString("UserPw");

      User input = new User();
      input.setMemberId(MemberId);
      input.setUserId(UserId);
      input.setUserPw(UserPw);

      User output = null;

      try {
         output = userService.getUserItem(input);
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      model.addAttribute("output", output);
      return new ModelAndView("_mypage/withdrawal1_HG");
   }
   //------------------------------------------------------------------------
   
   
   // 회원탈퇴 컨트롤러 (회원 탈퇴 사유)
   @RequestMapping(value = "/_mypage/withdrawal1ok_HG.do", method = RequestMethod.POST)
   public ModelAndView withdrawal1ok(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");
      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      if (loginInfo == null) {
         String redirectUrl = contextPath + "/_login/login_HG.do";
         return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요");
      }
      int MemberId = loginInfo.getMemberId();
      String UserId = loginInfo.getUserId();
      String UserPw = webHelper.getString("UserPw");

      User input = new User();
      input.setMemberId(MemberId);
      input.setUserId(UserId);
      input.setUserPw(UserPw);

      User output = null;

      try {
         output = userService.selectLoginInfo(input);
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      model.addAttribute("output", output);
      return new ModelAndView("_mypage/withdrawal2_HG");
   }
   //------------------------------------------------------------------------
   
   
   
   // 회원탈퇴 컨트롤러 DeleteOk
   @RequestMapping(value = "/_mypage/withdrawal2ok_HG.do", method = RequestMethod.POST)
   public ModelAndView withdrawal2ok(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      int MemberId = loginInfo.getMemberId();
      String UserName = loginInfo.getUserName();
      String UserId = loginInfo.getUserId();
      String UserPw = loginInfo.getUserPw();

      if (MemberId == 0) {
         return webHelper.redirect(null, "회원 번호가 없습니다.");
      }

      User input = new User();
      input.setMemberId(MemberId);
      input.setUserName(UserName);
      input.setUserId(UserId);
      input.setUserPw(UserPw);

      webHelper.removeAllSession();
      try {
         userService.deleteUser(input);
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }
      return webHelper.redirect(contextPath + "/home.do", "그 동안 연-결을 이용해 주셔서 감사합니다.");
   }
   //---------------------------------------------------------------------------------
   
   
   // 개인정보수정 컨트롤러 (비밀번호 입력)  
   @RequestMapping(value = "/_mypage/personal_information1_HG.do", method = RequestMethod.GET)
   public ModelAndView personal_information1(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");
      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      if (loginInfo == null) {
         String redirectUrl = contextPath + "/_login/login_HG.do";
         return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요");
      }
      int MemberId = loginInfo.getMemberId();
      String UserId = loginInfo.getUserId();
      String UserPw = webHelper.getString("UserPw");

      User input = new User();
      input.setMemberId(MemberId);
      input.setUserId(UserId);
      input.setUserPw(UserPw);

      User output = null;

      try {
         output = userService.getUserItem(input);
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      model.addAttribute("output", output);

      return new ModelAndView("_mypage/personal_information1_HG");
   }
   //-------------------------------------------------------------------------------------------------
   
   
   // 개인정보수정 컨트롤러 (처음 비밀번호 입력 후 개인정보 수정 입력 페이지)
   @RequestMapping(value = "/_mypage/personal_information1ok_HG.do", method = RequestMethod.POST)
   public ModelAndView personal_information1ok(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");
      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      if (loginInfo == null) {
         String redirectUrl = contextPath + "/_login/login_HG.do";
         return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요");
      }
      int MemberId = loginInfo.getMemberId();
      String UserId = loginInfo.getUserId();
      String UserPw = webHelper.getString("UserPw");

      User input = new User();
      input.setMemberId(MemberId);
      input.setUserId(UserId);
      input.setUserPw(UserPw);

      User output = null;

      try {
         output = userService.selectLoginInfo(input);
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      model.addAttribute("output", output);

      return new ModelAndView("_mypage/personal_information2_HG");
   }
   //-------------------------------------------------------------------------------------------------
   
   
   // 개인정보수정 컨트롤러 editOk (개인정보 수정Ok)
   @ResponseBody
   @RequestMapping(value = "/_mypage/personal_information2ok_HG.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
   public ModelAndView personal_information2ok(Model model) {
      User loginInfo = (User) webHelper.getSession("loginInfo");
      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      try {
         webHelper.upload();
      } catch (Exception e1) {
         return webHelper.redirect(null, "업로드에 실패");

      }

      List<UploadItem> fileList = webHelper.getFileList();
      Map<String, String> paramMap = webHelper.getParamMap();

      int MemberId = loginInfo.getMemberId();
      String UserName = loginInfo.getUserName();
      String UserId = loginInfo.getUserId();
      int Gender = loginInfo.getGender();
      String UserPw = paramMap.get("UserPw");
      String Mobile = paramMap.get("Mobile");
      String TEL = paramMap.get("TEL");
      String Email = paramMap.get("Email");
      String PostCode = paramMap.get("PostCode");
      String BasicAddress = paramMap.get("BasicAddress");
      String StateAddress = paramMap.get("StateAddress");
      String DetailAddress = paramMap.get("DetailAddress");

      String User_Img = fileList.get(0).getFilePath();

      User input = new User();

      input.setMemberId(MemberId);
      input.setUser_Img(User_Img);
      input.setUserName(UserName);
      input.setUserId(UserId);
      input.setGender(Gender);
      input.setUserPw(UserPw);
      input.setMobile(Mobile);
      input.setTEL(TEL);
      input.setEmail(Email);
      input.setPostCode(PostCode);
      input.setBasicAddress(BasicAddress);
      input.setStateAddress(StateAddress);
      input.setDetailAddress(DetailAddress);

      try {
         userService.editUserinformation(input);
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      return new ModelAndView("_mypage/personal_information1_HG");
   }
   //-----------------------------------------------------------------------------------
   

   // 회원 현황 컨트롤러 (연-결 남녀 회원 현황 비율)
   @RequestMapping(value = "/_service/MemberStatus_YB.do", method = RequestMethod.GET)
   public ModelAndView MemberStatus(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {

         String login = loginInfo.getUserName();

         model.addAttribute("login", login);
      }

      // 데이터베이스로부터 Gender 데이터 불러오기
      User input = new User();

      int outputMen = 0;
      int outputWomen = 0;
      try {
         outputMen = userService.getSelectCountGenderMen(input);
         outputWomen = userService.getSelectCountGenderWomen(input);
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      // 데이터 json형식으로 변환
      Gson gson = new Gson();
      String jsonListm = gson.toJson(outputMen);
      String jsonListw = gson.toJson(outputWomen);

      // View처리
      model.addAttribute("jsonListm", jsonListm);
      model.addAttribute("jsonListw", jsonListw);

      return new ModelAndView("_service/MemberStatus_YB");
   }
   //-----------------------------------------------------------------------------
   
   
   // 회원 현황 컨트롤러 (연-결 남녀 회원 연봉 분포)
   @RequestMapping(value = "/_service/MemberStatus2_YB.do", method = RequestMethod.GET)
   public ModelAndView MemberStatus2(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {

         String login = loginInfo.getUserName();

         model.addAttribute("login", login);
      }

      // 데이터베이스로부터 Sal_Annual 데이터 불러오기
      User input = new User();

      int outputSal0010M = 0;
      int outputSal0010W = 0;

      int outputSal2000M = 0;
      int outputSal2000W = 0;

      int outputSal3000M = 0;
      int outputSal3000W = 0;

      int outputSal4000M = 0;
      int outputSal4000W = 0;

      int outputSal5000M = 0;
      int outputSal5000W = 0;

      int outputSal6070M = 0;
      int outputSal6070W = 0;

      int outputSal8090M = 0;
      int outputSal8090W = 0;

      int outputSal10000M = 0;
      int outputSal10000W = 0;

      try {
         outputSal0010M = userService.getselectCountAnnualSalary0010M(input);
         outputSal0010W = userService.getselectCountAnnualSalary0010W(input);

         outputSal2000M = userService.getselectCountAnnualSalary2000M(input);
         outputSal2000W = userService.getselectCountAnnualSalary2000W(input);

         outputSal3000M = userService.getselectCountAnnualSalary3000M(input);
         outputSal3000W = userService.getselectCountAnnualSalary3000W(input);

         outputSal4000M = userService.getselectCountAnnualSalary4000M(input);
         outputSal4000W = userService.getselectCountAnnualSalary4000W(input);

         outputSal5000M = userService.getselectCountAnnualSalary5000M(input);
         outputSal5000W = userService.getselectCountAnnualSalary5000W(input);

         outputSal6070M = userService.getselectCountAnnualSalary6070M(input);
         outputSal6070W = userService.getselectCountAnnualSalary6070W(input);

         outputSal8090M = userService.getselectCountAnnualSalary8090M(input);
         outputSal8090W = userService.getselectCountAnnualSalary8090W(input);

         outputSal10000M = userService.getselectCountAnnualSalary10000M(input);
         outputSal10000W = userService.getselectCountAnnualSalary10000W(input);

      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      // 데이터 json형식으로 변환
      Gson gson = new Gson();
      String jsonSal0010M = gson.toJson(outputSal0010M);
      String jsonSal0010W = gson.toJson(outputSal0010W);

      String jsonSal2000M = gson.toJson(outputSal2000M);
      String jsonSal2000W = gson.toJson(outputSal2000W);

      String jsonSal3000M = gson.toJson(outputSal3000M);
      String jsonSal3000W = gson.toJson(outputSal3000W);

      String jsonSal4000M = gson.toJson(outputSal4000M);
      String jsonSal4000W = gson.toJson(outputSal4000W);

      String jsonSal5000M = gson.toJson(outputSal5000M);
      String jsonSal5000W = gson.toJson(outputSal5000W);

      String jsonSal6070M = gson.toJson(outputSal6070M);
      String jsonSal6070W = gson.toJson(outputSal6070W);

      String jsonSal8090M = gson.toJson(outputSal8090M);
      String jsonSal8090W = gson.toJson(outputSal8090W);

      String jsonSal10000M = gson.toJson(outputSal10000M);
      String jsonSal10000W = gson.toJson(outputSal10000W);

      // View처리
      model.addAttribute("jsonSal0010M", jsonSal0010M);
      model.addAttribute("jsonSal0010W", jsonSal0010W);

      model.addAttribute("jsonSal2000M", jsonSal2000M);
      model.addAttribute("jsonSal2000W", jsonSal2000W);

      model.addAttribute("jsonSal3000M", jsonSal3000M);
      model.addAttribute("jsonSal3000W", jsonSal3000W);

      model.addAttribute("jsonSal4000M", jsonSal4000M);
      model.addAttribute("jsonSal4000W", jsonSal4000W);

      model.addAttribute("jsonSal5000M", jsonSal5000M);
      model.addAttribute("jsonSal5000W", jsonSal5000W);

      model.addAttribute("jsonSal6070M", jsonSal6070M);
      model.addAttribute("jsonSal6070W", jsonSal6070W);

      model.addAttribute("jsonSal8090M", jsonSal8090M);
      model.addAttribute("jsonSal8090W", jsonSal8090W);

      model.addAttribute("jsonSal10000M", jsonSal10000M);
      model.addAttribute("jsonSal10000W", jsonSal10000W);

      return new ModelAndView("_service/MemberStatus2_YB");
   }
   //----------------------------------------------------------------
   
   
   // 회원 현황 컨트롤러 (연-결 남녀 회원 연령 분포)
   @RequestMapping(value = "/_service/MemberStatus3_YB.do", method = RequestMethod.GET)
   public ModelAndView MemberStatus3(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {

         String login = loginInfo.getUserName();

         model.addAttribute("login", login);
      }

      // 데이터베이스로부터 나이 데이터 불러오기
      User input = new User();

      int outputAge2024M = 0;
      int outputAge2024W = 0;

      int outputAge2529M = 0;
      int outputAge2529W = 0;

      int outputAge3034M = 0;
      int outputAge3034W = 0;

      int outputAge3539M = 0;
      int outputAge3539W = 0;

      int outputAge4049M = 0;
      int outputAge4049W = 0;

      int outputAge50PlusM = 0;
      int outputAge50PlusW = 0;

      try {
         outputAge2024M = userService.getselectCountAge2024M(input);
         outputAge2024W = userService.getselectCountAge2024W(input);

         outputAge2529M = userService.getselectCountAge2529M(input);
         outputAge2529W = userService.getselectCountAge2529W(input);

         outputAge3034M = userService.getselectCountAge3034M(input);
         outputAge3034W = userService.getselectCountAge3034W(input);

         outputAge3539M = userService.getselectCountAge3539M(input);
         outputAge3539W = userService.getselectCountAge3539W(input);

         outputAge4049M = userService.getselectCountAge4049M(input);
         outputAge4049W = userService.getselectCountAge4049W(input);

         outputAge50PlusM = userService.getselectCountAge50PlusM(input);
         outputAge50PlusW = userService.getselectCountAge50PlusW(input);

      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      // 데이터 json형식으로 변환
      Gson gson = new Gson();
      String jsonAge2024M = gson.toJson(outputAge2024M);
      String jsonAge2024W = gson.toJson(outputAge2024W);

      String jsonAge2529M = gson.toJson(outputAge2529M);
      String jsonAge2529W = gson.toJson(outputAge2529W);

      String jsonAge3034M = gson.toJson(outputAge3034M);
      String jsonAge3034W = gson.toJson(outputAge3034W);

      String jsonAge3539M = gson.toJson(outputAge3539M);
      String jsonAge3539W = gson.toJson(outputAge3539W);

      String jsonAge4049M = gson.toJson(outputAge4049M);
      String jsonAge4049W = gson.toJson(outputAge4049W);

      String jsonAge50PlusM = gson.toJson(outputAge50PlusM);
      String jsonAge50PlusW = gson.toJson(outputAge50PlusW);

      // View처리
      model.addAttribute("jsonAge2024M", jsonAge2024M);
      model.addAttribute("jsonAge2024W", jsonAge2024W);

      model.addAttribute("jsonAge2529M", jsonAge2529M);
      model.addAttribute("jsonAge2529W", jsonAge2529W);

      model.addAttribute("jsonAge3034M", jsonAge3034M);
      model.addAttribute("jsonAge3034W", jsonAge3034W);

      model.addAttribute("jsonAge3539M", jsonAge3539M);
      model.addAttribute("jsonAge3539W", jsonAge3539W);

      model.addAttribute("jsonAge4049M", jsonAge4049M);
      model.addAttribute("jsonAge4049W", jsonAge4049W);

      model.addAttribute("jsonAge50PlusM", jsonAge50PlusM);
      model.addAttribute("jsonAge50PlusW", jsonAge50PlusW);

      return new ModelAndView("_service/MemberStatus3_YB");
   }
   //-------------------------------------------------------------------------
   
   
   // 회원 현황 컨트롤러 (연-결 남녀 회원 학력 분포)
   @RequestMapping(value = "/_service/MemberStatus4_YB.do", method = RequestMethod.GET)
   public ModelAndView MemberStatus4(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {

         String login = loginInfo.getUserName();

         model.addAttribute("login", login);
      }

      // 데이터베이스로부터 학력 데이터 불러오기
      User input = new User();

      int outputHighschoolM = 0;
      int outputHighschoolW = 0;

      int outputCollegeM = 0;
      int outputCollegeW = 0;

      int outputUniversityM = 0;
      int outputUniversityW = 0;

      int outputGraduateSchoolM = 0;
      int outputGraduateSchoolW = 0;

      int outputDoctoralM = 0;
      int outputDoctoralW = 0;

      try {
         outputHighschoolM = userService.getselectCountAnnualSalary0010M(input);
         outputHighschoolW = userService.getselectCountAnnualSalary0010W(input);

         outputCollegeM = userService.getselectCountAnnualSalary2000M(input);
         outputCollegeW = userService.getselectCountAnnualSalary2000W(input);

         outputUniversityM = userService.getselectCountAnnualSalary3000M(input);
         outputUniversityW = userService.getselectCountAnnualSalary3000W(input);

         outputGraduateSchoolM = userService.getselectCountAnnualSalary4000M(input);
         outputGraduateSchoolW = userService.getselectCountAnnualSalary4000W(input);

         outputDoctoralM = userService.getselectCountAnnualSalary5000M(input);
         outputDoctoralW = userService.getselectCountAnnualSalary5000W(input);

      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

      // 데이터 json형식으로 변환
      Gson gson = new Gson();
      String jsonHighschoolM = gson.toJson(outputHighschoolM);
      String jsonHighschoolW = gson.toJson(outputHighschoolW);

      String jsonCollegeM = gson.toJson(outputCollegeM);
      String jsonCollegeW = gson.toJson(outputCollegeW);

      String jsonUniversityM = gson.toJson(outputUniversityM);
      String jsonUniversityW = gson.toJson(outputUniversityW);

      String jsonGraduateSchoolM = gson.toJson(outputGraduateSchoolM);
      String jsonGraduateSchoolW = gson.toJson(outputGraduateSchoolW);

      String jsonDoctoralM = gson.toJson(outputDoctoralM);
      String jsonDoctoralW = gson.toJson(outputDoctoralW);

      // View처리
      model.addAttribute("jsonHighschoolM", jsonHighschoolM);
      model.addAttribute("jsonHighschoolW", jsonHighschoolW);

      model.addAttribute("jsonCollegeM", jsonCollegeM);
      model.addAttribute("jsonCollegeW", jsonCollegeW);

      model.addAttribute("jsonUniversityM", jsonUniversityM);
      model.addAttribute("jsonUniversityW", jsonUniversityW);

      model.addAttribute("jsonGraduateSchoolM", jsonGraduateSchoolM);
      model.addAttribute("jsonGraduateSchoolW", jsonGraduateSchoolW);

      model.addAttribute("jsonDoctoralM", jsonDoctoralM);
      model.addAttribute("jsonDoctoralW", jsonDoctoralW);

      return new ModelAndView("_service/MemberStatus4_YB");
   }
   //-------------------------------------------------------------
   
   
   
   // index 메일 발송 컨트롤러
	@RequestMapping(value = "/_index/counsel_YH.do", method = RequestMethod.GET)
	public String write() {
		return "_index/counsel_YH";
	}
	//--------------------------------------------------------------------------

	// index 메일 발송 컨트롤러 sendOk
	@RequestMapping(value = "/_index/send.do", method = RequestMethod.POST)
	public ModelAndView send(Model model) {
		/** 사용자의 입력값 받기 */
		String to = webHelper.getString("to");
		String subject = webHelper.getString("subject");
		String content = webHelper.getString("content");

		/** 입력여부 검사후, 입력되지 않은 경우 이전 페이지로 보내기 */
		// 받는 메일 주소 검사하기

		if (!regexHelper.isValue(to)) {
			return webHelper.redirect(null, "받는 사람의 이메일 주소를 입력하세요.");
		}

		if (!regexHelper.isEmail(to)) {
			return webHelper.redirect(null, "받는 사람의 이메일 주소가 잘못되었습니다.");
		}
		// 메일 제목 --> null체크도 입력 여부를 확인할 수 있다.
		if (subject == null) {
			return webHelper.redirect(null, "받는 사람의 이름을 입력하세요.");
		}

		// 메일 내용 --> null체크도 입력 여부를 확인할 수 있다.
		if (content == null) {
			return webHelper.redirect(null, "메일의 내용을 입력하세요.");
		}

		/** 메일 발송 처리 */
		try {
			// sendMail() 메서드 선언시 throws를 정의했기 때문에 예외처리가 요구된다.
			mailHelper.sendMail(to, subject, content);
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "메일 발송에 실패했습니다.");
		}

		/** 결과처리 */
		return webHelper.redirect("counsel_YH.do", "메일 발송에 성공했습니다.");
	}
	//--------------------------------------------------------------------------
	
	
}