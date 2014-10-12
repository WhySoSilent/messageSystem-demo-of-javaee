package pojo;

/**
 * Msg entity. @author MyEclipse Persistence Tools
 */

public class Msg implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userid;
	private String realname;
	private String content;

	// Constructors

	/** default constructor */
	public Msg() {
	}

	/** minimal constructor */
	public Msg(Integer userid) {
		this.userid = userid;
	}

	/** full constructor */
	public Msg(Integer userid, String realname, String content) {
		this.userid = userid;
		this.realname = realname;
		this.content = content;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}