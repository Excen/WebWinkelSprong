<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : factuur
    Created on : 12-sep-2016, 16:14:54
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>nieuwe factuur</title>
    </head>
    <body>
        <h1>Factuur aanmaken</h1>
        <p>Voer gegevens in:</p>
        
        <form method = "POST">
            
            Factuurnummer <input type = "text" name = "factuurnummer" value =${factuur.factuurnummer}/> <br/>
            Factuurdatum <input type = "text" name = "factuurdatum" value = ${factuur.factuurdatum}/><br/>
            Bestelling <input type = "text" name = "artikelNummer" value = ${factuur.bestelling}/><br/>
            Klant <input type = "text" name = "klant" value = ${factuur.klant}/> <br/>
            Betaling <input type = "text" name = "betaling" value = ${factuur.betalingset}/><br/>

            <input type = "submit" value = "opslaan"/> | 
            <a href="<c:url value='/artikel/readallartikel' />">Annuleer</a>
        </form>   


        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        
        
    </body>
</html>
