package study.spring.simplespring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.simplespring.helper.MailHelper;
import study.spring.simplespring.helper.RegexHelper;
import study.spring.simplespring.helper.WebHelper;
import study.spring.simplespring.model.Payment;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.ManagerService;
import study.spring.simplespring.service.PaymentService;
import study.spring.simplespring.service.UserService;

@Controller
public class PaymentController {


   @Autowired
   WebHelper webHelper;

   @Autowired
   RegexHelper regexHelper;

   @Autowired
   MailHelper mailHelper;
   
   @Autowired
   UserService userService;

   @Autowired
   PaymentService paymentService;
   
   @Autowired
   ManagerService managerService;   

   @Value("#{servletContext.contextPath}")
   String contextPath;
   
   
   // 결제 서비스 컨트롤러
   @RequestMapping(value = "/_payment/payment_GD.do", method = RequestMethod.GET)
   public ModelAndView payment(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      return new ModelAndView("_payment/payment_GD");
   }
   //---------------------------------------------------------------------------
   

   // 결제 서비스 컨트롤러 addOk
   @RequestMapping(value = "/_payment/payok.do", method = RequestMethod.POST)
   public ModelAndView payok(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");
      Integer memberid = (Integer) loginInfo.getMemberId();

      int servicetype = webHelper.getInt("level");
      int pmttype = webHelper.getInt("pay");
      int servicebank = webHelper.getInt("bank");
      String payername = webHelper.getString("payName");
      int card = webHelper.getInt("cardType");
      int pmtplan = webHelper.getInt("installment");
      /** 2) 데이터 조회하기 */
      // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
      Payment input = new Payment();
      input.setServicetype(servicetype);
      input.setServicebank(servicebank);
      input.setPmtplan(pmtplan);
      input.setPayername(payername);
      input.setCard(card);
      input.setPmttype(pmttype);
      input.setMemberid(memberid);

      try {
         paymentService.createPayment(input);
         System.out.println(input);
      } catch (Exception e) {
         return webHelper.redirect(null, "DB 오류");
      }

      String redirectUrl = contextPath + "/_payment/pay_ok_GD.do";
      return webHelper.redirect(redirectUrl, "결제가 완료되었습니다.");
   }
   //---------------------------------------------------------------------------

   
   // 결제 서비스 컨트롤러 3번
   @RequestMapping(value = "/_payment/pay_ok_GD.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String paysuccess(Model model) {

      User loginInfo = (User) webHelper.getSession("loginInfo");

      if (loginInfo != null) {
         String login = loginInfo.getUserName();
         model.addAttribute("login", login);
      }

      return "_payment/pay_ok_GD";
   }
   //-----------------------------------------------------------------------------
   
}