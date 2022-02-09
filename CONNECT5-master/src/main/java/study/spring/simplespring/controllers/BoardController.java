package study.spring.simplespring.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import study.spring.simplespring.helper.DownloadHelper;
import study.spring.simplespring.helper.PageData;
import study.spring.simplespring.helper.RegexHelper;
import study.spring.simplespring.helper.UploadItem;
import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.Board;
import study.spring.simplespring.model.Manager;
import study.spring.simplespring.model.Payment;
import study.spring.simplespring.model.Reply;
import study.spring.simplespring.model.ReqMatch;
import study.spring.simplespring.model.SucMatch;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.BoardService;
import study.spring.simplespring.service.ManagerService;
import study.spring.simplespring.service.PaymentService;
import study.spring.simplespring.service.ReplyService;
import study.spring.simplespring.service.ReqMatchService;
import study.spring.simplespring.service.SucMatchService;
import study.spring.simplespring.service.UserService;

@Controller
public class BoardController {

	@Autowired
	WebHelper webHelper;
	
	@Autowired
	DownloadHelper downloadHelper;

	@Autowired
	BoardService boardService;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	ReqMatchService reqMatchService;

	@Autowired
	ReplyService replyService;

	@Autowired
	UserService userService;

	@Autowired
	SucMatchService sucMatchService;

	@Autowired
	PaymentService paymentService;

	@Autowired
	ManagerService managerService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 관리자 페이지 게시판 관리 (공지사항) 
	   @RequestMapping(value = "/_admin/admin_userManagement_YH.do", method = RequestMethod.GET)
	   public ModelAndView list(Model model) {

	      User loginInfo = (User) webHelper.getSession("loginInfo");

	      /** 1) 필요한 변수값 생성 */
	      String selected = webHelper.getString("selected", "");
	      String keyword = webHelper.getString("keyword", ""); // 검색어
	      int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
	      int totalCount = 0; // 전체 게시글 수
	      int listCount = 10; // 한 페이지당 표시할 목록 수
	      int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

	      int MemberId = loginInfo.getMemberId();
	      int BoardId = webHelper.getInt("BoardId");
	      
	      String Title = "";
			String UserName = "";
			
			if (selected.equals("bTitle")) {
	            Title = keyword;

	        } else if (selected.equals("bName")) {
	            UserName = keyword;

	        } else {
	            Title = keyword;
	            UserName = keyword;
	        }

	      /** 2) 데이터 조회하기 */
	      // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
	      Board input = new Board();
	      input.setTitle(Title);
	      input.setUserName(UserName);
	      input.setMemberId(MemberId);
	      input.setBoardId(BoardId);

	      List<Board> output = null; // 조회결과가 저장될 객체
	      PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

	      try {
	         // 전체 게시글 수 조회
	         totalCount = boardService.getBoardCountNotice(input);
	         // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
	         pageData = new PageData(nowPage, totalCount, listCount, pageCount);

	         // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
	         Board.setOffset(pageData.getOffset());
	         Board.setListCount(pageData.getListCount());

	         // 데이터 조회하기
	         output = boardService.getBoardListadminNotice(input);
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }

	      /** 3) View 처리 */
	      model.addAttribute("selected", selected);
	      model.addAttribute("keyword", keyword);
	      model.addAttribute("output", output);
	      model.addAttribute("pageData", pageData);

	      return new ModelAndView("_admin/admin_userManagement_YH");

	   }
	   
