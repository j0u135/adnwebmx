package com.mx.diezx.adn.controller.cultura;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mx.diezx.adn.model.ItemCultura;
import com.mx.diezx.adn.model.dao.ICulturaDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;


@WebServlet("/eliminaItemCultura")
public class EliminaItemCultura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EliminaItemCultura() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ItemCultura item = new ItemCultura();
		Gson json = new Gson();
		
		try{
			StringBuilder sb = new StringBuilder();
			String s;
			
			while((s = request.getReader().readLine()) != null){
				sb.append(s);
			}
			
			item = (ItemCultura)json.fromJson(sb.toString(), ItemCultura.class);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		DAOFactory factory = DAOFactory.getFactory(0);
		ICulturaDAO cultura_dao = factory.getCulturaDAO();
		
		cultura_dao.eliminarItemCultura(item);
	}

}
