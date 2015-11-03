package com.mx.diezx.adn.controller.indicadorinteligente;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.IndicadorInteligente;
import com.mx.diezx.adn.model.comunicaciones.PasoInf;
import com.mx.diezx.adn.model.dao.IIndicadorInteligenteDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

@WebServlet("/getIndicadorResultados")
public class GetIndicadorResultados extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetIndicadorResultados() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IndicadorInteligente indicador = new IndicadorInteligente();
		
		DAOFactory factory  = DAOFactory.getFactory(0);
		IIndicadorInteligenteDAO indicadorinteligente_dao = factory.getIndicadorInteligenteDAO();
		
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
		
		indicador = indicadorinteligente_dao.getIndicadorResultados(paso_inf.getIdIndicador(), paso_inf.getYear());
		
		String indicador_json = new Gson().toJson(indicador);
		
		response.setContentType("application/json");
		response.getWriter().write(indicador_json);
		
	}

}
