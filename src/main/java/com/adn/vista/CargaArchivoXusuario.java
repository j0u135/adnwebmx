package com.adn.vista;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.controlador.IndicadorInteligente;

/**
 * Servlet implementation class buscaUsuario y buscaIndicadores 
 */
@WebServlet("/CargaArchivoXusuario")
public class CargaArchivoXusuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargaArchivoXusuario() {
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
		String numReg = request.getParameter("cantMes");
		String anio = request.getParameter("anioSel");
		String nbIndicador = request.getParameter("indSel");
		String usuario = request.getParameter("usuSel");
		
		String[] arrMeses;
		//System.out.println("Num reg "+numReg);
		int agre= 1;
		String rowActualizar;
		String nbMes = "";
		if(numReg != null && numReg != ""){
			int totReg = Integer.parseInt(numReg);
			for(int i = 1; i<totReg; i++){ //Se revisa registro por registro
				rowActualizar = request.getParameter("row"+i);
				arrMeses = rowActualizar.split(","); //Se separa el registro
				nbMes = arrMeses[0]; //Se toma el nombre del indicador
				//System.out.println("Mes "+nbMes);
				//Se consulta el indicador del indicadore
				String[] nuevoArr = ClaseIndicadoresInteligentes.consultaMesxInd(nbIndicador, nbMes.substring(0, 3).toLowerCase(), anio);
				//Nombre|userS
		   		if(arrMeses.length == 7){
   				nuevoArr[4] = (arrMeses[1]!=""?arrMeses[1]:"vacio");//Resultado
   				nuevoArr[5] = (arrMeses[2]!=""?arrMeses[2]:"vacio");//Sem1res
   				nuevoArr[6] = (arrMeses[3]!=""?arrMeses[3]:"vacio");//Sem2res
   				nuevoArr[7] = (arrMeses[4]!=""?arrMeses[4]:"vacio");//Sem3res
   				nuevoArr[8] = (arrMeses[5]!=""?arrMeses[5]:"vacio");//Sem4res
   				nuevoArr[9] = (arrMeses[6]!=""?arrMeses[6]:"vacio");//Sem5res
		   		}else if(arrMeses.length == 9){
		   			nuevoArr[4] = (arrMeses[1]!=""?arrMeses[1]:"vacio");//Resultado
	   				nuevoArr[5] = (arrMeses[2]!=""?arrMeses[2]:"vacio");//Sem1res
	   				nuevoArr[6] = (arrMeses[3]!=""?arrMeses[3]:"vacio");//Sem2res
	   				nuevoArr[7] = (arrMeses[4]!=""?arrMeses[4]:"vacio");//Sem3res
	   				nuevoArr[8] = (arrMeses[5]!=""?arrMeses[5]:"vacio");//Sem4res
	   				nuevoArr[9] = (arrMeses[6]!=""?arrMeses[6]:"vacio");//Sem5res
	   				nuevoArr[16] = (arrMeses[7]!=""?arrMeses[7]:"vacio");//q1resultado
	   				nuevoArr[17] = (arrMeses[8]!=""?arrMeses[8]:"vacio");//q2resultado	
		   		}
		   		String nuevoMes ="";
		   		for(int w=0; w<nuevoArr.length;w++){
		   			if(w==0){
		   				nuevoMes= nuevoArr[w];
		   			}else{
		   				nuevoMes= nuevoMes +"-"+ nuevoArr[w];
		   			}
		   		}
		   		//System.out.println("nuevo: "+ nuevoMes);
		   		//System.out.println("nuevo: "+ nbIndicador + " - " +usuario+ " - " +anio+ " - " +nbMes.substring(0, 3).toLowerCase()+ " - " + nuevoMes);
		   		//IndicadorInteligente ii = new IndicadorInteligente(nbIndicador, "","", "","","",usuario,anio, nbMes.substring(0, 3).toLowerCase(), nuevoMes);
		   		boolean actualizado = false;//ClaseIndicadoresInteligentes.updateMes(ii);
		   		if(actualizado){
		   			String atri = "agregado" + agre;
		   			request.setAttribute(atri, nbIndicador);
		   			agre ++;
		   		}
			}
		}
		String msj = "Registros actualizados: "+agre+" de "+numReg;
		request.setAttribute("mensaje", msj);
        request.getRequestDispatcher("CargaArchivoCsvUsuario.jsp").forward(request, response);
	}

}
