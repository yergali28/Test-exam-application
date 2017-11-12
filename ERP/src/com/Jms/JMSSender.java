package com.Jms;

import javax.annotation.Resource;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.ObjectMessage;
import javax.jms.Queue;
import javax.jms.Session;

import com.Entities.ExamQuestion;

@Stateless
@LocalBean
public class JMSSender implements JMSSenderLocal {
	
	@Resource(mappedName = "java:jboss/DefaultJMSConnectionFactory")
	private ConnectionFactory connectionFactory;
	
	@Resource(mappedName = "java:/jms/queue/ExamQueue")
	private Queue queue;

	private Connection connection;

	@Override
	public void addExamQuestion(ExamQuestion examQuestion) {
		try{
			
			if(connection==null){
				connection = connectionFactory.createConnection();
			}
			
			Session session = connection.createSession(true, Session.AUTO_ACKNOWLEDGE);
			
			ObjectMessage objectMessage = session.createObjectMessage();
			objectMessage.setObject(examQuestion);
			
			MessageProducer messageProducer = session.createProducer(queue);
			messageProducer.send(objectMessage);
			messageProducer.close();
			
			session.close();
			
		}catch (JMSException e) {
			throw new IllegalStateException(e);
		}
	}

}
