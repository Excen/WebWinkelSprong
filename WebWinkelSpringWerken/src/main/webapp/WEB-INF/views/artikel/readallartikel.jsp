<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : readallartikel
    Created on : 15-sep-2016, 11:10:24
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Alle artikelen</title>
    </head>
    <body>
       <div align = "center">
           <h1>Artikellijst</h1>    
           <table>
                <th>Artikel id</th>
                <th>Artikelnummer</th>
                <th>Artikelnaam</th>
                <th>Artikel omschrijving</th>
                <th>ArtikelPrijs</th>
                <th></th>
                <th></th>
             
                  <c:forEach var="artikel" items="${artikellijst}" varStatus="status">
                <tr>
                    <td>${artikel.id}</td>
                    <td>${artikel.artikelNummer}</td>
                    <td>${artikel.artikelNaam}</td>
                    <td>${artikel.omschrijving}</td>
                    <td>€ ${artikel.artikelPrijs}</td>
                    <td><a href="<c:url value='/artikel/updateartikel-${artikel.id}' />">wijzig</a></td>
                    <td><a href="<c:url value='/artikel/deleteartikel-${artikel.id}' />">verwijder </a></td>         
                </tr>
                </c:forEach>
                
           </table>
           <br/>
        <a href = "<c:url value = '/artikel/createartikel'/>" >Nieuw artikel toevoegen </a>
        <br/>
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        </div>
    </body>
</html>
