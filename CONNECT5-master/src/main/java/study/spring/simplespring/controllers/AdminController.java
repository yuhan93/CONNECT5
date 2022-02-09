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

import study.spring.simplespring.helper.PageData;
import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.ReqMatch;
import study.spring.simplespring.model.SucMatch;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.ReqMatchService;
import study.spring.simplespring.service.SucMatchService;
import study.spring.simplespring.service.UserService;

@Controller
public class AdminController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	UserService userService;

	@Autowired
	ReqMatchService reqMatchService;
	
	@Autowired
	SucMatchService sucMatchService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	// 관리자(admin) 페이지 메인 컨트롤러
	@RequestMapping(value = "/_admin/admin_main_SE.do", method = RequestMethod.GET)
	public ModelAndView main(Model model) {

		int countM_N = 0;
		int countM_B = 0;
		int countM_S = 0;
		int countM_G = 0;
		int countM_V = 0;
		int countW_N = 0;
		int countW_B = 0;
		int countW_S = 0;
		int countW_G = 0;
		int countW_V = 0;
		int countM_All = 0;
		int countW_All = 0;

		ReqMatch input = new ReqMatch();
		User input1 = new User();

		List<ReqMatch> output = null;

		try {
			// 데이터 조회
			output = reqMatchService.getReqMatchList(input);
			countM_N = userService.getCountM_Member_lvN(input1);
			countM_B = userService.getCountM_Member_lvB(input1);
			countM_S = userService.getCountM_Member_lvS(input1);
			countM_G = userService.getCountM_Member_lvG(input1);
			countM_V = userService.getCountM_Member_lvV(input1);
			countW_N = userService.getCountW_Member_lvN(input1);
			countW_B = userService.getCountW_Member_lvB(input1);
			countW_S = userService.getCountW_Member_lvS(input1);
			countW_G = userService.getCountW_Member_lvG(input1);
			countW_V = userService.getCountW_Member_lvV(input1);
			countM_All = userService.getCountM_All(input1);
			countW_All = userService.getCountW_All(input1);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		Gson gson = new Gson();
		String jsonList = gson.toJson(output);

		model.addAttribute("output", output);
		model.addAttribute("jsonList", jsonList);
		model.addAttribute("countM_N", countM_N);
		model.addAttribute("countM_B", countM_B);
		model.addAttribute("countM_S", countM_S);
		model.addAttribute("countM_G", countM_G);
		model.addAttribute("countM_V", countM_V);
		model.addAttribute("countW_N", countW_N);
		model.addAttribute("countW_B", countW_B);
		model.addAttribute("countW_S", countW_S);
		model.addAttribute("countW_G", countW_G);
		model.addAttribute("countW_V", countW_V);
		model.addAttribute("countM_All", countM_All);
		model.addAttribute("countW_All", countW_All);

		return new ModelAndView("_admin/admin_main_SE");
	}
	// ----------------------------------------------------------------------------------

	
	@RequestMapping(value = "/_admin/deleteOk.do", method = RequestMethod.GET)
	public ModelAndView sucdelete(Model model) {
		
		int SucMatchId = webHelper.getInt("SucMatchId");
		
		if (SucMatchId == 0) {
            return webHelper.redirect(null, "매칭번호가 없습니다.");
        }
		
		SucMatch input = new SucMatch();
		input.setSucMatchId(SucMatchId);
		int memberId = 0;
		int otherMemberId  = 0;
		
		try {
			memberId = sucMatchService.getSucMatchItem_Id(input);
			otherMemberId = sucMatchService.getSucMatchItem_otherMemberId(input);
		} catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
		
		User user = new User();
		user.setMemberId(memberId);
		
		User user2 = new User();
		user2.setMemberId(otherMemberId);
		
		try {
			sucMatchService.deleteSucMatch(input);
			userService.editUserRestUp(user);
			userService.editUserRestUp(user2);
		} catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
		
		
		return webHelper.redirect(contextPath + "/_admin/admin_main_SE.do", "매칭 취소 되었습니다.");
	}




	// 관리자 (admin) 페이지 회원관리 컨트롤러 List
	@RequestMapping(value = "/_admin/admin_userManager1_HG.do", method = RequestMethod.GET)
	public ModelAndView admin_userManager1(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		/** 1) 필요한 변수값 생성 */
		String selected = webHelper.getString("selected", "");
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		int MemberId = webHelper.getInt("MemberId");
		String BirthDate = webHelper.getString("BirthDate");
		String Height = webHelper.getString("Height");
		String Edu_Lv = webHelper.getString("Edu_Lv");
		String Job = webHelper.getString("Job");
		
		String UserName = "";
		String UserId = "";
		
		if (selected.equals("bName")) {
			UserName = keyword;
		} else if (selected.equals("bId")) {
			UserId = keyword;
		} else {
			UserName = keyword;
			UserId = keyword;
		}

		User input = new User();
		input.setMemberId(MemberId);
		input.setUserId(UserId);
		input.setUserName(UserName);
		input.setBirthDate(BirthDate);
		input.setHeight(Height);
		input.setEdu_Lv(Edu_Lv);
		input.setJob(Job);

		List<User> output = null; // 조회결과가 저장될 객체
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = userService.getUserCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			User.setOffset(pageData.getOffset());
			User.setListCount(pageData.getListCount());

			output = userService.getUserListadminUser(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageData", pageData);
		model.addAttribute("output", output);

		return new ModelAndView("_admin/admin_userManager1_HG");
	}
	// -------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 해당 회원 정보 확인 View
	@RequestMapping(value = "/_admin/admin_userManager2_HG.do", method = RequestMethod.GET)
	public ModelAndView admin_userManager2(Model model) {

		int MemberId = webHelper.getInt("MemberId");
		String User_Img = webHelper.getString("User_Img");
		if (MemberId == 0) {
			return webHelper.redirect(null, "해당 회원이 없습니다.");
		}

		User input = new User();
		input.setMemberId(MemberId);
		input.setUser_Img(User_Img);
		User output = null;

		try {
			output = userService.getUserItemadminUser(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);

		return new ModelAndView("_admin/admin_userManager2_HG");
	}
	// --------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 해당 회원 비밀번호 변경 컨트롤러
	@RequestMapping(value = "/_admin/admin_userManager2ok2_HG.do", method = RequestMethod.POST)
	public ModelAndView admin_userManager2ok2(Model model) {

		int MemberId = webHelper.getInt("MemberId");
		String UserPw = webHelper.getString("UserPw");

		if (MemberId == 0) {
			return webHelper.redirect(null, "회원 번호가 없습니다.");
		}

		User input = new User();
		input.setMemberId(MemberId);
		input.setUserPw(UserPw);

		try {
			userService.editUseradmin(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/_admin/admin_userManager1_HG.do", "수정되었습니다.");
	}
	// ----------------------------------------------------------------------------------

	
	// 관리자 (admin) 페이지해당 회원 탈퇴(추방) 컨트롤러
	@RequestMapping(value = "/_admin/admin_userManager2ok1_HG.do", method = RequestMethod.POST)
	public ModelAndView admin_userManager2ok1(Model model) {

		int MemberId = webHelper.getInt("MemberId");
		String UserName = webHelper.getString("UserName");
		String UserId = webHelper.getString("UserId");
		String UserPw = webHelper.getString("UserPw");

		if (MemberId == 0) {
			return webHelper.redirect(null, "회원 번호가 없습니다.");
		}

		User input = new User();
		input.setMemberId(MemberId);
		input.setUserName(UserName);
		input.setUserId(UserId);
		input.setUserPw(UserPw);

		try {
			userService.deleteUser(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect(contextPath + "/_admin/admin_userManager1_HG.do", "삭제되었습니다.");
	}
	// ----------------------------------------------------------------------------------

	
}
