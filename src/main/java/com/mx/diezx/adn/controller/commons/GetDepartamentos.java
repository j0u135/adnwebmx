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
import com.mx.diezx.adn.model.dao.IDepartamentoDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;
import com.mx.diezx.adn.model.Area;
import com.mx.diezx.adn.model.Departamento;
import com.mx.diezx.adn.model.Usuario;

/**
 * Servlet implementation class GetDepartamentos
 */
@WebServlet("/getDepartamentos")
public class GetDepartamentos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDepartamentos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getFactory(0);
		
		IDepartamentoDAO departamento_dao = factory.getDepartamentoDAO();
		
		response.setContentType("application/json");       
        Gson gson = new Gson();
        Area area = new Area();
        
       Usuario consultante = null;
       
       HttpSession sesionOk = request.getSession();
		if (sesionOk.getAttribute("usuario") == null) {
			 return;
		} else {
			consultante = ((Usuario)sesionOk.getAttribute("usuario_sesion"));
		}
        
        try {
            StringBuilder sb = new StringBuilder();
            String s;
            while ((s = request.getReader().readLine()) != null) {
                sb.append(s);
            }
            area = (Area) gson.fromJson(sb.toString(), Area.class);    
        } catch (Exception ex) {
            ex.printStackTrace();
        }

		ArrayList <Departamento> lista_departamentos = departamento_dao.getDepartamentosByArea(area.getIdArea(), consultante);
		String lista_departamentos_json = new Gson().toJson(lista_departamentos);
		response.getWriter().write(lista_departamentos_json);
		
	}

}
