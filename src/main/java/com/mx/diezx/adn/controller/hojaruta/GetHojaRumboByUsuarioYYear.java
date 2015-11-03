package com.mx.diezx.adn.controller.hojaruta;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.HojaRuta;
import com.mx.diezx.adn.model.comunicaciones.PasoInf;
import com.mx.diezx.adn.model.dao.IHojaRutaDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

@WebServlet("/getHojaRumboByUsuarioYYear")
public class GetHojaRumboByUsuarioYYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetHojaRumboByUsuarioYYear() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IHojaRutaDAO hojaruta_dao = factory.getHojaRutaDAO();
		
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
		
		ArrayList<HojaRuta> lista_hojasruta = hojaruta_dao.getHojaRumboByUsuarioYYear(paso_inf.getUsuario(), paso_inf.getYear());
		
		String lista_hojasruta_json = new Gson().toJson(lista_hojasruta);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_hojasruta_json);
		
	}

}
