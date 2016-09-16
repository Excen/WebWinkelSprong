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
        <title>Alle artikelen</title>
    </head>
    <body>
       <div align = "center">
           <h1>Artikel lijst</h1>    
           <table>
               <th>Id</th>
               <th>Artikelnummer</th>
                <th>Artikelnaam</th>
                <th>Artikel omschrijving</th>
                <th>ArtikelPrijs</th>
             
                  <c:forEach var="artikel" items="${artikellijst}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${artikel.artikelnummmer}></td>
                    <td>${artikel.artikelNaam}></td>
                    <td>${artikel.omschrijving}</td>
                    <td>${artikel.artikelPrijs}</td>
                             
                </tr>
                </c:forEach>
                
              
              
           </table>
        <a href = "<c:url value = '/artikel/createartikel'/>" >Nieuw artikel toevoegen </a>
        
        <a href = "<c:url value = '/'/>"> Terug naar huis!</a>
        </div>
    </body>
</html>
