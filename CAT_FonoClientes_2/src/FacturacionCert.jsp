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
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>