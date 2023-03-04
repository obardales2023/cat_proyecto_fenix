<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="cl.sixbell.cat.ws.MainRestWS" %>
<%@page import="cl.sixbell.cat.ws.response.GetTokenResponse" %>
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
    
    JSONObject result = new JSONObject();
	
	try {
		System.out.println("INICIO WS[GetToken]");
		
		String callid = additionalParams.get("CallID");
		String url = additionalParams.get("URL");
		
		result.put("HttpCode","-1");
		result.put("Token","-1");
		
		System.out.println("WS[GetToken]> CallID: " + callid + ", URL: " + url);
		MainRestWS clientWS = new MainRestWS(callid); 
		//String bodyPROD = "{\"grant_type\":\"client_credentials\",\"client_id\": \"mAjFrF8IVRzuv588zAA\",\"client_secret\": \"eNw54zbxerwZB2PG\"}";
		//String bodyUAT = "{\"grant_type\":\"client_credentials\",\"client_id\": \"mAjFrF8IVRzuv588zAA\",\"client_secret\": \"Yw3Iys0pAzPzQWa1\"}";
		String bodyUAT = "{\"grant_type\":\"client_credentials\",\"client_id\": \"GNcc6CRMqpSCoCqqokj\",\"client_secret\": \"gDbRtiLizMq78zEo\"}";
		//GetTokenResponse respuestaOut = clientWS.GetToken(bodyPROD, url);
		GetTokenResponse respuestaOut = clientWS.GetToken(bodyUAT, url);

		System.out.println("WS[GetToken]> respuestaOut.getToken_type: " + respuestaOut.getToken_type());
		System.out.println("WS[GetToken]> respuestaOut.getAccess_token: " + respuestaOut.getAccess_token());
		System.out.println("WS[GetToken]> respuestaOut.getExpires_in: " + respuestaOut.getExpires_in());
		System.out.println("WS[GetToken]> respuestaOut.getHTTPCode: " + respuestaOut.getHTTPCode());
		
		result.put("HttpCode",respuestaOut.getHTTPCode());
		result.put("Token",respuestaOut.getAccess_token());
		
		} catch (Exception e) {
            System.out.println("ERROR "+ e.getMessage());
	      e.printStackTrace();
	    } 
		
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
    // result.put("OutParam", "Value");
	System.out.println("WS[GetToken]> Out HttpCode : " + result.get("HttpCode").toString());
    System.out.println("FIN WS[GetToken]");
    
    return result;
    
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>