<%-- 
    Document   : tabela-price
    Created on : 29 de mar. de 2021, 15:47:59
    Author     : Thiguino
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
        
        <style>
            table, th, td {
              border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <div>
       <%@include file="WEB-INF/jspf/header.jspf" %>     
    
       <%@include file="WEB-INF/jspf/menu.jspf" %> 

       <h1>Tabela Price</h1><br/>
        
        <form>
            
                    <b>Valor da divida <input type="number" name="valorDivida"></b>
                    <b>Quantidade das parcelas <input type="number" name="parcela"></b>
                    <b>Taxa <input type="number" name="juros"></b>
                   <input type="submit" name="calcular" value="Calcular">
              

            <br/><br/><br/>
            <% Locale localeBR = new Locale("pt","BR"); %>
            <% NumberFormat dinheiro = NumberFormat.getCurrencyInstance(localeBR); %>
            <% if(request.getParameter("calcular")!=null){ %>
                
                <% try{ %>
                <% int i=1; %>
                <% double valorDivida = Double.valueOf(request.getParameter("valorDivida")); %>
                <% double meses = Double.valueOf(request.getParameter("parcela")); %>
                <% double juros = Double.valueOf(request.getParameter("juros")); %>
                <% double amort = 0; %>
                <% double totalAmort = 0; %>
                <% double parc = 0; %>
                <% double totalParc = 0; %>
                <% double jurosOutput = 0; %>
                <% double totalJurosOutput = 0; %>
                <% double saldoDevedor = 0; %>
                <% double juros100 = juros/100; %>  
     
                <div>
                <table>
                    <tr>
                        <th>Qtd Parcela</th>
                        <th>Valor Parcela</th>
                        <th>Amortizações</th>
                        <th>Juros</th>
                        <th>Saldo Devedor</th>
                    </tr>
                    <tr>
                        <th>0</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th><%= dinheiro.format(valorDivida) %></th>
                    </tr>
                    <% parc = valorDivida * ((Math.pow(1+juros100, meses)) * juros100)/((Math.pow(1+juros100, meses)) - 1); %>
                    <% jurosOutput = valorDivida * juros100; %>
                    <% amort = parc - jurosOutput; %>
                    <% saldoDevedor = valorDivida - amort; %>
                        <tr>
                            <td align="center"><%= i %></td>
                            <td align="right"><%= dinheiro.format(parc) %></td>
                            <td align="right"><%= dinheiro.format(amort) %></td>
                            <td align="right"><%= dinheiro.format(jurosOutput) %></td>
                            <td align="right"><%= dinheiro.format(saldoDevedor) %></td>  
                        </tr>
                    <% totalAmort = totalAmort + amort; %>
                    <% totalJurosOutput += jurosOutput; %>
                    <% totalParc += parc; %>                    
                    <% for(i =2 ; i<=meses; i++){%>
                        <% jurosOutput = saldoDevedor*juros100; %>
                        <% amort = parc - jurosOutput; %>
                        <% saldoDevedor = saldoDevedor - amort; %>

                            <% if(i==meses){ %>
                            <% saldoDevedor = 0;%>
                            <% } %>
                            <tr>
                                <td align="center"><%= i %></td>
                                <td align="right"><%= dinheiro.format(parc) %></td>
                                <td align="right"><%= dinheiro.format(amort) %></td>
                                <td align="right"><%= dinheiro.format(jurosOutput) %></td>
                                <td align="right"><%= dinheiro.format(saldoDevedor) %></td>  
                            </tr>
                            <% totalAmort = totalAmort + amort; %>
                            <% totalJurosOutput += jurosOutput; %>
                            <% totalParc += parc; %>                            
                    <% }%>
                    <tr>
                        <td></td>
                        <td align="right"><%= dinheiro.format(totalParc) %></td>
                        <td align="right"><%= dinheiro.format(totalAmort) %></td>
                        <td align="right"><%= dinheiro.format(totalJurosOutput) %></td>
                        <td><center><b> TOTAL    </b></center></td> 
                    </tr>
                </table>
                </div>
                <br/>    
                
                <% }catch(Exception e){%>
                    <h1>Favor preencher todos os campos</h1>
                <% }%>
            <% } %>
        </form>
          </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>  
    </body>
</html>
