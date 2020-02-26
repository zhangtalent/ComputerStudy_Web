package z.talent.tengyu.bean;

public class EnglishListenError {
	private String word,audioid,familarword,createtime,uuid,userid;
	private int wordcount;

	public EnglishListenError(String word, String audioid, String familarword, String createtime, String uuid,
			String userid, int wordcount) {
		super();
		this.word = word;
		this.audioid = audioid;
		this.familarword = familarword;
		this.createtime = createtime;
		this.uuid = uuid;
		this.userid = userid;
		this.wordcount = wordcount;
	}

	public int getWordcount() {
		return wordcount;
	}

	public void setWordcount(int wordcount) {
		this.wordcount = wordcount;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getAudioid() {
		return audioid;
	}

	public void setAudioid(String audioid) {
		this.audioid = audioid;
	}

	public String getFamilarword() {
		return familarword;
	}

	public void setFamilarword(String familarword) {
		this.familarword = familarword;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public EnglishListenError(String word, String audioid, String familarword, String createtime, String uuid,
			String userid) {
		super();
		this.word = word;
		this.audioid = audioid;
		this.familarword = familarword;
		this.createtime = createtime;
		this.uuid = uuid;
		this.userid = userid;
	}

	public EnglishListenError() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
