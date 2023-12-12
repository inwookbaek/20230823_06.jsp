package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardDetailService {

	public BoardBean getBoard(int bno) {
		
		BoardBean board = null;
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);		
		int updateCount = boardDAO.updateReadCount(bno);
		if(updateCount > 0) JDBCUtility.commit(conn); else JDBCUtility.rollback(conn);
		board = boardDAO.selectBoard(bno);	
		return board;
	}

}
