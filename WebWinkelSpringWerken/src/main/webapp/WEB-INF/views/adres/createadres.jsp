<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : createadres
    Created on : 17-sep-2016, 15:01:25
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADRES TOEVOEGEN</title>
    </head>
    <body>
         
        <h1>Adres toevoegen</h1>
       

        <h3>Adres gegevens</h3>
        <form method = "POST">
            Straatnaam <input type = "text" name = "straatnaam" /> <br/>
            Huisnummer <input type = "text" name = "huisnummer" /> <br/>
            Toevoeging <input type = "text" name = "toevoeging" /><br/>
            Postcode  <input type = "text" name = "postcode" /><br/>
            Woonplaats <input type = "text" name = "woonplaats" /><br/>
            AdresType <input type = "text" name = "adrestype" /><br/>

            <input type = "submit" value = "opslaan"/> | 
            <a href="<c:url value='/adres/readalladres' />">Annuleer</a>
        </form>   


        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        <br/>
        <br/>
        
        <footer> Het is vandaag: <%=new java.util.Date()%></footer>
    </body>
</html>
