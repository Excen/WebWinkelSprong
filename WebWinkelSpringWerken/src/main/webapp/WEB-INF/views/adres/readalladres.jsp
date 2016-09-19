<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : readalladres
    Created on : 17-sep-2016, 14:35:30
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdressenLijst</title>
    </head>
    <body>
        <div align="center">
        <h1>Adressenlijst</h1>
        
        <table>
                <th>Id</th>
                <th>Straatnaam</th>
                <th>Huisnummer</th>
                <th>Toevoeging</th>
                <th>Postcode</th>
                <th>Woonplaats</th>
                <th>AdresType</th>
                <th></th>
                <th></th>
             
                  <c:forEach var="adres" items="${adressenlijst}" varStatus="status">
                <tr>
                    <td><c:out value ="${adres.id}"/></td>
                    <td><c:out value = "${adres.straatnaam}"/></td>
                    <td><c:out value = "${adres.huisnummer}"/></td>
                    <td><c:out value = "${adres.toevoeging}"/></td>
                    <td><c:out value = "${adres.postcode}"/></td>
                    <td><c:out value = "${adres.woonplaats}"/></td>
                    <td><c:out value = "${adres.adresType}"/></td>
                    <td><a href="<c:url value='/adres/updateadres-${adres.id}' />">wijzig</a></td>
                    <td><a href="<c:url value='/adres/deleteadres-${adres.id}' />">verwijder </a></td>         
                </tr>
                </c:forEach>
                
          </table>
           <br/>
        <a href = "<c:url value = '/adres/createadres'/>" >Nieuw adres toevoegen </a>
        <br/>
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        </div>
    </body>
</html>
