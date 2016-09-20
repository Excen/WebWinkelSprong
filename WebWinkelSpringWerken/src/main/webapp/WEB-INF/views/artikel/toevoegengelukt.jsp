z<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Artikel Toegevoegd</title>
    </head>
    <body>
        <h1>Artikel Toegevoegd</h1>
        <div>
        ${succes}
        </div>
    
        Go to: <a href="<c:url value='/artikel/readallartikel' />">Bestellingen</a>
        
    </body>
</html>
