package com.crud.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crud.dao.LoginDAO;
import com.crud.dao.UserDAO;
import com.crud.model.Login;
import com.crud.model.Occupation;
import com.crud.model.User;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_USER = "/listUser.jsp";
	private static String LOGIN = "/login.jsp";
	private LoginDAO loginDao;
	private UserDAO userDao;

	public LoginController() {
		super();
		loginDao = new LoginDAO();
		userDao = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Login login =  new Login(request.getParameter("user"), request.getParameter("pass"));

		System.out.println("LOGIN " + login);

		if(loginDao.getLogin(login)){
			RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
			request.setAttribute("users", userDao.getAllUsers());
			view.forward(request, response);
		}else{
			RequestDispatcher view = request.getRequestDispatcher(LOGIN);
			request.setAttribute("msg", "Usuario o contraseña invalidos");
			view.forward(request, response);
		}
	}
}
