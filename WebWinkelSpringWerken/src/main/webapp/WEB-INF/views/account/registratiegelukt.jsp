<%-- 
    Document   : registratieGelukt
    Created on : 11-sep-2016, 16:06:47
    Author     : Wendy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account toevoegen</title>
    </head>
    <body>
        <h1>Account aangemaakt</h1>
        <div>
        ${success}
        </div>
    
        <a href="<c:url value='/account/readallaccount' />">
            <input type="button" value="alle accounts"></a>
    </body>
</html>

