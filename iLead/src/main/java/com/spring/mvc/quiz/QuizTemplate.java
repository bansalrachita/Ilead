package com.spring.mvc.quiz;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.JoinColumn;

@Entity
@Table(name="QUIZ_TEMPLATE")
public class QuizTemplate implements java.io.Serializable{

	/**
	 * 
	 */
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int QT_ID;
	
	@ManyToOne
	@JoinColumn(name="QM_ID")
	private QuizMaster quizMaster;
	
	@Column(name="QUESTION_STRING")
	@Lob
	private String questionString;
	
	/*@ElementCollection(fetch=FetchType.LAZY)
	@JoinTable(name="OPTIONS", 
	joinColumns= @JoinColumn(name="QT_ID")
	)
	@GenericGenerator(name = "native", strategy = "native")
	private Collection<Options> options = new ArrayList<Options>();
	*/
	
	@Column(name="ANSWER_OPTIONS")
	private String options;
	
	private String answer;
	
	@Column(name="LEVEL_OF_DIFFICULTY")
	private String difficultyLevel;
	
	@Transient
	private Level level ;
	
	public enum Level{
		High("HIGH"),
		low("LOW"),
		Medium("MEDIUM");
		
		private String value;
		
		private Level(String level){
			value = level;
		}
		
		public String getValue(){
			return value;
		}
		
	}
	
	
	
	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public int getQT_ID() {
		return QT_ID;
	}

	public void setQT_ID(int qT_ID) {
		QT_ID = qT_ID;
	}

	public QuizMaster getQuizMaster() {
		return quizMaster;
	}

	public void setQuizMaster(QuizMaster quizMaster) {
		this.quizMaster = quizMaster;
	}

	public String getQuestionString() {
		return questionString;
	}

	public void setQuestionString(String questionString) {
		this.questionString = questionString;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
	}

	public String getDifficultyLevel() {
		return difficultyLevel;
	}

	public void setDifficultyLevel(String difficultyLevel) {
		this.difficultyLevel = difficultyLevel;
	}

	
	
	
	
}
