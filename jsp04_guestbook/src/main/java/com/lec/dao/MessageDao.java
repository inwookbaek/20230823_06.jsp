package com.lec.dao;

public class MessageDao {

	// Singleton
	private MessageDao() {}
	private static MessageDao messageDao = new MessageDao();
	public static MessageDao getInstance() {
		return messageDao;
	}
	
	// 1. insert
	// 2. select
	// 3. delete
	// 4. update
	// 5. selectCount
	// 6. selectList
	// 7. makeMessage
}
