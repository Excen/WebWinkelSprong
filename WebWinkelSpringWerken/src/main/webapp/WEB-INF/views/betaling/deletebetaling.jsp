<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : deletebetaling
    Created on : 19-sep-2016, 22:01:18
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>verwijder betaling</title>
    </head>
    <body>
        <h1>Betaling verwijderen</h1>
        <c:redirect url= "/readallbetaling.jsp"/>
    </body>
</html>
