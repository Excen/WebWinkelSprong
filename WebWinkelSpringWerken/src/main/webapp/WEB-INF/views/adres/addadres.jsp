<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : addadres
    Created on : 17-sep-2016, 15:31:16
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <h3>Adres gegevens</h3>
       <form method = "POST">
           <c:choose>
               <c:when test = "${edit}">
            Straatnaam <input type = "text" name = "straatnaam" value = "${adres.straatnaam}"/>  <br/>
            Huisnummer <input type = "text" name = "huisnummer" value = "${adres.huisnummer}"/> <br/>
            Toevoeging <input type = "text" name = "toevoeging" value = "${adres.toevoeging}"/><br/>
            Postcode  <input type = "text" name = "postcode"  value = "${adres.postcode}"/><br/>
            Woonplaats <input type = "text" name = "woonplaats"  value = "${adres.woonplaats}"/><br/>
            AdresType <input type = "text" name = "adrestype"  value = "${adres.adresType}"/><br/>
            
            <input type = "submit" value = "opslaan"/> | 
            <a href="<c:url value='/adres/readalladres' />">Annuleer</a>
            
                </c:when>
                <c:otherwise>
            Straatnaam <input type = "text" name = "straatnaam" /> <br/>
            Huisnummer <input type = "text" name = "huisnummer" /> <br/>
            Toevoeging <input type = "text" name = "toevoeging" /><br/>
            Postcode  <input type = "text" name = "postcode" /><br/>
            Woonplaats <input type = "text" name = "woonplaats" /><br/>
            AdresType <input type = "text" name = "adrestype" /><br/>
            
            <input type = "submit" value = "voeg toe"/> | 
            <a href="<c:url value='/adres/readalladres' />">Annuleer</a>
                </c:otherwise>
        </c:choose>
</form> 
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
    </body>
</html>
