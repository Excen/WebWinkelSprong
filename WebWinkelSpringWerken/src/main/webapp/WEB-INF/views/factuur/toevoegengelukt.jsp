<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <div  align="center">
        <h1>Factuur succesvol toegevoegd</h1>
        <h3>${success}</h3>
        
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <table>    
            <th>Artikel</th>
            <th>Aantal</th>
            
           
            
           
            <c:forEach var="bestellingArtikel" items="${bestelartikelset}" varStatus = "status">
             <tr>
                 <td>${bestellingArtikel.artikel.artikelNaam}</td>
                <td>${bestellingArtikel.artikelAantal}</td>    
             </tr> 
            </c:forEach>
          
            <%--c:forEach var="betaling" items ="${betalingset}" varStatus = "status">
            
                <td>${betaling.betaaldatum}</td>
                <td>${betaling.betaalwijze}</td>
                   
            </c:forEach--%>  
              
           
        </table>    
       
            <h3>Factuurbedrag</h3>
                <h3><fmt:setLocale value='de-DE' />
                    <fmt:formatNumber type="currency" maxFractionDigits='2' minFractionDigits="2" currencySymbol="€" value="${factuurbedrag}" />
                    </h3>
          
            
          
        <br/>
        <br/>
         Ga naar <a href="<c:url value='/factuur/readallfactuur' />"> Facturen in bestand</a>
         Ga naar <a href="<c:url value ="/factuur/homefactuur"/> "> Startpagina factuur</a><br/>
         Ga naar <a href="<c:url value ="/home"/> "> HOME</a>

         
         </div>
    </body>
</html>
