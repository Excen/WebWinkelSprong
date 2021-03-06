<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : toevoegengelukt
    Created on : 19-sep-2016, 21:53:14
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <title>toevoegen gelukt</title>
    </head>
    <body>
        <h1>Betaling toegevoegd</h1>
        
        <div>
          <p>${betalingid}</p>  
          <p>${betalingfactuur}</p>   
          <p>${betalingklant}</p>   
          <p>${betaaldatum}</p> 
          <p>${betaalwijze}</p> 
          <p>${betaalgegevens}</p> 
          <p>bedrag</p> 
        </div>
        
        <a href="<c:url value='/betaling/readallbetaling' />">alle betalingen</a>
    </body>
</html>
