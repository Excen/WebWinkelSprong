<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : homebetaling
    Created on : 19-sep-2016, 21:53:31
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Start betalingen</title>
    </head>
    <body>
        <h1>Startpagina betaling</h1>
        <p>Wat wilt u doen?</p>
        
        <ul>
            <li> <a href = "<c:url value = '/betaling/createbetaling'/>"> Betaling toevoegen</a></li>
            <li> <a href = "<c:url value = '/betaling/updatebetaling'/>"> Betaling wijzigen</a></li>
            <li> <a href = "<c:url value = '/betaling/deletebetaling'/>"> Betaling verwijderen</a></li>
            <li> <a href = "<c:url value = '/betaling/readallbetaling'/>">Overzicht betalingen </a></li>
        </ul>

        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        
        
    </body>
</html>
