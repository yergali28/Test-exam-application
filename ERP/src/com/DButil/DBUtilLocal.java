package com.DButil;

import javax.ejb.Local;

import com.Entities.ExamQuestion;

@Local
public interface DBUtilLocal {
	
	void addExamQuestion(ExamQuestion examQuestion);

}
