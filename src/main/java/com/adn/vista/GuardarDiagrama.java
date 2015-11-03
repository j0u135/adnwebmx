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
import com.adn.conexion.ClasePuestos;
import com.adn.controlador.Arbol;
import com.adn.controlador.Area;
import com.adn.controlador.Departamento;
import com.adn.controlador.Diagrama;
import com.adn.controlador.Puesto;

/**
 * Servlet implementation class GuardarDiagrama
 */
@WebServlet("/GuardarDiagrama")
public class GuardarDiagrama extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardarDiagrama() {
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
		
		String stringDiagrama=request.getParameter("stream_organigrama");
		String claveArea=request.getParameter("idAreaSel");
		String claveDepto=request.getParameter("idDeptoSel");
		String creadoPor=request.getParameter("usuarioSes");
		String arbolOrg="";
		int idDepto=0;
		System.out.println("organigrama: " + stringDiagrama);
		if(claveArea!=null && !claveArea.equals("") && creadoPor!=null && !creadoPor.equals("")){
			int idArea = Integer.parseInt(claveArea);
			if(claveDepto!=null && !claveDepto.endsWith("")){
				idDepto = Integer.parseInt(claveDepto);
			}
			Calendar fechaA = Calendar.getInstance();
			int mesInt = fechaA.get(Calendar.MONTH)+1;
			int ano = fechaA.get(Calendar.YEAR);
			int dia = fechaA.get(Calendar.DATE);
			String fhCreacion= dia+"/"+mesInt+"/"+ano;
			
			Diagrama diagramaEm=new Diagrama(idArea,fhCreacion,creadoPor);
			int contador=0;
			int numNodos=0;
			String[] arrNodos;
  			int repetido=ClaseDiagrama.verificaRepetido(idArea);
  			boolean agregado = false;
	  		if(repetido==0){
	  			int idDiagrama =ClaseDiagrama.agregarDiagrama(diagramaEm);
	  			if(idDiagrama!=0){
	  				arrNodos = stringDiagrama.split("\\|");
		  			numNodos = arrNodos.length/7;
		  			agregado = crearNodos(arrNodos, numNodos, idDiagrama, idArea, creadoPor, fhCreacion);
	  			}
	  		}else{
	  			arrNodos = stringDiagrama.split("\\|");
	  			numNodos = arrNodos.length/7;
	  			ArrayList<Puesto> arrPuesto = ClasePuestos.buscaPuestosXArbol(repetido);
	  			int anteriores = arrPuesto.size();
	  			int diferencia = 0;
	  			if(numNodos==anteriores){
	  				agregado = actualizarNodos(numNodos, arrPuesto,arrNodos, idArea);
	  			}else{
	  			//Hay de dos que sean mas nodos o que sean menos
	  				if(numNodos<anteriores){
	  				//Hay que eliminar
	  					diferencia = anteriores - numNodos;
	  					agregado = actualizarNodos(numNodos, arrPuesto, arrNodos,idArea);
	  					int tamInd = arrPuesto.size()-1;
	  					for(int i=0;i<diferencia;i++){
	  						agregado = ClasePuestos.eliminarPuesto(arrPuesto.get(tamInd-i));
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
	  					agregado = crearNodos(arrNodosNuevos, diferencia,repetido,idArea, creadoPor, fhCreacion);
	  					if(agregado){
	  						arrPuesto = ClasePuestos.buscaPuestosXArbol(repetido);
	  						agregado = actualizarNodos(numNodos, arrPuesto, arrNodos, idArea);
	  					}
	  				}
	  			}
	  		}
  				if(agregado){
  					ArrayList<Area> arrAreas = ClaseArea.consultar();
					ArrayList<Departamento> arrDeptos = ClaseDepartamento.buscaDepartamento(idArea);
					Arbol arbolInd=new Arbol(idArea, fhCreacion,creadoPor);
					int rep=ClaseArbol.verificaRepetido(arbolInd);
					String arbolIndString = "";
					if(rep>0){
						if(claveDepto!=null && !claveDepto.equals("") && !claveDepto.equals("0")){
							arbolIndString = ClaseIndicador.consultarArbolXDepto(rep,idDepto);
							arbolOrg = ClaseDiagrama.consultaArbol(idArea);
						}else{
							arbolIndString = ClaseIndicador.consultarArbol(rep);
							arbolOrg = ClaseDiagrama.consultaArbolXarea(idArea);
						}
					}
  					
  					request.setAttribute("areas", arrAreas);
					request.setAttribute("deptos", arrDeptos);
					request.setAttribute("idArea", idArea+"");
					request.setAttribute("idDepto", claveDepto+"");
					request.setAttribute("existeArbol", rep);
					request.setAttribute("arbolInd", arbolIndString);
					request.setAttribute("arbolOrg", arbolOrg);
					request.setAttribute("mensajeMostrar", new String("El arbol se guardo correctamente"));
					request.getRequestDispatcher("arbolIndicadoresADN.jsp").forward(request, response);
  				}else{
  					request.setAttribute("mensajeMostrar", new String("No se pudo guardar el diagrama, intente nuevamente"));
  					request.getRequestDispatcher("arbolIndicadoresADN.jsp").forward(request, response);
				}
  			
		}else{
			request.setAttribute("mensajeMostrar", new String("No se pudo guardar el diagrama, intente nuevamente"));
			request.getRequestDispatcher("arbolIndicadoresADN.jsp").forward(request, response);
		}
	}
	
