package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseAutorizaCambioFiltro;
import com.adn.controlador.AutorizaCambioFiltro;

/**
 * Servlet implementation class CargaInterfazIndicadores
 */
@WebServlet("/actualizaAutorizacionesFiltros")
public class ActualizaAutorizacionesFiltros extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizaAutorizacionesFiltros() {
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
		String usuarioAutorizador=request.getParameter("usuarioSes");
		String accionTodos=request.getParameter("accionTodos"); 
		String accionUno=request.getParameter("accionUno");
		String claveFiltro=request.getParameter("claveFiltro");
		String claveAutorizacion=request.getParameter("claveAutorizacion");
		ArrayList<AutorizaCambioFiltro> arrCambios = null;
		
		if(usuarioAutorizador!=null && !usuarioAutorizador.equals("")){
		if(accionTodos!=null && !accionTodos.equals("")){
			arrCambios = ClaseAutorizaCambioFiltro.consultaXnbAutorizador(usuarioAutorizador);
			if(accionTodos.equals("Aprobar") && arrCambios!=null && arrCambios.size()>0){
				for(int i=0; i<arrCambios.size();i++){
					AutorizaCambioFiltro cambioFil = arrCambios.get(i);
					cambioFil.setUsrAutorizador(usuarioAutorizador);
					boolean cambioOk = ClaseAutorizaCambioFiltro.ejecutaCambio(cambioFil);
					if(cambioOk){
						cambioFil.setStCambio("Autorizado");
						ClaseAutorizaCambioFiltro.update(cambioFil);
					}
				}
			}else if(accionTodos.equals("Borrar") && arrCambios!=null && arrCambios.size()>0){
				for(int i=0; i<arrCambios.size();i++){
					AutorizaCambioFiltro cambioFil = arrCambios.get(i);
					cambioFil.setStCambio("Borrado");
					cambioFil.setUsrAutorizador(usuarioAutorizador);
					ClaseAutorizaCambioFiltro.update(cambioFil);
				}
			}
		}else if(accionUno!=null && !accionUno.equals("") && claveAutorizacion!=null && !claveAutorizacion.equals("")){
			int idClaveAutorizacion = Integer.parseInt(claveAutorizacion);
			AutorizaCambioFiltro cambioFil = ClaseAutorizaCambioFiltro.consultaXidCambio(idClaveAutorizacion);
			cambioFil.setUsrAutorizador(usuarioAutorizador);
			if(accionUno.equals("Aprobar")){
				boolean cambioOk = ClaseAutorizaCambioFiltro.ejecutaCambio(cambioFil);
				if(cambioOk){
					cambioFil.setStCambio("Autorizado");
					ClaseAutorizaCambioFiltro.update(cambioFil);
				}
			}else if(accionUno.equals("Borrar")){
				cambioFil.setStCambio("Borrado");
				ClaseAutorizaCambioFiltro.update(cambioFil);
			}
		}
		
		if(usuarioAutorizador!=null && !usuarioAutorizador.equals("")){
			arrCambios = ClaseAutorizaCambioFiltro.consultaXnbAutorizador(usuarioAutorizador);
		}
		}
		request.setAttribute("arrCambios", arrCambios);
		request.getRequestDispatcher("Autorizaciones.jsp").forward(request, response);
	}
	
}
