/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: JspCServletContext/1.0
 * Generated at: 2021-11-22 22:36:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.src;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import java.io.*;
import java.util.*;
import org.json.JSONObject;
import org.json.JSONException;
import java.util.Map;
import org.json.JSONObject;
import com.genesyslab.studio.backendlogic.GVPHttpRequestProcessor;
import java.util.Map;

public final class Logger_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/src/../include/backend.jspf", Long.valueOf(1562373580596L));
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

      out.write("\r\n\r\n\r\n\r\n\r\n");
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
