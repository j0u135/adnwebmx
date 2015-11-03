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
import com.mx.diezx.adn.model.Usuario;
import com.mx.diezx.adn.model.dao.IIndicadorInteligenteDAO;
import com.mx.diezx.adn.model.dao.factory.DAOFactory;

/**
 * Servlet implementation class getIndicadoresMesesByUsuarioYYear
 */
@WebServlet("/getIndicadoresMesesByUsuarioYYear")
public class GetIndicadoresMesesByUsuarioYYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetIndicadoresMesesByUsuarioYYear() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getFactory(0);
		IIndicadorInteligenteDAO indicadorinteligente_dao = factory.getIndicadorInteligenteDAO();
		
		Gson gson = new Gson();
        PasoUsuarioYYear paso_inf = new PasoUsuarioYYear();
				
		try {
            StringBuilder sb = new StringBuilder();
            String s;
            while ((s = request.getReader().readLine()) != null) {
                sb.append(s);
                System.out.println(s);
            }
            paso_inf = (PasoUsuarioYYear) gson.fromJson(sb.toString(), PasoUsuarioYYear.class);
        } catch (Exception ex) {
            ex.printStackTrace();
        }		
		
		ArrayList<IndicadorInteligente> lista_indicadores = indicadorinteligente_dao.getIndicadoresMesesByUsuarioYYear(paso_inf.getUsuario(), paso_inf.getYear());
		
		String lista_indicadores_json = new Gson().toJson(lista_indicadores);
		
		response.setContentType("application/json");
		response.getWriter().write(lista_indicadores_json);
			
	}
	
	public class PasoUsuarioYYear {
		
		private Usuario usuario;
		private int year;
		
		public PasoUsuarioYYear() {
			super();
			this.usuario = new Usuario();
		}
		
		public Usuario getUsuario() {
			return usuario;
		}
		public void setUsuario(Usuario usuario) {
			this.usuario = usuario;
		}
		public int getYear() {
			return year;
		}
		public void setYear(int year) {
			this.year = year;
		}	
	}

}
