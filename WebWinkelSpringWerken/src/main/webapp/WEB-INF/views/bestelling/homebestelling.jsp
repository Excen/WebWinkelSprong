<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : home
    Created on : 11-sep-2016, 10:21:06
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Bestelling startpagina</title>
    </head>
    <body>
        <h1>Startpagina Bestelling</h1>
        <p>Wat wilt u doen?</p>
        
        <ul>
            <li><a href = "<c:url value = '/klant/readallklant'/>"> Bestelling toevoegen</a></li>
            <li><a href = "<c:url value = '/bestelling/readallbestelling'/>"> Bestelling wijzigen </a></li>
            <li><a href = "<c:url value = '/bestelling/readallbestelling'/>"> Zoek bestellinginfo op </a></li>
            <li><a href = "<c:url value = '/bestelling/readallbestelling'/>"> Alle Bestellingen opvragen </a></li>
            <li><a href = "<c:url value = '/bestelling/deleteallbestelling'/>"> Alle Bestellingen verwijderen </a></li>
        </ul>
        
    </body>
</html>
