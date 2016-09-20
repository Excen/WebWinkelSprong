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
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Adres gegevens</title>
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
             Adres type <select name="adresType" >                
                    <c:forEach items="${enumValues}" var="adresType" varStatus = "status">
                            <option value="${adresType}" label="--Maak uw keuze">                                
                                <c:out value="${adresType}"></c:out>
                            </option>
                    </c:forEach>
            </select>
            <input type = "submit" value = "opslaan"/> || 
            <a href="<c:url value='/adres/readalladres' />">Annuleer</a> || 
            
            <a href = "<c:url value = "/adres/addklanttoadres-${adres.id}"/>">voeg klant toe</a>
             
                </c:when>
                <c:otherwise>
            Straatnaam <input type = "text" name = "straatnaam" /> <br/>
            Huisnummer <input type = "text" name = "huisnummer" /> <br/>
            Toevoeging <input type = "text" name = "toevoeging" /><br/>
            Postcode  <input type = "text" name = "postcode" /><br/>
            Woonplaats <input type = "text" name = "woonplaats" /><br/>
            Adres type <select name= "adresType">
                    <c:forEach items="${enumValues}" var="adresType" varStatus="status">
                            <option value="${adresType}" label="--Maak uw keuze">                                
                                <c:out value="${adresType}"/>
                            </option>
                    </c:forEach>
                            
            </select>
            <input type = "submit" value = "voeg toe"/> | 
            <a href="<c:url value='/adres/readalladres' />">Annuleer</a>
                </c:otherwise>
        </c:choose>
</form> 
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
    </body>
</html>
