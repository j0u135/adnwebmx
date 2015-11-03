package com.adn.vista;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.adn.conexion.ClaseHojaRumbo;
import com.adn.conexion.ClaseIndicadoresInteligentes;
import com.adn.conexion.ClaseProyectosPrioritarios;
import com.adn.conexion.ConexionBase;
import com.adn.controlador.HojaRumbo;
import com.adn.controlador.IndicadorInteligente;
import com.adn.controlador.Prioridad;

/**
 * Servlet implementation class ExportarDatos
 */
@WebServlet("/ExportarDatos")
public class ExportarDatos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportarDatos() {
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
		
		
		String nombreUsuario=request.getParameter("usuarioReportes");
		String mesf=request.getParameter("mesActual");
		String nombre=request.getParameter("usuarioHojaRumbo");
		String solicitud=request.getParameter("solicitudHR");
		String resultado=request.getParameter("resultadoHR");
		String anio=request.getParameter("anioHR");
		
		
		System.out.println(nombreUsuario);
		
			 Calendar fecha = new GregorianCalendar();
		        //int ano = fecha.get(Calendar.YEAR);
		        //int mes = Integer.parseInt(mesf);
		//        int mesp=2;
		  //      String mesE="Febrero";
		
		    /*    
		        String mesA="";
		        
		        
		        switch(mes){
		        case 0:
		          {
		        	  mesA="ene";
		        	 
		            break;
		          }
		        case 1:
		          {
		        	  mesA="feb";
		        	 
		            break;
		          }
		        case 2:
		          {
		        	  mesA="mar";
		        	
		            break;
		          }
		        case 3:
		          {
		        	  mesA="abr";
		        	 
		            break;
		          }
		        case 4:
		          {
		        	  mesA="may";
		        	 
		            break;
		          }
		        case 5:
		          {
		        	  mesA="jun";
		        	 
		            break;
		          }
		        case 6:
		          {
		        	  mesA="jul";
		        	 
		            break;
		          }
		        case 7:
		          {
		        	  mesA="ago";
		        	 
		            break;
		          }
		        case 8:
		          {
		        	  mesA="sep";
		        	 
		            break;
		          }
		        case 9:
		          {
		        	  mesA="oct";
		        	  
		            break;
		          }
		        case 10:
		          {
		        	  mesA="nov";
		        	 
		            break;
		          }
		        case 11:
		          {
		        	  mesA="dic";
		        	 
		            break;
		          }
		      }
			*/
		
		    //    HojaRumbo nuevaHoja=new HojaRumbo(nombre, solicitud, mesf, resultado);
				//boolean estado=ClaseHojaRumbo.verificaEstado(nuevaHoja, anio);
					//ClaseIndicadoresInteligentes cii= new ClaseIndicadoresInteligentes();
					//ArrayList <IndicadorInteligente> arrIndInte= (ArrayList <IndicadorInteligente>) cii.consultar(nombre,mesf,anio);
					//ArrayList <String> resulsetProcentaje= (ArrayList <String>)ClaseHojaRumbo.consultarPorcentajes(nombre,mesf,anio);
					//ClaseProyectosPrioritarios cpp=new ClaseProyectosPrioritarios();
					//ArrayList <ProyectosPrioritarios> arrProyectosP = (ArrayList <ProyectosPrioritarios>)cpp.consultar(nombre,mesf,anio);    
		        	
					
					
		        
			Workbook wb = new HSSFWorkbook();
			Sheet personSheet = wb.createSheet("Reporte");
			Row headerRow = personSheet.createRow(0);
			Cell nameHeaderCell = headerRow.createCell(0);
			Cell addressHeaderCell = headerRow.createCell(1);
	
			ConexionBase c=new ConexionBase();
			Connection con=c.getConexion();
			
