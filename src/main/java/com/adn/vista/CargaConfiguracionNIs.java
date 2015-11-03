package com.adn.vista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseFiltroInd;
import com.adn.controlador.FiltroIndicadores;

/**
 * Servlet implementation class CargaInterfazIndicadores
 */
@WebServlet("/cargaConfigNIs")
public class CargaConfiguracionNIs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaConfiguracionNIs() {
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
		// TODO Auto-generated method stub
		String claveArea = request.getParameter("idAreaConf");
		String nbArea = request.getParameter("nbAreaConf");
		String claveDepto=request.getParameter("idDeptoConf");
		String nbDepto = request.getParameter("nbDeptoConf");
		String clavePuesto=request.getParameter("idPuestoConf");
		String nbPuesto = request.getParameter("nbPuestoConf");
		String claveNI = request.getParameter("idNiConf");
		String nbNi = request.getParameter("nbNIConf");
		
		FiltroIndicadores filInd = null;

		if(claveNI!=null && !claveNI.equals("")){
			int idNI = Integer.parseInt(claveNI);
			filInd = ClaseFiltroInd.consultarFiltroInd(idNI);
		}
						
		request.setAttribute("idPuesto", clavePuesto);
		request.setAttribute("idDepto", claveDepto);
		request.setAttribute("idArea", claveArea);
		request.setAttribute("idNi", claveNI);
		request.setAttribute("nbArea", nbArea);
		request.setAttribute("nbDepto", nbDepto);
		request.setAttribute("nbPuesto", nbPuesto);
		request.setAttribute("nbNi",nbNi);
		request.setAttribute("filtroInd",filInd);
		request.getRequestDispatcher("ConfigNIs.jsp").forward(request, response);
	}
	


}
