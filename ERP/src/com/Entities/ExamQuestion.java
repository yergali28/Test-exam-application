package com.Entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "exam_questions")
public class ExamQuestion implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "exam_id")
	private Exam exam;
	
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
	
	@Column(name = "user_answer_value")
	private Long userAnswer;
	
	@Column(name = "is_correct")
	private Long isCorrect;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
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

	public String getAnswerFour() {
		return answerFour;
	}

	public void setAnswerFour(String answerFour) {
		this.answerFour = answerFour;
	}

	public String getAnswerThree() {
		return answerThree;
	}

	public void setAnswerThree(String answerThree) {
		this.answerThree = answerThree;
	}

	public Long getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(Long correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public Long getUserAnswer() {
		return userAnswer;
	}

	public void setUserAnswer(Long userAnswer) {
		this.userAnswer = userAnswer;
	}

	public Long getIsCorrect() {
		return isCorrect;
	}

	public void setIsCorrect(Long isCorrect) {
		this.isCorrect = isCorrect;
	}
	
	public void submitTestQuestion(TestQuestion testQuestion) {
		this.question = testQuestion.getQuestion();
		this.answerOne = testQuestion.getAnswerOne();
		this.answerTwo = testQuestion.getAnswerTwo();
		this.answerThree = testQuestion.getAnswerThree();
		this.answerFour = testQuestion.getAnswerFour();
		this.correctAnswer = testQuestion.getCorrectAnswer();
	}
}
