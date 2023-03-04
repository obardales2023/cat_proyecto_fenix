<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>

<%@page import="java.io.BufferedReader" %>
<%@page import="java.io.DataOutputStream" %>
<%@page import="java.io.InputStreamReader" %>
<%@page import="java.net.HttpURLConnection" %>
<%@page import="java.net.URL" %>
<%@page import="java.net.*" %>
<%@page import="javax.net.ssl.HttpsURLConnection" %>

<%@page import="java.security.cert.CertificateException" %>
<%@page import="javax.net.ssl.HostnameVerifier" %>
<%@page import="javax.net.ssl.HttpsURLConnection" %>
<%@page import="javax.net.ssl.SSLContext" %>
<%@page import="javax.net.ssl.SSLSession" %>
<%@page import="javax.net.ssl.TrustManager" %>
<%@page import="javax.net.ssl.X509TrustManager" %>
<%@page import="javax.security.cert.X509Certificate" %>
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
	      System.out.println("INICIO 1");
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
	        String url = "https://apiuat.rfsc.cl/api/v1.0/sec/oauth2/token";
			URL obj = new URL(url);
			
			Proxy proxy = new  Proxy(Proxy.Type.HTTP,new InetSocketAddress("192.168.83.249",8080));
			HttpsURLConnection con = (HttpsURLConnection) obj.openConnection(proxy);

			//add request header
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json");

			String urlParameters = "{\"grant_type\":\"client_credentials\",\"client_id\": \"client_microsoft\",\"client_secret\": \"client_microsoft_secret\"}";
			
			// Send post request
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(urlParameters);
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			System.out.println("\nSending 'POST' request to URL : " + url);
			System.out.println("Post parameters : " + urlParameters);
			System.out.println("Response Code : " + responseCode);

			BufferedReader in = new BufferedReader(
			        new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			//print result
			System.out.println(response.toString());
			result.put("var_token_result",response.toString());

	    } catch (Exception e) {
            System.out.println("ERROR "+ e.getMessage());
	      e.printStackTrace();
	    } 
    
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
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>