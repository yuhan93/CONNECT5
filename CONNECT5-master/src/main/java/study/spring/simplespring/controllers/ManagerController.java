package study.spring.simplespring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.Manager;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.ManagerService;


@Controller
public class ManagerController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	ManagerService managerService;
	
	// 연-결 커플 매니저 (직원) 컨트롤러 List
	@RequestMapping(value = "/_info/manager_HG.do", method = RequestMethod.GET)
	public ModelAndView manager(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		int managerid = webHelper.getInt("managerid");
		String m_name = webHelper.getString("m_name");
		int m_tel = webHelper.getInt("m_tel");
		String m_email = webHelper.getString("m_email");
		String m_content = webHelper.getString("m_content");

		Manager input = new Manager();
		input.setManagerid(managerid);
		input.setM_name(m_name);
		input.setM_tel(m_tel);
		input.setM_email(m_email);
		input.setM_content(m_content);

		Manager output1 = null;
		Manager output2 = null;
		Manager output3 = null;
		Manager output4 = null;
		Manager output5 = null;

		try {
			output1 = managerService.getManagerItem1(input);
			output2 = managerService.getManagerItem2(input);
			output3 = managerService.getManagerItem3(input);
			output4 = managerService.getManagerItem4(input);
			output5 = managerService.getManagerItem5(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		model.addAttribute("output3", output3);
		model.addAttribute("output4", output4);
		model.addAttribute("output5", output5);

		return new ModelAndView("_info/manager_HG");
	}
	//----------------------------------------------------------
}
