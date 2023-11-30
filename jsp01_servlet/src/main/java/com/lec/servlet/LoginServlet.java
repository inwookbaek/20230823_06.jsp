package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		// request
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String[] hobbies = req.getParameterValues("hobby");
		String major = req.getParameter("major");
		String protocol = req.getParameter("protocol");

		System.out.println(id);
		System.out.println(password);
		System.out.println(hobbies.toString());
		System.out.println(major);
		System.out.println(protocol);
		
		// response
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8");
		PrintWriter writer = res.getWriter();
		writer.println("<html>");
		writer.println("<head><title>Login Servlet!!!</title></head>");
		writer.println("<body>");
		writer.println("아이디 : " + id + "<br>");
		writer.println("비밀번호 : " + password + "<br>");
		writer.println("취미 " + Arrays.toString(hobbies) + "<br>");
		writer.println("전공 : " + major + "<br>");
		writer.println("프로토콜 : " + protocol + "<br>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doGet(req, res);
	}
}
