package study.spring.simplespring.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.simplespring.helper.RegexHelper;
import study.spring.simplespring.helper.RetrofitHelper;
import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.UserService;
import study.spring.simplespring.service.BoardService;
import study.spring.simplespring.service.SucMatchService;

@Controller
public class HTMLController {

	/** 통신처리에 필요한 객체 주입 받기 */
	@Autowired
	RetrofitHelper retrofitHelper;

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	UserService userService;

	@Autowired
	BoardService boardService;

	@Autowired
	SucMatchService sucMatchService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 연-결 소개 컨트롤러
	@RequestMapping(value = "/_info/IntroWebsite_YB.do", method = RequestMethod.GET)
	public String IntroWebsite(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		return "_info/IntroWebsite_YB";
	}
	//------------------------------------------------------------------------
	
	// 연-결 인사말 컨트롤러
	@RequestMapping(value = "/_info/Greetings_YB.do", method = RequestMethod.GET)
	public String Greetings(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}
		return "_info/Greetings_YB";
	}
	//------------------------------------------------------------------------
	
	
	// 연-결 스페셜 서비스 컨트롤러
	@RequestMapping(value = "/_service/SpecialService_YH.do", method = RequestMethod.GET)
	public String SpecialService(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		return "_service/SpecialService_YH";
	}
	//-------------------------------------------------------------------------------
	
	// 회원 등급 안내 컨트롤러
	@RequestMapping(value = "/_service/MemberLevel_YH.do", method = RequestMethod.GET)
	public String MemberLevel(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}
		return "_service/MemberLevel_YH";
	}
	//------------------------------------------------------------------------------
	
	
	// 회원가입 안내 컨트롤러
	@RequestMapping(value = "/_service/MembershipRegisGuide_YB.do", method = RequestMethod.GET)
	public String MembershipRegisGuide(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		return "_service/MembershipRegisGuide_YB";
	}
	//--------------------------------------------------------------------------------
	
	
	// 서비스 이용절차 컨트롤러
	@RequestMapping(value = "/_service/ServiceProcedures_YB.do", method = RequestMethod.GET)
	public String ServiceProcedures(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		return "_service/ServiceProcedures_YB";
	}
	//--------------------------------------------------------------------
	
	
	// 데이트코스 컨트롤러
	@RequestMapping(value = "/_coach/DatingCourse_YB.do", method = RequestMethod.GET)
	public String DatingCourse(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		return "_coach/DatingCourse_YB";
	}
	//-----------------------------------------------------------------------------
	
	
	// 데이트코스 컨트롤러 view (서울 북촌 한옥 마을 read)
	@RequestMapping(value = "/_coach/DatingCourse2_YB.do", method = RequestMethod.GET)
	public String DatingCourse2(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		return "_coach/DatingCourse2_YB";
	}
	//-----------------------------------------------------------------------------
	
	
	// 연-결 오시는길 Gmap 컨트롤러
	@RequestMapping(value = "/_info/map_GD.do", method = RequestMethod.GET)
	public String Map(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}
		return "_info/map_GD";
	}
	//--------------------------------------------------------------------------------
	
	// 연-결 파트너 컨트롤러
	@RequestMapping(value = "/_info/partner_HG.do", method = RequestMethod.GET)
	public String partner(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}
		return "_info/partner_HG";
	}
	//--------------------------------------------------------------------------------
}
