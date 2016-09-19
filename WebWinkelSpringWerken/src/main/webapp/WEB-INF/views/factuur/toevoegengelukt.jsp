<%@taglib prefix="c"uri = "http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : toevoegengelukt
    Created on : 19-sep-2016, 0:03:20
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Factuur toegevoegd</title>
    </head>
    <body>
        <h1>Factuur succesvol toegevoegd</h1>
        <div>${succes}</div>
        <div>${factuurBedrag}</div>
        <table>
            <th>Betaaldatum</th>
            <th>Betaalwijze</th>
            <c:forEach var="betaling" items ="${betalingset}" varStatus = "status">
            <tr>
                <td>${betaling.betaaldatum}</td>
                <td>${betaling.betaalwijze}</td>
            </tr>        
            </c:forEach>
            
        </table>    
        <br/>
        <br/>
         Ga naar <a href="<c:url value='/factuur/readallfactuur' />"> Facturen in bestand</a>
         Ga naar <a href="<c:url value ="/factuur/homefactuur"/> "> Startpagina factuur</a>
    </body>
</html>
