package com.lec.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet(
//		urlPatterns = { "/init" }, 
//		initParams = { 
//				@WebInitParam(name = "id", value = "sohyang", description = "사용자id"),
//				@WebInitParam(name = "pw", value = "xxxxx")
//		})
public class InitParameter extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		System.out.println("사용자id = " + getInitParameter("id"));
		System.out.println("사용자pw = " + getInitParameter("pw"));

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doGet(req, res);
	}
}
