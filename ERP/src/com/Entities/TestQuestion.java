package com.Entities;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "test_questions")
public class TestQuestion implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name = "question")
	private String question;
	
	@Column(name = "answer_one")
	private String answerOne;

	@Column(name = "answer_two")
	private String answerTwo;

	@Column(name = "answer_three")
	private String answerThree;

	@Column(name = "answer_four")
	private String answerFour;
	
	@Column(name = "correct_answer_value")
	private Long correctAnswer;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswerOne() {
		return answerOne;
	}

	public void setAnswerOne(String answerOne) {
		this.answerOne = answerOne;
	}

	public String getAnswerTwo() {
		return answerTwo;
	}

	public void setAnswerTwo(String answerTwo) {
		this.answerTwo = answerTwo;
	}

	public String getAnswerThree() {
		return answerThree;
	}

	public void setAnswerThree(String answerThree) {
		this.answerThree = answerThree;
	}

	public String getAnswerFour() {
		return answerFour;
	}

	public void setAnswerFour(String answerFour) {
		this.answerFour = answerFour;
	}

	public Long getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(Long correctAnswer) {
		this.correctAnswer = correctAnswer;
	}
	
	public List<String> getAnswers() {
		return Arrays.asList(answerOne, answerTwo, answerThree, answerFour);
	}
	
	public static class Builder {

		private String question;
		private String answerOne;
		private String answerTwo;
		private String answerThree;
		private String answerFour;
		private Long correctAnswer;
		
		public Builder with() {
			return this;
		}
		
		public Builder question(String question) {
			this.question = question;
			
			return this;
		}
		
		public Builder answerOne(String answerOne) {
			this.answerOne = answerOne;
			
			return this;
		}
		
		public Builder answerTwo(String answerTwo) {
			this.answerTwo = answerTwo;
			
			return this;
		}
		
		public Builder answerThree(String answerThree) {
			this.answerThree = answerThree;
			
			return this;
		}
		
		public Builder answerFour(String answerFour) {
			this.answerFour = answerFour;
			
			return this;
		}
		
		public Builder correctAnswer(Long correctAnswer) {
			this.correctAnswer = correctAnswer;
			
			return this;
		}
		
		public TestQuestion build() {
			TestQuestion testQuestion = new TestQuestion();
			
			testQuestion.setQuestion(question);
			testQuestion.setAnswerOne(answerOne);
			testQuestion.setAnswerTwo(answerTwo);
			testQuestion.setAnswerThree(answerThree);
			testQuestion.setAnswerFour(answerFour);
			testQuestion.setCorrectAnswer(correctAnswer);
			
			return testQuestion;
		}
	}
}
