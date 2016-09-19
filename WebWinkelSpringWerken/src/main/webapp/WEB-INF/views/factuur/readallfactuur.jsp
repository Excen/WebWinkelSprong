<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : readallfactuur
    Created on : 18-sep-2016, 23:19:02
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Alle facturen</title>
    </head>
    <body>
        <h1>Factuurlijst</h1>
        
        
        <table>
                <th>Id</th>
                <th>Factuurnummer</th>
                <th>Factuurdatum</th>
                <th></th>
                <th></th>
                <th></th>
             
                <c:forEach var="factuur" items="${factuurlijst}" varStatus="status">
                <tr>
                    <td><c:out value ="${factuur.id}"/></td>
                    <td><c:out value = "${factuur.factuurnummer}"/>></td>
                    <td><c:out value = "${factuur.factuurdatum}"/>></td>  
                    <td><a href="<c:url value='/factuur/updatefactuur-${factuur.id}' />">wijzig</a></td>
                    <td><a href="<c:url value='/factuur/deletefactuur-${factuur.id}' />">verwijder </a></td>     
                    <td><a href=" "<c:url value="/factuur/readfactuur-${factuur.id}" />>gegevens inzien</a></td>
                </tr>
                </c:forEach>
                
          </table>
           <br/>
        <a href = "<c:url value = '/factuur/createfactuur'/>" >Nieuwe factuur toevoegen </a>
        <br/>
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        
        
        
    </body>
</html>
