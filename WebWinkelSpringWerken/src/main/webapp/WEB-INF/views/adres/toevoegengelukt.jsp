<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : toevoegengelukt
    Created on : 17-sep-2016, 15:51:12
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adres toegevoegd</title>
    </head>
    <body>
        <h1>Adres toevoegen gelukt</h1>
        <div>${succes} </div><br/>
        <div>${adres} </div><br/>
        <div>${postcode} </div><br/>
        <div>${woonplaats} </div><br/>
        <div>${adrestype} </div><br/>
        
       
         Go to: <a href="<c:url value='/adres/homeadres' />">startpagina adres</a>
         <br/>
         Go to: <a href="<c:url value='/' />">terug naar start</a>
        
          
    </body>
</html>