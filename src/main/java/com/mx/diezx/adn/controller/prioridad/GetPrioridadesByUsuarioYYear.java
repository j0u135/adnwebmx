package com.mx.diezx.adn.controller.prioridad;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.Prioridad;
import com.mx.diezx.adn.model.comunicaciones.PasoInf;
import com.mx.diezx.adn.model.dao.IPrioridadDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

@WebServlet("/getPrioridadesByUsuarioYYear")
public class GetPrioridadesByUsuarioYYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetPrioridadesByUsuarioYYear() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IPrioridadDAO prioridad_dao = factory.getPrioridadDAO();
		
		Gson gson = new Gson();
		PasoInf paso_inf = new PasoInf();
		
		try {
            StringBuilder sb = new StringBuilder();
            String s;
            while ((s = request.getReader().readLine()) != null) {
                sb.append(s);
                System.out.println(s);
            }
            paso_inf = (PasoInf) gson.fromJson(sb.toString(), PasoInf.class);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
		
		ArrayList<Prioridad> lista_prioridades = prioridad_dao.getPrioridadesByUsuarioYYear(paso_inf.getUsuario(), paso_inf.getYear());
		
		String lista_prioridades_json = new Gson().toJson(lista_prioridades);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_prioridades_json);
	}

}
