package z.talent.tengyu.bean;

public class EnglishAudio {
	
	private String title,audiourl,content,createtime,uuid;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAudiourl() {
		return audiourl;
	}

	public void setAudiourl(String audiourl) {
		this.audiourl = audiourl;
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

	public EnglishAudio(String title, String audiourl, String content, String createtime, String uuid) {
		super();
		this.title = title;
		this.audiourl = audiourl;
		this.content = content;
		this.createtime = createtime;
		this.uuid = uuid;
	}

	public EnglishAudio() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
