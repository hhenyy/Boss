package boss.model;

import java.util.Date;

public class ChatMessageData {
	private int msgId; /* 챗 메시지 번호 */
	private int chatId; /* chatbotData(chatId)참조*/
	private Date msgCreatedAt; /* 메시지시간 */
	private int isAI; /* AI */
	private int msgType; /* 메시지 타입 */
	private String msgtext; /* 메시지내용 */
	private int pId; /* 상품고유코드 */
	private String chatImage;/* 챗이미지 */

	public int getMsgId() {
		return msgId;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public Date getMsgCreatedAt() {
		return msgCreatedAt;
	}

	public void setMsgCreatedAt(Date msgCreatedAt) {
		this.msgCreatedAt = msgCreatedAt;
	}

	public int getIsAI() {
		return isAI;
	}

	public void setIsAI(int isAI) {
		this.isAI = isAI;
	}

	public int getMsgType() {
		return msgType;
	}

	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}

	public String getMsgtext() {
		return msgtext;
	}

	public void setMsgtext(String msgtext) {
		this.msgtext = msgtext;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getChatImage() {
		return chatImage;
	}

	public void setChatImage(String chatImage) {
		this.chatImage = chatImage;
	}

}
