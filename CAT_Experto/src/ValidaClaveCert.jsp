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
	
	System.out.println("INICIO WS[ValidaClave]");
    
    JSONObject result = new JSONObject();
	
	try {
		String callid = additionalParams.get("CallID");
		String token = additionalParams.get("Token");
		String url = additionalParams.get("URL");
		String idCliente = additionalParams.get("idCliente");
		String idTarjeta = additionalParams.get("idTarjeta");
		String clave = additionalParams.get("Clave");
		
		//callid = "01NAIGH6J09MN0LH1K52G2LAES00M7OP";
		//token = "OU7KkRatqBvy8zMklweLIqn35FOqE7mD";
		//url = "https://api.qa.rfsc.cl/api/v1.0/catconnect/claves-compras/validaciones";
		//idCliente = "2626762";
		//idTarjeta = "141300";
		//clave = "1234";
		
		result.put("HttpCode","-1");
		result.put("ResponseCode","-1");
		
		System.out.println("WS[ValidaClave]> CallID: " + callid + ", URL: " + url + ", Token: " + token);
		
		ClaveCompra clientWS = new ClaveCompra(); 
		clientWS.validar(token, idCliente, idTarjeta, clave, url);

		System.out.println("WS[ValidaClave]> getResponseCode: " + clientWS.getCodigo());
		System.out.println("WS[ValidaClave]> getResponseMessage: " + clientWS.getMensaje());
		System.out.println("WS[ValidaClave]> getHTTPCode: " + clientWS.get_HTTPCode());
		
		result.put("HttpCode",clientWS.get_HTTPCode());
		result.put("ResponseCode",clientWS.getCodigo());
		result.put("ResponseMessage",clientWS.getMensaje());
		
		
		} catch (Exception e) {
            System.out.println("ERROR "+ e.getMessage());
	      e.printStackTrace();
	    } 
		
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
    // result.put("OutParam", "Value");
	System.out.println("WS[ValidaClave]> Out HttpCode : " + result.get("HttpCode").toString());
    System.out.println("FIN WS[ValidaClave]");
    
    return result;
    
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>