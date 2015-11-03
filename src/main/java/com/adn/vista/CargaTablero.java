package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseArbol;
import com.adn.conexion.ClaseFiltroInd;
import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseIndicador;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClasePrioridesPorMes;
import com.adn.conexion.ClaseProyectosPrioritarios;
import com.adn.conexion.ClasePuestos;
import com.adn.conexion.ClaseUsuario;
import com.adn.controlador.Arbol;
import com.adn.controlador.FiltroIndicadores;
import com.adn.controlador.HojaRumbo;
import com.adn.controlador.Indicador;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Prioridad;
import com.adn.controlador.Puesto;
import com.adn.controlador.Usuario;

/**
 * Servlet implementation class CargaInterfazIndicadores
 */
@WebServlet("/CargaTablero")
public class CargaTablero extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaTablero() {
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
		String mes=request.getParameter("mesEnviadoHD");
		String mesNum=request.getParameter("mesNumericoHD");
		String anio=request.getParameter("anioSelHD"); 
		String usuario=request.getParameter("usuarioRedireccionHD");
		
		//Busca los datos del usuario
		Usuario usr = ClaseUsuario.buscaUsuario(usuario);
		ArrayList<Indicador> indAsocXpuesto = this.validaNIsXpuesto(usr);
		ArrayList <IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) ClaseIndicadoresInteligentes.consultar(usuario,mes,anio);
		ClaseHojaRumbo chr= new ClaseHojaRumbo();
		ArrayList<HojaRumbo> arrHR = chr.consultar(usuario);
		ArrayList<HojaRumbo> hojaRumboArr = chr.consultar3(usuario);
		
		int mesNumReal=Integer.parseInt(mesNum)+1;
		ArrayList <Prioridad> arrProyectosP = (ArrayList <Prioridad>)ClaseProyectosPrioritarios.consultar(usuario,mes, mesNumReal+"",anio);
		arrProyectosP = (ArrayList <Prioridad>) ClasePrioridesPorMes.consultarResMes(arrProyectosP,mes);
		System.out.println("longitud del arreglo "+ arrHR.size());
		request.setAttribute("hojasEquipo", hojaRumboArr);
		request.setAttribute("hojas", arrHR);
		request.setAttribute("indicadores", arrIndInte);
		request.setAttribute("proyectosPrio", arrProyectosP);
		request.setAttribute("usuarioEnviado", usuario);
		request.setAttribute("mesEnviado", mes);
		request.setAttribute("mesNumerico", mesNum);
		request.setAttribute("anio", anio);
		request.getRequestDispatcher("grid.jsp").forward(request, response);
	}
	
	private ArrayList<Indicador> validaNIsXpuesto(Usuario usu){
		ArrayList<Indicador> indAsocXpuesto = null;
		if(usu!=null){
			String idPuesto = usu.getPuesto();
			Puesto puestoUsuario = ClasePuestos.buscaPuestoXid(idPuesto);
			String indicadores= puestoUsuario.getIndCtrlAsoc();
			if(indicadores!=null && !indicadores.equals("")){
				Arbol nuevoArbol = new Arbol();
				nuevoArbol.setIdArea(puestoUsuario.getIdArea());
				int idArbol = ClaseArbol.verificaRepetido(nuevoArbol);
				ArrayList<Indicador> arrIndicadores = ClaseIndicador.consultarIndicadores(idArbol);
				if(arrIndicadores!=null && arrIndicadores.size()>0){
					indAsocXpuesto = new ArrayList<Indicador>();
					for(int i=0; i<arrIndicadores.size(); i++){
						Indicador ind = arrIndicadores.get(i);
						int nuNodoArbol = ind.getNuNodoArbol();
						String[] arrInd = indicadores.split("\\,");
						for(int j =0; j<arrInd.length; j++){
							
							int nuNodoAsociado =  Integer.parseInt(arrInd[j]);
							if(nuNodoArbol==nuNodoAsociado){
								FiltroIndicadores filind = ClaseFiltroInd.consultarFiltroInd(ind.getIdIndicador());
								if(filind!=null && filind.getIdFiltroInd()>0){
									indAsocXpuesto.add(ind);//Indicadores de control asociados al puesto
								}
							}
						}
					}
				}
			}
		}
		return indAsocXpuesto;
	}
	

}
