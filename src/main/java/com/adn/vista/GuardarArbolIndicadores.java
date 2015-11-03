package com.adn.vista;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

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
import com.adn.controlador.Indicador;


/**
 * Servlet implementation class GuardarArbolIndicadores
 */
@WebServlet("/GuardarArbolIndicadores")
public class GuardarArbolIndicadores extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardarArbolIndicadores() {
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
		String stringIndicadores=request.getParameter("stream_identificadores");
		String claveArea=request.getParameter("idAreaSel");
		String claveDepto=request.getParameter("idDeptoSel");
		String creadoPor=request.getParameter("usuarioSes");
		boolean agregado=false;
		int idArbol=-1;
		String arbolOrg="";
		String arbolIndString="";
		//System.out.println("arbol "+stringIndicadores);
		if(claveArea!=null && !claveArea.equals("") && creadoPor!=null && !creadoPor.equals("")){
			int idArea = ClaseArea.consultarIdArea(claveArea);
			Calendar fechaA = Calendar.getInstance();
			int mesInt = fechaA.get(Calendar.MONTH)+1;
			int ano = fechaA.get(Calendar.YEAR);
			int dia = fechaA.get(Calendar.DATE);
			String fhCreacion= dia+"/"+mesInt+"/"+ano;
			
			Arbol arbolInd=new Arbol(idArea, fhCreacion,creadoPor);
			int numNodos=0;
  			int repetido=ClaseArbol.verificaRepetido(arbolInd);
		  	if(repetido==0){
		  		idArbol=ClaseArbol.agregarArbol(arbolInd);
		  		if(idArbol!=0){
		  			String[] arrNodos = stringIndicadores.split("\\|");
		  			numNodos = arrNodos.length/7;
		  			agregado = crearNodos(arrNodos, numNodos,idArbol,idArea);
		  		}
		  	}else{
		  		idArbol = repetido;
		  		String[] arrNodos = stringIndicadores.split("\\|");
	  			numNodos = arrNodos.length/7;
	  			ArrayList<Indicador> arrInd = ClaseIndicador.consultarIndicadores(repetido);
	  			int anteriores = arrInd.size();
	  			int diferencia = 0;
	  			if(numNodos==anteriores){
	  				agregado = actualizarNodos(numNodos, arrInd, arrNodos, idArea);
	  			}else{
	  				//Hay de dos que sean mas nodos o que sean menos
	  				if(numNodos<anteriores){
	  					//Hay que eliminar
	  					diferencia = anteriores - numNodos;
	  					agregado = actualizarNodos(numNodos, arrInd, arrNodos, idArea);
	  					int tamInd = arrInd.size()-1;
	  					for(int i=0;i<diferencia;i++){
	  						agregado = ClaseIndicador.eliminarIndicador(arrInd.get(tamInd-i));
	  					}
	  					
	  				}else if(numNodos>anteriores){
	  					//Hay que agregar
	  					diferencia = numNodos - anteriores;
	  					int inicio = anteriores * 7;
	  					int longitud = diferencia * 7;
	  					String[] arrNodosNuevos = new String[longitud];
	  					int i=0;
	  					for(int ini=inicio; ini<arrNodos.length;ini++){
	  						arrNodosNuevos[i] = arrNodos[ini];
	  						i++;
	  					}
	  					agregado = crearNodos(arrNodosNuevos, diferencia,idArbol,idArea);
	  					if(agregado){
	  						arrInd = ClaseIndicador.consultarIndicadores(repetido);
	  						agregado = actualizarNodos(numNodos, arrInd, arrNodos, idArea);
	  					}
	  				}
	  			}
	  			
		  	}
				if(agregado){
					ArrayList<Area> arrAreas = ClaseArea.consultar();
					ArrayList<Departamento> arrDeptos = ClaseDepartamento.buscaDepartamento(idArea);
					if(idArbol>0){
						if(claveDepto!=null && !claveDepto.equals("") && !claveDepto.equals("0")){
							int idDepto= Integer.parseInt(claveDepto);
							arbolIndString = ClaseIndicador.consultarArbolXDepto(idArbol,idDepto);
							arbolOrg = ClaseDiagrama.consultaArbolXdepto(idArea,idDepto);
						}else{
							arbolIndString = ClaseIndicador.consultarArbol(idArbol);
							arbolOrg = ClaseDiagrama.consultaArbolXarea(idArea);
						}
					}
					request.setAttribute("areas", arrAreas);
					request.setAttribute("deptos", arrDeptos);
					request.setAttribute("idArea", idArea+"");
					request.setAttribute("idDepto", claveDepto+"");
					request.setAttribute("existeArbol", idArbol);
					request.setAttribute("arbolInd", arbolIndString);
					request.setAttribute("arbolOrg", arbolOrg);
					request.setAttribute("mensajeMostrar", new String("El arbol se guardo correctamente"));
					request.getRequestDispatcher("arbolIndicadoresADN.jsp").forward(request, response);
				}else{
					request.setAttribute("mensajeMostrar", new String("No se pudo guardar el arbol, intente nuevamente"));
					request.getRequestDispatcher("arbolIndicadoresADN.jsp").forward(request, response);
				}
  			}else{
  				request.setAttribute("mensajeMostrar", new String("No se pudo guardar el arbol, intente nuevamente"));
				request.getRequestDispatcher("arbolIndicadoresADN.jsp").forward(request, response);
  			}
	}
	
	private boolean crearNodos(String[] arrNodos,int numNodos, int idArbol, int idArea){
		boolean agregado=false;
		int i=0;
		for(int j=0; j<numNodos;j++){
			Indicador ind= new Indicador();
			int nuNodoArbol = Integer.parseInt(arrNodos[i]);
			ind.setNuNodoArbol(nuNodoArbol);
			if(!arrNodos[i+1].equals("")){
				int nuNodoPadre = Integer.parseInt(arrNodos[i+1]);
				ind.setNuNodoPadre(nuNodoPadre);
			}
			ind.setIdArbol(idArbol);
			ind.setNbIndicador(arrNodos[i+2]);
			ind.setDescIndicador(arrNodos[i+3]);
			ind.setNodosAsociados(arrNodos[i+4]);
			Departamento depto = ClaseDepartamento.buscaDeptoXnombre(arrNodos[i+5], idArea);
			if(depto!=null){
				ind.setIdDepartamento(depto.getIdDepto());
			}
			ind.setColor(arrNodos[i+6]);
			agregado = ClaseIndicador.agregarIndicador(ind);
			i=i+7;
		}
		return agregado;
	}

	private boolean actualizarNodos(int numNodos, ArrayList<Indicador> arrInd, String[] arrNodos, int idArea){
		boolean agregado=false;
		int i=0;
		for(int j=0; j<numNodos;j++){
				Indicador indAnte = arrInd.get(j);
				if(!arrNodos[i+1].equals("")){
					int nuNodoPadre = Integer.parseInt(arrNodos[i+1]);
					indAnte.setNuNodoPadre(nuNodoPadre);
				}
				indAnte.setNbIndicador(arrNodos[i+2]);
				indAnte.setDescIndicador(arrNodos[i+3]);
				indAnte.setNodosAsociados(arrNodos[i+4]);
				Departamento depto = ClaseDepartamento.buscaDeptoXnombre(arrNodos[i+5], idArea);
				if(depto!=null){
					indAnte.setIdDepartamento(depto.getIdDepto());
				}
				indAnte.setColor(arrNodos[i+6]);
				agregado = ClaseIndicador.update(indAnte);
				i=i+7;
			}
		return agregado;
	}
}
