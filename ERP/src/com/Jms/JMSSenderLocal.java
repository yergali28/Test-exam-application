package com.Jms;

import javax.ejb.Local;

import com.Entities.ExamQuestion;

@Local
public interface JMSSenderLocal {
	
	void addExamQuestion(ExamQuestion examQuestion);

}
