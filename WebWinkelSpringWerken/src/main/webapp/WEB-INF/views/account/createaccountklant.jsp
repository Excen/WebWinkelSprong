<%-- 
    Document   : createaccountklant
    Created on : 19-sep-2016, 18:10:20
    Author     : Anne
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>Create account met klant</title>
    </head>
    <body>
        <h1>Nieuw account</h1>
        <form method = "POST">
            
            Username <input type = "text" name = "username" />  <br>
            Password <input type = "text" name = "password" /> <br>
            Datum <input type ="date" name ="creatieDatum" /> <br>
            <input type ="hidden" name=""
                  
            <input type = "submit" value = "opslaan"/>
            <%-- klant toevoegen --%>
        </form>   
        
        <a href = "<c:url value = '/'/>"> Terug naar huis!</a>
        
        
    </body>
</html>
