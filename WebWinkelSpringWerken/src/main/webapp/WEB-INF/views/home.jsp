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
        <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
    
        
    <nav>
    <div class=navigatie>
    <div class= "pull-left"><ul>
            <li><a href = "<c:url value = '/account/homeaccount'/>"> account </a><li> 
            <li><a href = "<c:url value = '/adres/homeadres'/>"> adres </a></li> 
            <li><a href = "<c:url value = '/artikel/homeartikel'/>"> artikel </a></li>       
            <li><a href = "<c:url value = '/bestelling/homebestelling'/>"> bestelling </a></li>
            <li><a href = "<c:url value = '/betaling/homebetaling'/>"> betaling </a> </li>
            <li><a href = "<c:url value = '/factuur/homefactuur'/>"> factuur </a></li> 
            <li><a href = "<c:url value = '/klant/homeklant'/>"> klant </a></li>
    </ul>    </div>
    <div class= "pull-right"><ul>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Wie zijn wij</a></li>
    </ul></div>
    </div>
</nav>
        
        <div class= "welkomhome">
        <br/><h1>Welkom bij "Het juiste been"</h1>
        <br/>       
        
        <p> Kom je liever standaard met je juiste been uit bed. Zit je hoofd vol, wil je een lege?
            Heb je blauwe bloed en wil je groene handen? Of juist andersom. Alles is hier mogelijk. Benieuwd? Meld u aan voor de nieuwsbrief</p>
        <input type="email" placeholder="Uw e-mail">
        <input type= "submit" value="Zend" >
        </div>   
            
            
        <footer>Note:</footer>Website updated on: <%= (new java.util.Date()) %>
        
        
        

        

    </body>
    
    
    
    
    
</html>