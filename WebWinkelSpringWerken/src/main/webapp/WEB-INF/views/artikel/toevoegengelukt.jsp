<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : toevoegengelukt
    Created on : 16-sep-2016, 17:03:31
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Artikel toevoegen</title>
    </head>
    <body>
        <h1>Artikel toegevoegd</h1>
        <div>
        ${success}
        </div>
    
        <a href="<c:url value='/artikel/readallartikel' />">
            <input type="button" value="alle artikelen"></a>
        
    </body>
</html>