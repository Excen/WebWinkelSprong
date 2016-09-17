<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : homeartikel
    Created on : 15-sep-2016, 14:02:00
    Author     : Wendy
--%>


<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Artikel startpagina</title>
    </head>
    <body>
        <h1>Startpagina artikelen</h1>
        <a href = "<c:url value = '/artikel/createartikel'/>"> Artikel toevoegen</a><br>
        <a href = "<c:url value = '/artikel/updateartikel'/>"> Artikel wijzigen </a><br>
        <a href = "<c:url value = '/artikel/readallartikel'/>"> Artikellijst opvragen </a><br>
        <a href = "<c:url value = '/artikel/deleteallartikel'/>"> Artikellijst verwijderen </a><br>
    </body>
</html>