	private boolean crearNodos(String[] arrNodos,int numNodos, int idDiagrama, int idArea, String creadoPor, String fhCreacion){
		boolean agregado=false;
		int i=0;
		for(int j=0; j<numNodos;j++){
				Puesto puesto = new Puesto();
				puesto.setIdDiagrama(idDiagrama);
				int nuNodoArbol = Integer.parseInt(arrNodos[i]);
				puesto.setNuNodoArbol(nuNodoArbol);
				if(!arrNodos[i+1].equals("")){
					int nuNodoPadre = Integer.parseInt(arrNodos[i+1]);
  				puesto.setNuNodoPadre(nuNodoPadre);
				}
				puesto.setIdArea(idArea);
				puesto.setNbPuesto(arrNodos[i+2]);
				puesto.setDescPuesto(arrNodos[i+3]);
				puesto.setIndCtrlAsoc(arrNodos[i+4]);
				Departamento depto = ClaseDepartamento.buscaDeptoXnombre(arrNodos[i+5],idArea);
				if(depto!=null){
					puesto.setIdDepartamento(depto.getIdDepto());
				}
				puesto.setColor(arrNodos[i+6]);
				puesto.setCreadoPor(creadoPor);
				puesto.setFhCreacion(fhCreacion);
				agregado = ClasePuestos.agregarPuesto(puesto);
				i=i+7;
			}
		return agregado;
	}
	
	
	private boolean actualizarNodos(int numNodos, ArrayList<Puesto> arrPuesto, String[] arrNodos, int idArea){
		boolean agregado=false;
		int i=0;
		for(int j=0; j<numNodos;j++){
				Puesto puesto = arrPuesto.get(j);
				if(!arrNodos[i+1].equals("")){
					int nuNodoPadre = Integer.parseInt(arrNodos[i+1]);
					puesto.setNuNodoPadre(nuNodoPadre);
				}
				Departamento depto = ClaseDepartamento.buscaDeptoXnombre(arrNodos[i+5],idArea);
				if(depto!=null){
					puesto.setIdDepartamento(depto.getIdDepto());
				}
				puesto.setNbPuesto(arrNodos[i+2]);
				puesto.setDescPuesto(arrNodos[i+3]);
				puesto.setIndCtrlAsoc(arrNodos[i+4]);
				puesto.setColor(arrNodos[i+6]);
				agregado = ClasePuestos.update(puesto);
				i=i+7;
			}
		return agregado;
	}
}
