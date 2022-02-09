package study.spring.simplespring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import study.spring.simplespring.model.Payment;
import study.spring.simplespring.model.User;

@Service
public interface PaymentService {
	
	public Payment getPaymentItem(Payment input) throws Exception;

	public List<Payment> getPaymentList(Payment input) throws Exception;

	public int getPaymentCount(Payment input) throws Exception;

	public int createPayment(Payment input) throws Exception;

	public int deletePayment(Payment input) throws Exception;
	
	public int clearManager(User input) throws Exception;
}
