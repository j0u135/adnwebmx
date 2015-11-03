package com.adn.vista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseIndicador;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.controlador.IndicadorInteligente;

/**
 * Servlet implementation class buscaUsuario y buscaIndicadores 
 */
@WebServlet("/CargaArchivoXmes")
public class CargaArchivoXmes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaArchivoXmes() {
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
		
			String numReg = request.getParameter("cantInd");
			//String anio = request.getParameter("anioSel");
			String anio = request.getParameter("anio1");
			String[] arrIndicador;
			System.out.println("Num reg "+numReg+" año: "+ anio);
			int agre= 1;
			String nbIndicador = "";
			String usuario="";
			String indicador = "";
			String mes = "";
			int totReg =0;
			String msj="";
			int idIndicador;
			
			if(numReg != null && numReg != ""){
				totReg = Integer.parseInt(numReg);
				for(int i =1; i<totReg; i++){ //Se revisa registro por registro
					indicador = request.getParameter("row"+i);
					//System.out.println(request.getParameter("row"+i));
					arrIndicador = indicador.split(","); //Se separa el registro
					//System.out.println("Longitud "+ arrIndicador.length);
					if(arrIndicador.length >3){
						usuario=arrIndicador[0];
						nbIndicador = arrIndicador[1]; //Se toma el nombre del indicador
						idIndicador = ClaseIndicador.consultaIndXnomb(nbIndicador);
						mes = arrIndicador[2];
					//Se consulta el mes del indicadore
						if(usuario!=null && usuario!="" && idIndicador>0 && mes!=null && mes!=""){
							IndicadorInteligente nuevoInd = ClaseIndicadoresInteligentes.consultaMesxIndyUsu(idIndicador, mes, anio,usuario);
							//Nombre|userS
							if(nuevoInd!=null){
								if(arrIndicador.length == 4){//mes
									nuevoInd.setResultado(arrIndicador[3]!=""?arrIndicador[3]:"");//Resultado
								}else if(arrIndicador.length == 9){//Semana
									nuevoInd.setResultado(arrIndicador[3]!=""?arrIndicador[3]:"");//Resultado
									nuevoInd.setResulSem1(arrIndicador[4]!=""?arrIndicador[4]:"");//Sem1res
									nuevoInd.setResulSem2(arrIndicador[5]!=""?arrIndicador[5]:"");//Sem2res
									nuevoInd.setResulSem3(arrIndicador[6]!=""?arrIndicador[6]:"");//Sem3res
									nuevoInd.setResulSem4(arrIndicador[7]!=""?arrIndicador[7]:"");//Sem4res
									nuevoInd.setResulSem5(arrIndicador[8]!=""?arrIndicador[8]:"");//Sem5res
						   		}else if(arrIndicador.length == 11){//Quincena
						   			nuevoInd.setResultado(arrIndicador[3]!=""?arrIndicador[3]:"");//Resultado
									nuevoInd.setResulSem1(arrIndicador[4]!=""?arrIndicador[4]:"");//Sem1res
									nuevoInd.setResulSem2(arrIndicador[5]!=""?arrIndicador[5]:"");//Sem2res
									nuevoInd.setResulSem3(arrIndicador[6]!=""?arrIndicador[6]:"");//Sem3res
									nuevoInd.setResulSem4(arrIndicador[7]!=""?arrIndicador[7]:"");//Sem4res
									nuevoInd.setResulSem5(arrIndicador[8]!=""?arrIndicador[8]:"");//Sem5res
									nuevoInd.setResulQuin1(arrIndicador[9]!=""?arrIndicador[9]:"");//q1resultado
									nuevoInd.setResulQuin2(arrIndicador[10]!=""?arrIndicador[10]:"");//q2resultado	
						   		}
						   		//System.out.println("nuevo: "+ nuevoMes);
						   		boolean actualizado = ClaseIndicadoresInteligentes.update(nuevoInd, usuario, mes);
						   		if(actualizado){
						   			String atri = "agregado" + agre;
						   			request.setAttribute(atri, nbIndicador);
						   			agre ++;
						   		}
							}else{
								msj = "El usuario: "+usuario+" no cuenta con planeación para el mes de: "+mes;
							}
						}else{
							msj = "Error en el registro: "+agre;
						}
					}
				}
			}
			agre = agre-1;
			totReg = totReg-1;
			msj = msj + " Registros actualizados: "+agre+" de "+totReg;
			request.setAttribute("mensaje", msj);
            request.getRequestDispatcher("CargaArchivoCsvMes.jsp").forward(request, response);
	}

}
