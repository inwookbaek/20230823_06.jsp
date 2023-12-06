package com.lec.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardListService;
import com.lec.board.vo.ActionForward;
import com.lec.board.vo.BoardBean;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		// System.out.println("2. 글목록조회....");
		List<BoardBean> boardList = new ArrayList<>();
				
		// 게시글목록을 가져올 서비스
		BoardListService boardListService = new BoardListService();
		int listCount = boardListService.getListCount("writer", "홍");
		System.out.println("3. 글목록갯수 ... " + listCount);
		return null;
	}
}
