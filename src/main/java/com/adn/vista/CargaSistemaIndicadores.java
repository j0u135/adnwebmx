package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArbol;
import com.adn.conexion.ClaseArea;
import com.adn.conexion.ClaseDepartamento;
import com.adn.conexion.ClaseDiagrama;
import com.adn.conexion.ClaseIndicador;
import com.adn.controlador.Arbol;
import com.adn.controlador.Area;
import com.adn.controlador.Departamento;

/**
 * Servlet implementation class CargaInterfazIndicadores
 */
@WebServlet("/CargaSistInd")
public class CargaSistemaIndicadores extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaSistemaIndicadores() {
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
		String tpUsr = request.getParameter("TpUsr");
		String claveArea = request.getParameter("idArea");
		String claveDepto=request.getParameter("idDepto");
		String diagMost=request.getParameter("diagMos");
		ArrayList<Departamento> arrDeptos = null;
		int idArea;
		int idDepto;
		int idArbol = 0;
		String arbolInd="";
		String arbolOrg="";
		ArrayList<Area> arrAreas = ClaseArea.consultar();
		if(claveArea!=null && !claveArea.equals("")){
			Arbol arbol = new Arbol();
			idArea = Integer.parseInt(claveArea);
			arbol.setIdArea(idArea);
			arrDeptos = ClaseDepartamento.buscaDepartamento(idArea);
			idArbol = ClaseArbol.verificaRepetido(arbol);
			if(idArbol!=0){
				if(claveDepto!=null && !claveDepto.equals("") && !claveDepto.equals("0")){
					idDepto= Integer.parseInt(claveDepto);
					arbolInd = ClaseIndicador.consultarArbolXDepto(idArbol,idDepto);
					arbolOrg = ClaseDiagrama.consultaArbolXdepto(idArea,idDepto);
				}else{
					arbolInd = ClaseIndicador.consultarArbol(idArbol);
					arbolOrg = ClaseDiagrama.consultaArbolXarea(idArea);
				}
			}
		}
		request.setAttribute("diagMost",diagMost);
		request.setAttribute("arbolInd", arbolInd);
		request.setAttribute("arbolOrg", arbolOrg);
		request.setAttribute("existeArbol", idArbol);
		request.setAttribute("idDepto", claveDepto);
		request.setAttribute("idArea", claveArea);
		request.setAttribute("deptos", arrDeptos);
		request.setAttribute("areas", arrAreas);
		request.getRequestDispatcher("arbolIndicadoresADN.jsp").forward(request, response);
	}
	


}
