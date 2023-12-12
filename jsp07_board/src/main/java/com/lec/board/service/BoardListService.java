package com.lec.board.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
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

	public List<BoardBean> getBoardList(int p, int limit, String f, String q) {
		// select * from board where writer like '%홍%' limit startrow 10; 
		List<BoardBean> boardList = new ArrayList<>();
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);		
		boardList = boardDAO.selectBoardList(p, limit, f, q);
		return boardList;
	}
}
