package study.spring.simplespring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.UserService;

@Service
@Slf4j
public class UserServiceImpl implements UserService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public User getUserItem(User input) throws Exception {
		User result = null;

		try {
			result = sqlSession.selectOne("UserMapper.selectItem", input);

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
	public List<User> getUserList(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectList", input);

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
	public int getUserCount(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int addUser(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("UserMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int editUser(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("UserMapper.updateItem1", input);

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

	@Override
	public int deleteUser(User input) throws Exception {
		int result = 0;
		
		try {
			sqlSession.update("UserMapper.unsetBoard", input);
			sqlSession.update("UserMapper.unsetManager", input);
			sqlSession.update("UserMapper.unsetReply", input);
			sqlSession.update("UserMapper.unsetReqMatch", input);
			sqlSession.update("UserMapper.unsetPayMent", input);
			sqlSession.update("UserMapper.unsetSucMatch", input);
			
			result = sqlSession.delete("UserMapper.deleteItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public User selectLoginInfo(User input) throws Exception {
		User result = null;

		try {

			result = sqlSession.selectOne("UserMapper.selectLoginInfo", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("비밀번호를 다시 입력해주세요.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;

	}
	
	@Override
	public int selectGender(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectItem_Gender", input);
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
	public User selectFindaccount(User input) throws Exception {
		User result = null;

		try {

			result = sqlSession.selectOne("UserMapper.selectFindaccount", input);
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
	public User selectMypage(User input) throws Exception {
		User result = null;

		try {

			result = sqlSession.selectOne("UserMapper.selectMypage", input);
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
	public List<User> getUserListadminUser(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectListadminUser", input);

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
	public User getUserItemadminUser(User input) throws Exception {
		User result = null;

		try {
			result = sqlSession.selectOne("UserMapper.selectItemadminUser", input);

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

	/** 남녀 회원 수 */
	@Override
	public int getSelectCountGenderMen(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountGenderMen", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getSelectCountGenderWomen(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountGenderWomen", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/** 연봉범위별 남녀 회원 수 */
	@Override
	public int getselectCountAnnualSalary0010M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary0010M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary0010W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary0010W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary2000M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary2000M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary2000W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary2000W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary3000M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary3000M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary3000W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary3000W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary4000M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary4000M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary4000W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary4000W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary5000M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary5000M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary5000W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary5000W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary6070M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary6070M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary6070W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary6070W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary8090M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary8090M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary8090W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary8090W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary10000M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary10000M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAnnualSalary10000W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAnnualSalary10000W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/** 연령대별 남녀 회원 수 */
	@Override
	public int getselectCountAge2024M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge2024M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge2024W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge2024W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge2529M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge2529M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge2529W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge2529W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge3034M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge3034M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge3034W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge3034W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge3539M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge3539M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge3539W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge3539W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge4049M(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge4049M", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge4049W(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge4049W", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge50PlusM(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge50PlusM", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountAge50PlusW(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountAge50PlusW", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/** 최종학력별 남녀 회원 수 */
	@Override
	public int getselectCountEduHighschoolM(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduHighschoolM", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountEduHighschoolW(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduHighschoolW", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountEduCollegeM(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduCollegeM", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountEduCollegeW(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduCollegeW", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountEduUniversityM(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduUniversityM", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountEduUniversityW(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduUniversityW", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountEduGraduateSchoolM(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduGraduateSchoolM", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountEduGraduateSchoolW(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduGraduateSchoolW", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountEduDoctoralM(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduDoctoralM", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getselectCountEduDoctoralW(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.selectCountEduDoctoralW", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int editUserinformation(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UserMapper.updateIteminformation", input);
			
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

	@Override
	public int editUseradmin(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UserMapper.updateItemadmin", input);
			
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

	@Override
	public int specialEditUser(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("UserMapper.Special_updateItem", input);
				
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
	@Override
	public int managerEditUser(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("UserMapper.Manager_updateItem", input);
				
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
	

	@Override
	public User getUserIdCheck(User input) throws Exception {
		User result = null;

		try {
			result = sqlSession.selectOne("UserMapper.IdCheck", input);

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
	   public int editreqMatch_User(User input1) throws Exception {
	      int result = 0;

	      try {
	         result = sqlSession.update("UserMapper.reqMatch_updateUser", input1);
	            
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

	@Override
	public User getUserItemFindId(User input) throws Exception {
		User result = null;

	      try {
	         result = sqlSession.selectOne("UserMapper.selectItemFindId", input);
	            
	         if (result == null) {
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

	@Override
	public User selectFindPassword(User input) throws Exception {
		User result = null;

		try {

			result = sqlSession.selectOne("UserMapper.selectFindPassword", input);
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
	public int editUserPw(User input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UserMapper.updateItemPw", input);
			
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
	
	@Override
	public int editreqSpService_User(User input) throws Exception {
		int result = 0;

	      try {
	         result = sqlSession.update("UserMapper.reqSpService_updateUser", input);
	            
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

	@Override
	public List<User> getreqUserList(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectModalList", input);

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
	public List<User> getreqUserList1(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectModalList1", input);

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
	public List<User> getreqUserList1_1(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectModalList1_1", input);

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
	public List<User> getreqUserList2(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectModalList2", input);

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
	public List<User> getreqUserList2_1(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectModalList2_1", input);

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
	public List<User> getreqUserList3(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectModalList3", input);

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
	public List<User> getreqUserList3_1(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectModalList3_1", input);

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
	public List<User> getreqUserList4(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectModalList4", input);

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
	public List<User> getsucUserList(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.selectSucModalList", input);

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
	public List<User> getidealtypeok(User input) throws Exception {
		List<User> result = null;

		try {
			result = sqlSession.selectList("UserMapper.idealtypeList", input);

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
	public int getCountM_Member_lvB(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountM_Member_lvB", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountM_Member_lvS(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountM_Member_lvS", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountM_Member_lvG(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountM_Member_lvG", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountM_Member_lvV(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountM_Member_lvV", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountW_Member_lvB(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountW_Member_lvB", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountW_Member_lvS(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountW_Member_lvS", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountW_Member_lvG(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountW_Member_lvG", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountW_Member_lvV(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountW_Member_lvV", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountM_All(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.MCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountW_All(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.WCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountM_Member_lvN(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountM_Member_lvN", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCountW_Member_lvN(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.CountW_Member_lvN", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int editreqMatch_isSpUserupdateUser(User input) throws Exception {
		 int result = 0;

	      try {
	         result = sqlSession.update("UserMapper.reqMatch_isSpUserupdateUser", input);
	            
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

	@Override
	public int editUserRest(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("UserMapper.updateItemRest", input);

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

	@Override
	public int editUserRestUp(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("UserMapper.updateItemRestUp", input);

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

	@Override
	public int editUserSucMatch(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("UserMapper.updateItemSucMatch", input);

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

	@Override
	public int editDate_Rest(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("UserMapper.updateDate_Rest", input);

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