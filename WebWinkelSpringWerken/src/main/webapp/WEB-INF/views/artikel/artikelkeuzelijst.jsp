<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : artikelkeuzelijst
    Created on : 21-sep-2016, 17:30:31
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Keuzelijst artikelen</title>
    </head>
    <body>
        
         <form method="POST">
        <div align = "center">
           <h1>Keuzelijst Artikelen</h1>   
             <table>
                <th>Artikelnummer</th>
                <th>Artikelnaam</th>
                <th>ArtikelPrijs</th>
                <th>Aantal</th>
                <th></th>
                <th></th>
                <th></th>
             
               
                <c:forEach var="artikel" items="${artikellijst}" varStatus="status">
                <tr>  
                                  
                    <td>${artikel.artikelNummer}</td>
                    <td>${artikel.artikelNaam}</td>                    
                    <td><fmt:setLocale value='de-DE' />
                    <fmt:formatNumber type="currency" maxFractionDigits='2' minFractionDigits="2" currencySymbol="€" value="${artikel.artikelPrijs}" />
                    </td>
                    <td><input type="text" name = "artikelAantal" size = "3" 
                                                   value="${bestellingArtikel.artikelAantal}"/></td>
                    
                    
                    <td><a href="<c:url value='/artikel/readartikel-${artikel.id}' />"> Bekijk artikel </a></td>  
                     
                    <td><input type ="hidden" name="ArtikelId" value="${artikel.id}">
                            <input type="submit" value="Bestelling toevoegen"/> </td>
                    
             </tr> 
               </c:forEach>
                                
           </table>
        <br/>
        <a href = "<c:url value = '/bestelling/homebestelling'/>" >Terug naar start bestelling </a>
        <br/>
        <a href = "<c:url value = '/'/>"> HOME </a>
        </div>        
                          
        
       </form>
 
    </body>
</html>
