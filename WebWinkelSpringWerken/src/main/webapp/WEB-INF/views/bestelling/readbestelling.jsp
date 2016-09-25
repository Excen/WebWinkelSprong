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
        
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestelling</title>
    </head>
    <body>
       <div align = "center"> 
           <table>
                <th>Bestelling ID   </th>
                <th>Klant Id   </th>
                <th>Bestelling Datum   </th>
                <th>Aanwezige Artikellen </th>
                <th>Factuur ID   </th>
                <tr>
                    <td>${bestelling.id}</td>
                    <td>${bestelling.klant.id}</td>
                    <td>${bestelling.bestellingDatum}</td> 
                    <td><c:forEach var="bestellingartikel" items="${bestellingartikellijst}">
                            <c:out value='${bestellingartikel.artikel.artikelNaam} 
                                           ${bestellingartikel.artikelAantal}: keer'>
                            </c:out></c:forEach></td>
                    <td>${bestelling.factuur.id}</td>
                     
                </tr>
                
           </table>
           <br/>
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        </div>
    </body>
</html>




