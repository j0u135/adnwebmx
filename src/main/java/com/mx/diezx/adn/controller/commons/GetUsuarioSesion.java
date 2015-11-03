package com.mx.diezx.adn.controller.commons;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.Usuario;

@WebServlet("/getUsuarioSesion")
public class GetUsuarioSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetUsuarioSesion() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario consultante = null;
		
		HttpSession sesionOk = request.getSession();
		if (sesionOk.getAttribute("usuario") == null) {
			 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
		} else {
			consultante = ((Usuario)sesionOk.getAttribute("usuario_sesion"));
		}
		
		String lista_usuarios_json = new Gson().toJson(consultante);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_usuarios_json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
