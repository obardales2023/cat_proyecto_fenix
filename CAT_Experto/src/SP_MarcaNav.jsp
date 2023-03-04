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
	String idLlamada = state.getString("CallUUID");
	String numMovil = state.getString("ANI");
	String Var3 = state.getString("var_dnis");
	String Var4 = state.getString("var_RUT");
	String Var5 = state.getString("var_log_hora_ini");
	String Var6= state.getString("var_log_hora_fin");
	String Var7 = state.getString("var_APLICACION");
	String Var8 = state.getString("var_log_navegacion");
	
	
	int error = 0;
	String messageEjecucion = "OK";
	
	System.out.println("Marca Navegacion> var_log_navegacion: " + Var8);
	
	//VARIABLES LOCALES CONEXION BD CON INSTANCIA, DE NO EXISTIR VA EL PUERTO
	//QA
	//String connStr = "jdbc:sqlserver://bd2\\QA;databaseName=catQA;user=usrcatQA;password=Matamoros91";
	
	//PROD
	String connStr = "jdbc:sqlserver://vbd-sql\\PROD;databaseName=cat;user=adminprd;password=GUwDU99L";
    Connection con = null;
    SQLServerCallableStatement cstmt = null;
    
	 try 
	 {
		 System.out.println("Marca Navegacion> Conexion a Base de Datos");
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		 con = DriverManager.getConnection(connStr); 
		 
         // LLAMADA SP
         System.out.println("Marca Navegacion> Consulta a SP_IVR_RegistraTraza");
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

		 cstmt.close();
		 con.close(); 	 
		 
        }
	 

        catch (SQLException e) {
        	System.out.println("Marca Navegacion> SQLException: " + e.getMessage());
   		 	cstmt.close();
   		 	con.close(); 
   		 	error = e.getErrorCode();
    	 	messageEjecucion = e.getMessage();
            e.printStackTrace();
        }
	 	catch (Exception e) {
	 		System.out.println("Marca Navegacion> Exception: " + e.getMessage());
			cstmt.close();
			con.close(); 
			error = 1;
    	 	messageEjecucion = e.getMessage();
            e.printStackTrace();
        }
	 System.out.println("Marca Navegacion> error: " + error);
	 System.out.println("Marca Navegacion> messageEjecucion: " + messageEjecucion);
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