	   // 관리자 페이지 게시판 관리 (공지사항 게시글 추가)
	   @RequestMapping(value = "/_admin/admin_userManagementadd.do", method = RequestMethod.GET)
	   public ModelAndView add(Model model) {
	      User loginInfo = (User) webHelper.getSession("loginInfo");

	      if (loginInfo != null) {

	         String login = loginInfo.getUserName();

	         model.addAttribute("login", login);
	      }
	      return new ModelAndView("_admin/admin_userManagementadd");

	   }
	   // 관리자 페이지 게시판 관리 (공지사항 게시글 추가)
	   @RequestMapping(value = "/_admin/admin_userManagementaddOk.do", method = RequestMethod.POST)
	   public ModelAndView addOk(Model model) {
	      User loginInfo = (User) webHelper.getSession("loginInfo");
	      
	      Integer MemberId = (Integer) loginInfo.getMemberId();
	      
	      try {
	         webHelper.upload();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      
	      List<UploadItem> fileList = webHelper.getFileList();
	      Map<String, String> paramMap = webHelper.getParamMap();

	      String Title = paramMap.get("Title");
	      String Content = paramMap.get("Content");
	      // String ContentImg = fileList.get(0).getFilePath();
	      String CreationDate = webHelper.getString("CreationDate");
	      String ContentImg="";
	      for(UploadItem aa : fileList) {
	          ContentImg = aa.getFilePath();
	      }
	      
	      
	      Board input = new Board();
	      input.setContent(Content);
	      input.setTitle(Title);
	      input.setMemberId(MemberId);
	      input.setCreationDate(CreationDate);
	      input.setContentImg(ContentImg);

	      try {
	         // 데이터 저장
	         // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
	         boardService.addBoardNotice(input);

	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }

	      // View에 추가

	      String redirectUrl = contextPath + "/_admin/admin_userManagementview.do?BoardId=" + input.getBoardId();
	      return webHelper.redirect(redirectUrl, "공지사항이 등록되었습니다.");

	   }
	   
	   // 관리자 페이지 게시판 관리 (공지사항 게시글 보기)
	   @RequestMapping(value = "/_admin/admin_userManagementview.do", method = RequestMethod.GET)
	   public ModelAndView view(Model model) {

	      User loginInfo = (User) webHelper.getSession("loginInfo");

	      if (loginInfo != null) {

	         String login = loginInfo.getUserName();

	         model.addAttribute("login", login);
	      }

	      int BoardId = webHelper.getInt("BoardId");
	      String Title = webHelper.getString("Title");
	      int viewcount = webHelper.getInt("viewcount");
	      String ContentImg = webHelper.getString("ContentImg");
	      
	      if (BoardId == 0) {
	         return webHelper.redirect(null, "공지사항이 없습니다.");
	      }

	      Board input = new Board();
	      input.setBoardId(BoardId);
	      input.setTitle(Title);
	      input.setContentImg(ContentImg);
	      
	      Board input1 = new Board();
	      input1.setViewcount(viewcount);
	      input1.setBoardId(BoardId);
	      
	      
	      int output1 = 0;
	      Board output = null;
	      Board prevBoard = null;
	      Board nextBoard = null;
	      
	      
	      try {
	         // 데이터 조회
	         output1 = boardService.editviewcount(input1);
	         output = boardService.getBoardNotice(input);
	         prevBoard = boardService.getNextDocument(input);
	         nextBoard = boardService.getPrevDocument(input);
	         
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      model.addAttribute("nextBoard",nextBoard);
	      model.addAttribute("prevBoard",prevBoard);
	      model.addAttribute("output1",output1);
	      model.addAttribute("output", output);
	      return new ModelAndView("_admin/admin_userManagementview");
	   }
	   
	   // 관리자 페이지 게시판 관리 (공지사항 게시글 수정)
	   @RequestMapping(value = "/_admin/admin_userManagementedit.do", method = RequestMethod.GET)
	   public ModelAndView adminUseredit(Model model) {

	      User loginInfo = (User) webHelper.getSession("loginInfo");

	      if (loginInfo != null) {

	         String login = loginInfo.getUserName();

	         model.addAttribute("login", login);
	      }

	      int BoardId = webHelper.getInt("BoardId");
	      String Content = webHelper.getString("Content");
	      String Title = webHelper.getString("Title");

	      if (BoardId == 0) {
	         return webHelper.redirect(null, "공지사항이 없습니다.");
	      }

	      Board input = new Board();
	      input.setBoardId(BoardId);
	      input.setTitle(Title);
	      input.setContent(Content);

	      Board output = null;

	      try {
	         output = boardService.getBoardNotice(input);
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }

	      model.addAttribute("output", output);
	      return new ModelAndView("_admin/admin_userManagementedit");

	   }
	   
	   // 관리자 페이지 게시판 관리 (공지사항 게시글 수정 )
	   @RequestMapping(value = "/_admin/admin_userManagementeditOk.do", method = RequestMethod.POST)
	   public ModelAndView admin_Useredit_ok(Model model) {
	      
	      User loginInfo = (User) webHelper.getSession("loginInfo");
	      
	      Integer MemberId = (Integer) loginInfo.getMemberId();
	      
	      try {
	         webHelper.upload();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      
	      List<UploadItem> fileList = webHelper.getFileList();
	      Map<String, String> paramMap = webHelper.getParamMap();

	      String Title = paramMap.get("Title");
	      String Content = paramMap.get("Content");
	      String BoardId = paramMap.get("BoardId");
	      // String ContentImg = fileList.get(0).getFilePath();
	      String CreationDate = webHelper.getString("CreationDate");
	      String ContentImg="";
	      for(UploadItem aa : fileList) {
	          ContentImg = aa.getFilePath();
	      }
	      
	      int a = Integer.parseInt(BoardId);
	      
	      Board input = new Board();
	      input.setContent(Content);
	      input.setTitle(Title);
	      input.setMemberId(MemberId);
	      input.setCreationDate(CreationDate);
	      input.setContentImg(ContentImg);
	      input.setBoardId(a);


	      try {
	         boardService.editBoardNotice(input);
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }

	      String redirectUrl = contextPath + "/_admin/admin_userManagement_YH.do";
	      return webHelper.redirect(redirectUrl, "공지사항이 수정 되었습니다.");

	   }
	   
	   // 관리자 페이지 게시판 관리 (공지사항 게시글 삭제)
	   @RequestMapping(value = "/_admin/admin_userManagementdeleteOk.do", method = RequestMethod.GET)
	   public ModelAndView delete_okadmin(Model model) {

	      int BoardId = webHelper.getInt("BoardId");

	      if (BoardId == 0) {
	         return webHelper.redirect(null, "공지사항 게시글이 없습니다.");
	      }

	      Board input = new Board();
	      input.setBoardId(BoardId);

	      try {
	         // 데이터 삭제
	         boardService.deleteBoardNotice(input);
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }

	      return webHelper.redirect(contextPath + "/_admin/admin_userManagement_YH.do", "삭제되었습니다.");
	   }
	
	// 매칭 기록 보기 List
	@RequestMapping(value = "/_mypage/Ex-MatchingRecord_YB.do", method = RequestMethod.GET)
	public ModelAndView ExMatchingRecord_List(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		if (loginInfo == null) {
			String redirectUrl = contextPath + "/_login/login_HG.do";
			return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
		}

		/** 1) 필요한 변수값 생성 */
		// 사용자가 dropdown 선택지 중 상대방 이름을 선택시 selected에는 partnerN이란 value 갖는다.
		// 사용자가 dropdown 선택지 중 직업을 선택시 selected에는 partnerJ란 value 갖는다.
		String selected = webHelper.getString("selected", ""); // dropdown 선택 사항
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		int MemberId = loginInfo.getMemberId();
		String name = "";
		String job = "";

		if (selected.equals("partnerN")) {
			name = keyword;

		} else if (selected.equals("partnerJ")) {
			job = keyword;

		} else {
			name = keyword;
			job = keyword;
		}

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		SucMatch input = new SucMatch();
		input.setMemberId(MemberId);
		input.setUserName(name);
		input.setJob(job);

		List<SucMatch> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = sucMatchService.getSucMatchCountExRecord(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			SucMatch.setOffset(pageData.getOffset());
			SucMatch.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = sucMatchService.getSucMatchListExRecord(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("/_mypage/Ex-MatchingRecord_YB");
	}
	// ---------------------------------------------------------------------------------------

	// 관리자 (admin) 연-결 성혼 스토리 게시판 List
	@RequestMapping(value = "/_admin/admin_MngBoard_WeddingStory_YB.do", method = RequestMethod.GET)
	public ModelAndView MngBoard_WeddingStory_List(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		/** 1) 필요한 변수값 생성 */
		String selected = webHelper.getString("selected", ""); // dropdown에서 선택된 값
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		int BoardId = webHelper.getInt("BoardId");
		int MemberId = loginInfo.getMemberId();

		String title = "";
		String userName = "";

		if (selected.equals("bTitle")) {
			title = keyword;

		} else if (selected.equals("bName")) {
			userName = keyword;

		} else {
			title = keyword;
			userName = keyword;
		}

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(title);
		input.setUserName(userName);
		input.setMemberId(MemberId);

		List<Board> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardCountAdminStory(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = boardService.getBoardListAdminStory(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("_admin/admin_MngBoard_WeddingStory_YB");
	}
	// ---------------------------------------------------------------------------------------

	// 관리자 (admin) 연-결 성혼 스토리 게시판 View
	@RequestMapping(value = "/_admin/admin_MngBoard_WeddingStoryRead_YB.do", method = RequestMethod.GET)
	public ModelAndView MngBoard_WeddingStoryRead_View(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 값
		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");
		int viewcount = webHelper.getInt("viewcount");

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "조회 제목이 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);

		Board inputview = new Board();
		inputview.setViewcount(viewcount);
		inputview.setBoardId(BoardId);

		// 조회결과를 저장할 객체 선언
		int outputview = 0;
		Board output = null;
		Board prevBoard = null;
		Board nextBoard = null;

		try {
			// 데이터 조회
			outputview = boardService.editviewcountAdminStory(inputview);
			output = boardService.getBoardItemAdminStory(input);
			prevBoard = boardService.getPrevPageAdminStory(input);
			nextBoard = boardService.getNextPageAdminStory(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("nextBoard", nextBoard);
		model.addAttribute("prevBoard", prevBoard);
		model.addAttribute("outputview", outputview);
		model.addAttribute("output", output);
		/** 3) View 처리 */
		return new ModelAndView("_admin/admin_MngBoard_WeddingStoryRead_YB");
	}
	// ---------------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 성혼 스토리 add
	@RequestMapping(value = "/_admin/admin_MngBoard_WeddingStoryWrite_YB.do", method = RequestMethod.GET)
	public ModelAndView MngBoard_WeddingStoryWrite_Add(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}
		return new ModelAndView("_admin/admin_MngBoard_WeddingStoryWrite_YB");
	}
	// ------------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 성혼 스토리 addOk
	@RequestMapping(value = "/_admin/admin_MngBoard_WeddingStoryWrite_AddOk_YB.do", method = RequestMethod.POST)
	public ModelAndView MngBoard_WeddingStoryWrite_AddOk(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		int MemberId = loginInfo.getMemberId();
		String Title = webHelper.getString("Title");
		String Content = webHelper.getString("Content");
		int Category = webHelper.getInt("Category");
		String CreationDate = webHelper.getString("CreationDate");

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Board input = new Board();
		input.setContent(Content);
		input.setTitle(Title);
		input.setMemberId(MemberId);
		input.setCategory(Category);
		input.setCreationDate(CreationDate);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			boardService.addBoardAdminStory(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// View에 추가

		String redirectUrl = contextPath + "/_admin/admin_MngBoard_WeddingStoryRead_YB.do?BoardId="
				+ input.getBoardId();
		return webHelper.redirect(redirectUrl, "성혼스토리 게시판에 등록되었습니다.");
	}
	// ------------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 성혼 스토리 edit
	@RequestMapping(value = "/_admin/admin_MngBoard_WeddingStoryEdit_YB.do", method = RequestMethod.GET)
	public ModelAndView MngBoard_WeddingStoryEdit(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 값
		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");
		String Content = webHelper.getString("Content");

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "성혼스토리 게시글번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);
		input.setContent(Content);

		// 게시글 조회결과를 저장할 객체 선언
		Board output = null;

		// List<User> userList = null;

		try {
			// 관리자 게시판 성혼스토리 기본 정보 조회
			output = boardService.getBoardItemAdminStory(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("_admin/admin_MngBoard_WeddingStoryEdit_YB");
	}
	// ------------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 성혼 스토리 editOk
	@RequestMapping(value = "/_admin/admin_MngBoard_WeddingStory_EditOk.do", method = RequestMethod.POST)
	public ModelAndView admin_MngBoard_WeddingStory_EditOk(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");
		String Content = webHelper.getString("Content");
		int Category = webHelper.getInt("Category");
		String CreationDate = webHelper.getString("CreationDate");
		int MemberId = loginInfo.getMemberId();

		if (BoardId == 0) {
			return webHelper.redirect(null, "등록할 게시글이 없습니다.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setContent(Content);
		input.setTitle(Title);
		input.setMemberId(MemberId);
		input.setCategory(Category);
		input.setCreationDate(CreationDate);

		try {
			// 데이터 수정
			boardService.editBoardAdminStory(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다.
		String redirectUrl = contextPath + "/_admin/admin_MngBoard_WeddingStoryRead_YB.do?BoardId="
				+ input.getBoardId();
		return webHelper.redirect(redirectUrl, "성혼스토리 게시글이 수정 되었습니다.");
	}
	// ------------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 성혼 스토리 DeleteOk
	@RequestMapping(value = "/_admin/admin_MngBoard_WeddingStory_DeleteOk.do", method = RequestMethod.GET)
	public ModelAndView admin_MngBoard_WeddingStory_Delete_ok(Model model) {

		int BoardId = webHelper.getInt("BoardId");

		if (BoardId == 0) {
			return webHelper.redirect(null, "성혼스토리 게시글이 없습니다.");
		}

		Board input = new Board();
		input.setBoardId(BoardId);

		try {
			// 데이터 삭제
			boardService.deleteBoardAdminStory(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/_admin/admin_MngBoard_WeddingStory_YB.do", "게시글이 삭제되었습니다.");
	}
	// ------------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 문의 현황 List
	@RequestMapping(value = "/_admin/admin_Question_SE.do", method = RequestMethod.GET)
	public ModelAndView question1_1admin(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");
		
		String selected = webHelper.getString("selected", "");
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		int MemberId = loginInfo.getMemberId();
		int BoardId = webHelper.getInt("BoardId");
		int Reply_Ok = webHelper.getInt("Reply_Ok");

		String Title = "";
		String UserName = "";
		
		if (selected.equals("bTitle")) {
            Title = keyword;

        } else if (selected.equals("bName")) {
            UserName = keyword;

        } else {
            Title = keyword;
            UserName = keyword;
        }
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Board input = new Board();
		input.setTitle(Title);
		input.setUserName(UserName);
		input.setMemberId(MemberId);
		input.setBoardId(BoardId);
		input.setReply_Ok(Reply_Ok);

		List<Board> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = boardService.getBoardListadmin1_1(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("_admin/admin_Question_SE");
	}
	// ---------------------------------------------------------------------------

	// 관리자 (admin) 페이지 문의현황 View + 답글
	@RequestMapping(value = "/_admin/admin_QuestionRead_SE.do", method = RequestMethod.GET)
	public ModelAndView viewadmin1_1(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}
		if (loginInfo == null) {
			String redirectUrl = contextPath + "/_login/login_HG.do";
			return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
		}

		int BoardId = webHelper.getInt("BoardId");
		String Re_Content = webHelper.getString("Re_Content");

		if (BoardId == 0) {
			return webHelper.redirect(null, "공지사항이 없습니다.");
		}

		Board input = new Board();
		input.setBoardId(BoardId);

		Reply input1 = new Reply();
		input1.setBoardId(BoardId);
		input1.setRe_Content(Re_Content);

		Board output = null;
		List<Reply> output1 = null;

		try {
			// 데이터 조회
			output1 = replyService.getReplya1_1admin(input1);
			output = boardService.getBoardItemadmin1_1(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output1", output1);
		model.addAttribute("output", output);
		return new ModelAndView("_admin/admin_QuestionRead_SE");
	}
	// ---------------------------------------------------------------------------

	// 관리자 (admin) 페이지 답글 컨트롤러 addOk
	@RequestMapping(value = "/_admin/admin_QuestionRead_SEaddOk.do", method = RequestMethod.POST)
	public ModelAndView replyaddOkadmin1_1(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		String Re_Title = webHelper.getString("Re_Title");
		String Re_Content = webHelper.getString("Re_Content");
		int MemberId = loginInfo.getMemberId();
		int BoardId = webHelper.getInt("BoardId");

		Reply input = new Reply();
		input.setMemberId(MemberId);
		input.setRe_Content(Re_Content);
		input.setRe_Title(Re_Title);
		input.setBoardId(BoardId);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			replyService.addReplyadmin1_1(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// View에 추가

		String redirectUrl = contextPath + "/_admin/admin_QuestionRead_SE.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "댓글이 등록되었습니다.");
	}
	// -----------------------------------------------------------------------------

	// 연-결 공지사항 컨트롤러 List
	@RequestMapping(value = "/_info/notice_SE.do", method = RequestMethod.GET)
	public ModelAndView notice_SE(Model model) {

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

		int BoardId = webHelper.getInt("BoardId");
		String CreationDate = webHelper.getString("CreationDate");

		String Title = "";
		String UserName = "";
		
		if (selected.equals("bTitle")) {
            Title = keyword;

        } else if (selected.equals("bName")) {
            UserName = keyword;

        } else {
            Title = keyword;
            UserName = keyword;
        }
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);
		input.setUserName(UserName);
		input.setCreationDate(CreationDate);

		List<Board> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardCountNotice(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = boardService.getBoardListNotice(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("_info/notice_SE");
	}
	// -------------------------------------------------------------------------

	// 연-결 공지사항 컨트롤러 view
	@RequestMapping(value = "/_info/noticeRead_SE.do", method = RequestMethod.GET)
	public ModelAndView noticeread2(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);

		// 조회결과를 저장할 객체 선언
		Board output = null;
		Board prevBoard = null;
		Board nextBoard = null;

		try {
			// 데이터 조회
			output = boardService.getBoardItem(input);
			nextBoard = boardService.getNextNoticeDocument(input);
			prevBoard = boardService.getPrevNoticeDocument(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("nextBoard", nextBoard);
		model.addAttribute("prevBoard", prevBoard);
		model.addAttribute("output", output);
		return new ModelAndView("_info/noticeRead_SE");

	}
	// --------------------------------------------------------------------------------------------------

	// 연-결 Q&A 컨트롤러 List
	@RequestMapping(value = "/_coach/QnA_SE.do", method = RequestMethod.GET)
	public ModelAndView list2(Model model) {

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

		int BoardId = webHelper.getInt("BoardId");
		String CreationDate = webHelper.getString("CreationDate");

		String Title = "";
		String UserName = "";
		
		if (selected.equals("bTitle")) {
            Title = keyword;

        } else if (selected.equals("bName")) {
            UserName = keyword;

        } else {
            Title = keyword;
            UserName = keyword;
        }
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);
		input.setUserName(UserName);
		input.setCreationDate(CreationDate);

		List<Board> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardCountQnA(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = boardService.getBoardListQnA(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("_coach/QnA_SE");
	}
	// ---------------------------------------------------------------------------

	// 연-결 Q&A 컨트롤러 add
	@RequestMapping(value = "/_coach/QnAWrite_SE.do", method = RequestMethod.GET)
	public ModelAndView QnAadd(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		return new ModelAndView("_coach/QnAWrite_SE");
	}
	// ---------------------------------------------------------------------------

	// 연-결 Q&A 컨트롤러 addOk
	@RequestMapping(value = "/_coach/QnAWrite_ok_SE.do", method = RequestMethod.POST)
	public ModelAndView QnAadd_ok(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		int MemberId = loginInfo.getMemberId();
		String UserId = loginInfo.getUserId();

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		String Title = webHelper.getString("Title");
		String Content = webHelper.getString("Content");
		String CreationDate = webHelper.getString("CreationDate");
		String ContentImg = webHelper.getString("ContentImg");
		int Category = webHelper.getInt("Category");

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Board input = new Board();
		input.setMemberId(MemberId);
		input.setTitle(Title);
		input.setContent(Content);
		input.setCreationDate(CreationDate);
		input.setContentImg(ContentImg);
		input.setCategory(Category);
		input.setUserId(UserId);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			boardService.addBoardQnA(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/_coach/QnARead_SE.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}
	// ---------------------------------------------------------------------------

	// 연-결 Q&A 컨트롤러 view
	@RequestMapping(value = "/_coach/QnARead_SE.do", method = RequestMethod.GET)
	public ModelAndView QnAview(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		
		if (loginInfo == null) {
			String redirectUrl = contextPath + "/_coach/QnA_SE.do";
			return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
		}

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);

		Reply input1 = new Reply();
		input1.setBoardId(BoardId);

		// 조회결과를 저장할 객체 선언
		Board output = null;
		List<Reply> output1 = null;
		Board prevBoard = null;
		Board nextBoard = null;

		try {
			// 데이터 조회
			output = boardService.getBoardItem(input);
			output1 = replyService.getReplyList(input1);
			nextBoard = boardService.getNextQnADocument(input);
			prevBoard = boardService.getPrevQnADocument(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("output1", output1);
		model.addAttribute("nextBoard", nextBoard);
		model.addAttribute("prevBoard", prevBoard);

		return new ModelAndView("_coach/QnARead_SE");
	}
	// ---------------------------------------------------------------------------

	// 연-결 Q&A 컨트롤러 댓글 Delete
	@RequestMapping(value = "/_coach/replyDelete_SE.do", method = RequestMethod.GET)
	public ModelAndView QnAReplydelete(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");
		
		if (loginInfo == null) {
			String redirectUrl = contextPath + "/_coach/QnA_SE.do";
			return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
		}

		int ReplyId = webHelper.getInt("ReplyId");

		if (ReplyId == 0) {
			webHelper.redirect(null, "댓글번호가 없습니다.");
		}

		Reply input = new Reply();
		input.setReplyId(ReplyId);

		try {
			replyService.deleteReply(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/_coach/QnA_SE.do", "삭제되었습니다.");
	}
	// ---------------------------------------------------------------------------

	// 연-결 Q&A 컨트롤러 댓글 addOk
	@RequestMapping(value = "/_coach/replyWrite_ok_SE.do", method = RequestMethod.POST)
	public ModelAndView QnAreplyadd_ok(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");
		
		if (loginInfo == null) {
			String redirectUrl = contextPath + "/_coach/QnA_SE.do";
			return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
		}
		
		int MemberId = loginInfo.getMemberId();
		String UserName = loginInfo.getUserName();
		int BoardId = webHelper.getInt("BoardId");
		String Re_Title = webHelper.getString("Re_Title");
		String Re_Content = webHelper.getString("Re_Content");

		Reply input = new Reply();
		input.setBoardId(BoardId);
		input.setMemberId(MemberId);
		input.setRe_Content(Re_Content);
		input.setRe_Title(Re_Title);
		input.setUserName(UserName);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			replyService.addReply(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/_coach/QnARead_SE.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}
	// ---------------------------------------------------------------------------

	// 연-결 Q&A 컨트롤러 댓글 editOk
	@RequestMapping(value = "/_coach/replyeditOk.do", method = RequestMethod.POST)
	public ModelAndView QnAedit_ok(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		
		if (loginInfo == null) {
			String redirectUrl = contextPath + "/_coach/QnA_SE.do";
			return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
		}
		
		int replyId = webHelper.getInt("replyId");
		String Re_Title = webHelper.getString("Re_Title");
		String Re_Content = webHelper.getString("Re_Content");
		int BoardId = webHelper.getInt("BoardId");
		int rep_memberId = webHelper.getInt("MemberId");
		int MemberId = loginInfo.getMemberId();
		String UserName = loginInfo.getUserName();
		
		
		if (replyId == 0) {
			return webHelper.redirect(null, "댓글번호가 없습니다.");
		}
		
		if (MemberId != rep_memberId) {
			return webHelper.redirect(null, "본인이 작성한 댓글만 수정가능합니다.");
		}

		Reply input = new Reply();
		input.setReplyId(replyId);
		input.setRe_Title(Re_Title);
		input.setRe_Content(Re_Content);
		input.setBoardId(BoardId);
		input.setMemberId(MemberId);
		input.setUserName(UserName);
		
		try {
			replyService.editReply(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		String redirectUrl = contextPath + "/_coach/QnARead_SE.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "댓글이 수정 되었습니다.");
	}
	// ---------------------------------------------------------------------------

	// 연-결 만남후기 컨트롤러 List
	@RequestMapping(value = "/_coach/review_SE.do", method = RequestMethod.GET)
	public ModelAndView Reviewview(Model model) {

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

		int BoardId = webHelper.getInt("BoardId");
		String CreationDate = webHelper.getString("CreationDate");

		String Title = "";
		String UserName = "";
		
		if (selected.equals("bTitle")) {
            Title = keyword;

        } else if (selected.equals("bName")) {
            UserName = keyword;

        } else {
            Title = keyword;
            UserName = keyword;
        }
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);
		input.setUserName(UserName);
		input.setCreationDate(CreationDate);

		List<Board> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardCountReview(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = boardService.getBoardListReview(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("_coach/review_SE");
	}
	// -----------------------------------------------------------------------------

	// 연-결 만남 후기 컨트롤러 add
	@RequestMapping(value = "/_coach/reviewWrite_SE.do", method = RequestMethod.GET)
	public ModelAndView reviewWrite(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		return new ModelAndView("_coach/reviewWrite_SE");
	}
	// -----------------------------------------------------------------------------

	// 연-결 만남 후기 컨트롤러 addOk
	@RequestMapping(value = "/_coach/reviewWrite_ok_SE.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");
		int MemberId = loginInfo.getMemberId();
		String UserId = loginInfo.getUserId();

		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		String Title = webHelper.getString("Title");
		String Content = webHelper.getString("Content");
		String CreationDate = webHelper.getString("CreationDate");
		String ContentImg = webHelper.getString("ContentImg");
		int Category = webHelper.getInt("Category");

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Board input = new Board();
		input.setMemberId(MemberId);
		input.setTitle(Title);
		input.setContent(Content);
		input.setCreationDate(CreationDate);
		input.setContentImg(ContentImg);
		input.setCategory(Category);
		input.setUserId(UserId);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			boardService.addBoardReview(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/_coach/reviewRead_SE.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}
	// -----------------------------------------------------------------------------

	// 연-결 만남 후기 컨트롤러 view , 해당 게시글 댓글 List
	@RequestMapping(value = "/_coach/reviewRead_SE.do", method = RequestMethod.GET)
	public ModelAndView Reviewread2(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		
		if (loginInfo == null) {
			String redirectUrl = contextPath + "/_coach/review_SE.do";
			return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
		}

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);

		Reply input1 = new Reply();
		input1.setBoardId(BoardId);

		// 조회결과를 저장할 객체 선언
		Board output = null;
		List<Reply> output1 = null;
		Board prevBoard = null;
		Board nextBoard = null;

		try {
			// 데이터 조회
			output = boardService.getBoardItem(input);
			output1 = replyService.getReplyList(input1);
			nextBoard = boardService.getNextreviewDocument(input);
			prevBoard = boardService.getPrevreviewADocument(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("output1", output1);
		model.addAttribute("nextBoard", nextBoard);
		model.addAttribute("prevBoard", prevBoard);
		return new ModelAndView("_coach/reviewRead_SE");
	}
	// -----------------------------------------------------------------------------

	// 연결 만남 후기 컨트롤러 댓글 Delete
	@RequestMapping(value = "/_coach/repReviewDelete_SE.do", method = RequestMethod.GET)
	public ModelAndView delete(Model model) {

		int ReplyId = webHelper.getInt("ReplyId");

		if (ReplyId == 0) {
			webHelper.redirect(null, "댓글번호가 없습니다.");
		}

		Reply input = new Reply();
		input.setReplyId(ReplyId);

		try {
			replyService.deleteReply(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/_coach/review_SE.do", "삭제되었습니다.");
	}
	// -----------------------------------------------------------------------------

	// 연-결 만남 후기 댓글 컨트롤러 addOk
	@RequestMapping(value = "/_coach/repReviewWrite_ok.do", method = RequestMethod.POST)
	public ModelAndView replyadd_ok(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		int MemberId = loginInfo.getMemberId();
		/** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		int BoardId = webHelper.getInt("BoardId");
		String Re_Content = webHelper.getString("Re_Content");
		String Re_Title = webHelper.getString("Re_Title");

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Reply input = new Reply();
		input.setBoardId(BoardId);
		input.setMemberId(MemberId);
		input.setRe_Content(Re_Content);
		input.setRe_Title(Re_Title);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			replyService.addReply(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/_coach/reviewRead_SE.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}
	// -----------------------------------------------------------------------------

	// 연-결 만남 후기 컨트롤러 editOk
	@RequestMapping(value = "/_coach/repReviewEditOk.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		int ReplyId = webHelper.getInt("ReplyId");
		String Re_Title = webHelper.getString("Re_Title");
		String Re_Content = webHelper.getString("Re_Content");
		int BoardId = webHelper.getInt("BoardId");
		int MemberId = loginInfo.getMemberId();
		String UserName = loginInfo.getUserName();

		if (ReplyId == 0) {
			return webHelper.redirect(null, "댓글번호가 없습니다.");
		}

		Reply input = new Reply();
		input.setReplyId(ReplyId);
		input.setRe_Title(Re_Title);
		input.setRe_Content(Re_Content);
		input.setBoardId(BoardId);
		input.setMemberId(MemberId);
		input.setUserName(UserName);

		try {
			replyService.editReply(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		String redirectUrl = contextPath + "/_coach/reviewRead_SE.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "댓글이 수정 되었습니다.");
	}
	// -----------------------------------------------------------------------------

	// Love컬럼 컨트롤러 List
	@RequestMapping(value = "/_coach/loveColumn_GD.do", method = RequestMethod.GET)
	public ModelAndView lovecolumn(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			Integer isadmin = loginInfo.getIsadmin();

			model.addAttribute("isadmin", isadmin);
			model.addAttribute("login", login);
		}

		Board input = new Board();

		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0;
		int listCount = 4; // 한 페이지당 표시할 목록 수
		int pageCount = 5;

		PageData pageData = null;

		List<Board> output = null;

		try {
			totalCount = boardService.getBoardCountColumn(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());
			output = boardService.getBoardListColumn(input);
		} catch (Exception e) {
			System.out.println(output);
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("_coach/loveColumn_GD");
	}
	// -----------------------------------------------------------------------------

	// Love컬럼 컨트롤러 view
	@RequestMapping(value = "/_coach/readColumn_GD.do", method = RequestMethod.GET)
	public ModelAndView readlovecolumn(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			Integer isadmin = loginInfo.getIsadmin();
			model.addAttribute("isadmin", isadmin);
			model.addAttribute("login", login);
		}

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}

		Board input = new Board();
		User user = new User();
		input.setBoardId(BoardId);

		Board output = null;
		User out = null;
		try {
			output = boardService.getBoardItemColumn(input);
			user = userService.getUserItem(out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("user", user);
		model.addAttribute("output", output);

		return new ModelAndView("_coach/readColumn_GD");
	}
	// -----------------------------------------------------------------------------

	// Love컬럼 컨트롤러 Delete
	@RequestMapping(value = "/_coach/deleteColumn.do", method = RequestMethod.GET)
	public ModelAndView deleteColumn(Model model) {

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}

		Board input = new Board();

		input.setBoardId(BoardId);

		try {

			boardService.deleteColumn(input);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return webHelper.redirect(contextPath + "/_coach/loveColumn_GD.do", "삭제되었습니다.");
	}
	// -----------------------------------------------------------------------------

	// Love컬럼 컨트롤러 add
	@RequestMapping(value = "/_coach/ColumnWrite.do", method = RequestMethod.GET)
	public ModelAndView columnwrite(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		return new ModelAndView("_coach/ColumnWrite");
	}
	// -----------------------------------------------------------------------------

	// Love컬럼 컨트롤러 addOk
	@ResponseBody
	@RequestMapping(value = "/_coach/ColumnWriteOk.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView columnok(Model model) {

		User id = (User) webHelper.getSession("loginInfo");
		Integer memberid = id.getMemberId();

		try {
			webHelper.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<UploadItem> fileList = webHelper.getFileList();
		Map<String, String> paramMap = webHelper.getParamMap();

		String title = paramMap.get("title");
		String content = paramMap.get("content");
		String contentimg = fileList.get(0).getFilePath();

		Board input = new Board();
		input.setTitle(title);
		input.setContent(content);
		input.setContentImg(contentimg);
		input.setMemberId(memberid);

		try {
			boardService.addBoardColumn(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String redirectUrl = contextPath + "/_coach/readColumn_GD.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "게시물이 등록되었습니다.");
	}
	// -----------------------------------------------------------------------------

	// 미팅성공전략TIP 컨트롤러 List
	@RequestMapping(value = "/_coach/meetingTip_GD.do", method = RequestMethod.GET)
	public ModelAndView tip(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			Integer isadmin = loginInfo.getIsadmin();

			model.addAttribute("isadmin", isadmin);
			model.addAttribute("login", login);
		}

		Board input = new Board();

		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0;
		int listCount = 4; // 한 페이지당 표시할 목록 수
		int pageCount = 5;

		PageData pageData = null;

		List<Board> output = null;

		try {
			totalCount = boardService.getBoardCountTip(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());
			output = boardService.getBoardListTip(input);
		} catch (Exception e) {
			System.out.println(output);
			return webHelper.redirect(null, e.getLocalizedMessage());

		}

		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("_coach/meetingTip_GD");
	}
	// ------------------------------------------------------------------------------------

	// 미팅성공전략TIP 컨트롤러 add
	@RequestMapping(value = "/_coach/TipWrite.do", method = RequestMethod.GET)
	public ModelAndView tipwrite(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}
		return new ModelAndView("_coach/TipWrite");
	}
	// ------------------------------------------------------------------------------------

	// 미팅성공전략TIP 컨트롤러 addOk
	@ResponseBody
	@RequestMapping(value = "/_coach/TipWriteok.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView tipwriteok(Model model) {

		User id = (User) webHelper.getSession("loginInfo");
		Integer memberid = id.getMemberId();

		try {
			webHelper.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<UploadItem> fileList = webHelper.getFileList();
		Map<String, String> paramMap = webHelper.getParamMap();

		String title = paramMap.get("title");
		String content = paramMap.get("content");
		String contentimg = fileList.get(0).getFilePath();

		Board input = new Board();
		input.setTitle(title);
		input.setContent(content);
		input.setContentImg(contentimg);
		input.setMemberId(memberid);

		try {
			boardService.addBoardTip(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String redirectUrl = contextPath + "/_coach/readTip_GD.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "게시물이 등록되었습니다.");
	}
	// ------------------------------------------------------------------------------------

	// 미팅성공전략TIP 컨트롤러 view
	@RequestMapping(value = "/_coach/readTip_GD.do", method = RequestMethod.GET)
	public ModelAndView readtip(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			Integer isadmin = loginInfo.getIsadmin();
			model.addAttribute("isadmin", isadmin);
			model.addAttribute("login", login);
		}

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}
		Board input = new Board();
		input.setBoardId(BoardId);
		Board output = null;
		try {
			output = boardService.getBoardItemTip(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("output", output);

		return new ModelAndView("_coach/readTip_GD");
	}
	// ------------------------------------------------------------------------------------

	// 미팅성공전략TIP 컨트롤러 delete
	@RequestMapping(value = "/_coach/deleteTip.do", method = RequestMethod.GET)
	public ModelAndView deleteTip(Model model) {

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}
		Board input = new Board();
		input.setBoardId(BoardId);
		try {

			boardService.deleteTip(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return webHelper.redirect(contextPath + "/_coach/meetingTip_GD.do", "삭제되었습니다.");
	}
	// ------------------------------------------------------------------------------------

	// 미팅성공전략TIP 컨트롤러 edit
	@RequestMapping(value = "/_coach/editTip.do", method = RequestMethod.GET)
	public ModelAndView editTip(Model model) {

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}
		Board input = new Board();

		input.setBoardId(BoardId);

		Board output = null;
		try {
			output = boardService.getBoardItemTip(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("output", output);

		return new ModelAndView("_coach/editTip");
	}
	// ------------------------------------------------------------------------------------

	// 미팅성공전략TIP 컨트롤러 editOk
	@ResponseBody
	@RequestMapping(value = "/_coach/editTipok.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView editTipOk(Model model) {

		User id = (User) webHelper.getSession("loginInfo");
		Integer memberid = id.getMemberId();

		String CreationDate = webHelper.getString("CreationDate");

		try {
			webHelper.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<UploadItem> fileList = webHelper.getFileList();
		Map<String, String> paramMap = webHelper.getParamMap();

		String title = paramMap.get("title");
		String content = paramMap.get("content");
		String contentimg = fileList.get(0).getFilePath();
		String boardid = (String) paramMap.get("boardid");

		if (boardid == null) {
			return webHelper.redirect(null, "내용이 없아");
		}
		System.out.println(boardid);

		Board input = new Board();
		input.setTitle(title);
		input.setContent(content);
		input.setContentImg(contentimg);
		input.setMemberId(memberid);
		input.setBoardId(Integer.parseInt(boardid));
		input.setCreationDate(CreationDate);

		try {
			boardService.editTip(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return webHelper.redirect(null, "DB 오류");
		}

		String redirectUrl = contextPath + "/_coach/readTip_GD.do";
		return webHelper.redirect(redirectUrl, "수정되었습니다.");
	}
	// ------------------------------------------------------------------------------------

	// Love컬럼 컨트롤러 edit
	@RequestMapping(value = "/_coach/editColumn.do", method = RequestMethod.GET)
	public ModelAndView editColumn(Model model) {

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");

		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}
		Board input = new Board();

		input.setBoardId(BoardId);

		Board output = null;
		try {
			output = boardService.getBoardItemColumn(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("output", output);

		return new ModelAndView("_coach/editColumn");
	}
	// ------------------------------------------------------------------------------------

	// Love컬럼 컨트롤러 editOk
	@ResponseBody
	@RequestMapping(value = "/_coach/editColumnok.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView editColumnok(Model model) {

		User id = (User) webHelper.getSession("loginInfo");
		Integer memberid = id.getMemberId();

		String CreationDate = webHelper.getString("CreationDate");

		try {
			webHelper.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<UploadItem> fileList = webHelper.getFileList();
		Map<String, String> paramMap = webHelper.getParamMap();

		String title = paramMap.get("title");
		String content = paramMap.get("content");
		String contentimg = fileList.get(0).getFilePath();
		String boardid = (String) paramMap.get("boardid");

		if (boardid == null) {
			return webHelper.redirect(null, "내용이 없아");
		}
		System.out.println(boardid);

		Board input = new Board();
		input.setTitle(title);
		input.setContent(content);
		input.setContentImg(contentimg);
		input.setMemberId(memberid);
		input.setBoardId(Integer.parseInt(boardid));
		input.setCreationDate(CreationDate);

		try {
			boardService.editColumn(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return webHelper.redirect(null, "DB 오류");
		}

		String redirectUrl = contextPath + "/_coach/readColumn_GD.do";
		return webHelper.redirect(redirectUrl, "수정되었습니다.");
	}
	// ------------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 결제관리 컨트롤러 List
	@RequestMapping(value = "/_admin/admin_Payment_GD.do", method = RequestMethod.GET)
	public ModelAndView adminPaymentList(Model model) {
		/** 1) 필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		Payment input = new Payment();
		input.setPayername(keyword);

		List<Payment> output = null;
		PageData pageData = null;

		List<Manager> managerList = null;
		try {

			totalCount = paymentService.getPaymentCount(input);

			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			Payment.setOffset(pageData.getOffset());
			Payment.setListCount(pageData.getListCount());

			output = paymentService.getPaymentList(input);
			managerList = managerService.getManagerList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("managerList", managerList);
		model.addAttribute("pageData", pageData);

		String viewPath = "_admin/admin_Payment_GD";
		return new ModelAndView(viewPath);
	}
	// ------------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 Q&A 게시판 컨트롤러 List
	@RequestMapping(value = "/_admin/admin_QnA_GD.do", method = RequestMethod.GET)
	public ModelAndView adminqna(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		/** 1) 필요한 변수값 생성 */
		String selected = webHelper.getString("selected", "");
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		int MemberId = loginInfo.getMemberId();
		int BoardId = webHelper.getInt("BoardId");

		String Title = "";
		String UserName = "";
		
		if (selected.equals("bTitle")) {
            Title = keyword;

        } else if (selected.equals("bName")) {
            UserName = keyword;

        } else {
            Title = keyword;
            UserName = keyword;
        }
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Board input = new Board();
		input.setTitle(Title);
		input.setUserName(UserName);
		input.setMemberId(MemberId);
		input.setBoardId(BoardId);

		List<Board> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardCountadminQnA(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = boardService.getBoardListadminQnA(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		String viewPath = "_admin/admin_QnA_GD";
		return new ModelAndView(viewPath);
	}
	// ------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 Q&A 게시판 컨트롤러 View
	@RequestMapping(value = "/_admin/admin_QnARead_GD.do", method = RequestMethod.GET)
	public ModelAndView adminqnaread(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");
		int viewcount = webHelper.getInt("viewcount");

		if (BoardId == 0) {
			return webHelper.redirect(null, "게시글이 없습니다.");
		}

		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);

		Board input1 = new Board();
		input1.setViewcount(viewcount);
		input1.setBoardId(BoardId);

		int output1 = 0;
		Board output = null;
		Board prevBoard = null;
		Board nextBoard = null;

		try {
			// 데이터 조회
			output1 = boardService.editviewcount(input1);
			output = boardService.getBoardItem(input);
			prevBoard = boardService.getNextDocument(input);
			nextBoard = boardService.getPrevDocument(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("nextBoard", nextBoard);
		model.addAttribute("prevBoard", prevBoard);
		model.addAttribute("output1", output1);
		model.addAttribute("output", output);
		return new ModelAndView("_admin/admin_QnARead_GD");
	}
	// ------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 Q&A 게시판 컨트롤러 DeleteOk
	@RequestMapping(value = "/_admin/admin_QnA_GDdeleteOk.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model) {

		int BoardId = webHelper.getInt("BoardId");

		if (BoardId == 0) {
			return webHelper.redirect(null, "공지사항 게시글이 없습니다.");
		}

		Board input = new Board();
		input.setBoardId(BoardId);

		try {
			// 데이터 삭제
			boardService.deleteBoardNotice(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/_admin/admin_QnA_GD.do", "삭제되었습니다.");
	}
	// ------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 만남후기 게시판 컨트롤러 List
	@RequestMapping(value = "/_admin/admin_userEx_GD.do", method = RequestMethod.GET)
	public ModelAndView adminuserex(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");
		/** 1) 필요한 변수값 생성 */
		String selected = webHelper.getString("selected", "");
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		int MemberId = loginInfo.getMemberId();
		int BoardId = webHelper.getInt("BoardId");

		String Title = "";
		String UserName = "";
		
		if (selected.equals("bTitle")) {
            Title = keyword;

        } else if (selected.equals("bName")) {
            UserName = keyword;

        } else {
            Title = keyword;
            UserName = keyword;
        }
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Board input = new Board();
		input.setTitle(Title);
		input.setUserName(UserName);
		input.setMemberId(MemberId);
		input.setBoardId(BoardId);

		List<Board> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardCountReview(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = boardService.getBoardListReview(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) View 처리 */
		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		String viewPath = "_admin/admin_userEx_GD";
		return new ModelAndView(viewPath);
	}
	// ------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 만남후기 게시판 컨트롤러 View
	@RequestMapping(value = "/_admin/admin_userExRead_GD.do", method = RequestMethod.GET)
	public ModelAndView adminuserexread(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");
		int viewcount = webHelper.getInt("viewcount");

		if (BoardId == 0) {
			return webHelper.redirect(null, "게시글이 없습니다.");
		}

		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);

		Board input1 = new Board();
		input1.setViewcount(viewcount);
		input1.setBoardId(BoardId);

		int output1 = 0;
		Board output = null;
		Board prevBoard = null;
		Board nextBoard = null;

		try {
			// 데이터 조회
			output1 = boardService.editviewcount(input1);
			output = boardService.getBoardItem(input);
			prevBoard = boardService.getNextDocument(input);
			nextBoard = boardService.getPrevDocument(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("nextBoard", nextBoard);
		model.addAttribute("prevBoard", prevBoard);
		model.addAttribute("output1", output1);
		model.addAttribute("output", output);
		return new ModelAndView("_admin/admin_userExRead_GD");
	}
	// ------------------------------------------------------------------------

	// 관리자 (admin) 페이지 연-결 만남후기 게시판 컨트롤러 DeleteOk
	@RequestMapping(value = "/_admin/admin_userExdeleteOk_GD.do", method = RequestMethod.GET)
	public ModelAndView userExdelete_ok(Model model) {

		int BoardId = webHelper.getInt("BoardId");

		if (BoardId == 0) {
			return webHelper.redirect(null, "공지사항 게시글이 없습니다.");
		}

		Board input = new Board();
		input.setBoardId(BoardId);

		try {
			// 데이터 삭제
			boardService.deleteBoardNotice(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/_admin/admin_userEx_GD.do", "삭제되었습니다.");
	}
	// ------------------------------------------------------------------------

	// 관리자 (admin) 신청현황 List
	@RequestMapping(value = "/_admin/admin_userApply_YH.do", method = RequestMethod.GET)
	public ModelAndView userApplyview(Model model) {
		/** 1) 필요한 변수값 생성 */
		String keyword = webHelper.getString("keyword", ""); // 검색어
		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		int ReqMatchId = webHelper.getInt("ReqMatchId");
		String start = webHelper.getString("start");
		String Title = webHelper.getString("Title");
		int MemberId = webHelper.getInt("MemberId");
		String Select_Date = webHelper.getString("Select_Date");
		int ReqSpService = webHelper.getInt("ReqSpService");

		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		ReqMatch input = new ReqMatch();
		input.setStart(start);
		input.setMemberId(MemberId);
		input.setTitle(Title);
		input.setReqMatchId(ReqMatchId);
		input.setUserName(keyword);
		input.setSelect_Date(Select_Date);
		input.setReqSpService(ReqSpService);

		// 조회결과를 저장할 객체 선언
		List<ReqMatch> output = null;
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = reqMatchService.getReqMatchCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			ReqMatch.setOffset(pageData.getOffset());
			ReqMatch.setListCount(pageData.getListCount());
			// 데이터 조회
			output = reqMatchService.getReqMatchList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("_admin/admin_userApply_YH");
	}
	// -------------------------------------------------------------------------------------

	// 관리자 (admin) 페이지 신청 현황 DeleteOk
	@RequestMapping(value = "/_admin/admin_userApply_YHdeleteOk.do", method = RequestMethod.GET)
	public ModelAndView userApplydelete_ok(Model model) {

		int ReqMatchId = webHelper.getInt("ReqMatchId");

		if (ReqMatchId == 0) {
			return webHelper.redirect(null, "신청현황이 없습니다.");
		}

		int MemberId = webHelper.getInt("MemberId");
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+MemberId);
		
		ReqMatch input = new ReqMatch();
		input.setReqMatchId(ReqMatchId);
		
		User input1 = new User();
		input1.setMemberId(MemberId);

		try {
			
			userService.editreqMatch_isSpUserupdateUser(input1);
			// 데이터 삭제
			reqMatchService.deleteReqMatch(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/_admin/admin_userApply_YH.do", "신청 취소 되었습니다.");
	}
	// -------------------------------------------------------------------------------------

	// My 페이지 1:1문의하기 List
	@RequestMapping(value = "/_mypage/1_1questionEmpty_YH.do", method = RequestMethod.GET)
	public ModelAndView view(Model model, HttpServletRequest request, HttpServletResponse response) {

		int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		User loginInfo = (User) webHelper.getSession("loginInfo");

		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60 * 60);

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		if (loginInfo == null) {
			String redirectUrl = contextPath + "/_login/login_HG.do";
			return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
		}

		String UserName = loginInfo.getUserName();
		int MemberId = loginInfo.getMemberId();
		String Title = webHelper.getString("Title");
		String Content = webHelper.getString("Content");
		String CreationDate = webHelper.getString("CreationDate");
		int Category = webHelper.getInt("Category");

		Board input = new Board();
		input.setUserName(UserName);
		input.setTitle(Title);
		input.setContent(Content);
		input.setCreationDate(CreationDate);
		input.setCategory(Category);
		input.setMemberId(MemberId);

		PageData pageData = null;
		List<Board> output = null;
		try {

			totalCount = boardService.getBoardCount(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			output = boardService.getBoardList1_1(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// View에 추가
		model.addAttribute("pageData", pageData);
		model.addAttribute("output", output);
		return new ModelAndView("_mypage/1_1questionEmpty_YH");
	}
	// ----------------------------------------------------------------------------------

	// My 페이지 1:1문의글 add
	@RequestMapping(value = "/_mypage/1_1questionadd.do", method = RequestMethod.GET)
	public ModelAndView questionadd(Model model) {
		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		return new ModelAndView("_mypage/1_1questionadd");
	}
	// ----------------------------------------------------------------------------------

	// My 페이지 1:1문의글 addOk
	@RequestMapping(value = "/_mypage/1_1questionadd_Ok.do", method = RequestMethod.POST)
	public ModelAndView questionaddOk(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		int MemberId = loginInfo.getMemberId();
		String Title = webHelper.getString("Title");
		String Content = webHelper.getString("Content");
		int Category = webHelper.getInt("Category");
		String CreationDate = webHelper.getString("CreationDate");

		Board input = new Board();
		input.setContent(Content);
		input.setTitle(Title);
		input.setMemberId(MemberId);
		input.setCategory(Category);
		input.setCreationDate(CreationDate);

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			boardService.addBoard1_1(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// View에 추가

		String redirectUrl = contextPath + "/_mypage/1_1questionview.do?BoardId=" + input.getBoardId();
		return webHelper.redirect(redirectUrl, "1:1 문의글이 등록되었습니다.");
	}
	// ----------------------------------------------------------------------------------

	// My 페이지 1:1문의 view
	@RequestMapping(value = "/_mypage/1_1questionview.do", method = RequestMethod.GET)
	public ModelAndView wait(Model model, HttpServletRequest request, HttpServletResponse response) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		int BoardId = webHelper.getInt("BoardId");
		String Re_Content = webHelper.getString("Re_Content");

		if (BoardId == 0) {
			return webHelper.redirect(null, "문의내역이 없습니다.");
		}
		Board input = new Board();
		input.setBoardId(BoardId);

		Reply input1 = new Reply();
		input1.setBoardId(BoardId);
		input1.setRe_Content(Re_Content);

		Board output = null;
		List<Reply> output1 = null;

		try {
			// 데이터 조회
			output1 = replyService.getReplya1_1admin(input1);
			output = boardService.getBoardItem1_1(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output1", output1);
		model.addAttribute("output", output);
		return new ModelAndView("_mypage/1_1questionview");
	}
	// ----------------------------------------------------------------------------------

	// My 페이지 1:1문의 edit
	@RequestMapping(value = "/_mypage/1_1questionedit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {

			String login = loginInfo.getUserName();

			model.addAttribute("login", login);
		}

		int BoardId = webHelper.getInt("BoardId");

		if (BoardId == 0) {
			return webHelper.redirect(null, "문의내역이 없습니다.");
		}

		Board input = new Board();
		input.setBoardId(BoardId);

		Board output = null;

		try {
			output = boardService.getBoardItem1_1(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);
		return new ModelAndView("_mypage/1_1questionedit");
	}
	// ------------------------------------------------------------------------------

	// My 페이지 1:1문의 editOk
	@RequestMapping(value = "/_mypage/1_1questioneditOk.do", method = RequestMethod.POST)
	public ModelAndView edit_ok1_1question(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");
		String Content = webHelper.getString("Content");
		int MemberId = loginInfo.getMemberId();
		int Category = webHelper.getInt("Category");
		String CreationDate = webHelper.getString("CreationDate");

		if (BoardId == 0) {
			return webHelper.redirect(null, "문의내역이 없습니다.");
		}

		Board input = new Board();
		input.setContent(Content);
		input.setTitle(Title);
		input.setMemberId(MemberId);
		input.setCategory(Category);
		input.setCreationDate(CreationDate);
		input.setBoardId(BoardId);

		try {
			boardService.editBoard1_1(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		String redirectUrl = contextPath + "/_mypage/1_1questionEmpty_YH.do";
		return webHelper.redirect(redirectUrl, "1:1문의 글이 수정 되었습니다.");
	}
	// ----------------------------------------------------------------------------------

	// 관리자 (admin) 결제관리 컨트롤러 EditOk (회원 등급, 매니저 부여 후 승인)
	@RequestMapping(value = "/_admin/admin_Payment_edit_GD.do", method = RequestMethod.POST)
	public ModelAndView adminpayedit(Model model) {

		int memlv = webHelper.getInt("memlv");
		int service = webHelper.getInt("service");
		int manager = webHelper.getInt("manager");
		int memberid = webHelper.getInt("MemberId");

		User input = new User();
		input.setMember_Lv(memlv);
		input.setDate_Rest(service);
		input.setManagerId(manager);
		input.setMemberId(memberid);

		try {

			paymentService.clearManager(input);
			userService.managerEditUser(input);

		} catch (Exception e) {

			return webHelper.redirect(null, "DB 오류");
		}

		String redirectUrl = contextPath + "/_admin/admin_Payment_GD.do";
		return webHelper.redirect(redirectUrl, "승인되었습니다.");
	}
	// ----------------------------------------------------------------------------------

	// 연-결 성혼스토리 컨트롤러 List
	@RequestMapping(value = "/_info/story_SE.do", method = RequestMethod.GET)
	public ModelAndView viewStory(Model model) {

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

		int BoardId = webHelper.getInt("BoardId");
		String CreationDate = webHelper.getString("CreationDate");

		String Title = "";
		String UserName = "";
		
		if (selected.equals("bTitle")) {
            Title = keyword;

        } else if (selected.equals("bName")) {
            UserName = keyword;

        } else {
            Title = keyword;
            UserName = keyword;
        }
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);
		input.setUserName(UserName);
		input.setCreationDate(CreationDate);

		List<Board> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = boardService.getBoardCountStory(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Board.setOffset(pageData.getOffset());
			Board.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = boardService.getBoardListStory(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("selected", selected);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("_info/story_SE");
	}
	// ---------------------------------------------------------------------------

	// 연-결 성혼스토리 컨트롤러 view
	@RequestMapping(value = "/_info/storyRead_SE.do", method = RequestMethod.GET)
	public ModelAndView read2(Model model) {

		User loginInfo = (User) webHelper.getSession("loginInfo");

		if (loginInfo != null) {
			String login = loginInfo.getUserName();
			model.addAttribute("login", login);
		}

		if (loginInfo == null) {
			String redirectUrl = contextPath + "/_login/login_HG.do";
			return webHelper.redirect(redirectUrl, "로그인 후 이용해주세요.");
		}

		/** 1) 필요한 변수값 생성 */
		// 조회할 대상에 대한 PK값
		int BoardId = webHelper.getInt("BoardId");
		String Title = webHelper.getString("Title");
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (BoardId == 0) {
			return webHelper.redirect(null, "글번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Board input = new Board();
		input.setBoardId(BoardId);
		input.setTitle(Title);

		// 조회결과를 저장할 객체 선언
		Board output = null;
		Board prevBoard = null;
		Board nextBoard = null;

		try {
			// 데이터 조회
			output = boardService.getBoardItem(input);
			nextBoard = boardService.getNextStoryDocument(input);
			prevBoard = boardService.getPrevStoryDocument(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) View 처리 */
		model.addAttribute("nextBoard", nextBoard);
		model.addAttribute("prevBoard", prevBoard);
		model.addAttribute("output", output);
		return new ModelAndView("_info/storyRead_SE");
	}
	// ---------------------------------------------------------------------------
	/** 파일 다운로드 및 썸네일을 생성하는 페이지 */
    // --> 다운로드 ex) /upload/download.do?file=이미지경로&origin=원본파일이름
    // --> 썸네일 ex) /upload/download.do?file=이미지경로&size=240x320&crop=true
    @RequestMapping(value = "/upload/download.do", method = RequestMethod.GET)
    public ModelAndView download(Model model) {
        // 서버상에 저장되어 있는 파일경로 (필수)
        String filePath = webHelper.getString("file");
        // 원본 파일이름 (미필수)
        String originName = webHelper.getString("origin");
        // 축소될 이미지 해상도 --> 320x320
        String size = webHelper.getString("size");
        // 이미지 크롭 여부 --> 값이 없을 경우 기본값 false
        String crop = webHelper.getString("crop", "false");

        /** 다운로드 스트림 출력하기 */
        if (filePath != null) {
            try {
                // 썸네일 생성을 위해 축소될 이미지의 사이즈가 요청되었다면?
                if (size != null) {
                    // x를 기준으로 나눠서 숫자로 변환
                    String[] temp = size.split("x");
                    int width = Integer.parseInt(temp[0]);
                    int height = Integer.parseInt(temp[1]);

                    // 모든 파라미터는 문자열이므로 크롭 여부를 boolean으로 재설정
                    boolean is_crop = false;
                    if (crop.equals("true")) {
                        is_crop = true;
                    }

                    // 썸네일 생성 후 다운로드 처리
                    downloadHelper.download(filePath, width, height, is_crop);
                } else {
                    // 원본에 대한 다운로드 처리
                    downloadHelper.download(filePath, originName);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        // View를 사용하지 않고 FileStream을 출력하므로 리턴값은 없다.
        return null;
    }
}
