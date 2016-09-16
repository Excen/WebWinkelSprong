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
        <link href="<c:url value="../resources/main.css" />" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Welkom</h1>
        <b>Note:</b>Website updated on: <%= (new java.util.Date()).toLocaleString() %>
        <br>
        <br>
        <a href = "<c:url value = '/artikel/homeartikel'/>"> artikel </a> |
       
        <a href = "<c:url value = '/account/homeaccount'/>"> account </a> |
         <a href = "<c:url value = '/factuur/homefactuur'/>"> factuur </a> |
        
        
        
        
        

        

    </body>
    
    
    
    
    
</html>