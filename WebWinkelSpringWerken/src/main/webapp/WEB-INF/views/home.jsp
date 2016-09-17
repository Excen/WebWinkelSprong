<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : home
    Created on : 11-sep-2016, 10:21:06
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <link href="<c:url value="../resources/css/main.css" />" rel="stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Welkom</h1>
        
        <br/>
        <br/>
        <a href = "<c:url value = '/account/homeaccount'/>"> account </a> |
        <a href = "<c:url value = '/adres/homeadres'/>"> adres </a> |
        <a href = "<c:url value = '/artikel/homeartikel'/>"> artikel </a> |       
        <a href = "<c:url value = '/bestelling/homebestelling'/>"> bestelling </a> |
        <a href = "<c:url value = '/betaling/homebetaling'/>"> betaling </a> |
        <a href = "<c:url value = '/factuur/homefactuur'/>"> factuur </a> |        
        <a href = "<c:url value = '/klant/homeklant'/>"> klant </a> |
        <br/>
        <br/>
        <footer>Note:</footer>Website updated on: <%= (new java.util.Date()).toLocaleString() %>
        
        
        

        

    </body>
    
    
    
    
    
</html>