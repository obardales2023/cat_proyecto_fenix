/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: JspCServletContext/1.0
 * Generated at: 2022-11-09 18:49:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.src;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.URI;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import javax.servlet.jsp.JspWriter;
import org.json.JSONObject;
import org.json.JSONException;
import org.json.JSONArray;
import java.util.Map;
import org.apache.http.Header;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.json.JSONObject;
import com.genesyslab.studio.backendlogic.GVPHttpRequestProcessor;
import java.util.Map;

public final class SP_005fJSP_005fWhatsApp_005fEnviaHSM_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/src/../include/backend.jspf", Long.valueOf(1559356499267L));
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("application/json;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, false, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n");
      out.write('\r');
      out.write('\n');
      out.write(" \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n");
      out.write("\r\n\r\n\r\n\r\n\r\n");

response.setHeader("Cache-Control", "no-cache");

String output = null;

try {
    // process the post data
    GVPHttpRequestProcessor processor = new GVPHttpRequestProcessor(request);
    processor.parseRequest();
    
    // "state" encapsulates the state variable submitted by the VXML page
    JSONObject state = processor.getState();
    
    // additional parameters that were passed in the namelist
    Map<String, String> additionalParams = processor.getAdditionalParams();
    
    // perform the logic
    JSONObject result = performLogic(state, additionalParams);
    
	output = result.toString();
    
    out.print(output);
    
} catch (Exception e) {
    
    e.printStackTrace();
    String msg = e.getMessage();
    if (null != msg){
    	msg = msg.replace('"', '\'');
    }
	out.print("{\"errorMsg\": \"" + msg + "\"}");
	
}

    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
