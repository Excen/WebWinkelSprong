<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : homeadres
    Created on : 17-sep-2016, 13:21:17
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Startpagina Adres</title>
    </head>
    <body>
        <h1>Adressen bestand</h1>
        <p></p>
        
        <a href = "<c:url value = '/adres/createadres'/>"> Adres toevoegen</a><br>
        <a href = "<c:url value = '/adres/updateadres'/>"> Adres wijzigen </a><br>
        <a href = "<c:url value = '/adres/readalladres'/>"> Adressenlijst opvragen </a><br>
        <a href = "<c:url value = '/adres/deletealladres'/>"> Adressenlijst verwijderen </a><br>
        
        
    </body>
</html>
