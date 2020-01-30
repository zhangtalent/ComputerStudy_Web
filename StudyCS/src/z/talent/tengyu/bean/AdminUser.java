package z.talent.tengyu.bean;

public class AdminUser {
	
	private String username,password,time,uuid;
	
	public AdminUser(String username, String password, String time, String uuid) {
		super();
		this.username = username;
		this.password = password;
		this.time = time;
		this.uuid = uuid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}


	
	
}
