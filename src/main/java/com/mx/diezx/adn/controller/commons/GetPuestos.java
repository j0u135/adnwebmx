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
import com.mx.diezx.adn.model.Departamento;
import com.mx.diezx.adn.model.Puesto;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IPuestoDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

@WebServlet("/getPuestos")
public class GetPuestos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetPuestos() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		DAOFactory factory = DAOFactory.getFactory(0);
		IPuestoDAO puesto_dao = factory.getPuestoDAO();
		
		Gson gson = new Gson();
		Departamento departamento = new Departamento();
		Usuario consultante = null;
		
		HttpSession sesionOk = request.getSession();
		if (sesionOk.getAttribute("usuario") == null) {
			 return;
		} else {
			consultante = ((Usuario)sesionOk.getAttribute("usuario_sesion"));
		}
		
		try{
			StringBuilder sb = new StringBuilder();
            String s;
            while ((s = request.getReader().readLine()) != null) {
                sb.append(s);
            }
            departamento = (Departamento) gson.fromJson(sb.toString(), Departamento.class);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		ArrayList<Puesto> lista_puestos = puesto_dao.getPuestosByDepartamento(departamento.getId_Departamento(), consultante);
		String lista_puestos_json = new Gson().toJson(lista_puestos);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_puestos_json);
	}

}
