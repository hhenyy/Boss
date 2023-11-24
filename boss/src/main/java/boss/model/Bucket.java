package boss.model;

public class Bucket {
	private int bId; /* 장바구니 고유번호(시퀀스) */
	private String mEmail; /* 이메일 */
	private int pId; /* 상품 고유코드 */
	private String bName; /* 상품명 */
	private String bImage; /* 상품 이미지 */
	private int bCount; /* 상품 수량 */
	private String bSize; /* 상품 사이즈 */
	private String bColor; /* 상품 색상 */
	private int bPrice; /* 상품 가격 */
	private String bDrop; /* 상품 삭제여부 */

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbImage() {
		return bImage;
	}

	public void setbImage(String bImage) {
		this.bImage = bImage;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getbSize() {
		return bSize;
	}

	public void setbSize(String bSize) {
		this.bSize = bSize;
	}

	public String getbColor() {
		return bColor;
	}

	public void setbColor(String bColor) {
		this.bColor = bColor;
	}

	public int getbPrice() {
		return bPrice;
	}

	public void setbPrice(int bPrice) {
		this.bPrice = bPrice;
	}

	public String getbDrop() {
		return bDrop;
	}

	public void setbDrop(String bDrop) {
		this.bDrop = bDrop;
	}

}
