package z.talent.tengyu.bean;

public class EnglishPassage {
	private String title,content,createtime,uuid;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public EnglishPassage(String title, String content, String createtime, String uuid) {
		super();
		this.title = title;
		this.content = content;
		this.createtime = createtime;
		this.uuid = uuid;
	}

	public EnglishPassage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
