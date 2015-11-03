package com.mx.diezx.adn.controller.hojaruta;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.ReporteDepartamentosHojaRuta;
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.comunicaciones.PasoInf;
import com.mx.diezx.adn.model.dao.IHojaRutaDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

@WebServlet("/getHojaRutaByAreaYYear")
public class GetHojaRutaByAreaYYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetHojaRutaByAreaYYear() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOFactory factory = DAOFactory.getFactory(0);
		IHojaRutaDAO hojaruta_dao = factory.getHojaRutaDAO();
		Usuario consultante = null;
		
		HttpSession sesionOk = request.getSession();
		if (sesionOk.getAttribute("usuario") == null) {
			 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
		} else {
			consultante = ((Usuario)sesionOk.getAttribute("usuario_sesion"));
			
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

			ArrayList<ReporteDepartamentosHojaRuta> lista_reportes = hojaruta_dao.getHojaRutaByAreaYYear(paso_inf.getArea(), paso_inf.getYear(), consultante);
			
			String lista_reportes_json = new Gson().toJson(lista_reportes);
			System.out.println(lista_reportes_json);
			
			response.setContentType("application/json");
			response.getWriter().write(lista_reportes_json);

		}
		
	}

}
