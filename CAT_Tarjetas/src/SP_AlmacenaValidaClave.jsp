<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*" %>
<%@page import="com.microsoft.sqlserver.jdbc.SQLServerCallableStatement"%>
<%@page import="javax.servlet.jsp.JspWriter" %>


<%!
private static final Logger log = LogManager.getLogger("gvp");
// Implement this method to execute some server-side logic.

public JSONObject performLogic(JSONObject state, Map<String, String> additionalParams) throws Exception {
	
	JSONObject result = new JSONObject();	

	
	//OBTIENE VARIABLES DE SP
	String calluuid = state.getString("CallUUID");
	String rut = state.getString("var_RUT");
	String nombre = state.getString("var_Nombre");
	String decision= state.getString("var_Decision");
	String msjIntentos = state.getString("var_MsjIntentos");
	String tipoTarjeta = state.getString("var_TipoTarjeta");
	String mensaje = state.getString("var_Mensaje");
	String tipoCliente = state.getString("var_TipoCliente");
	String ivr = state.getString("var_APLICACION");
	
	System.out.println("TipoCLiente: " + tipoCliente);
	
	if(tipoCliente.equals("true"))
		tipoCliente = "Titular";
	if(tipoCliente.equals("false"))
		tipoCliente = "Adicional";
		
	
	int error = 0;
	String messageEjecucion = "OK";
	
	System.out.println("Almacena Datos de la Validación de clave");
	
	//VARIABLES LOCALES CONEXION BD CON INSTANCIA, DE NO EXISTIR VA EL PUERTO
	//QA
	//String connStr = "jdbc:sqlserver://bd2\\QA;databaseName=catQA;user=usrcatQA;password=Matamoros91";
	
	//PROD
	String connStr = "jdbc:sqlserver://vbd-sql\\PROD;databaseName=cat;user=adminprd;password=GUwDU99L";
    Connection con = null;
    SQLServerCallableStatement cstmt = null;
    
	 try 
	 {
		 System.out.println("Almacena Validacion Clave> Conexion a Base de Datos");
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		 con = DriverManager.getConnection(connStr); 
		 
         // LLAMADA SP
         System.out.println("Almacena Validacion Clave> Consulta a SP_IVR_Registro_ConClave");
         cstmt = (SQLServerCallableStatement) con.prepareCall("{call dbo.SP_IVR_Registro_ConClave(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
        		
         //PASO DE VARIABLES A SP
         
         cstmt.setString(1, rut);
         cstmt.setString(2, nombre);
         cstmt.setString(3, decision);
         cstmt.setString(4, msjIntentos);
         cstmt.setString(5, tipoTarjeta);
         cstmt.setString(6, mensaje);
         cstmt.setString(7, tipoCliente); 	
         cstmt.setString(8, ivr);
         cstmt.setString(9, calluuid);
         cstmt.execute();
     	
		 cstmt.close();
		 con.close(); 	 
		 
        }
	 

        catch (SQLException e) {
        	System.out.println("Almacena Validacion Clave> SQLException: " + e.getMessage());
   		 	cstmt.close();
   		 	con.close(); 
   		 	error = e.getErrorCode();
    	 	messageEjecucion = e.getMessage();
            e.printStackTrace();
        }
	 	catch (Exception e) {
	 		System.out.println("Almacena Validacion Clave> Exception: " + e.getMessage());
			cstmt.close();
			con.close(); 
			error = 1;
    	 	messageEjecucion = e.getMessage();
            e.printStackTrace();
        }
	 System.out.println("Almacena Validacion Clave> error: " + error);
	 System.out.println("Almacena Validacion Clave> messageEjecucion: " + messageEjecucion);
	 result.put("error", error);
	 result.put("messageEjecucion", messageEjecucion);
	 	 
     return result;
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="../include/backend.jspf" %>