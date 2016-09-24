<%-- 
    Document   : commitwinkelmand
    Created on : 23-sep-2016, 22:13:50
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>winkelmand</h1>
        
        <a href="<c:url value='#-${bestellingId}-${artikelId}' />">winkelverder</a>
        <a href="<c:url value='#-${bestellingId}-${artikelId}' />">bestelling afronden</a>
    </body>
</html>
