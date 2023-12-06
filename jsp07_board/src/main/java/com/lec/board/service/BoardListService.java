package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.db.JDBCUtility;

public class BoardListService {

	public int getListCount(String f, String q) {
		// 총레코드건수 select count(*) from board where writer like '%홍%'
		int listCount = 0;
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		listCount = boardDAO.selectListCount(f, q);
		return listCount;
	}
}
