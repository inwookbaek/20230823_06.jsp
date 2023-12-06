package com.lec.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.lec.dao.MessageDao;
import com.lec.dto.Message;
import com.lec.jdbc.ConnectionProvider;
import com.lec.jdbc.JDBCUtil;

public class DeleteMessageService {

	private DeleteMessageService() {}
	private static DeleteMessageService instance = new DeleteMessageService();
	public static DeleteMessageService getInstance() {
		return instance;
	}
	
	public void deleteMessage(int messageId, String password) {
		Connection conn = null;
	
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			MessageDao messageDao = MessageDao.getInstance();
			Message message = messageDao.select(conn, messageId);
			
			if(message == null) {
				throw new MessageFoundException("메시지가 없습니다!!");
			} 
			
			if(!message.matchPassword(password)) {
				throw new InvalidPasswordException("비밀번호가 틀립니다!!");
			}
			
			int row = messageDao.delete(conn, messageId);
			conn.commit();
		} catch (SQLException e) {
			JDBCUtil.rollback(conn);
			throw new ServiceException("삭제실패!! " + e.getMessage(), e);
		} catch (InvalidPasswordException | MessageFoundException e) {
			JDBCUtil.rollback(conn);
			throw e;
		} finally {
			JDBCUtil.close(conn, null, null);
		}
	}
}
