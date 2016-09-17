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
            <%-- create nr --%>
            Voornaam <input type = "text" name = "voornaam" />  <br>
            Achternaam <input type = "text" name = "achternaam" />  <br>
            Tussenvoegsel <input type = "text" name = "tussenvoegsel" /> <br>
            Emailadres <input type = "text" name = "email" /> <br>
        </form>
            <a href = "<c:url value = '/'/>"> Terug naar huis!</a>
            
    </body>
</html>

