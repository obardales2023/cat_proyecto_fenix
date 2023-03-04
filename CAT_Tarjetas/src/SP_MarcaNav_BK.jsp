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

	
	//OBTIENE VARIABLES DE SP
	String idLlamada = state.getString("CallUUID");
	String numMovil = state.getString("ANI");
	String Var3 = state.getString("var_dnis");
	String Var4 = state.getString("var_RUT");
	String Var5 = state.getString("var_log_hora_ini");
	String Var6= state.getString("var_log_hora_fin");
	String Var7 = state.getString("var_APLICACION");
	String Var8 = state.getString("var_log_navegacion");
	
	LoggerCallflow = state.getString("LoggerCallflow");
	
	//Concatenamos el CallUUID , el Ani , el nombre del flujo y el mensaje que queremos guardar, esto nos ayudara a darle seguimiento a una llamada dentro de los logs
    LoggerMensaje = idLlamada + " | " + numMovil + " | " + LoggerCallflow + " | ";
	
	//VARIABLES LOCALES CONEXION BD CON INSTANCIA, DE NO EXISTIR VA EL PUERTO
	//String connStr = "jdbc:sqlserver://bd2\\QA;databaseName=catQA;user=usrcatQA;password=Matamoros91";
	String connStr = "jdbc:sqlserver://vbd-sql\\PROD;databaseName=cat;user=adminprd;password=GUwDU99L";
	
	
    Connection con = null;
    SQLServerCallableStatement cstmt = null;
    
	 try 
	 {
		 //INICIA TIMER PARA SABER TIEMPO ENTRE CONEXION A BD Y EJECUCION DE SP
		 long startTime = System.nanoTime();		 
		 con = DriverManager.getConnection(connStr); 
		 
         // LLAMADA SP
         cstmt = (SQLServerCallableStatement) con.prepareCall("{call dbo.SP_IVR_RegistraTraza(?, ?, ?, ?, ?, ?, ?, ?)}");
        		
         //PASO DE VARIABLES A SP
         cstmt.setString(1, idLlamada);
         cstmt.setString(2, numMovil);
         cstmt.setString(3, Var3);
         cstmt.setString(4, Var4);
         cstmt.setString(5, Var5);
         cstmt.setString(6, Var6);
         cstmt.setString(7, Var7);
         cstmt.setString(8, Var8);

 		
         cstmt.execute();
         long stopTime = System.nanoTime();
		 long elapsedTime = (stopTime - startTime)/1000000;
		 LoggerMensaje += "JS SP_MarcaNav.jsp tardo en ejecutarse:" + elapsedTime;
		 log.info(LoggerMensaje);
		//FINALIZA TIMER
		
		 cstmt.close();
		 con.close(); 
		 
		 result.put("error","0");
		 result.put("messageEjecucion","OK");
		 	 
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