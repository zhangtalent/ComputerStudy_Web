package z.talent.tengyu.bean;

public class EnglishListenData {
	private String audioid,createtime,uuid,userid;
	private int listentime,rateofcorrect;
	public String getAudioid() {
		return audioid;
	}

	public void setAudioid(String audioid) {
		this.audioid = audioid;
	}

	public int getListentime() {
		return listentime;
	}

	public void setListentime(int listentime) {
		this.listentime = listentime;
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

	public int getRateofcorrect() {
		return rateofcorrect;
	}

	public void setRateofcorrect(int rateofcorrect) {
		this.rateofcorrect = rateofcorrect;
	}

	public String getUseridString() {
		return userid;
	}

	public void setUseridString(String userid) {
		this.userid = userid;
	}

	public EnglishListenData(String audioid, int listentime, String createtime, String uuid, int rateofcorrect,
			String userid) {
		super();
		this.audioid = audioid;
		this.listentime = listentime;
		this.createtime = createtime;
		this.uuid = uuid;
		this.rateofcorrect = rateofcorrect;
		this.userid = userid;
	}

	public EnglishListenData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
