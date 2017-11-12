package com.Beans;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.Entities.ExamQuestion;
import com.Entities.TestQuestion;
import com.Jms.JMSSenderLocal;

@SuppressWarnings("unchecked")
@Stateless
@LocalBean
public class QuestionBean implements QuestionBeanLocal {
	
	@PersistenceContext(unitName = "erpPU")
	private EntityManager entityManager;

	@EJB
	private JMSSenderLocal jmsSender;
	
	@Override
	public TestQuestion createTestQuestionEntity(String question, String answerOne, String answerTwo,
			String answerThree, String answerFour, Long correctAnswer) {
		return new TestQuestion.Builder().with()
				.question(question)
				.answerOne(answerOne)
				.answerTwo(answerTwo)
				.answerThree(answerThree)
				.answerFour(answerFour)
				.correctAnswer(correctAnswer)
				.build();
	}

	@Override
	public void addTestQuestion(TestQuestion testQuestion) {
		entityManager.persist(testQuestion);
	}

	@Override
	public void editTestQuestion(TestQuestion testQuestion, Long questionId) {
		entityManager
			.createQuery("UPDATE TestQuestion t SET t.question = :question, "
					+ "t.answerOne = :ansOne, t.answerTwo = :ansTwo, t.answerThree = :ansThree, "
					+ "t.answerFour = :ansFour, t.correctAnswer = :correctAns WHERE t.id = :tid")
			.setParameter("question", testQuestion.getQuestion())
			.setParameter("ansOne", testQuestion.getAnswerOne())
			.setParameter("ansTwo", testQuestion.getAnswerTwo())
			.setParameter("ansThree", testQuestion.getAnswerThree())
			.setParameter("ansFour", testQuestion.getAnswerFour())
			.setParameter("correctAns", testQuestion.getCorrectAnswer())
			.setParameter("tid", questionId)
			.executeUpdate();
	}

	@Override
	public void deleteTestQuestion(Long testQuestionId) {
		entityManager
			.createQuery("DELETE FROM TestQuestion t WHERE t.id = :tid")
			.setParameter("tid", testQuestionId)
			.executeUpdate();
	}

	@Override
	public List<TestQuestion> getTestQuestions() {
		return (List<TestQuestion>) entityManager
				.createQuery("SELECT t FROM TestQuestion t")
				.getResultList();
	}

	@Override
	public List<TestQuestion> getRandomTestQuestions(int limit) {
		return (List<TestQuestion>) entityManager
				.createQuery("SELECT t FROM TestQuestion t ORDER BY RAND()")
				.setMaxResults(limit)
				.getResultList();
	}

	@Override
	public void addExamQuestion(ExamQuestion examQuestion) {
		jmsSender.addExamQuestion(examQuestion);
	}

}
