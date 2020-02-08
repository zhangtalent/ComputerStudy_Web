package z.talent.tengyu.bean;

public class Journal {
	
	private String title,journalcontent,time,uuid,pic1,pic2,pic3;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getJournalcontent() {
		return journalcontent;
	}

	public void setJournalcontent(String journalcontent) {
		this.journalcontent = journalcontent;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public String getPic3() {
		return pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}

	public Journal(String title, String journalcontent, String time, String uuid, String pic1, String pic2,
			String pic3) {
		super();
		this.title = title;
		this.journalcontent = journalcontent;
		this.time = time;
		this.uuid = uuid;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
	}

	public Journal() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	
}
