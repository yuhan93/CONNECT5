package study.spring.simplespring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.simplespring.model.Payment;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.PaymentService;

@Service
@Slf4j
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public Payment getPaymentItem(Payment input) throws Exception {

		Payment result = null;
		try {
			result = sqlSession.selectOne("PaymentMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}

		return result;
	}

	@Override
	public List<Payment> getPaymentList(Payment input) throws Exception {
		List<Payment> result = null;

		try {
			result = sqlSession.selectList("PaymentMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
		return result;
	}

	@Override
	public int getPaymentCount(Payment input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createPayment(Payment input) throws Exception {

		int result = 0;
		try {

			result = sqlSession.insert("PaymentMapper.insertItem", input);
			if (result == 0) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}

		return result;

	}

	@Override
	public int deletePayment(Payment input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int clearManager(User input) throws Exception {
		int result = 0;

	      try {
	         result = sqlSession.update("PaymentMapper.updateItem", input);
	            
	         if (result == 0) {
	            throw new NullPointerException("result=0");
	         }
	      } catch (NullPointerException e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("수정된 데이터가 없습니다.");
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 수정에 실패했습니다.");
	      }

	      return result;
	   }

}
