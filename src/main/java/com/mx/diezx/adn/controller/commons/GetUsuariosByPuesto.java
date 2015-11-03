package com.mx.diezx.adn.controller.commons;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.Puesto;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IUsuarioDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;


@WebServlet("/getUsusariosByPuesto")
public class GetUsuariosByPuesto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetUsuariosByPuesto() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOFactory factory = DAOFactory.getFactory(0);
		IUsuarioDAO usuario_dao = factory.getUsuarioDAO();
		Usuario consultante = null;
		ArrayList<Usuario> lista_usuarios = new ArrayList<Usuario>();
		
		Gson gson = new Gson();
		Puesto puesto = new Puesto();
		try {
            StringBuilder sb = new StringBuilder();
            String s;
            while ((s = request.getReader().readLine()) != null) {
                sb.append(s);
            }
            puesto = (Puesto) gson.fromJson(sb.toString(), Puesto.class);    
        } catch (Exception ex) {
            ex.printStackTrace();
        }
		
		HttpSession sesionOk = request.getSession();
		if (sesionOk.getAttribute("usuario") == null) {
			 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
		} else {
			consultante = ((Usuario)sesionOk.getAttribute("usuario_sesion"));
			lista_usuarios = usuario_dao.getUsuariosByPuestoYRol(puesto.getIdPuesto(), consultante);
		}
		
		String lista_usuarios_json = new Gson().toJson(lista_usuarios);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_usuarios_json);
	}

}
