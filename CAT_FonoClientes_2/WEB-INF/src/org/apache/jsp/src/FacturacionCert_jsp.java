/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: JspCServletContext/1.0
 * Generated at: 2020-06-12 22:34:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.src;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import cl.sixbell.cat.ws.MainRestWS;
import cl.sixbell.cat.ws.response.*;
import org.json.JSONObject;
import org.json.JSONException;
import java.util.Map;
import org.json.JSONObject;
import com.genesyslab.studio.backendlogic.GVPHttpRequestProcessor;
import java.util.Map;

public final class FacturacionCert_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    
    // Example:
    // Note that "Param1" is the parameter name of the input parameter.
    // String param = additionalParams.get("Param1");
	
	System.out.println("INICIO WS[FacturacionCert]");
    
    JSONObject result = new JSONObject();
	
	try {
		String callid = additionalParams.get("CallID");
		String token = additionalParams.get("Token");
		String url = additionalParams.get("URL");
		String idCuenta = additionalParams.get("idCuenta");
		
		result.put("id","-1");
		result.put("mes","-1");
		result.put("anio","-1");
		result.put("fechaDesde","-1");
		result.put("fechaHasta","-1");
		result.put("fechaVencimiento","-1");
		result.put("montoFacturado","-1");
		result.put("pagoMinimo","-1");
		result.put("montoPagado","-1");
		result.put("montoAdeudado","-1");
		result.put("deudaTotal","-1");
		result.put("HttpCode","-1");
		
		System.out.println("WS[FacturacionCert]> CallID: " + callid + ", URL: " + url + ", Token: " + token + " idCuenta: " + idCuenta);
		
		MainRestWS clientWS = new MainRestWS(callid);
		
		FacturacionResponse respuestaFacturacion = clientWS.ObtieneFactura(token, Integer.parseInt(idCuenta), url);
		System.out.println("WS[FacturacionCert] Saliendo con : ");
		System.out.println("WS[FacturacionCert] Id : " + respuestaFacturacion.getId());			
		System.out.println("WS[FacturacionCert] Mes : " + respuestaFacturacion.getMes());
		System.out.println("WS[FacturacionCert] Anio : " + respuestaFacturacion.getAnio());
		System.out.println("WS[FacturacionCert] Fecha Desde : " + respuestaFacturacion.getFechaDesde());
		System.out.println("WS[FacturacionCert] Fecha Hasta : " + respuestaFacturacion.getFechaHasta());
		System.out.println("WS[FacturacionCert] Fecha de Vencimiento : " + respuestaFacturacion.getFechaVencimiento());
		System.out.println("WS[FacturacionCert] Monto Facturado : " + respuestaFacturacion.getMontoFacturado());
		System.out.println("WS[FacturacionCert] Pago Minimo : " + respuestaFacturacion.getPagoMinimo());
		System.out.println("WS[FacturacionCert] Monto Pagado : " + respuestaFacturacion.getMontoPagado());
		System.out.println("WS[FacturacionCert] Monto Adeudado : " + respuestaFacturacion.getMontoAdeudado());
		System.out.println("WS[FacturacionCert] Deuda Total : " + respuestaFacturacion.getDeudaTotal());
		System.out.println("WS[FacturacionCert] HTTPCode : " + respuestaFacturacion.getHTTPCode());

		
		
		//result.put("id",respuestaFacturacion.getId());
		//result.put("mes",respuestaFacturacion.getMes());
		//result.put("anio",respuestaFacturacion.getAnio());
		//result.put("fechaDesde",respuestaFacturacion.getFechaDesde());
		//result.put("fechaHasta",respuestaFacturacion.getFechaHasta());
		result.put("fechaVencimiento",respuestaFacturacion.getFechaVencimiento());
		result.put("montoFacturado",respuestaFacturacion.getMontoFacturado());
		result.put("pagoMinimo",respuestaFacturacion.getPagoMinimo());
		//result.put("montoPagado",respuestaFacturacion.getMontoPagado());
		result.put("montoAdeudado",respuestaFacturacion.getMontoAdeudado());
		result.put("deudaTotal",respuestaFacturacion.getDeudaTotal());
		result.put("HttpCode",respuestaFacturacion.getHTTPCode());
		} catch (Exception e) {
            System.out.println("ERROR "+ e.getMessage());
	      e.printStackTrace();
	    } 
		
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
    // result.put("OutParam", "Value");
	System.out.println("WS[FacturacionCert]> Out HttpCode : " + result.get("HttpCode").toString());
    System.out.println("FIN WS[FacturacionCert]");
    
    return result;
    
};

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/src/../include/backend.jspf", Long.valueOf(1559349299267L));
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

      out.write("\r\n\r\n\r\n");
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
