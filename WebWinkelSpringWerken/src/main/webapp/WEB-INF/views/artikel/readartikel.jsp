<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : readartikel
    Created on : 15-sep-2016, 11:10:07
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Bekijk - ${artikel.artikelNaam}</title>
    </head>
    <body>
       
        <table>                
                <th>Artikelnummer</th>
                <th>Artikelnaam</th>               
                <th>ArtikelPrijs</th>
                <th>Omschrijving</th>
                <th></th>
                <th></th>
                
             
                 
                <tr>                    
                    <td>${artikel.artikelNummer}</td>
                    <td>${artikel.artikelNaam}</td>                    
                    <td><fmt:setLocale value='de-DE' />
                    <fmt:formatNumber type="currency" maxFractionDigits='2' minFractionDigits="2" currencySymbol="€" value="${artikel.artikelPrijs}" />
                    </td>
                    <td>${artikel.omschrijving}</td>
                    
                    
                    
                    <td><a href="<c:url value='#' />">aantal</a></td>
                    <td><a href="<c:url value='/bestelling/artikelinbestelling-${artikel.id}-${artikelAantal}' />">In winkelmandje</a></td>
                    
                    
                    
                </tr>
               
        
        
    </body>
</html>
