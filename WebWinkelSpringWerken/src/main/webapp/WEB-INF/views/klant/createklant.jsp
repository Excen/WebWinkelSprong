<%-- 
    Document   : createklant
    Created on : 15-sep-2016, 11:10:59
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create klant</title>
    </head>
    <body>
        <h1>Klant aanmaken</h1>
        <form method = "POST">
            klant nummer <input type = "text" name = "klantnummer" /> <br>
            Voornaam <input type = "text" name = "voornaam" />  <br>
            Achternaam <input type = "text" name = "achternaam" />  <br>
            Tussenvoegsel <input type = "text" name = "tussenvoegsel" /> <br>
            Emailadres <input type = "text" name = "email" /> <br>
            
            <input type = "submit" value = "opslaan"/> | 
            <a href="<c:url value='/artikel/readallartikel' />">Annuleer</a>
            
        </form>
            <a href = "<c:url value = '/'/>"> Terug naar huis!</a>
            
    </body>
</html>

