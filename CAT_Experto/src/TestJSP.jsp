
<%@ page import="org.apache.commons.codec.DecoderException" %>
<%@ page import="org.apache.commons.codec.binary.Hex" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%!
// Implement this method to execute some server-side logic.

public JSONObject performLogic(JSONObject state, Map<String, String> additionalParams) throws Exception {
    /**
      * Decode pinblock format 0 (ISO 9564)
      * @param pin pin 
       * @param pan primary account number (PAN/CLN/CardNumber)
      * @return pinblock in HEX format
      */
public String format0Encode(String pin, String pan) {
            try {
                  final String pinLenHead = StringUtils.leftPad(Integer.toString(pin.length()), 2, '0')+pin;
                  final String pinData = StringUtils.rightPad(pinLenHead, 16,'F');
                  final byte[] bPin = Hex.decodeHex(pinData.toCharArray());
                  final String panPart = extractPanAccountNumberPart(pan);
                  final String panData = StringUtils.leftPad(panPart, 16, '0');
                  final byte[] bPan = Hex.decodeHex(panData.toCharArray());

                  final byte[] pinblock = new byte[8];
                  for (int i = 0; i < 8; i++)
                        pinblock[i] = (byte) (bPin[i] ^ bPan[i]);

                  return Hex.encodeHexString(pinblock).toUpperCase();
            } catch (DecoderException e) {
                  throw new RuntimeException("Hex decoder failed!",e);
            }
      };
      
      /**
      * @param accountNumber PAN - primary account number
      * @return extract right-most 12 digits of the primary account number (PAN)
      */
      public String extractPanAccountNumberPart(String accountNumber) {
            String accountNumberPart = null;
            if (accountNumber.length() > 12)
                  accountNumberPart = accountNumber.substring(accountNumber.length() - 13, accountNumber.length() - 1);
            else
                  accountNumberPart = accountNumber;
            return accountNumberPart;
      };
      
      /**
      * decode pinblock format 0 - ISO 9564
      * @param pinblock pinblock in format 0 - ISO 9564 in HEX format 
       * @param pan primary account number (PAN/CLN/CardNumber)
      * @return clean PIN
      */
      public String format0decode(String pinblock, String pan) {
            try {
                  final String panPart = extractPanAccountNumberPart(pan);
                  final String panData = StringUtils.leftPad(panPart, 16, '0');
                  final byte[] bPan = Hex.decodeHex(panData.toCharArray());
                  
                  final byte[] bPinBlock = Hex.decodeHex(pinblock.toCharArray());
                  
                  final byte[] bPin  = new byte[8];
                  for (int i = 0; i < 8; i++)
                        bPin[i] = (byte) (bPinBlock[i] ^ bPan[i]);
                  
                  final String pinData = Hex.encodeHexString(bPin);
                  final int pinLen = Integer.parseInt(pinData.substring(0, 2));
                  return pinData.substring(2,2+pinLen);
            } catch (NumberFormatException e) {
                  throw new RuntimeException("Invalid pinblock format!");
            } catch (DecoderException e) {
                  throw new RuntimeException("Hex decoder failed!",e);
            }
      };
    
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
    String param = additionalParams.get("Param1");
    
    JSONObject result = new JSONObject();
    
    // Finally, this method must return a result object.  Any values stored in 
    // this result object will be reassigned to output parameters defined in the voice application.
    // For example, if the voice application declares an output parameter called "OutParam",
    // the output parameter will get the value "Value".
	
	String getPanAccountNumberPart = extractPanAccountNumberPart("6152803126446467");
	//String getPanAccountNumberPart = utilsSXB.extractPanAccountNumberPart("6152803126446467");
	
	//String Salida = format0Encode(String pin, String pan);
    
    //result.put("OutParam", "Value");
    result.put("OutParam", param + "Procesada: " + getPanAccountNumberPart);
    
    return result;
    
};

%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>