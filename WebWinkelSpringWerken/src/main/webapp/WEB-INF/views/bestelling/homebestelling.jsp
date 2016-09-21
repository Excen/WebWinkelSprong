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
        <link href="<c:url value="/src/main/resources/main.css" />" rel="stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Bestelling startpagina</title>
    </head>
    <body>
        <h1>Startpagina Bestelling</h1>
        <a href = "<c:url value = '/klant/readallklant'/>"> Bestelling toevoegen</a><br>
        <a href = "<c:url value = '/bestelling/readallbestelling'/>"> Bestelling wijzigen </a><br>
        <a href = "<c:url value = '/bestelling/readallbestelling'/>"> Zoek bestellinginfo op </a><br>
        <a href = "<c:url value = '/bestelling/readallbestelling'/>"> Alle Bestellingen opvragen </a><br>
        <a href = "<c:url value = '/bestelling/deleteallbestelling'/>"> Alle Bestellingen verwijderen </a><br>
        
    </body>
</html>