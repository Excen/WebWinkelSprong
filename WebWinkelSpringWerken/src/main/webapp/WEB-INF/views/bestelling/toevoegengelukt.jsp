<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : toevoegengelukt
    Created on : 16-sep-2016, 17:03:31
    Author     : Excen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Bestelling toevoegen</title>
    </head>
    <body>
        <h1>Bestelling toegevoegd</h1>
        <div>
        ${bestelling}
        ${artikel}
        ${artikelAantal}
        </div>
    
        <a href="<c:url value='#' />">
            <input type="button" value="bestelling afronden"></a>
        <a href="<c:url value='#' />">
            <input type="button" value="verder winkelen"></a>
        <a href="<c:url value='/bestelling/homebestelling' />">
            <input type="button" value="terug naar home"></a>
        
    </body>
</html>