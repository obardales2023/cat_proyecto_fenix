<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="cl.sixbell.cat.utils.LibUtils" %>
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
		System.out.println("INICIO Utils[GetParamConfig]");
		String callid = additionalParams.get("CallID");
		String dnis = additionalParams.get("DNIS");

		System.out.println("Utils[GetParamConfig]> CallID: " + callid + ", dnis: " + dnis);
		LibUtils utilsWS = new LibUtils(callid);
				
		String respuesta1 = utilsWS.GetParamConfig(dnis,"EndPointGetToken");
		System.out.println("Utils[GetParamConfig]> EndPointGetToken: " + respuesta1);
		
		String respuesta2 = utilsWS.GetParamConfig(dnis,"EndPointDatosCliente");
		System.out.println("Utils[GetParamConfig]> EndPointDatosCliente: " + respuesta2);
		
		String respuesta3 = utilsWS.GetParamConfig(dnis,"EndPointCrearSesionCRM");
		System.out.println("Utils[GetParamConfig]> EndPointCrearSesionCRM: " + respuesta3);
		
		String respuesta4 = utilsWS.GetParamConfig(dnis,"EndPointCerrarSesionCRM");
		System.out.println("Utils[GetParamConfig]> EndPointCerrarSesionCRM: " + respuesta4);
		
		String respuesta5 = utilsWS.GetParamConfig(dnis,"EndPointConsultaActivos");
		System.out.println("Utils[GetParamConfig]> EndPointConsultaActivos: " + respuesta5);
		
		String respuesta6 = utilsWS.GetParamConfig(dnis,"EndPointTokenValidaTarjeta");
		System.out.println("Utils[GetParamConfig]> EndPointTokenValidaTarjeta: " + respuesta6);
		
		String respuesta7 = utilsWS.GetParamConfig(dnis,"EndPointValidaClave");
		System.out.println("Utils[GetParamConfig]> EndPointValidaClave: " + respuesta7);
		
		String respuesta8 = LibUtils.GetParamConfig(dnis,"EndPointActualizaSesion");
		System.out.println("Utils[GetParamConfig]> EndPointActualizaSesion: " + respuesta8);
		
		String respuesta9 = LibUtils.GetParamConfig(dnis,"EndPointOfertaClientes");
		System.out.println("Utils[GetParamConfig]> EndPointOfertaClientes: " + respuesta9);		
		
		result.put("EndPointGetToken",respuesta1);
		result.put("EndPointDatosCliente",respuesta2);
		result.put("EndPointCrearSesionCRM",respuesta3);		
		result.put("EndPointCerrarSesionCRM",respuesta4);
		result.put("EndPointConsultaActivos",respuesta5);
		result.put("EndPointTokenValidaTarjeta",respuesta6);
		result.put("EndPointValidaClave",respuesta7);
		result.put("EndPointActualizaSesion",respuesta8);
		result.put("EndPointOfertaClientes",respuesta9);	
		
		} catch (Exception e) {
            System.out.println("ERROR "+ e.getMessage());
	      e.printStackTrace();
	    } 
		
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
    // result.put("OutParam", "Value");
    System.out.println("FIN Utils[GetParamConfig]");
    
    return result;
    
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>