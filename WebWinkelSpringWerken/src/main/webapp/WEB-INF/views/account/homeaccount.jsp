<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : homeaccount
    Created on : 15-sep-2016, 23:28:40
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="<c:url value="/src/main/resources/main.css" />" rel="stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account startpagina</title>
    </head>
    <body>
        <h1>Account startmenu</h1>
        <a href = "<c:url value = '/account/createaccount'/>"> Account toevoegen</a><br>
        <a href = "<c:url value = '/account/updateaccount'/>"> Account update </a><br>
        <a href = "<c:url value = '/account/readallaccount'/>"> Accounts opvragen </a><br>
        <a href = "<c:url value = '/account/deleteaccount'/>"> Account verwijderen </a><br>
    </body>
</html>

