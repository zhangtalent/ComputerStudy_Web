package z.talent.tengyu.bean;

public class JournalTypes {
	
	private String keyid,title,uuid;
	private int counts;

	public JournalTypes(String keyid, String title, String uuid) {
		super();
		this.keyid = keyid;
		this.title = title;
		this.uuid = uuid;
	}

	public JournalTypes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getKeyid() {
		return keyid;
	}

	public void setKeyid(String keyid) {
		this.keyid = keyid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}

	public JournalTypes(String keyid, String title, String uuid, int counts) {
		super();
		this.keyid = keyid;
		this.title = title;
		this.uuid = uuid;
		this.counts = counts;
	}
	
	

	
	
}
