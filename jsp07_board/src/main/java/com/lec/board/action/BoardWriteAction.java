package com.lec.board.action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardWriteService;
import com.lec.board.vo.ActionForward;
import com.lec.board.vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		// System.out.println("1. 글등록하기!!!");
		ActionForward forward = null;	
		BoardBean board = null;
		String realFolder = "";
		String saveFolder = "D:/lec/00.share/98.temp/upload";
		int filesize = 1024*1024*5;
		
		ServletContext context = req.getServletContext();
		realFolder = context.getRealPath("/boardUpload");
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(req, saveFolder, filesize, "utf-8"
					, new DefaultFileRenamePolicy());
			board = new BoardBean();
			board.setWriter(multi.getParameter("writer"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));

//			Enumeration<?> files = multi.getFileNames();
//			String element = "";
//			if(files.hasMoreElements()) {
//				element = (String) files.nextElement();
//				System.out.println(multi.getOriginalFileName(element));
//			}
			
			// insert로직
			BoardWriteService boardWriteService = new BoardWriteService();
			boolean isWriteSuccess = boardWriteService.registerBoard(board);
			
			if(isWriteSuccess) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo");
			} else {
				res.setContentType("text/html; charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("  alert('게시글등록이 실패했습니다!!'");
				out.println("  history.back()");
				out.println("</script>");
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}				
		return forward;
	}

}
