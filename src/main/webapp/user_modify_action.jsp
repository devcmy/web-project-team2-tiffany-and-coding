<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>     
<%
	if(request.getMethod().equals("GET")){
		response.sendRedirect("user_main.jsp");
		return;
	}
	try{
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		User user=new User(userId,password,name,email,phone,address);
		UserService userService=new UserService();
		int updateRowCount=userService.update(user);
		
		response.sendRedirect("user_view.jsp");
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("user_error.jsp");
	}
	
%>






