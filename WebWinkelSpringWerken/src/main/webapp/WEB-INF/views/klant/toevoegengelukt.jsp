<%-- 
    Document   : toevoegengelukt
    Created on : 19-sep-2016, 22:58:08
    Author     : Anne
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Toevoegen gelukt</h1>
      
        <div>
        ${success}
        </div>
        <ul>
        <li><a href = "<c:url value = '/'/>"> Terug naar huis</a></li>
        <li><a href = "<c:url value = '/klant/homeklant'/>"> Startpagina Klant</a></li>
       
        </ul>
    </body>
</html>
