package study.spring.simplespring;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.simplespring.helper.PageData;
import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.Board;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.BoardService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

   @Autowired
   WebHelper webHelper;
   
   @Autowired
   BoardService boardService;

   @RequestMapping(value = { "/", "home.do" }, method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {

         String login = loginInfo.getUserName();

         model.addAttribute("login", login);
      }
      
      int nowPage = webHelper.getInt("page", 1);
		int totalCount = 0;
		int listCount = 10 - 5;
		 int pageCount  = 5;        
		
		int BoardId = webHelper.getInt("BoardId");
		String Content = webHelper.getString("Content");
		String CreationDate = webHelper.getString("CreationDate");

		Board input = new Board();
		input.setContent(Content);
		input.setCreationDate(CreationDate);
		input.setBoardId(BoardId);
		
		List<Board> output = null;
		PageData pageData = null;
		List<Board> output2 = null;
		
		try {

			totalCount = boardService.getBoardCount(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());
			
			output2 = boardService.getBoardListStory(input);
			output = boardService.getBoardListadminNotice(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output2", output2);
		model.addAttribute("pageData",pageData);
		model.addAttribute("output", output);
      
      return new ModelAndView("home");
   }
}