/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: JspCServletContext/1.0
 * Generated at: 2019-05-31 22:30:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.src;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.*;
import javax.net.ssl.HttpsURLConnection;
import java.security.cert.CertificateException;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.security.cert.X509Certificate;
import org.json.JSONObject;
import org.json.JSONException;
import java.util.Map;
import org.json.JSONObject;
import com.genesyslab.studio.backendlogic.GVPHttpRequestProcessor;
import java.util.Map;

public final class CrearSesionCRM_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
    System.out.println("\nINICIO WS[CrearSesionCRM]");
    // Example:
    // Note that "Param1" is the parameter name of the input parameter.
    // String param = additionalParams.get("Param1");
    
    JSONObject result = new JSONObject();
	try {
    
    
		String param1 = additionalParams.get("ParamURL");
		String param2 = additionalParams.get("ParamHdr");
		String param3 = additionalParams.get("ParamHdr2");
		String param4 = additionalParams.get("ParamHdr3");

		System.out.println("WS[CrearSesionCRM]> Recibiendo URL 'param1' : " + param1);
		System.out.println("WS[CrearSesionCRM]> Recibiendo Header 1 'param2' : " + param2);
		System.out.println("WS[CrearSesionCRM]> Recibiendo Header 2 'param3' : " + param3);
		System.out.println("WS[CrearSesionCRM]> Recibiendo Header 3 'param4' : " + param4);
		
		TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
			public java.security.cert.X509Certificate[] getAcceptedIssuers() { return null; }
			public void checkClientTrusted(X509Certificate[] certs, String authType) { }
			public void checkServerTrusted(X509Certificate[] certs, String authType) { }
			@Override
			public void checkClientTrusted(java.security.cert.X509Certificate[] arg0, String arg1)
				throws CertificateException {
				// TODO Auto-generated method stub
				}
			@Override
			public void checkServerTrusted(java.security.cert.X509Certificate[] chain, String authType)
				throws CertificateException {
				// TODO Auto-generated method stub	
				}
		} };

	    SSLContext sc = SSLContext.getInstance("SSL");
	    sc.init(null, trustAllCerts, new java.security.SecureRandom());
	    HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

	    // Create all-trusting host name verifier
	    HostnameVerifier allHostsValid = new HostnameVerifier() {
	        public boolean verify(String hostname, SSLSession session) { return true; }
	    };
	    // Install the all-trusting host verifier
	    HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
		
	    String url = param1;
		URL obj = new URL(url);
			
		Proxy proxy = new  Proxy(Proxy.Type.HTTP,new InetSocketAddress("192.168.83.249",8080));
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection(proxy);
		
		//add request header
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", param2);
		con.setRequestProperty("Content-Type", "application/json");
		con.setRequestProperty("X-Request-ID", param4);
		con.setRequestProperty("api_key", "123");
		con.setRequestProperty("cache-control", "no-cache");
		con.setRequestProperty("x-Rol-principal", "ejecutivo");
		con.setRequestProperty("x-canal-id", "520");
		con.setRequestProperty("x-cliente-id", param3);
		con.setRequestProperty("x-ip", "127.0.0.1");

		String urlParameters = "{\"autorizado\": \"string\"}";

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		System.out.println("WS[CrearSesionCRM]> Sending 'POST' request to URL : " + url);
		System.out.println("WS[CrearSesionCRM]> Sending HEADER Authorization : " + param2);
		System.out.println("WS[CrearSesionCRM]> Sending HEADER x-cliente-id : " + param3);
		System.out.println("WS[CrearSesionCRM]> Sending HEADER X-Request-ID : " + param4);
		System.out.println("WS[CrearSesionCRM]> Sending JSON : " + urlParameters);
		System.out.println("WS[CrearSesionCRM]> Response Code : " + responseCode);
		result.put("ParamHttpCode",responseCode);

		BufferedReader in = new BufferedReader(
        new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			//print result
			//parser con JSONObject
			JSONObject resultLocal = new JSONObject(response.toString());
			System.out.println("WS[CrearSesionCRM]> resultLocal.id_sesion: " + resultLocal.get("id_sesion").toString());
			
			
			System.out.println("WS[CrearSesionCRM]> Response JSON: " + response.toString());
			result.put("ParamResult",response.toString());
			result.put("ParamIdSesion",resultLocal.get("id_sesion").toString());

	} catch (Exception e) {
            System.out.println("WS[CrearSesionCRM]> ERROR: "+ e.getMessage());
	      e.printStackTrace();
	} 
    
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
	System.out.println("WS[CrearSesionCRM]> Out ParamHttpCode : " + result.get("ParamHttpCode").toString());
    System.out.println("FIN WS[CrearSesionCRM]");
    
    return result;
    
};

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/src/../include/backend.jspf", Long.valueOf(1559338499267L));
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

      out.write("\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n");
      out.write('\r');
      out.write('\n');
      out.write(" \r\n\r\n\r\n\r\n");
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
