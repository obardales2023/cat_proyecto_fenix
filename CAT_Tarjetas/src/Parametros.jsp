<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="cl.sixbell.cat.utils.LibUtils" %>
<%@page import="java.util.Map"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.jsp.JspWriter" %>
<%!
private static final Logger log = LogManager.getLogger("gvp");
// Implement this method to execute some server-side logic.
public JSONObject performLogic(JSONObject state, Map<String, String> additionalParams) throws Exception {
    
    // The state variable contains all variables from the application.
    // If the application is a callflow, this consists of the variables in the Entry block 
    // of the callflow.  If the application is a workflow, the project variables will 
    // be passed.
    // For callflows, it's possible for the state variable to be null, if the 
    // passState option of the Backend block is false.
    
    // Example of how to access data from the state object.
    // Note that "Input1" is the name of the Input block and 
    // "Var1" is the name of the user-defined variable.
    
    // String userInput = state.getString("Input1");
    // String userVariable = state.getString("Var1");
    
    // The additionalParams map contains any additional input parameters passed
    // in the backend logic block.
    
    // Example:
    // Note that "Param1" is the parameter name of the input parameter.
    // String param = additionalParams.get("Param1");
    
    JSONObject result = new JSONObject();
	
	try {
		System.out.println("INICIO Utils[GetParamConfig]");
		String callid = additionalParams.get("CallID");
		String dnis = additionalParams.get("DNIS");
		String ani = additionalParams.get("ANI");
		log.info("Llegan a Parámetros: ");
		log.info("callid: " + callid);
		log.info("dnis: " + dnis);
		log.info("ani: " + ani);
		
		result.put("EndPointGetToken","https://api.rfsc.cl/api/v1.0/sec/oauth2/token");
		result.put("EndPointDatosCliente","https://api.rfsc.cl/api/v1.0/clientes/@RUT@/estado-cuentas?tipo_documento=1&pais=CHL");
		result.put("EndPointCrearSesionCRM","https://api.rfsc.cl/api/v1.0/sesiones/");
		result.put("EndPointCerrarSesionCRM","https://api.rfsc.cl/api/v1.0/sesiones/");
		result.put("ExecWSSession","on");
		
		//result.put("EndPointDatosMora","https://api.rfsc.cl/api/v1.0/clientes/@RUT@/activos?pais=056&tipo_documento=C&tipo_activo=060&estado=A");
		//"https://apiuatog.rfsc.cl/api/v1.0/clientes/65916312/activos?pais=056&tipo_documento=C&tipo_activo=060&estado=A"							   
		
		
		System.out.println("Utils[GetParamConfig]> CallID: " + callid + ", dnis: " + dnis);
		//LibUtils utilsWS = new LibUtils(callid);
		LibUtils.setIdLog(callid);
		
		
		String respuesta1 = LibUtils.GetParamConfig(dnis,"EndPointGetToken");
		System.out.println("Utils[GetParamConfig]> EndPointGetToken: " + respuesta1);
		log.info("Utils[GetParamConfig]> EndPointGetToken: " + respuesta1);
		
		String respuesta2 = LibUtils.GetParamConfig(dnis,"EndPointDatosCliente");
		System.out.println("Utils[GetParamConfig]> EndPointDatosCliente: " + respuesta2);
		log.info("Utils[GetParamConfig]> EndPointDatosCliente: " + respuesta2);
				
		String respuesta3 = LibUtils.GetParamConfig(dnis,"EndPointCrearSesionCRM");
		System.out.println("Utils[GetParamConfig]> EndPointCrearSesionCRM: " + respuesta3);
		log.info("Utils[GetParamConfig]> EndPointCrearSesionCRM: " + respuesta3);
				
		String respuesta4 = LibUtils.GetParamConfig(dnis,"EndPointCerrarSesionCRM");
		System.out.println("Utils[GetParamConfig]> EndPointCerrarSesionCRM: " + respuesta4);
		log.info("Utils[GetParamConfig]> EndPointCerrarSesionCRM: " + respuesta4);
				
		String respuesta5 = LibUtils.GetParamConfig(dnis,"ExecWSSession");
		System.out.println("Utils[GetParamConfig]> ExecWSSession: " + respuesta5);
		log.info("Utils[GetParamConfig]> ExecWSSession: " + respuesta5);
				
		String respuesta6 = LibUtils.GetParamConfig(dnis,"HorarioIni");
		System.out.println("Utils[GetParamConfig]> HorarioIni: " + respuesta6);
		log.info("Utils[GetParamConfig]> HorarioIni: " + respuesta6);
				
		String respuesta7 = LibUtils.GetParamConfig(dnis,"HorarioFin");
		System.out.println("Utils[GetParamConfig]> HorarioFin: " + respuesta7);
		log.info("Utils[GetParamConfig]> HorarioFin: " + respuesta7);
				
		String respuesta8 = LibUtils.GetParamConfig(dnis,"EndPointConsultaActivos");
		System.out.println("Utils[GetParamConfig]> EndPointConsultaActivos: " + respuesta8);
		log.info("Utils[GetParamConfig]> EndPointConsultaActivos: " + respuesta8);
				
		String respuesta9 = LibUtils.GetParamConfig(dnis,"EndPointTokenValidaTarjeta");
		System.out.println("Utils[GetParamConfig]> EndPointTokenValidaTarjeta: " + respuesta9);
		log.info("Utils[GetParamConfig]> EndPointTokenValidaTarjeta: " + respuesta9);
				
		String respuesta10 = LibUtils.GetParamConfig(dnis,"EndPointValidaClave");
		System.out.println("Utils[GetParamConfig]> EndPointValidaClave: " + respuesta10);
		log.info("Utils[GetParamConfig]> EndPointValidaClave: " + respuesta10);
				
		String respuesta11 = LibUtils.GetParamConfig(dnis,"EndPointFacturacion");
		System.out.println("Utils[GetParamConfig]> EndPointFacturacion: " + respuesta11);
		log.info("Utils[GetParamConfig]> EndPointFacturacion: " + respuesta11);
				
		String respuesta12 = LibUtils.GetParamConfig(dnis,"EndPointObtieneEWT");
		System.out.println("Utils[GetParamConfig]> EndPointObtieneEWT: " + respuesta12);
		log.info("Utils[GetParamConfig]> EndPointObtieneEWT: " + respuesta12);
				
		String respuesta13 = LibUtils.GetParamConfig(dnis,"EndPointSMSWhatsapp");
		System.out.println("Utils[GetParamConfig]> EndPointSMSWhatsapp: " + respuesta13);
		log.info("Utils[GetParamConfig]> EndPointSMSWhatsapp: " + respuesta13);
				
		String respuesta14 = LibUtils.GetParamConfig(dnis,"EndPointHSMWhatsapp");
		System.out.println("Utils[GetParamConfig]> EndPointHSMWhatsapp: " + respuesta14);	
		log.info("Utils[GetParamConfig]> EndPointHSMWhatsapp: " + respuesta14);	
				
		String respuesta15 = LibUtils.GetParamConfig(dnis,"EndPointActualizaSesion");
		System.out.println("Utils[GetParamConfig]> EndPointActualizaSesion: " + respuesta15);
		log.info("Utils[GetParamConfig]> EndPointActualizaSesion: " + respuesta15);
		
		String respuesta16 = LibUtils.GetParamConfig(dnis,"EndPointOfertaClientes");
		System.out.println("Utils[GetParamConfig]> EndPointOfertaClientes: " + respuesta16);
		log.info("Utils[GetParamConfig]> EndPointOfertaClientes: " + respuesta16);
				
		String numeroHorasMoviles = LibUtils.GetParamConfig(dnis,"numeroHorasMoviles");
		System.out.println("Utils[GetParamConfig]> numeroHorasMoviles: " + numeroHorasMoviles);
		log.info("Utils[GetParamConfig]> numeroHorasMoviles: " + numeroHorasMoviles);
				
		String numeroLlamadasANIDesconectar = LibUtils.GetParamConfig(dnis,"numeroLlamadasANIDesconectar");
		System.out.println("Utils[GetParamConfig]> numeroLlamadasANIDesconectar: " + numeroLlamadasANIDesconectar);
		log.info("Utils[GetParamConfig]> numeroLlamadasANIDesconectar: " + numeroLlamadasANIDesconectar);
				
		String numeroLlamadasRUTDesconectar = LibUtils.GetParamConfig(dnis,"numeroLlamadasRUTDesconectar");
		System.out.println("Utils[GetParamConfig]> numeroLlamadasRUTDesconectar: " + numeroLlamadasRUTDesconectar);
		log.info("Utils[GetParamConfig]> numeroLlamadasRUTDesconectar: " + numeroLlamadasRUTDesconectar);
				
		String SendMailFree_emlFrom = LibUtils.GetParamConfig(dnis,"SendMailFree_emlFrom");
		System.out.println("Utils[GetParamConfig]> SendMailFree_emlFrom: " + SendMailFree_emlFrom);
		log.info("Utils[GetParamConfig]> SendMailFree_emlFrom: " + SendMailFree_emlFrom);
				
		String SendMailFree_emlTo = LibUtils.GetParamConfig(dnis,"SendMailFree_emlTo");
		System.out.println("Utils[GetParamConfig]> SendMailFree_emlTo: " + SendMailFree_emlTo);
		log.info("Utils[GetParamConfig]> SendMailFree_emlTo: " + SendMailFree_emlTo);
				
		String SendMailFree_emlSubject = LibUtils.GetParamConfig(dnis,"SendMailFree_emlSubject");
		System.out.println("Utils[GetParamConfig]> SendMailFree_emlSubject: " + SendMailFree_emlSubject);
		log.info("Utils[GetParamConfig]> SendMailFree_emlSubject: " + SendMailFree_emlSubject);
				
		String SendMailFree_emlBody = LibUtils.GetParamConfig(dnis,"SendMailFree_emlBody");
		SendMailFree_emlBody = SendMailFree_emlBody.replace("<ANI>", ani);
		System.out.println("Utils[GetParamConfig]> SendMailFree_emlBody: " + SendMailFree_emlBody);
		log.info("Utils[GetParamConfig]> SendMailFree_emlBody: " + SendMailFree_emlBody);
				
		String SendMailFree_srvIp = LibUtils.GetParamConfig(dnis,"SendMailFree_srvIp");
		System.out.println("Utils[GetParamConfig]> SendMailFree_srvIp: " + SendMailFree_srvIp);
		log.info("Utils[GetParamConfig]> SendMailFree_srvIp: " + SendMailFree_srvIp);
				
		String SendMailFree_srvPort = LibUtils.GetParamConfig(dnis,"SendMailFree_srvPort");
		System.out.println("Utils[GetParamConfig]> SendMailFree_srvPort: " + SendMailFree_srvPort);
		log.info("Utils[GetParamConfig]> SendMailFree_srvPort: " + SendMailFree_srvPort);
				
		String SendMailFree_srvSsl = LibUtils.GetParamConfig(dnis,"SendMailFree_srvSsl");
		System.out.println("Utils[GetParamConfig]> SendMailFree_srvSsl: " + SendMailFree_srvSsl);
		log.info("Utils[GetParamConfig]> SendMailFree_srvSsl: " + SendMailFree_srvSsl);
				
		String SendMailFree_srvUser = LibUtils.GetParamConfig(dnis,"SendMailFree_srvUser");
		System.out.println("Utils[GetParamConfig]> SendMailFree_srvUser: " + SendMailFree_srvUser);
		log.info("Utils[GetParamConfig]> SendMailFree_srvUser: " + SendMailFree_srvUser);
				
		String SendMailFree_srvPassw = LibUtils.GetParamConfig(dnis,"SendMailFree_srvPassw");
		System.out.println("Utils[GetParamConfig]> SendMailFree_srvPassw: " + SendMailFree_srvPassw);
		log.info("Utils[GetParamConfig]> SendMailFree_srvPassw: " + SendMailFree_srvPassw);
				
		result.put("EndPointGetToken",respuesta1);
		result.put("EndPointDatosCliente",respuesta2);
		result.put("EndPointCrearSesionCRM",respuesta3);
		result.put("EndPointCerrarSesionCRM",respuesta4);
		result.put("ExecWSSession",respuesta5);
		result.put("HorarioIni",respuesta6);
		result.put("HorarioFin",respuesta7);
		result.put("EndPointDatosMora",respuesta8);
		result.put("EndPointTokenValidaTarjeta",respuesta9);
		result.put("EndPointValidaClave",respuesta10);
		result.put("EndPointFacturacion",respuesta11);
		result.put("EndPointObtieneEWT",respuesta12);
		result.put("EndPointSMSWhatsapp",respuesta13);
		result.put("EndPointHSMWhatsapp",respuesta14);
		result.put("EndPointActualizaSesion",respuesta15);
		result.put("EndPointOfertaClientes",respuesta16);
		result.put("numeroHorasMoviles", numeroHorasMoviles);
		result.put("numeroLlamadasANIDesconectar", numeroLlamadasANIDesconectar);
		result.put("numeroLlamadasRUTDesconectar", numeroLlamadasRUTDesconectar);
		
		result.put("SendMailFree_emlFrom", SendMailFree_emlFrom);
		result.put("SendMailFree_emlTo", SendMailFree_emlTo);
		result.put("SendMailFree_emlSubject", SendMailFree_emlSubject);
		result.put("SendMailFree_emlBody", SendMailFree_emlBody);
		result.put("SendMailFree_srvIp", SendMailFree_srvIp);
		result.put("SendMailFree_srvPort", SendMailFree_srvPort);
		result.put("SendMailFree_srvSsl", SendMailFree_srvSsl);
		result.put("SendMailFree_srvUser", SendMailFree_srvUser);
		result.put("SendMailFree_srvPassw", SendMailFree_srvPassw);
		
		
		
		} catch (Exception e) {
            System.out.println("ERROR "+ e.getMessage());
            log.info("ERROR "+ e.getMessage());
	      e.printStackTrace();
	    } 
		
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
    // result.put("OutParam", "Value");
    System.out.println("FIN Utils[GetParamConfig]");
    
    return result;
    
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>