<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.codec.DecoderException"%>
<%@page import="org.apache.commons.codec.binary.Hex"%>
<%@page import="org.apache.commons.lang.StringUtils"%>


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
    String pin = additionalParams.get("PIN");
	String pan = additionalParams.get("PAN");
	String PINBlock = "";

            try {
                  
                  String panPart = null;
                  if (pan.length() > 12)
                        panPart = pan.substring(pan.length() - 13, pan.length() - 1);
                  else
                        panPart = pan;
                  
                  String pinLenHead = StringUtils.leftPad(Integer.toString(pin.length()), 2, '0')+pin;
                  String pinData = StringUtils.rightPad(pinLenHead, 16,'F');
                  byte[] bPin = Hex.decodeHex(pinData.toCharArray());
                                   
                  String panData = StringUtils.leftPad(panPart, 16, '0');
                  byte[] bPan = Hex.decodeHex(panData.toCharArray());

                  byte[] pinblock = new byte[8];
                  for (int i = 0; i < 8; i++)
                        pinblock[i] = (byte) (bPin[i] ^ bPan[i]);

                  PINBlock = Hex.encodeHexString(pinblock).toUpperCase();
            } catch (DecoderException e) {
                  throw new RuntimeException("Hex decoder failed!",e);
            }        
        //041214DDEEDAC6AD
	
    JSONObject result = new JSONObject();
    
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
    
    // result.put("OutParam", "Value");
	result.put("OutParam", "Procesado: " + PINBlock );
    
    return result;
    
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>