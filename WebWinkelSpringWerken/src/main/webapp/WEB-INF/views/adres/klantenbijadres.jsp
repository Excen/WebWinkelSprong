
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : klantenbijadres
    Created on : 20-sep-2016, 21:28:53
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adres klanten</title>
    </head>
    <body>
        
        
        <div align="center">
        <h1>Klanten bij adres met adresId - ${adres.id}</h1>
        
        <table>
               
            <th>KlantId</th>
            <th>Voornaam</th>
            <th>Tussenvoegsel</th>    
            <th>Achternaam</th>    
            <th>Email</th>    
            <th>Klantnummer</th>    
            <th></th>
                  <c:forEach  items="${klanten}" varStatus="status" var="klant">
                <tr>
                    <td><c:out value = "${klant.id}"/></td>
                    <td><c:out value = "${klant.voornaam}"/></td>
                    <td><c:out value = "${klant.tussenvoegsel}"/></td>
                    <td><c:out value = "${klant.achternaam}"/></td>
                    <td><c:out value = "${klant.email}"/></td>
                    <td><c:out value = "${klant.klantNummer}"/></td>                    
                    <td><a href="<c:url value='/adres/deleteklantvanadres-${adres.id}-${klant.id}' />">Verwijder</a></td>  
                </tr>
                </c:forEach>
            
           <br/>
        
        <a href = "<c:url value = '/adres/homeadres'/>" >Start adres</a>
        <br/>
        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        </div>
        
    </body>
</html>
