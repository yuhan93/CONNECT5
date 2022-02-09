package study.spring.simplespring.controllers;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.UserService;

@Controller
public class LoginController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	UserService userService;

	@Autowired
	MailHelper mailHelper;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	// 로그인 컨트롤러
	@RequestMapping(value = "/_login/login_HG.do", method = RequestMethod.GET)
	public String location(Model model) {

		return "_login/login_HG";
	}
	// -----------------------------------------------------------------------------------

	// 로그인 컨트롤러 SessionOk
	@RequestMapping(value = "/_login/loginOk.do", method = RequestMethod.POST)
	public ModelAndView loginaction(Model model, HttpServletRequest request, HttpServletResponse response) {

		String UserId = webHelper.getString("UserId");

		// LocalDate selectDate = LocalDate.now();

		String UserPw = webHelper.getString("UserPw");

		User input = new User();
		input.setUserId(UserId);
		input.setUserPw(UserPw);

		User loginInfo = null;
		try {

			loginInfo = userService.selectLoginInfo(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		webHelper.setSession("loginInfo", loginInfo);

		int admin = loginInfo.getIsadmin();
		if (admin == 1) {
			return webHelper.redirect(contextPath + "/_admin/admin_main_SE.do", "관리자페이지로 이동합니다.");
		}

		String logininfo = loginInfo.getUserName();

		model.addAttribute("login", logininfo);
		String viewPath = "home";
		return new ModelAndView(viewPath);
	}
	// ------------------------------------------------------------------------------------

	// 로그아웃 SessionRemove
	@RequestMapping(value = "/_login/loginOut.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView logout(Model model, HttpServletRequest request, HttpServletResponse response) {

		webHelper.removeAllSession();

		return webHelper.redirect(request.getContextPath() + "/", "연-결을 이용해 주셔서 감사합니다. 안녕히가세요.");
	}
	// ------------------------------------------------------------------------------------

	// 회원가입 컨트롤러 1번
	@RequestMapping(value = "/_join/join1_HG.do", method = RequestMethod.GET)
	public String join1(Model model) {

		return "_join/join1_HG";
	}

	// 회원가입 컨트롤러 2번
	@RequestMapping(value = "/_join/join2_HG.do", method = RequestMethod.GET)
	public ModelAndView join2(Model model) {

		return new ModelAndView("_join/join2_HG");

	}

	// 회원가입 컨트롤러 addOk
	@RequestMapping(value = "/_join/join2_HGok.do", method = RequestMethod.POST)
	public ModelAndView addok_HG(Model model) {
		String UserId = webHelper.getString("UserId");
		String UserPw = webHelper.getString("UserPw");
		String UserName = webHelper.getString("UserName");
		String BirthDate = webHelper.getString("BirthDate");
		int Gender = webHelper.getInt("Gender");
		int IsMarried = webHelper.getInt("IsMarried");
		String Mobile = webHelper.getString("Mobile");
		String TEL = webHelper.getString("TEL");
		String Email = webHelper.getString("Email");
		String PostCode = webHelper.getString("PostCode");
		String BasicAddress = webHelper.getString("BasicAddress");
		String StateAddress = webHelper.getString("StateAddress");
		String DetailAddress = webHelper.getString("DetailAddress");
		String Join_Date = webHelper.getString("Join_Date");

		User input = new User();
		input.setUserId(UserId);
		input.setUserPw(UserPw);
		input.setUserName(UserName);
		input.setBirthDate(BirthDate);
		input.setGender(Gender);
		input.setIsMarried(IsMarried);
		input.setMobile(Mobile);
		input.setTEL(TEL);
		input.setEmail(Email);
		input.setPostCode(PostCode);
		input.setBasicAddress(BasicAddress);
		input.setStateAddress(StateAddress);
		input.setDetailAddress(DetailAddress);
		input.setJoin_Date(Join_Date);

		try {
			userService.addUser(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		String redirectUrl = contextPath + "/_join/join3_HG.do?MemberId=" + input.getMemberId();
		return webHelper.redirect(redirectUrl, "회원가입이 완료되었습니다.");
	}
	// ------------------------------------------------------------------------------------

	// 회원가입 컨트롤러 3번
	@RequestMapping(value = "/_join/join3_HG.do", method = RequestMethod.GET)
	public String join3(Model model) {

		return "_join/join3_HG";
	}
	// ------------------------------------------------------------------------------------

	// 회원가입 아이디 중복확인 컨트롤러
	@ResponseBody
	@RequestMapping(value = "_join/idcheck.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String idcheck() {

		String UserId = webHelper.getString("UserId");

		User input = new User();
		input.setUserId(UserId);

		User output = null;

		try {
			output = userService.getUserIdCheck(input);
		} catch (Exception e) {
			System.out.println("중복된 아이디가 없습니다.");
		}

		String status = "OK";
		System.out.println(output);

		if (output != null) {
			status = "FAIL";
		}

		Gson gson = new Gson();
		return gson.toJson(status);
	}
	// ---------------------------------------------------------------------------------

	// 아이디 찾기 컨트롤러
	@RequestMapping(value = "/_findAccount/FindId_GD.do", method = RequestMethod.GET)
	public ModelAndView findid(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		return new ModelAndView("_findAccount/FindId_GD");
	}
	//------------------------------------------------------------------------

	
	// 아이디 찾기 컨트롤러 Ok
	@ResponseBody
	@RequestMapping(value = "/_findAccount/FindId_GD_ok.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String findidok(Model model) {

		String username = webHelper.getString("user_name");
		String useremail = webHelper.getString("user_email");

		User input = new User();
		input.setUserName(username);
		input.setEmail(useremail);

		User req = null;

		try {
			req = userService.selectFindaccount(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(req);

		Gson gson = new Gson();

		Map<String, Object> result1 = new HashMap<String, Object>();

		if (req.getMemberId() != 0) {

			Random random = new Random(System.currentTimeMillis());

			int range = (int) Math.pow(10, 6);
			int trim = (int) Math.pow(10, 6 - 1);
			int result = random.nextInt(range) + trim;

			result1.put("result", result);
			result1.put("req", req);

			if (result > range) {
				result = result - trim;
			}

			String subject = "(주) 연-결 인증번호가 도착했습니다.";
			String content = username + "님의 인증번호는 " + result + " 입니다. 사이트에서 인증번호를 입력해주세요";

			System.out.println(result1);
			/** 메일 발송 처리 */
			try {
				// sendMail() 메서드 선언시 throws를 정의했기 때문에 예외처리가 요구된다.
				mailHelper.sendMail(useremail, subject, content);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return gson.toJson(result1);
	}
	//------------------------------------------------------------------------
	
	
	
	// 비밀번호 찾기 컨트롤러
	@RequestMapping(value = "/_findAccount/FindPw_GD.do", method = RequestMethod.GET)
	public ModelAndView findpw(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		return new ModelAndView("_findAccount/FindPw_GD");
	}
	//------------------------------------------------------------------------
	

	// 비밀번호 찾기 컨트롤러 Ok
	@ResponseBody
	@RequestMapping(value = "/_findAccount/FindPw_GD_ok.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String findpwok(Model model) {

		String username = webHelper.getString("user_name");
		String userid = webHelper.getString("user_id");
		String useremail = webHelper.getString("user_email");

		User input = new User();
		input.setUserName(username);
		input.setUserId(userid);
		input.setEmail(useremail);

		User req = null;

		try {
			req = userService.selectFindPassword(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(req);

		Gson gson = new Gson();

		Map<String, Object> result1 = new HashMap<String, Object>();

		if (req.getMemberId() != 0) {

			Random random = new Random(System.currentTimeMillis());

			int range = (int) Math.pow(10, 6);
			int trim = (int) Math.pow(10, 6 - 1);
			int result = random.nextInt(range) + trim;

			result1.put("result", result);
			result1.put("req", req);

			if (result > range) {
				result = result - trim;
			}

			String subject = "(주) 연-결 인증번호가 도착했습니다.";
			String content = username + "님의 인증번호는 " + result + " 입니다. 사이트에서 인증번호를 입력해주세요";

			System.out.println(result1);

		}
		return gson.toJson(result1);
	}
	//------------------------------------------------------------------------
	
	
	// 비밀번호 변경 컨트롤러 Ok
	@RequestMapping(value = "/_findAccount/FindPw_GD_Success.do", method = RequestMethod.POST)
	public ModelAndView findpwsuccess(Model model) {

		String password = webHelper.getString("new_pwd");
		String checkpwd = webHelper.getString("check_pwd");
		String userid = webHelper.getString("userid");
		User input = new User();

		input.setUserId(userid);
		input.setUserPw(password);

		try {
			userService.editUserPw(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return webHelper.redirect(contextPath + "/_login/login_HG.do", "정상적으로 변경되었습니다.");
	}
	//------------------------------------------------------------------------
	
	
	// 아이디 찾기 컨트롤러 회원에게 아이디 노출
	@RequestMapping(value = "/_findAccount/CheckId_GD.do", method = RequestMethod.POST)
	public ModelAndView checkid(Model model) {

		String name = webHelper.getString("user_name");

		User input = new User();
		input.setUserName(name);

		User output = null;
		try {
			output = userService.getUserItemFindId(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("output", output);

		return new ModelAndView("_findAccount/CheckId_GD");
	}
	//------------------------------------------------------------------
	
	
	// 비밀번호 찾기 컨트롤러 회원에게 변경 비밀번호 노출
	@RequestMapping(value = "/_findAccount/CheckPw_GD.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String checkpw(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		return "_findAccount/CheckPw_GD";
	}
	//------------------------------------------------------------------

}
