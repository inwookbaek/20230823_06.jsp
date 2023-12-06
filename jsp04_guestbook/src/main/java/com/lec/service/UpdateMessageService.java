package com.lec.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.lec.dao.MessageDao;
import com.lec.dto.Message;
import com.lec.jdbc.ConnectionProvider;
import com.lec.jdbc.JDBCUtil;

public class UpdateMessageService {

	private UpdateMessageService() {}
	private static UpdateMessageService instance = new UpdateMessageService();
	public static UpdateMessageService getInstance() {
		return instance;
	}
	
	public void updateMessage(int messageId, String password, String message) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			MessageDao messageDao = MessageDao.getInstance();
			Message messageDto = messageDao.select(conn, messageId);
			
			if(messageDto == null || message.trim().isEmpty()) {
				throw new MessageNotFoundException(messageId + "번 메시지가 공란입니다! " 
						+ "메시지를 입력하세요!!!");
			}
			
			if(!messageDto.matchPassword(password)) {
				throw new InvalidPasswordException("비밀번호가 틀립니다! 다시 입력하세요!!");
			}
						
			messageDao.update(conn, messageId, message);
			conn.commit();
		} catch (SQLException e) {
			throw new ServiceException("메시지수정실패!!! " + e.getMessage());
		} catch (MessageNotFoundException | InvalidPasswordException e) {
			// System.out.println("비밀번호불일치!!!");
			JDBCUtil.rollback(conn);
		} finally {
			JDBCUtil.close(conn, null, null);
		}
	}
}
