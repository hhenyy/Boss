package boss.model;

public class OrderDetail {

	private int odid; // pk 주문상세번호 (시퀀스)
	private int oid; // fk 주문번호 (odid의 기준점.)
	private int pid; // fk 상품번호 (개별값이 들어감.)
	private int odstatus; // 주문상태를 나타냄 (defalut : 0 ( 배송대기 ) 1 : ( 배송완료 ) 2 : ( 환불처리중 ) 3 : ( 환불완료 )
	private int odcount; // 구매수량 (재고 - 해당번호 => 최신화)

	public int getOdid() {
		return odid;
	}

	public void setOdid(int odid) {
		this.odid = odid;
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

	public int getOdstatus() {
		return odstatus;
	}

	public void setOdstatus(int odstatus) {
		this.odstatus = odstatus;
	}

	public int getOdcount() {
		return odcount;
	}

	public void setOdcount(int odcount) {
		this.odcount = odcount;
	}

}
