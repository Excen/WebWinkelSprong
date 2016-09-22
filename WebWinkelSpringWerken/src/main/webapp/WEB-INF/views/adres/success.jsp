<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : success
    Created on : 12-sep-2016, 16:07:12
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>klantadres verwijderd</title>
    </head>
    <body>
        <h1>Klant adres koppeling succesvol verwijderd</h1>
        <div>${succes} </div><br/>
        <div>${adresId} </div><br/>
        <div>${klantId} </div><br/>
       
        
        <a href="<c:url value='/adres/deleteadres-${adresId}' />">Verwijder adres uit het adressenbestand</a><br/>
       <a href="<c:url value='/klant/deleteklant-${klantId}' />">Verwijder klant uit het klantenbestand</a><br/>
        
         Go to: <a href="<c:url value='/adres/homeadres' />">startpagina adres</a>
         <br/>
        Go to: <a href="<c:url value='/klant/homeklant' />">startpagina klant</a>
        <br/>
         Go to: <a href="<c:url value='/home' />">terug naar start</a>
        
          
    </body>
</html>
