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
import com.adn.conexion.ClaseFiltroInd;
import com.adn.conexion.ClaseIndicador;
import com.adn.conexion.ClasePuestos;
import com.adn.controlador.Arbol;
import com.adn.controlador.Area;
import com.adn.controlador.Departamento;
import com.adn.controlador.FiltroIndicadores;
import com.adn.controlador.Indicador;
import com.adn.controlador.Puesto;

/**
 * Servlet implementation class CargaInterfazIndicadores
 */
@WebServlet("/cargaConsultaNIs")
public class CargaConsultaNIs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaConsultaNIs() {
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
		String claveArea = request.getParameter("idArea");
		String claveDepto=request.getParameter("idDepto");
		String clavePuesto=request.getParameter("idPuesto");
		String vistaNIs = request.getParameter("vistaNI");
		String buscaNIs = request.getParameter("buscaNI");
		String claveNI = request.getParameter("idNi");
		ArrayList<Departamento> arrDeptos = null;
		ArrayList<Puesto> arrPuestos = null;
		ArrayList<Indicador> arrIndicadores = null;
		String totNIs="", totPues="";
		ArrayList<String> niPuesXdepto = null;
		ArrayList<String> niXpuesto = null;
		ArrayList<Indicador> arrIndTabla = null;
		ArrayList<FiltroIndicadores> arrFiltroTbl = null;
		int idArea;
		int idDepto=-1;
		int idPuesto=-1;
		int idIndicador=-1;
		int idArbol = -1;
		ArrayList<Area> arrAreas = ClaseArea.consultar();
		if(claveArea!=null && !claveArea.equals("")){
			Arbol arbol = new Arbol();
			idArea = Integer.parseInt(claveArea);
			arbol.setIdArea(idArea);
			arrDeptos = ClaseDepartamento.buscaDepartamento(idArea);
			if(claveDepto!=null && !claveDepto.equals("") && !claveDepto.equals("0")){
				idDepto= Integer.parseInt(claveDepto);
				vistaNIs ="1";
				arrPuestos = ClasePuestos.buscaPuestos(idArea, idDepto);
				Arbol arbol2 = new Arbol();
				arbol2.setIdArea(idArea);
				// Para grafica por área y depto
				totNIs = ClaseIndicador.cuentaIndxArbol(idArbol,idDepto);
				totPues = ClasePuestos.cuentaPuestxArea(idArea,idDepto);
				if(arrPuestos.size()>0){
					niXpuesto = new ArrayList<String>();
					for(int i=0; i<arrPuestos.size(); i++){
						Puesto pues = arrPuestos.get(i);
						String niXpues = ClasePuestos.cuentaIndxPuesto(pues.getIdPuesto());
						String reng = pues.getNbPuesto()+","+niXpues;
						niXpuesto.add(reng);
					}
				}
				if(clavePuesto!=null && !clavePuesto.equals("") && !clavePuesto.equals("0")){
					idPuesto= Integer.parseInt(clavePuesto);
					idArbol = ClaseArbol.verificaRepetido(arbol2);
					arrIndicadores = ClaseIndicador.consultarIndxPuesto(idPuesto, idArbol);
				}else if(clavePuesto!=null && !clavePuesto.equals("") && clavePuesto.equals("0")){
					idPuesto= Integer.parseInt(clavePuesto);
					idArbol = ClaseArbol.verificaRepetido(arbol2);
					arrIndicadores = ClaseIndicador.consultarIndxDepto(idArbol, idDepto);
				}
			}else if(claveDepto!=null && !claveDepto.equals("") && claveDepto.equals("0")){ //Si selecciono todos
				vistaNIs ="1";
				idArbol = ClaseArbol.verificaRepetido(arbol);
				arrPuestos = ClasePuestos.buscaPuestosXarea(idArea);
				// Para grafica por área
				totNIs = ClaseIndicador.cuentaIndxArbol(idArbol);
				totPues = ClasePuestos.cuentaPuestxArea(idArea);
				if(arrDeptos.size()>0){
					niPuesXdepto = new ArrayList<String>();
					for(int i=0; i<arrDeptos.size(); i++){
						Departamento depto = arrDeptos.get(i);
						String niXdepto = ClaseIndicador.cuentaIndxArbol(idArbol, depto.getIdDepto());
						String puestXdepto = ClasePuestos.cuentaPuestxArea(idArea, depto.getIdDepto());
						String renglon = depto.getNbDepto()+","+niXdepto+","+puestXdepto;
						niPuesXdepto.add(renglon);
					}
				}
			}
			//Si es tabla
			if(buscaNIs!=null && !buscaNIs.equals("") && buscaNIs.equals("buscaNI")){
				if(idArea>0){
					arrFiltroTbl = new ArrayList<FiltroIndicadores>();
					if(idDepto>0){
						if(idPuesto>0){
							idIndicador = Integer.parseInt(claveNI);
							if(idIndicador>0){
								//Busca por indicador
								arrIndTabla = ClaseIndicador.consultarIndicadorXid(idIndicador);
								FiltroIndicadores filtro = ClaseFiltroInd.consultarFiltroInd(idIndicador);
								if(filtro!=null){
									arrFiltroTbl.add(filtro);
								}
							}else if(idIndicador==0){
								//Busca por puesto
								arrIndTabla = ClaseIndicador.consultarIndxPuesto(idPuesto, idArbol);
								if(arrIndTabla!=null && arrIndTabla.size()>0){
									for(int i=0; i<arrIndTabla.size(); i++){
										Indicador ind = arrIndTabla.get(i);
										FiltroIndicadores filtro = ClaseFiltroInd.consultarFiltroInd(ind.getIdIndicador());
										if(filtro!=null){
											arrFiltroTbl.add(filtro);
										}
									}
								}
							}
						}else if(idPuesto==0){
							//Busca por Departamento
							arrIndTabla = ClaseIndicador.consultarIndxDepto(idArbol, idDepto);
							if(arrIndTabla!=null && arrIndTabla.size()>0){
								for(int i=0; i<arrIndTabla.size(); i++){
									Indicador ind = arrIndTabla.get(i);
									FiltroIndicadores filtro = ClaseFiltroInd.consultarFiltroInd(ind.getIdIndicador());
									if(filtro!=null){
										arrFiltroTbl.add(filtro);
									}
								}
							}
						}
					}else if(idDepto==0){
						//Busca por area
						arrIndTabla = ClaseIndicador.consultarIndicadores(idArbol);
						if(arrIndTabla!=null && arrIndTabla.size()>0){
							for(int i=0; i<arrIndTabla.size(); i++){
								Indicador ind = arrIndTabla.get(i);
								FiltroIndicadores filtro = ClaseFiltroInd.consultarFiltroInd(ind.getIdIndicador());
								if(filtro!=null){
									arrFiltroTbl.add(filtro);
								}
							}
						}
					}
				}
			}
		}
		request.setAttribute("idPuesto", clavePuesto);
		request.setAttribute("idDepto", claveDepto);
		request.setAttribute("idArea", claveArea);
		request.setAttribute("deptos", arrDeptos);
		request.setAttribute("areas", arrAreas);
		request.setAttribute("puestos", arrPuestos);
		request.setAttribute("indicadores", arrIndicadores);
		request.setAttribute("vistaNI", vistaNIs);
		//Para gráfica total de NIs, total de puestos, ni´s y puesto por depto, ni´s por puesto
		request.setAttribute("totNIs", totNIs); 
		request.setAttribute("totPues", totPues);
		//Regresa un arreglo, en cada nodo hay una cadena separada por coma; que tiene Nombre del depto, num de NI, num de Depto
		request.setAttribute("niPuesXdepto", niPuesXdepto);
		//Regresa un arreglo, en cada nodo hay una cadena separada por coma; que tiene Nombre del puesto, num de NI.
		request.setAttribute("niXpuesto", niXpuesto);
		//Para la tabla de NI´s
		request.setAttribute("arrIndTabla", arrIndTabla);
		request.setAttribute("arrFiltroTbl", arrFiltroTbl);
		request.getRequestDispatcher("ConsultaNIs.jsp").forward(request, response);
	}
	


}
