package boss.model;

import java.util.Date;

public class Review {
	private int rid; // pk 리뷰 고유번호
	private String memail; // fk 회원아이디
	private int oid; // fk 주문번호
	private int pid; // fk 상품번호
	private String rwriter; // 작성자 (회원이름일듯)
	private String title; // 작성자 (회원이름일듯)
	private String rimage; // 이미지
	private Date rreg; // 작성일
	private int rreadcount; // 조회수
	private String rdrop; // 삭제여부 default 'N'

	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRimage() {
		return rimage;
	}
	public void setRimage(String rimage) {
		this.rimage = rimage;
	}
	public Date getRreg() {
		return rreg;
	}
	public void setRreg(Date rreg) {
		this.rreg = rreg;
	}
	public int getRreadcount() {
		return rreadcount;
	}
	public void setRreadcount(int rreadcount) {
		this.rreadcount = rreadcount;
	}
	public String getRdrop() {
		return rdrop;
	}
	public void setRdrop(String rdrop) {
		this.rdrop = rdrop;
	}

}
