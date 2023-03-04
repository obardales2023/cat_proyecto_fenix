<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="cl.sixbell.cat.ws.MainRestWS" %>
<%@page import="cl.sixbell.cat.ws.response.*" %>
<%!
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
	
	System.out.println("INICIO WS[ConsultaActivosCert]");
    
    JSONObject result = new JSONObject();
	
	try {
		String callid = additionalParams.get("CallID");
		String token = additionalParams.get("Token");
		String url = additionalParams.get("URL");
		String sesionId = additionalParams.get("sesion_id");
		String ultimosDigitos = additionalParams.get("ultimosDigitos");
		String idCliente = additionalParams.get("idCliente");
		
		url = url + idCliente;
		
		

		
		result.put("HttpCode","-1");
		result.put("idCliente","-1");
		
		
		System.out.println("WS[ConsultaActivosCert]> CallID: " + callid + ", URL: " + url + ", Token: " + token + ", SesionId: " + sesionId + " ultimosDigitos: " + ultimosDigitos);
		
		Activos clientWS = new Activos(); 
		clientWS.ConsultaActivos(token, ultimosDigitos, sesionId, "280", url);
		
		
		System.out.println("WS[ConsultaActivosCert]> getHTTPCode: " + clientWS.get_HTTPCode());
		System.out.println("WS[ConsultaActivosCert]> getIdTarjeta: " + clientWS.getIdTarjeta());
		System.out.println("WS[ConsultaActivosCert]> getMora: " + clientWS.getMora());
		System.out.println("WS[ConsultaActivosCert]> getVigencia: " + clientWS.getVigencia());
		System.out.println("WS[ConsultaActivosCert]> getSaldoPendiente: " + clientWS.getSaldoPendiente());
		System.out.println("WS[ConsultaActivosCert]> getDisponibleAvanceEfectivo: " + clientWS.getDisponibleAvanceEfectivo());
		
		
		result.put("HttpCode",clientWS.get_HTTPCode());
		result.put("idTarjeta",clientWS.getIdTarjeta());
		result.put("mora",clientWS.getMora());
		result.put("vigencia",clientWS.getVigencia());
		result.put("saldoPendiente",clientWS.getSaldoPendiente());
		result.put("cupoDisponibleAvanceEfectivo",clientWS.getDisponibleAvanceEfectivo());
		
		
		} catch (Exception e) {
            System.out.println("ERROR "+ e.getMessage());
	      e.printStackTrace();
	    } 
		
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
    // result.put("OutParam", "Value");
	System.out.println("WS[ConsultaActivosCert]> Out HttpCode : " + result.get("HttpCode").toString());
    System.out.println("FIN WS[ConsultaActivosCert]");
    
    return result;
    
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>