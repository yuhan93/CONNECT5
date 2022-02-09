package study.spring.simplespring.service;

import java.util.List;

import study.spring.simplespring.model.Reply;

public interface ReplyService {
	
	public Reply getReplyItem(Reply input) throws Exception;

	public List<Reply> getReplyList(Reply input) throws Exception;

	public int addReply(Reply input) throws Exception;

	public int editReply(Reply input) throws Exception;

	public int deleteReply(Reply input) throws Exception;
	
	public int addReplyadmin1_1(Reply input) throws Exception;

	public Reply getReplyadmin1_1(Reply input) throws Exception;
	
	public List<Reply> getReplya1_1admin(Reply input) throws Exception;
}
