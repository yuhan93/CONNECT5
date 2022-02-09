package study.spring.simplespring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.simplespring.model.Board;
import study.spring.simplespring.service.BoardService;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public Board getBoardItem(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItem", input);

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
	public int getBoardCount(Board input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("BoardMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}
	
	@Override
	public int getBoardCountStory(Board input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("BoardMapper.selectCountAllStory", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}


	@Override
	public int getBoardCountNotice(Board input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("BoardMapper.selectCountAllNotice", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}


	@Override
	public int getBoardCountReview(Board input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("BoardMapper.selectCountAllReview", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}
	
	@Override
	public int getBoardCountQnA(Board input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("BoardMapper.selectCountAllQnA", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	@Override
	public int addBoard(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("BoardMapper.insertItem", input);

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
	public int addBoardReview(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("BoardMapper.insertItemReview", input);

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
	public int addBoardQnA(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("BoardMapper.insertItemQnA", input);

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
	public int editBoard(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.update("BoardMapper.updateItem", input);

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
	public int deleteBoard(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.delete("BoardMapper.deleteItem", input);

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
	public List<Board> getBoardListNotice(Board input) throws Exception {
		List<Board> result = null;

        try {
            result = sqlSession.selectList("BoardMapper.selectListNotice", input);

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
	public List<Board> getBoardListReview(Board input) throws Exception {
		List<Board> result = null;

        try {
            result = sqlSession.selectList("BoardMapper.selectListReview", input);

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
	public List<Board> getBoardListQnA(Board input) throws Exception {
		List<Board> result = null;

        try {
            result = sqlSession.selectList("BoardMapper.selectListQnA", input);

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
	public List<Board> getBoardListStory(Board input) throws Exception {
		List<Board> result = null;

        try {
            result = sqlSession.selectList("BoardMapper.selectListStory", input);

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
	public List<Board> getBoardList1_1(Board input) throws Exception {
		List<Board> result = null;

		try {
			
			result = sqlSession.selectList("BoardMapper.selectList1_1", input);

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
	public Board getBoardItem1_1(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItem1_1", input);

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
	public int editBoard1_1(Board input) throws Exception {
		int result = 0;

        try {
        	
            result = sqlSession.update("BoardMapper.updateItem1_1", input);

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
	public int addBoardNotice(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("BoardMapper.insertItemadminNotice", input);
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
	public Board getBoardNotice(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItemadminNotice", input);

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
	public int editBoardNotice(Board input) throws Exception {
		int result = 0;

        try {
        	
            result = sqlSession.update("BoardMapper.updateItemadminNotice", input);

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
	public int deleteBoardNotice(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.delete("BoardMapper.deleteItemadminNotice", input);

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
	public List<Board> getBoardListadminNotice(Board input) throws Exception {
		List<Board> result = null;

        try {
            result = sqlSession.selectList("BoardMapper.selectListadminNotice", input);

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
	public int addBoard1_1(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("BoardMapper.insertItem1_1", input);
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
	public List<Board> getBoardListadmin1_1(Board input) throws Exception {
		List<Board> result = null;

        try {
            result = sqlSession.selectList("BoardMapper.selectListadmin1_1", input);

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
	public Board getBoardItemadmin1_1(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItemadmin1_1", input);

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
	public Board getBoardItemTip(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItemTip", input);

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
	public List<Board> getBoardListTip(Board input) throws Exception {
		List<Board> result = null;

		try {
			result = sqlSession.selectList("BoardMapper.selectListTip", input);

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
	public int addBoardTip(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("BoardMapper.insertItemTip", input);

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
	public int getBoardCountTip(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("BoardMapper.selectCountTip", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public int deleteTip(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.delete("BoardMapper.deleteItemTip", input);

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
	public int editTip(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.update("BoardMapper.editItemTip", input);

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
	public List<Board> getBoardListColumn(Board input) throws Exception {
		List<Board> result = null;

		try {
			result = sqlSession.selectList("BoardMapper.selectListColumn", input);

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
	public int addBoardColumn(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("BoardMapper.insertItemColumn", input);

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
	public int getBoardCountColumn(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("BoardMapper.selectCountColumn", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public int deleteColumn(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.delete("BoardMapper.deleteItemColumn", input);

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
	public int editColumn(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.update("BoardMapper.editItemColumn", input);

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
	public Board getBoardItemColumn(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItemColumn", input);

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
	public Board getBoardItemadminQnA(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItemadminQnA", input);

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
	public Board getBoardItemadminLater(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItemadminQnA", input);

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
	public List<Board> getBoardListadminQnA(Board input) throws Exception {
		List<Board> result = null;

		try {
			result = sqlSession.selectList("BoardMapper.selectListadminQnA", input);

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
	public List<Board> getBoardListadminLater(Board input) throws Exception {
		List<Board> result = null;

		try {
			result = sqlSession.selectList("BoardMapper.selectListColumn", input);

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
	public int editviewcount(Board input1) throws Exception {
		int result = 0;

        try {
            result = sqlSession.update("BoardMapper.updateviewcount", input1);

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
	public Board getPrevDocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectPrevDocument", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이전글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public Board getNextDocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectNextDocument", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("다음글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public int getBoardCountadminQnA(Board input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("BoardMapper.selectCountAlladminQnA", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}


	@Override
	public int getBoardCountadminLater(Board input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int addBoardadminQnA(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("BoardMapper.insertItemadminQnA", input);

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
	public int addBoardadminReview(Board input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("BoardMapper.insertItemadminReview", input);

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
	public Board getPrevStoryDocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectStoryPrevDocument", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이전글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public Board getNextStoryDocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectStoryNextDocument", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("다음글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public Board getPrevNoticeDocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectNoticePrevDocument", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이전글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public Board getNextNoticeDocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectNoticeNextDocument", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("다음글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public Board getPrevQnADocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectQnAPrevDocument", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이전글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public Board getNextQnADocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectQnANextDocument", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("다음글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public Board getPrevreviewADocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectReviewPrevDocument", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이전글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public Board getNextreviewDocument(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectReviewNextDocument", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("다음글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	// 관리자 성혼스토리 게시판 시작 ================================================= /
	@Override
	public List<Board> getBoardListAdminStory(Board input) throws Exception {
		List<Board> result = null;

		try {
			result = sqlSession.selectList("BoardMapper.selectListAdminStory", input);

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
	public int getBoardCountAdminStory(Board input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("BoardMapper.selectCountAllAdminStory", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	@Override
	public Board getBoardItemAdminStory(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItemAdminStory", input);

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
	public int addBoardAdminStory(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("BoardMapper.insertItemAdminStory", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("추가된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 추가에 실패했습니다.");
		}

		return result;
	}


	@Override
	public Board getBoardAdminStory(Board input) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectItemAdminStory", input);

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
	public int editBoardAdminStory(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("BoardMapper.updateItemAdminStory", input);

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
	public int deleteBoardAdminStory(Board input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("BoardMapper.deleteItemAdminStory", input);

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
	public int editviewcountAdminStory(Board inputView) throws Exception {
		int result = 0;

        try {
            result = sqlSession.update("BoardMapper.updateviewcountAdminStory", inputView);

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
	public Board getPrevPageAdminStory(Board inputPrev) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectPrevPageAdminStory", inputPrev);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이전글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public Board getNextPageAdminStory(Board inputNext) throws Exception {
		Board result = null;

		try {
			result = sqlSession.selectOne("BoardMapper.selectNextPageAdminStory", inputNext);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("다음글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	// 관리자 성혼스토리 게시판 끝 ============================================ /
	
	
}
