package com.lec.service;

import java.sql.Connection;
import java.util.Collections;
import java.util.List;

import com.lec.dao.MessageDao;
import com.lec.dto.Message;
import com.lec.jdbc.ConnectionProvider;
import com.lec.jdbc.JDBCUtil;

public class GetMessageListService {

	// Singleton
    private GetMessageListService() {}
    private static GetMessageListService instance = new GetMessageListService();
    public static GetMessageListService getInstance() {
    	return instance;
    }
    
    private static final int MESSAGE_COUNT_PER_PAGE = 3;
    
    public MessageListView getMessageList(int pageNumber) {
    	
    	Connection conn = null;
    	int currentPageNumber = pageNumber;
    	
    	try {
    		conn = ConnectionProvider.getConnection();
    		MessageDao messageDao = MessageDao.getInstance();
    		
    		int messageTotalCount = messageDao.selectCount(conn);

    		List<Message> messageList = null;
    		int firstRow = 0;
    		int endRow = 0;
    		
    		if(messageTotalCount > 0) {
    			firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE;
    			endRow = firstRow + MESSAGE_COUNT_PER_PAGE;
    			messageList = messageDao.selectList(conn, firstRow, endRow);
    		} else {
    			currentPageNumber = 0;
    			messageList = Collections.emptyList();
    		}
    		return new MessageListView(messageList, messageTotalCount
    				, currentPageNumber, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
    	} catch (Exception e) {
    		throw new ServiceException("메시지목록 가져오기 실패 : " + e.getMessage(), e);
    	} finally {
			JDBCUtil.close(conn, null, null);
		}
    }
}
