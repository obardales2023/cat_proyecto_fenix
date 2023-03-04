<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.URI"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
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
	
	int timeoutWS = 5;
	
	String idLlamada = state.getString("CallUUID");
	//String idLlamada = "02BBUB0QVS91F00J1K52G2LAES66F2J3";
	String numMovil = state.getString("ANI");
	//String numMovil = "";
	String LoggerCallflow = "EnvioHSM";
	String LoggerMensaje = "";
	
	String _HTTPCode = "";
	String _status = "";
	String _idCanal = "";
	String _message = "";
	
	//String numero = state.getString("var_dnis");
	String numero = "";
	String endpoint = "https://api.puresocial.cx:8443/notification/send";
	
	LoggerMensaje = "Ingresando con numero = " + numero + ", Endpoint = " + endpoint + ", TimeoutWS = " + timeoutWS;
	LoggerMensaje = idLlamada + " | " + numMovil + " | " + LoggerCallflow + " | " + LoggerMensaje;
	log.info(LoggerMensaje);

	StringBuffer sbJson = new StringBuffer();
	sbJson.append("{\"channel\":\"whatsapp\" ,");
	sbJson.append("\"userID\":\"56941406249\" ,");
	sbJson.append("\"orgID\":\"cat-20e57cc2-838f-4aa8-042d-112d8c605a76\" ,");
	sbJson.append("\"type\":\"template\" ,");
	sbJson.append("\"destination\": {");
	sbJson.append("\"type\":\"recipient\" ,");
	sbJson.append("\"recipients\": [\"56" +  numMovil + "\"]},");
	sbJson.append("\"data\": {");
	sbJson.append("\"code\":\"cat_demo_hsm\" ,");
	sbJson.append("\"language\":\"es_MX\" ,");
	sbJson.append("\"metadata\": {}},");
	sbJson.append("\"origin\":\"origin\" ,");
	sbJson.append("\"context\":\"context\"}");
		
	String inJSON = sbJson.toString();
	
	LoggerMensaje = "Body: " + inJSON;
	LoggerMensaje = idLlamada + " | " + numMovil + " | " + LoggerCallflow + " | " + LoggerMensaje;
	log.info(LoggerMensaje);
	
	CloseableHttpClient httpclient = HttpClients.createDefault();		
	HttpPost httppost = new HttpPost(endpoint);        
	RequestConfig requestConfig = RequestConfig.custom()
	  .setSocketTimeout(timeoutWS*1000)
	  .setConnectTimeout(timeoutWS*1000)
	  .setConnectionRequestTimeout(timeoutWS*1000)
	  .build();		
	StringEntity requestEntity = new StringEntity(inJSON, ContentType.APPLICATION_JSON);
	CloseableHttpResponse response = null;
	String lineJSON = "";
	String line = "";

	httppost.setHeader("Content-Type", "application/json");
	httppost.setHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJvcmdJRCI6ImNhdC0yMGU1N2NjMi04MzhmLTRhYTgtMDQyZC0xMTJkOGM2MDVhNzYiLCJvcmdOYW1lIjoiY2F0IiwiaWF0IjoxNTkyMjQxOTM5fQ.01citBlrLbgJBbaYu_ljIQWvcSVbUzXVimHRk2N7ONQ");
		
	httppost.setEntity(requestEntity);    
	httppost.setConfig(requestConfig);	    

	Header[] headers = httppost.getAllHeaders();
		
		
	try {					
		response = httpclient.execute(httppost);
			
		BufferedReader rd = new BufferedReader (new InputStreamReader(response.getEntity().getContent()));
		while ((line = rd.readLine()) != null) {
			lineJSON = lineJSON + line;
		}
		LoggerMensaje = "Respuesta JSON: " + lineJSON + ", HTTP Code = " + response.getStatusLine().toString();
		LoggerMensaje = idLlamada + " | " + numMovil + " | " + LoggerCallflow + " | " + LoggerMensaje;
		log.info(LoggerMensaje);
			
        if(response.getStatusLine().getStatusCode() == 200)
		{
        	JSONObject tokenJSON;

			tokenJSON = new JSONObject(lineJSON);
			_status = tokenJSON.get("status").toString();
	    	_idCanal = tokenJSON.get("idCanal").toString();
	    	_message = tokenJSON.get("message").toString();	    	
			
			LoggerMensaje = "Valores Response - status: " + _status + ",idCanal" + _idCanal + ",_message" + _message;
			LoggerMensaje = idLlamada + " | " + numMovil + " | " + LoggerCallflow + " | " + LoggerMensaje;
			log.info(LoggerMensaje);        				
		}	
	    _HTTPCode = (Integer.toString(response.getStatusLine().getStatusCode()));	        
	} catch (ClientProtocolException e) {
		LoggerMensaje = "response.getEntity()> ClientProtocolException = " + e;		
	} catch (IOException e) {
		LoggerMensaje = "response.getEntity()> IOException = " + e;
	} catch (Exception e) {		
		LoggerMensaje = "response.getEntity()> Exception = " + e;
	}   	
	LoggerMensaje = idLlamada + " | " + numMovil + " | " + LoggerCallflow + " | " + LoggerMensaje;
	log.info(LoggerMensaje);
      

	result.put("HttpCode",_HTTPCode);
	result.put("Status",_status);
	result.put("idCanal",_idCanal);
	result.put("message",_message);
	
				
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
    // result.put("OutParam", "Value");
    
    return result;
    
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.http.Header"%>
<%@page import="org.apache.http.impl.client.CloseableHttpClient"%>
<%@page import="org.apache.http.impl.client.HttpClients"%>
<%@page import="org.apache.http.entity.ContentType"%>
<%@page import="org.apache.http.entity.StringEntity"%>
<%@page import="org.apache.http.client.ClientProtocolException"%>
<%@page import="org.apache.http.client.config.RequestConfig"%>
<%@page import="org.apache.http.client.methods.CloseableHttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpEntityEnclosingRequestBase"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.client.methods.HttpPost"%>
<%@include file="../include/backend.jspf" %>