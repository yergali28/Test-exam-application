package com.Mdb;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.EJB;
import javax.ejb.MessageDriven;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

import com.DButil.DBUtilLocal;
import com.Entities.ExamQuestion;

@MessageDriven(
		mappedName = "ExamQueue",
		activationConfig = { 
			@ActivationConfigProperty(propertyName = "destinationLookup", propertyValue = "java:/jms/queue/ExamQueue"),
			@ActivationConfigProperty(propertyName = "acknowledgeMode", propertyValue = "Auto-acknowledge"),
			@ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue")
		})
public class MDBReceiver implements MessageListener {
	
	@EJB
	private DBUtilLocal dbUtil;

	@Override
	public void onMessage(Message message) {
		try{ 		
    		ObjectMessage objectMessage = (ObjectMessage) message;
    		Object object = objectMessage.getObject();
    		
    		if(object instanceof ExamQuestion){
    			dbUtil.addExamQuestion((ExamQuestion) object);
    		}
    		
    	}catch (JMSException e) {
			throw new IllegalStateException(e);
		}
		
	}

}
