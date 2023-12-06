package com.lec.service;

import java.sql.Connection;

import com.lec.dao.MessageDao;
import com.lec.dto.Message;
import com.lec.jdbc.ConnectionProvider;
import com.lec.jdbc.JDBCUtil;

public class WriteMessageService {

	private WriteMessageService() {}
	private static WriteMessageService instance = new WriteMessageService();
	public static WriteMessageService getInstance() {
		return instance;
	}
	
	public void write(Message message) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao =  MessageDao.getInstance();
			int insertCount = messageDao.insert(conn, message);
		} catch (Exception e) {
			throw new ServiceException("메시지등록실패!!! " + e.getMessage(), e);
		} finally {
			JDBCUtil.close(conn, null, null);
		}
	}
}
