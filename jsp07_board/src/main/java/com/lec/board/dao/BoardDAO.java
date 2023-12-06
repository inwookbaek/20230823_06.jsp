package com.lec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardDAO {

	private BoardDAO() {}
	private static BoardDAO boardDAO;
	public static BoardDAO getInstance() {
		if(boardDAO == null) boardDAO = new BoardDAO();
		return boardDAO;
	}
	
	Connection conn = null;
	DataSource ds = null;
	
	// DB커넥션
	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	// 1. 글쓰기
	public int insertBoard(BoardBean board) {
		// System.out.println("1. 글쓰기.....");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into board(bno, writer, pass, subject, content, file, "
				   +     "re_ref, re_lev, re_seq, readcount, crtdate) values(?,?,?,?,?,?,?,?,?,?,now())";
		int insertCount = 0;
		int bno = 0;
		
		try {
			pstmt = conn.prepareStatement("select max(bno) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) bno = rs.getInt(1) + 1; else bno = 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getFile());
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			insertCount = pstmt.executeUpdate();
			JDBCUtility.commit(conn);
		} catch (Exception e) {
			System.out.println("게시글등록실패!!! : " + e.getMessage());
			JDBCUtility.rollback(conn);
		} finally {
			JDBCUtility.close(null, pstmt, rs);
		}
		return insertCount;
	}

	// 2. 글갯수구하기
	public int selectListCount(String f, String q) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select count(*) from board where " + f + " like ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + q + "%");
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtility.close(conn, pstmt, rs);
		}
		return listCount;
	}
	
	// 3. 글목록조회하기
	// 4. 글조회수증가하기
	// 5. 글상세보기
	// 6. 글수정하기
	// 7. 글삭제하기
	// 8. 댓글쓰기
}


















