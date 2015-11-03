package com.adn.conexion;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.adn.conexion.Conexion;


public class Select extends Conexion {
	
	public Select()
    {
        
    }
	
	public ResultSet consultar(String sql){
        conectar();
        ResultSet resultado = null;
        try {
        	System.out.println(sql);
            resultado =consulta.executeQuery(sql);

        } catch (SQLException e) {
                System.out.println("Mensaje:"+e.getMessage());
                System.out.println("Estado:"+e.getSQLState());
                System.out.println("Codigo del error:"+e.getErrorCode());
                }
        
        return resultado;
    }

	
	
	
}	
