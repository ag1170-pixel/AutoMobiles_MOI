<%

String month= request.getParameter("m");
String rate=request.getParameter("r");
String amt=    request.getParameter("amt");    

%>

<script language="JavaScript">
    
    
    
function get_round(X) { return Math.round(X*100)/100 }
function showpay() {
 if ((document.calc.loan.value == null || document.calc.loan.value.length == 0) ||
     (document.calc.months.value == null || document.calc.months.value.length == 0)
||
     (document.calc.rate.value == null || document.calc.rate.value.length == 0))
 { document.calc.pay.value = "Incomplete data";
document.calc.tot_amount.value = "Incomplete data";
document.calc.tot_interest.value = "Incomplete data";
document.calc.yearly_interest.value = "Incomplete data";
document.calc.interest_pa.value = "Incomplete data";
document.calc.interest_pm.value = "Incomplete data";
 }
 else
 {
 var princ = document.calc.loan.value;
 var term  = document.calc.months.value;
 var intr   = document.calc.rate.value / 1200;
 var yrs   = document.calc.months.value / 12;
 document.calc.pay.value = get_round(princ * intr / (1 - (Math.pow(1/(1 + intr), term))));
 document.calc.tot_amount.value = get_round(document.calc.pay.value * term);
 document.calc.tot_interest.value = get_round(document.calc.tot_amount.value - princ);
 document.calc.yearly_interest.value = get_round(document.calc.tot_interest.value / yrs);
 document.calc.interest_pa.value = get_round(document.calc.yearly_interest.value / princ * 100);
 document.calc.interest_pm.value = get_round((document.calc.yearly_interest.value / princ * 100)/12);
 }
}
                </script>
                
                <table width="400" border="0" align="left" style="border:1px solid #0777c4; ">
                     <tr>
                        <td bgcolor="#001eb0" colspan="2" align="center" height="30" valign="middle">
                        
                                <font color="white" size="2">  EMI Calculator</font>
                            </td>
                    </tr>
                    <form method="post" name="calc" id="calc">
                    <tr>
                        <td class="bodyarial11">
                            <p align="left">Loan Amount<font color="#FF0000">*</font></p>
                            
                        </td>
                        <td align="right" ><input
                                type="text" name="loan"
                            size="10" value="<%=amt%>" /></td>
                    </tr>
                    <tr>
                        <td class="bodyarial11">
                            <p align="left">Loan Tenure (Months)<font color="#FF0000" face="Verdana" size="2">*</font></p>
                        </td>
                        <td
                            align="right"><input type="text"
                                             name="months" size="10"  value="<%=month%>"/></td>
                        
                    </tr>
                    <tr>
                        <td class="bodyarial11">
                            <p align="left">Interest Rate (Reducing)<font color="#FF0000" face="Verdana" size="2">*</font></p>
                        </td>
                        <td align="right" ><input
                                type="text" name="rate"
                            size="10"  value="<%=rate%>"/></td>
                    </tr>
                    <tr>
                        
                        <td class="bodyarial11" > 
                            <p align="left"> Monthly Payment (EMI)</p>
                        </td>
                        <td
                            align="right"><p align="center">
                                <input name="button" type="button" class="bluebutton" onclick='showpay()'
                                       value="Calculate" />
                                &nbsp;<input name="reset" type="reset" class="bluebutton"
                                             value="Reset" />
                        </p></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" ><div align="center">
                            
                            <p>&nbsp;</p>
                            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="80%" id="AutoNumber3">
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" ><em style="font-style: normal">Calculated Monthly EMI</em> </td>
                                    <td
                                        align="right" ><input
                                        type="text" name="pay" size="12" /></td>
                                </tr>
                                
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" > Total Amount with Interest</td>
                                    <td
                                        align="right" ><input
                                        type="text" name="tot_amount" size="12" /></td>
                                </tr>
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" ><em style="font-style: normal">Flat Interest Rate PA</em></td>
                                    <td
                                        align="right" width="109"><input
                                        type="text" name="interest_pa" size="12" /></td>
                                    
                                </tr>
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" ><em style="font-style: normal">Flat Interest Rate PM</em></td>
                                    <td
                                        align="right" ><input
                                        type="text" name="interest_pm" size="12" /></td>
                                </tr>
                                <tr>
                                    <td
                                    align="right" class="bodyarial11" ><em style="font-style: normal">Total Interest Amount</em> </font> </td>
                                    
                                    <td
                                        align="right" width="109"><input
                                            type="text" name="tot_interest" size="12" />
                                    </font></td>
                                </tr>
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" ><em style="font-style: normal">Yearly Interest Amount</em></td>
                                    <td
                                        align="right" ><input
                                        type="text" name="yearly_interest" size="12" /></td>
                                    
                                </tr>
                        </table> </td>
                    </tr>
                </table>  