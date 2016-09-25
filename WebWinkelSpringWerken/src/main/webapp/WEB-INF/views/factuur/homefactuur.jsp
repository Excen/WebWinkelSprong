<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : homefactuur
    Created on : 16-sep-2016, 13:49:08
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Factuur startpagina</title>
    </head>
    <body>
        <h1>Factuur start </h1>
        <p>Wat wilt u doen?</p>
        <ul type="disc">
                
                <li><a href = "<c:url value = "/factuur/readallfactuur"/>">Factuur verwijderen</a></li>
                <li><a href = "<c:url value = "/factuur/updatefactuur"/>"  >Factuur aanpassen</a></li>
                <li><a href = "<c:url value = "/factuur/readallfactuur"/>"  >Factuurlijst opvragen</a></li>
            </ul>
    </body>
</html>
