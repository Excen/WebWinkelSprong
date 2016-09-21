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
        <title>Bestelling toevoegen</title>
    </head>
    <body>
        <h1>Bestelling toegevoegd</h1>
        <div>
        ${success}
        </div>
    
        <a href="<c:url value='/bestelling/homebestelling' />">
            <input type="button" value="terug naar home"></a>
        
    </body>
</html>