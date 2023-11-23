package boss.model;

import java.sql.Date;

public class Notice {

	private int mnid;
	private String mnTitle;
	private String mnContent;
	private Date mnReg;
	private String mnOriFile;
	private int mnReadCount;
	
	public int getMnid() {
		return mnid;
	}
	public void setMnid(int mnid) {
		this.mnid = mnid;
	}
	public String getMnTitle() {
		return mnTitle;
	}
	public void setMnTitle(String mnTitle) {
		this.mnTitle = mnTitle;
	}
	public String getMnContent() {
		return mnContent;
	}
	public void setMnContent(String mnContent) {
		this.mnContent = mnContent;
	}
	public Date getMnReg() {
		return mnReg;
	}
	public void setMnReg(Date mnReg) {
		this.mnReg = mnReg;
	}
	public String getMnOriFile() {
		return mnOriFile;
	}
	public void setMnOriFile(String mnOriFile) {
		this.mnOriFile = mnOriFile;
	}
	public int getMnReadCount() {
		return mnReadCount;
	}
	public void setMnReadCount(int mnReadCount) {
		this.mnReadCount = mnReadCount;
	}
}
