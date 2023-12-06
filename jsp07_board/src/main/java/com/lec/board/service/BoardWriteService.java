package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardWriteService {

	public boolean registerBoard(BoardBean board) {
		
		boolean isWriteSuccess = false;
		
		Connection conn = JDBCUtility.getConnection();		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int insertCount = boardDAO.insertBoard(board);
			
		return isWriteSuccess;
	}
}
