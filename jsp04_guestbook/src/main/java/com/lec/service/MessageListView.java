package com.lec.service;

import java.util.List;

import com.lec.dto.Message;

public class MessageListView {

	private int messageTotalCount;     // 총건수
	private int currentPageNumber;     // 현재페이지
	private List<Message> messageList; // 방명록데이터
	private int pageTotalCount;        // 총페이지수 = 총건수 / MESSAGE_COUNT_PER_PAGE;
	private int messageCountPerPage;   // 한페이지당 출력 메시지건수 = MESSAGE_COUNT_PER_PAGE
	private int firstRow;              // 조회할 데이터 시작행번호
	private int endRow;                // 조회할 데이터 마지막행번호
	
	public MessageListView(List<Message> messageList, int messageTotalCount
			, int currentPageNumber, int messageCountPerPage, int firstRow, int endRow) {
		
		this.messageList = messageList;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		
		calculatePageTotalCount();
		
	}

	private void calculatePageTotalCount() {
		if(messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = messageTotalCount / messageCountPerPage;
			if(messageTotalCount % messageCountPerPage > 0) pageTotalCount++;
		}
	}

	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
	public boolean isEmpty() {
		return messageTotalCount == 0;
	}
}

