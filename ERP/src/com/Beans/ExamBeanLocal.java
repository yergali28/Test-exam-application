package com.Beans;

import java.util.List;

import javax.ejb.Local;

import com.Entities.Exam;

@Local
public interface ExamBeanLocal {

	Long createExam(Exam exam);
	Exam getExamById(Long id);
	List<Exam> getUserExamsById(Long id);
}
