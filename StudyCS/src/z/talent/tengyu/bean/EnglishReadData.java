package z.talent.tengyu.bean;

public class EnglishReadData {
	private String pageid,createtime,uuid,userid;
	private int readtime;
	public EnglishReadData(String pageid, String createtime, String uuid, String userid, int readtime) {
		super();
		this.pageid = pageid;
		this.createtime = createtime;
		this.uuid = uuid;
		this.userid = userid;
		this.readtime = readtime;
	}
	public EnglishReadData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPageid() {
		return pageid;
	}
	public void setPageid(String pageid) {
		this.pageid = pageid;
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
	public String getUseridString() {
		return userid;
	}
	public void setUseridString(String userid) {
		this.userid = userid;
	}
	public int getReadtime() {
		return readtime;
	}
	public void setReadtime(int readtime) {
		this.readtime = readtime;
	}
	
}
