<%-- 
    Document   : readallklant
    Created on : 17-sep-2016, 15:52:13
    Author     : Anne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alle klanten ophalen</title>
    </head>
    <body>
        <div align="center">
        <h1>Klantenlijst</h1>
        <table border="1">
                <th width="70">id</th>
                <th width="70">klantnummer</th>
                <th width="110">voornaam</th>
                <th width="110">achternaam</th>
                <th width="110">tussenvoegsel</th>
                <th width="140">email</th>
                <th width="70">bestelling</th>
                 <th width="110">wijzig</th>
                <th width="110">verwijder</th>
                <th width="110"></th>
                 <th width="110"></th>
                  <th width="110"></th>
                
                <c:forEach var="klant" items="${klantenlijst}" varStatus="status">
                <tr>
                    <td>${klant.id + 1}</td>
                    <td>${klant.klantNummer}</td>
                    <td>${klant.voornaam}</td>
                    <td>${klant.achternaam}</td>
                    <td>${klant.tussenvoegsel}</td>
                    <td>${klant.email}</td>
                    <td><form method="POST"><input type ="hidden" name="KlantId" value="${klant.id}">
                            <input type="submit" value="Bestelling maken"></input></form></td>
                   
                    <td><a href="<c:url value='/klant/updateklant-${klant.id}' />">wijzig </a></td> 
                    <td><a href="<c:url value='/klant/deleteklant-${klant.id}' />">verwijder </a></td>   
                    <td><a href = "<c:url value ='/klant/adressenbijklant-${klant.id}'/>">adressen</a></td>  
                    <td><a href="<c:url value='/klant/addadrestoklant-${klant.id}' />">adres toevoegen</a></td> 
                    <td><a href="<c:url value='/account/createaccount-${klant.id}' />">maak account </a></td>
                    
                </tr>
                </c:forEach>             
            </table>
            <br/>
        <a href = "<c:url value = '/klant/createklant'/>" >Nieuwe klant toevoegen </a>
        <br/>
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        </div>
    </body>
</html>



              
