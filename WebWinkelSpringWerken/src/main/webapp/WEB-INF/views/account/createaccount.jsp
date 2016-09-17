<%-- 
    Document   : nieuwaccount
    Created on : 12-sep-2016, 16:10:04
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    <body>
        <h1>account toevoegen</h1>
        <form method = "POST">
            Username <input type = "text" name = "username" />  <br>
            Password <input type = "text" name = "password" /> <br>
            <input type = "submit" value = "opslaan"/>
            <%-- klant toevoegen --%>
        </form>   
        
        <a href = "<c:url value = '/'/>"> Terug naar huis!</a>
    </body>
</html>

