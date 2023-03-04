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
	
	System.out.println("INICIO WS[EnvioNotificacionPureSocial]");
    
    JSONObject result = new JSONObject();
	
	try {
		String callid = additionalParams.get("CallID");
		String url = additionalParams.get("URL");
		String ANI = additionalParams.get("ANI");

		
		result.put("HttpCode","-1");
		result.put("Status","None");
		result.put("idCanal","None");		
		result.put("message","None");
		
		System.out.println("WS[EnvioNotificacionPureSocial]> CallID: " + callid + ", URL: " + url + ", ANI: " + ANI);
		EnvioNotificacionPureSocial envio = new EnvioNotificacionPureSocial(); 
		envio.enviarNotificacion(ANI, url);
		
		System.out.println("WS[EnvioNotificacionPureSocial]> HTTPCode: " + envio.get_HTTPCode());
		System.out.println("WS[EnvioNotificacionPureSocial]> Status: " + envio.getStatus());
		System.out.println("WS[EnvioNotificacionPureSocial]> InsertId: " + envio.getIdCanal());
		System.out.println("WS[EnvioNotificacionPureSocial]> MsgId: " + envio.getMessage());

		
		result.put("HttpCode",envio.get_HTTPCode());
		result.put("Status",envio.getStatus());
		result.put("idCanal",envio.getIdCanal());
		result.put("message",envio.getMessage());

		
		} catch (Exception e) {
            System.out.println("WS[EnvioNotificacionPureSocial]> ERROR "+ e.getMessage());
	      e.printStackTrace();
	    } 
		
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
    // result.put("OutParam", "Value");
	System.out.println("WS[EnvioNotificacionPureSocial]> Out HttpCode : " + result.get("HttpCode").toString());
    System.out.println("FIN WS[EnvioNotificacionPureSocial]");
    
    return result;
    
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>