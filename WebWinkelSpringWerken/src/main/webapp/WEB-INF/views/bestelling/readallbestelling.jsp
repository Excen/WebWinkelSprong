<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : readallartikel
    Created on : 15-sep-2016, 11:10:24
    Author     : Excen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aanwezige Bestellingen</title>
    </head>
    <body>
       <div align = "center">
           <h1>Bestellinglijst</h1>    
           <table>
                <th>Bestelling ID   </th>
                <th>Klant Id   </th>
                <th>Bestelling Datum   </th>
                <th>Factuur ID   </th>

                 <c:forEach var="bestelling" items="${bestellinglijst}" varStatus="status">
                <tr>
                    
                    
                    <td>${bestelling.id}</td>
                    <td>${bestelling.klant.id}</td>
                    <td>${bestelling.bestellingDatum}</td>  
                    <td>${bestelling.factuur.id}</td>
                <td><a href="<c:url value='/bestelling/readbestelling-${bestelling.id}' />">bestelling info</a></td>
                <td><a href="<c:url value='/bestelling/updatebestelling-${bestelling.id}' />">bestelling wijzigen</a></td>
                <td><a href="<c:url value='/bestelling/deletebestelling-${bestelling.id}' />">bestelling verwijderen</a></td>
                </tr>
                </c:forEach>
                
           </table>
           <br/>
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        </div>
    </body>
</html>
