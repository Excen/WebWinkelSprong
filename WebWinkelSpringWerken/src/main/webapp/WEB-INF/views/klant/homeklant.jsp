<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : homeklant
    Created on : 17-sep-2016, 15:43:57
    Author     : Anne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Klant homepage</title>
    </head>
    <body>
        <h1>Klant startmenu</h1>
        <a href = "<c:url value = '/klant/createklant'/>"> Klant toevoegen</a><br>
        <a href = "<c:url value = '/klant/updateklant'/>"> Klant update </a><br>
        <a href = "<c:url value = '/klant/readallklant'/>"> Klanten opvragen </a><br>
        <a href = "<c:url value = '/klant/deleteklant'/>"> Klant verwijderen </a><br>
    </body>
</html>

