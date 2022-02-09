package study.spring.simplespring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.Test;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.ManagerService;
import study.spring.simplespring.service.TestService;
import study.spring.simplespring.service.UserService;
import study.spring.simplespring.service.impl.UserServiceImpl;

@Controller
public class TestController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	UserService userService;

	@Autowired
	TestService testService;

	@Autowired
	ManagerService managerService;

	@Autowired
	UserServiceImpl userServiceImpl;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	
	// 나의 연애 매력 컨트롤러 1번
	@RequestMapping(value = "/_test/lovescore1_HG.do", method = RequestMethod.GET)
	public String lovescore1(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		return "_test/lovescore1_HG";
	}
	//---------------------------------------------------------------------
	
	// 나의 연애 매력 컨트롤러 2번
	@RequestMapping(value = "/_test/lovescore2_HG.do", method = RequestMethod.GET)
	public String lovescore2(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}
		int TestQ3 = webHelper.getInt("TestQ3");

		Test input = new Test();
		input.setTestQ3(TestQ3);

		model.addAttribute("TestQ3", TestQ3);

		return "_test/lovescore2_HG";
	}
	//---------------------------------------------------------------------
	
	
	// 나의 연애 매력 컨트롤러 3번
	@RequestMapping(value = "/_test/lovescore3_HG.do", method = RequestMethod.GET)
	public ModelAndView list(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}
		int TestQ3 = webHelper.getInt("TestQ3");
		int TestQ4 = webHelper.getInt("TestQ4");
		String ResultTitle = webHelper.getString("ResultTitle");
		String ResultContent = webHelper.getString("ResultContent");

		Test input = new Test();
		input.setTestQ3(TestQ3);
		input.setTestQ4(TestQ4);
		input.setResultTitle(ResultTitle);
		input.setResultContent(ResultContent);

		List<Test> output = null;

		try {
			output = testService.getTestList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("TestQ4", TestQ4);
		model.addAttribute("TestQ3", TestQ3);
		model.addAttribute("ResultContent", ResultContent);
		model.addAttribute("ResultTitle", ResultTitle);
		model.addAttribute("output", output);

		return new ModelAndView("_test/lovescore3_HG");
	}
	//---------------------------------------------------------------------
	

	// 연애성향 테스트 컨트롤러 1번
	@RequestMapping(value = "/_test/propensity1_HG.do", method = RequestMethod.GET)
	public String propensity1(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		return "_test/propensity1_HG";
	}
	//--------------------------------------------------------------------------
	
	
	// 연애성향 테스트 컨트롤러 2번
	@RequestMapping(value = "/_test/propensity2_HG.do", method = RequestMethod.GET)
	public String propensity2(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}
		int TestQ1 = webHelper.getInt("TestQ1");

		Test input = new Test();
		input.setTestQ1(TestQ1);

		model.addAttribute("TestQ1", TestQ1);
		return "_test/propensity2_HG";
	}
	//--------------------------------------------------------------------------
	
	
	// 연애성향 테스트 컨트롤러 3번
	@RequestMapping(value = "/_test/propensity3_HG.do", method = RequestMethod.GET)
	public ModelAndView list2(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}
		int TestQ1 = webHelper.getInt("TestQ1");
		int TestQ2 = webHelper.getInt("TestQ2");
		String ResultTitle = webHelper.getString("ResultTitle");
		String ResultContent = webHelper.getString("ResultContent");

		Test input = new Test();
		input.setTestQ1(TestQ1);
		input.setTestQ2(TestQ2);
		input.setResultTitle(ResultTitle);
		input.setResultContent(ResultContent);

		List<Test> output = null;

		try {
			output = testService.getTestList1(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("TestQ1", TestQ1);
		model.addAttribute("TestQ2", TestQ2);
		model.addAttribute("ResultContent", ResultContent);
		model.addAttribute("ResultTitle", ResultTitle);
		model.addAttribute("output", output);

		return new ModelAndView("_test/propensity3_HG");
	}
	//--------------------------------------------------------------------------
	
	
	// 이상형 찾기 컨트롤러
	@RequestMapping(value = "/_test/idealtype_HG.do", method = RequestMethod.GET)
	public ModelAndView idealtype(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		return new ModelAndView("_test/idealtype_HG");
	}
	//--------------------------------------------------------------------------
	
	
	// 이상형 찾기 컨트롤러 선택 List 
	@RequestMapping(value = "/_test/idealtype1_HG.do", method = RequestMethod.GET)
	public ModelAndView idealtype1(Model model) {

		int MemberId = webHelper.getInt("MemberId");
		String UserName = webHelper.getString("UserName");
		int Gender = webHelper.getInt("Gender");
		int IsMarried = webHelper.getInt("IsMarried");
		String Date_Loc = webHelper.getString("Date_Loc");
		String Height = webHelper.getString("Height");
		String Style = webHelper.getString("Style");
		String Personality = webHelper.getString("Personality");
		String BldType = webHelper.getString("BldType");
		String Sal_Annual = webHelper.getString("Sal_Annual");

		User input = new User();

		input.setMemberId(MemberId);
		input.setUserName(UserName);
		input.setGender(Gender);
		input.setIsMarried(IsMarried);
		input.setDate_Loc(Date_Loc);
		input.setHeight(Height);
		input.setStyle(Style);
		input.setPersonality(Personality);
		input.setBldType(BldType);
		input.setSal_Annual(Sal_Annual);

		List<User> output = null;

		try {
			output = userService.getidealtypeok(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("MemberId", MemberId);
		model.addAttribute("UserName", UserName);
		model.addAttribute("Gender", Gender);
		model.addAttribute("IsMarried", IsMarried);
		model.addAttribute("Date_Loc", Date_Loc);
		model.addAttribute("Height", Height);
		model.addAttribute("Style", Style);
		model.addAttribute("Personality", Personality);
		model.addAttribute("BldType", BldType);
		model.addAttribute("Sal_Annual", Sal_Annual);
		model.addAttribute("output", output);

		return new ModelAndView("_test/idealtype1_HG");
	}
	//--------------------------------------------------------------------------
	
}
