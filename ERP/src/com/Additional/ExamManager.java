package com.Additional;

import java.util.ArrayList;
import java.util.List;

import com.Entities.ExamQuestion;
import com.Entities.TestQuestion;

public class ExamManager {
	
	private List<TestQuestion> testQuestions;
	private List<ExamQuestion> examQuestions;
	
	private int currentQuestionIndex;
	
	private ExamManager() { 
		currentQuestionIndex = 0;
		examQuestions = new ArrayList<>();
	}
	
	public static ExamManager createExam(List<TestQuestion> questions) {
		 ExamManager manager = new ExamManager();
		 manager.setTestQuestions(questions);
		 
		 return manager;
	}

	public List<TestQuestion> getTestQuestions() {
		return testQuestions;
	}

	public void setTestQuestions(List<TestQuestion> testQuestions) {
		this.testQuestions = testQuestions;
	}

	public int getCurrentQuestionIndex() {
		return currentQuestionIndex;
	}
	
	public TestQuestion getCurrentQuestion() {
		return testQuestions.get(currentQuestionIndex);
	}
	
	public void changeQuestion() {
		currentQuestionIndex++;
	}
	
	public List<ExamQuestion> getExamQuestions() {
		return examQuestions;
	}

	public void setExamQuestions(List<ExamQuestion> examQuestions) {
		this.examQuestions = examQuestions;
	}

	public void addExamQuestion(ExamQuestion examQuestion) {
		examQuestions.add(examQuestion);
	}
}
