package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArea;
import com.adn.conexion.ClaseComentIndInte;
import com.adn.conexion.ClaseDepartamento;
import com.adn.conexion.ClaseFiltroInd;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.ComentarioIndInte;
import com.adn.controlador.Departamento;
import com.adn.controlador.FiltroIndicadores;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Usuario;


/**
 * Servlet implementation class servletRedireccion
 */
@WebServlet("/servletRedireccion")
public class servletRedireccion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletRedireccion() {
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
		 String valor=request.getParameter("hiddenRedireccion");
		 String usuarioHR=request.getParameter("usuarioHR");
		 String anio=request.getParameter("anioSel");
		 String pesoTotal=request.getParameter("peso"); 
		 String desMensual=request.getParameter("desMensual");
		 String mesBarra=request.getParameter("mesBarra");
		 String cveIndInte =request.getParameter("cveIndInte");
		 String mesNum = request.getParameter("mesNumerico");
		 
		 Departamento depto = null;
		 IndicadorInteligente indInt=null;
		 FiltroIndicadores filInd = null;
		 Usuario usu = ClaseUsuario.buscaUsuario(usuarioHR);
		 ArrayList<ComentarioIndInte> arrComentIndInte=null;
		 if(usu!=null){
			 arrComentIndInte= new ArrayList<ComentarioIndInte>();
			 int idArea = ClaseArea.consultarIdArea(usu.getArea());
			 depto = ClaseDepartamento.buscaDeptoXpuesto(usu.getPuesto(), idArea);
			 if(cveIndInte!=null && cveIndInte!=""){
				 int idIndInte = Integer.parseInt(cveIndInte);
				 indInt = ClaseIndicadoresInteligentes.consultarCompletoIndInte(idIndInte, usuarioHR, mesBarra, anio);
				 filInd = ClaseFiltroInd.consultarFiltroInd(indInt.getIdIndicador());
				 arrComentIndInte = ClaseComentIndInte.buscaComent(idIndInte);
			 }
		 }
		   if(filInd!=null){
			   request.setAttribute("unidad", filInd.getUnidadMedida());
			   request.setAttribute("filtro",filInd);
		   }else{
			   request.setAttribute("unidad", "");
			   request.setAttribute("filtro", "");
		   }
		   request.setAttribute("comentarios",arrComentIndInte);
		   request.setAttribute("indicadorEnviado", new String("Update"));
		   request.setAttribute("valor", new String(valor));
		   request.setAttribute("indInt", indInt);
		   request.setAttribute("arrUsu", usu);
		   request.setAttribute("depto", depto.getNbDepto());
		   request.setAttribute("area", usu.getArea());
		   request.setAttribute("puesto", usu.getPuesto());
		   //Nuevos campos para llevar la barra
		   request.setAttribute("pesoTotal", new String(pesoTotal));
		   request.setAttribute("desMensual", new String(desMensual));
		   request.setAttribute("mesBarra", new String(mesBarra));
		   request.setAttribute("usuarioEnviado", usuarioHR);
  		   request.setAttribute("mesEnviado", mesBarra);
		   request.setAttribute("mesNumerico", mesNum);
		   request.setAttribute("anio", anio);
		   request.setAttribute("claveIndInte",cveIndInte);
		  
		   request.getRequestDispatcher("indicadoresInteligentes.jsp").forward(request, response);
   }
}
