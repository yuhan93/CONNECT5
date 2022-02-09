package study.spring.simplespring.model;

import lombok.Data;

@Data
public class Email {
	
	private String to;
	private String subject;
	private String content;
	private String receiver;
}
