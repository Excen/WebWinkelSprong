<%-- 
    Document   : toevoegengelukt
    Created on : 17-sep-2016, 15:51:12
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adres toegevoegd</title>
    </head>
    <body>
        <h1>Uw adres is toegevoegd</h1>
        <div>${success} </div>
        <a href=" " >  </a>
        
         Go to: <a href="<c:url value='/adres/readalladres' />">Ga naar alle adressen in het bestand</a>
          Go to: <a href="<c:url value='/' />">terug naar start</a>
        
        
    </body>
</html>
