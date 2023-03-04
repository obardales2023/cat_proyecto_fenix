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
	
	String LoggerCallflow = "";
	String LoggerMensaje = "";
	String varSalida = ""; 
	int returnSP = 4;

	
	//OBTIENE VARIABLES DE SP
	String idLlamada = state.getString("CallUUID");
	String rut = state.getString("var_RUT");
	
	
	LoggerCallflow = state.getString("LoggerCallflow");
	
	//Concatenamos el CallUUID , el Ani , el nombre del flujo y el mensaje que queremos guardar, esto nos ayudara a darle seguimiento a una llamada dentro de los logs
    LoggerMensaje = idLlamada + " | " + rut + " | " + LoggerCallflow + " | ";
	
	//VARIABLES LOCALES CONEXION BD CON INSTANCIA, DE NO EXISTIR VA EL PUERTO
	String connStr = "jdbc:sqlserver://vbd-sql:1433;databaseName=cat;user=usrcat;password=b4cat-Cq";
	
    Connection con = null;
    SQLServerCallableStatement cstmt = null;
    
	 try 
	 {
		 //INICIA TIMER PARA SABER TIEMPO ENTRE CONEXION A BD Y EJECUCION DE SP
		 long startTime = System.nanoTime();		 
		 con = DriverManager.getConnection(connStr); 
		 
         // LLAMADA SP
         cstmt = (SQLServerCallableStatement) con.prepareCall("{? = call dbo.SP_IVR_ConsultaClienteNoEnrolado(?)}");
        		
         //PASO DE VARIABLES A SP
         cstmt.registerOutParameter(1, Types.INTEGER);
         cstmt.setString(2, rut);
         
         cstmt.execute();
		 
		 returnSP = cstmt.getInt(1);
		 
		 
         long stopTime = System.nanoTime();
		 long elapsedTime = (stopTime - startTime)/1000000;
		 LoggerMensaje += "Valor de Retorno de Ejecucion de SP:" + returnSP;
		 LoggerMensaje += " JS SP_JSP_ConsultaClienteNoEnrolado.jsp tardo en ejecutarse:" + elapsedTime;
		 log.info(LoggerMensaje);
		//FINALIZA TIMER
		
		 cstmt.close();
		 con.close(); 
		 
		 result.put("error","0");
		 result.put("messageEjecucion","OK");
		 result.put("returnSP",returnSP);
		 	 
         return result;
        }
	 

        catch (SQLException e) {
   		 	cstmt.close();
   		 	con.close(); 
       		result.put("errorSQL", e.getErrorCode());
       	 	result.put("messageSQL",e.getMessage());
            e.printStackTrace();
            return result;
        }
	 	catch (Exception e) {
			cstmt.close();
			con.close(); 
	 		result.put("error2", "1");
       	 	result.put("message2", e.getMessage());
            e.printStackTrace();
            return result;
        }
        
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="../include/backend.jspf" %>