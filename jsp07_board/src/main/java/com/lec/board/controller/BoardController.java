package com.lec.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.action.Action;
import com.lec.board.action.BoardDetailAction;
import com.lec.board.action.BoardListAction;
import com.lec.board.action.BoardWriteAction;
import com.lec.board.action.boardDeleteAction;
import com.lec.board.action.boardDeleteFormAction;
import com.lec.board.action.boardModifyAction;
import com.lec.board.action.boardModifyFormAction;
import com.lec.board.action.boardReplyAction;
import com.lec.board.action.boardReplyFormAction;
import com.lec.board.vo.ActionForward;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {

	Action action = null;
	ActionForward forward = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		process(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		process(req, res);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		 // System.out.println("Board Controller............");
		
		// localhost:8080/jsp07_board/boardList.bo?p=2&f=writer&q=홍&fn=파일이름
		req.setCharacterEncoding("utf-8");
		String p = req.getParameter("p");
		String f = req.getParameter("f");
		String q = req.getParameter("q");
		String fn = req.getParameter("fn");	
		
		// localhost:8080/jsp07_board/boardWriteForm.bo
		String requestURI = req.getRequestURI();   // /jsp07_board/boardWriteForm.bo
		String contextPath = req.getContextPath(); // /jsp07_board
		String command = requestURI.substring(contextPath.length()); // /boardWriteForm.bo
		System.out.println(requestURI + ", " + contextPath + ", " + command);
		
		if(command.equalsIgnoreCase("/boardWriteForm.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/board_write.jsp");
		} else if(command.equalsIgnoreCase("/boardWrite.bo")) {
			action = new BoardWriteAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardList.bo")) {
			action = new BoardListAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardDetail.bo")) {
			action = new BoardDetailAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardModifyForm.bo")) {
			action = new boardModifyFormAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardModify.bo")) {
			action = new boardModifyAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardDeleteForm.bo")) {
			action = new boardDeleteFormAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardDelete.bo")) {
			action = new boardDeleteAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardReplyForm.bo")) {
			action = new boardReplyFormAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/boardReply.bo")) {
			action = new boardReplyAction();
			forward = action.execute(req, res);
		} else if(command.equalsIgnoreCase("/download.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/board_download.jsp?p=" + p + "&f=" + f + "&q=" + q + "&fn=" + fn);
		} else if(command.equalsIgnoreCase("/error.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/error.jsp");
		}			
		
		if(forward != null) {
			if(forward.isRedirect()) {
				res.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);
			}
		}
		
	}
}






















