
<%-- 
    Document   : adressenbijklant
    Created on : 23-sep-2016, 10:55:26
    Author     : Anne
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adressen bij klant</title>
    </head>
    <body>
        <div align="center">
        <h1>Adressen bij klant met klantId - $(klant.id}</h1>
        <table>
               
            <th>AdresId</th>
            <th>Straatnaam</th>
            <th>Huisnummer</th>    
            <th>Toevoeging</th>    
            <th>Postcode</th>    
            <th>Woonplaats</th> 
            <th>AdresType</th>
            <th></th>
            
                <c:forEach  items="${adressen}" varStatus="status" var="adres">
                <tr>
                    <td><c:out value = "${adres.id}"/></td>
                    <td><c:out value = "${adres.straatnaam}"/></td>
                    <td><c:out value = "${adres.huisnummer}"/></td>
                    <td><c:out value = "${adres.toevoeging}"/></td>
                    <td><c:out value = "${adres.postcode}"/></td>
                    <td><c:out value = "${adres.woonplaats}"/></td>  
                    <td><c:out value = "${adres.adresType}"/></td>  
                    <td><a href="<c:url value='/klant/deleteadresvanklant-${adres.id}-${klant.id}' />">Verwijder</a></td>  
                </tr>
                </c:forEach>
           <br/>
           
           <a href = "<c:url value = '/klant/homeklant'/>" >Start adres</a><br/>
           <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        </div>
    </body>
</html>
