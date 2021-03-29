<%-- 
    Document   : index
    Created on : 27 de mar. de 2021, 08:21:34
    Author     : Thiguino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
        <%@include file="WEB-INF/jspf/header.jspf" %> 
        </div>
        
        <div>
        <%@include file="WEB-INF/jspf/menu.jspf" %> 
        </div>
        
        <div id='tabela_price'>  <h2>Tabela Price</h2> <p>Tabela Price, também chamado de sistema francês de amortização, é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais.</p> </div>                
        
        <div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>          
        </div>
        
        <script>
             document.getElementById('tabela_price').addEventListener('click', function(event) {document.location.href = '/TabelaPricePupo/tabela-price.jsp';});
        </script>
    </body>
</html>
