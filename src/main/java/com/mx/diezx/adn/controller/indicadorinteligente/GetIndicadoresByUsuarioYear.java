package com.mx.diezx.adn.controller.indicadorinteligente;

import java.io.IOException;
import java.util.ArrayList;

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

/**
 * Servlet implementation class GetIndicadoresByUsuarioYear
 */
@WebServlet("/getIndicadoresByUsuarioYear")
public class GetIndicadoresByUsuarioYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetIndicadoresByUsuarioYear() {
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

		ArrayList<IndicadorInteligente> lista_indicadores = indicadorinteligente_dao.getIndicadoresByUsuarioYYear(paso_inf.getUsuario(), paso_inf.getYear());
		String lista_indicadores_json = new Gson().toJson(lista_indicadores);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_indicadores_json);
	}
}
