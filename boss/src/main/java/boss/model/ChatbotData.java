package boss.model;

import java.util.Date;

public class ChatbotData {
	private int chatId; /* 챗 번호 */
	private String mEmail; /* 이메일 */
	private Date chatCreatedAt; /* 챗시간 */
	private String msgId; /* chat에 포함된 메시지ID 리스트 */

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public Date getChatCreatedAt() {
		return chatCreatedAt;
	}

	public void setChatCreatedAt(Date chatCreatedAt) {
		this.chatCreatedAt = chatCreatedAt;
	}

	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
}
