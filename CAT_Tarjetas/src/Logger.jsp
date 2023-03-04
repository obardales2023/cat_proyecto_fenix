<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%!
private static final Logger log = LogManager.getLogger("gvp");

public JSONObject performLogic(JSONObject state, Map<String, String> additionalParams) throws Exception {
	JSONObject result = new JSONObject();
    
	String LoggerCallflow = "";
	String LoggerMensaje = "";
	String LoggerNivel = "";
	
    try{
        //Busca el CallUUID del state de la sesion.
		String idLlamada = state.getString("CallUUID");
		//Busca el ani del state del al sesion.
		String numMovil = state.getString("ANI");
		//Se debe declarar la variable "LoggerCallflow" en el Callflow o Workflow donde se indica el nombre del flujo para hacerle seguimiento
	    LoggerCallflow = state.getString("LoggerCallflow");
	    //Viene como parametro de entrada
	    LoggerMensaje =  additionalParams.get("LoggerMensaje"); 
	    //Viene como parametro de entrada
	    LoggerNivel = additionalParams.get("LoggerNivel"); 
		
		//Concatenamos el CallUUID , el Ani , el nombre del flujo y el mensaje que queremos guardar, esto nos ayudara a darle seguimiento a una llamada dentro de los logs
	    LoggerMensaje = idLlamada + " | " + numMovil + " | " + LoggerCallflow + " | " + LoggerMensaje;
		
		//Indicamos el nivel del logs
	    if(LoggerNivel.equals("Error"))
	    {
			log.error(LoggerMensaje);
	    }
	    else if(LoggerNivel.equals("Warn"))
	    {
	    	log.warn(LoggerMensaje);
	    }
	    else if(LoggerNivel.equals("Fatal"))
	    {
	    	log.fatal(LoggerMensaje);
	    }else
	    {
	    	log.info(LoggerMensaje);
	    }
	}catch(Exception ex){
		log.error(LoggerMensaje+"|Exception", ex);
	}
    return result;
}
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>