<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : updateadres
    Created on : 17-sep-2016, 22:07:09
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update</title>
    </head>
    <body>
        <h1>update adres</h1>
        <c:redirect url = "/adres/readalladres"/>
    </body>
</html>