			try{
			
				
				//usuario-Nombre Indicador---Unidad---Meta---Resultado 
				String sql = "SELECT (SELECT ind.nb_indicador FROM Indicadores ind WHERE ind.idIndicador = indIn.idIndicador), indIn.usuario, indIn.peso, indIn.frecuencia, indIn.meta, indIn.resultado, indIn.prog_sem1, indIn.resul_sem1, indIn.prog_sem2, indIn.resul_sem2, indIn.prog_sem3, indIn.resul_sem3, indIn.prog_sem4, indIn.resul_sem4, indIn.prog_sem5, indIn.resul_sem5 FROM IndInte indIn WHERE indIn.mes='"+mesf+"' ORDER BY indIn.usuario ";
				System.out.println(sql);
				PreparedStatement ps =  con.prepareStatement(sql);
				ResultSet resultSet = ps.executeQuery();    
                System.out.print(sql);		
				int row = 1;
				while(resultSet.next()) {
				    String NI = resultSet.getString(1);
				    String Usuario = resultSet.getString("usuario");
				    String Peso = resultSet.getString("peso");
				    String Frecuencia = resultSet.getString("frecuencia");
				    String Meta = resultSet.getString("meta");
				    String Resultado = resultSet.getString("resultado");
				    String Prog_sem1 = resultSet.getString("prog_sem1");
				    String Resul_sem1 = resultSet.getString("resul_sem1");
				    String Prog_sem2 = resultSet.getString("prog_sem2");
				    String Resul_sem2 = resultSet.getString("resul_sem2");
				    String Prog_sem3 = resultSet.getString("prog_sem3");
				    String Resul_sem3 = resultSet.getString("resul_sem3");
				    String Prog_sem4 = resultSet.getString("prog_sem4");
				    String Resul_sem4 = resultSet.getString("resul_sem4");
				    String Prog_sem5 = resultSet.getString("prog_sem5");
				    String Resul_sem5 = resultSet.getString("resul_sem5");
		
				    Row dataRow = personSheet.createRow(row);
		
				    Cell celdaNI = dataRow.createCell(0);
				    celdaNI.setCellValue(NI);
		
				    Cell celdaUsuario = dataRow.createCell(1);
				    celdaUsuario.setCellValue(Usuario);
				    
				    Cell celdaPeso = dataRow.createCell(2);
				    celdaPeso.setCellValue(Peso);
				    
				    Cell celdaFrecuencia = dataRow.createCell(3);
				    celdaFrecuencia.setCellValue(Frecuencia);
				    
				    Cell celdaMeta = dataRow.createCell(4);
				    celdaMeta.setCellValue(Meta);
				    
				    Cell celdaResultado = dataRow.createCell(5);
				    celdaResultado.setCellValue(Resultado);
				    
				    Cell celdaProg1 = dataRow.createCell(6);
				    celdaProg1.setCellValue(Prog_sem1);
				    
				    Cell celdaResul1 = dataRow.createCell(7);
				    celdaResul1.setCellValue(Resul_sem1);
				    
				    Cell celdaProg2 = dataRow.createCell(8);
				    celdaProg2.setCellValue(Prog_sem2);
				    
				    Cell celdaResul2 = dataRow.createCell(9);
				    celdaResul2.setCellValue(Prog_sem2);
				    
				    Cell celdaProg3 = dataRow.createCell(10);
				    celdaProg3.setCellValue(Prog_sem3);
				    
				    Cell celdaResul3 = dataRow.createCell(11);
				    celdaResul3.setCellValue(Resul_sem3);
				    
				    Cell celdaProg4 = dataRow.createCell(12);
				    celdaProg4.setCellValue(Prog_sem4);
				    
				    Cell celdaResul4 = dataRow.createCell(13);
				    celdaResul4.setCellValue(Resul_sem4);
				    
				    Cell celdaProg5 = dataRow.createCell(14);
				    celdaProg5.setCellValue(Prog_sem5);
				    
				    Cell celdaResul5 = dataRow.createCell(15);
				    celdaResul5.setCellValue(Resul_sem5);
		
				    row = row + 1;
				}
				
				
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//String rutaArchivo = System.getProperty("user.home")+"/ejemploExcelJava.xls";
			String outputDirPath = "\\C:\\ReportesADN\\Reporte.xls";
			FileOutputStream fileOut = new FileOutputStream(outputDirPath);
			wb.write(fileOut);
			fileOut.close();
			
			
			
			request.setAttribute("variableEnviada", new String("Reporte generado correctamente en C:/ReportesADN"));
			
			//request.setAttribute("indicadores", arrIndInte);
			//request.setAttribute("porcentajes", resulsetProcentaje);
			//request.setAttribute("proyectosPrio", arrProyectosP);
			//request.setAttribute("usuarioEnviado", nombre);
			//request.setAttribute("mesEnviado", mesE);
			//request.setAttribute("mesNumerico", mesp);
			//request.setAttribute("anio", anio);
			request.getRequestDispatcher("InterfazIndicadoresADN.jsp").forward(request, response);
		
            	
		
	}

}
