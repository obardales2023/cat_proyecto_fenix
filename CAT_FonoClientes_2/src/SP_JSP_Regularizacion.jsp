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
	int error = 0;
	String messageEjecucion = "OK";
	
	//OBTIENE VARIABLES DE SP
	String idLlamada = state.getString("CallUUID");
	String numMovil = state.getString("ANI");
	String varRUT = state.getString("rut");
	String varExiste = state.getString("existe");
	String varClasificacion = state.getString("clasificacion");
	
	System.out.println("Consulta Regularizacion> ANI: " + numMovil);
	System.out.println("Consulta Regularizacion> RUT: " + varRUT);
	LoggerCallflow = state.getString("LoggerCallflow");
	
	//Concatenamos el CallUUID , el Ani , el nombre del flujo y el mensaje que queremos guardar, esto nos ayudara a darle seguimiento a una llamada dentro de los logs
    LoggerMensaje = idLlamada + " | " + numMovil + " | " + LoggerCallflow + " | ";
	
  //VARIABLES LOCALES CONEXION BD CON INSTANCIA, DE NO EXISTIR VA EL PUERTO
  	//QA
  	//String connStr = "jdbc:sqlserver://bd2\\QA;databaseName=catQA;user=usrcatQA;password=Matamoros91";
  	
  	//PROD
  	String connStr = "jdbc:sqlserver://vbd-sql\\PROD;databaseName=cat;user=adminprd;password=GUwDU99L";
	
    Connection con = null;
    SQLServerCallableStatement cstmt = null;
    
	 try 
	 {
		 System.out.println("Consulta Regularizacion> Conexion a Base de Datos");
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");		 
		 con = DriverManager.getConnection(connStr); 
		 
         // LLAMADA SP
         System.out.println("Consulta Regularizacion> Consulta a SP_IVR_ConsultaRenegociacion");
         cstmt = (SQLServerCallableStatement) con.prepareCall("{? = call dbo.SP_IVR_ConsultaRenegociacion(?, ?, ?)}");
																
         //PASO DE VARIABLES A SP
         cstmt.registerOutParameter(1, Types.INTEGER);
         cstmt.setString(2, varRUT);
         cstmt.registerOutParameter(3, Types.VARCHAR);
		 cstmt.registerOutParameter(4, Types.VARCHAR);
 		
         cstmt.execute();
         
         returnSP = cstmt.getInt(1);
         varExiste  = cstmt.getString(3);
		 varClasificacion  = cstmt.getString(4);
		 
        		
		 cstmt.close();
		 con.close(); 
		 
		 
        }
	 

        catch (SQLException e) {
        	System.out.println("Consulta Regularizacion> SQLException: " + e.getMessage());
   		 	cstmt.close();
   		 	con.close();
   		 	error = e.getErrorCode();
    	 	messageEjecucion = e.getMessage();
            e.printStackTrace();
        }
	 	catch (Exception e) {
	 		System.out.println("Consulta Regularizacion> Exception: " + e.getMessage());
			cstmt.close();
			con.close(); 
			error = 1;
    	 	messageEjecucion = e.getMessage();
            e.printStackTrace();
        }
	 
	 System.out.println("Consulta Regularizacion> error: " + error);
	 System.out.println("Consulta Regularizacion> messageEjecucion: " + messageEjecucion);
	 System.out.println("Consulta Regularizacion> returnSP: " + returnSP);
	 System.out.println("Consulta Regularizacion> varExiste: " + varExiste);
	 System.out.println("Consulta Regularizacion> varClasificacion: " + varClasificacion);
	 result.put("error",error);
	 result.put("messageEjecucion",messageEjecucion);
	 result.put("returnSP",returnSP);
	 result.put("varExiste",varExiste);
	 result.put("varClasificacion",varClasificacion);
 	 
     return result;
        
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="../include/backend.jspf" %>