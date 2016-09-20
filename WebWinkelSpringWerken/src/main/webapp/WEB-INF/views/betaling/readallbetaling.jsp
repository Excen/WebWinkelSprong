<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : readallbetaling
    Created on : 19-sep-2016, 21:53:54
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Alle betalingen</title>
    </head>
    <body>
        <div align = "center">
        <h1>Betalingen Lijst</h1>
        
        <table>
            
            <th>Betaling id</th>
            <th>Betaaldatum</th>
            <th>Factuur</th>
            <th>Betaalwijze</th>
            <th>Klant</th>
            <th>Betaalgegevens</th>
            <th></th>
            <th></th>
        
        <c:forEach var= "betaling" items="${betalinglijst}" varStatus= "status">
           
            <td>${betaling.id}</td> 
            <td>${betaling.betaaldatum}</td>
            <td>${betaling.factuur}</td>
            <td>${betaling.betaalwijze}</td>
            <td>${betaling.klant}</td>
            <td>${betaling.betalingsGegevens}</td>
            <td><a href="<c:url value='/betaling/updatebetaling-${betaling.id}' />">wijzig</a></td>
            <td><a href="<c:url value='/betaling/deletebetaling-${betaling.id}' />">verwijder </a></td>  
            
        </c:forEach>
        
        </table>
        </div>
        
    </body>
</html>
