<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Create Account</title>
    </head>
    <body>
        <h1>account aanmaken</h1>
           <form method = "POST">
            Account gebruikersnaam <input type = "text" name = "username" /> <br/>
            Wachtwoord <input type = "text" name = "password" /> <br/>
            Creatiedatum <input type = "text" name = "creatiedatum" value =  <%= (new java.util.Date()) %>/> <br/>
            

            <input type = "submit" value = "opslaan"/> | 
            <a href="<c:url value='/account/readallaccount' />">Annuleer</a>
        </form>   


        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
    </body>
</html>
        
    </body>
</html>

