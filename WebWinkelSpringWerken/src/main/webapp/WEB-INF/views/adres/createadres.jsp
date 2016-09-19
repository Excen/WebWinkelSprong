

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
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
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
            Adres type <select name="adresType" >                
                    <c:forEach items="${enumValues}" var="option">
                            <option value="${adresType}" label="--Please Select">                                
                                <c:out value="${adresType}"></c:out>
                            </option>
                    </c:forEach>
            </select>

            <input type = "submit" value = "opslaan"/> | 
            <a href="<c:url value='/adres/readalladres' />">Annuleer</a>
        </form>   


        <a href = "<c:url value = '/'/>"> Terug naar huis</a>
        <br/>
        <br/>
        
        <footer> Het is vandaag: <%=new java.util.Date()%></footer>
    </body>
</html>

   <%--form: radiobuttons path="adresType" items="${enumValues}" /--%>
   <%--form:select path="adrestype">
     <form:option value="-" label="--Please Select"/>
     <form:options items="${enumValues}" />
</form:select--%>