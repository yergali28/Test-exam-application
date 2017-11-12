package com.Beans;

import java.util.List;

import javax.ejb.Local;

import com.Entities.ExamQuestion;
import com.Entities.TestQuestion;

@Local
public interface QuestionBeanLocal {
	
	void addTestQuestion(TestQuestion testQuestion);
	void editTestQuestion(TestQuestion testQuestion, Long questionId);
	void deleteTestQuestion(Long testQuestionId);
	List<TestQuestion> getTestQuestions();
	List<TestQuestion> getRandomTestQuestions(int limit);
	void addExamQuestion(ExamQuestion examQuestion);
	TestQuestion createTestQuestionEntity(String question, String answerOne, String answerTwo, String answerThree,
			String answerFour, Long correctAnswer);

}
