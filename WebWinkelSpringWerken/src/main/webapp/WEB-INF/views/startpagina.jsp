<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : startpagina
    Created on : 22-sep-2016, 10:49:41
    Author     : Wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href = "<c:url value = "/resources/css/main.css"/>"  rel = "stylesheet" type = "text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Beginpagina</title>
    </head>
    <body>
       <nav>
    <div class=navigatie>
    <div class= "pull-right"><ul>
            
            <li><a href = "<c:url value = '/account/createaccount'/>"> Klant worden </a><li> 
            <li><a href = "<c:url value = '#'/>"> Inloggen klant </a></li> 
            <li><a href = "<c:url value = '/artikel/readallartikel'/>"> Naar Webshop </a></li>    
              
            
    </ul>    </div>
    <div class= "pull-left"><ul>
        <li><a href="#">Contact</a></li>
        <li><a href="#">Wie zijn wij</a></li>
        <li><a href="#">Wat doen wij</a></li>
    </ul></div>
    </div>
</nav>
        <div class= "welkomhome">
        <br/><h1>Welkom bij "Het juiste been"</h1>
        <br/>       
        
        <p> Kom je bij voorkeur standaard met het juiste been uit bed. Zit je hoofd vol, wil je een lege?
            Heb je blauwe bloed en wil je groene handen? Of juist andersom. Alles is hier mogelijk. Benieuwd? Meldt u aan voor de nieuwsbrief</p>
        <input type="email" placeholder="Uw e-mail">
        <input type= "submit" value="Zend" >
        </div>   
            
            
        
            
            
            <div class= "footer">
                <div class=navigatie>
                   <div class = "pull-left"> <ul>
                         <li><a href = "<c:url value = '#'/>"> Disclaimer </a></li>    
                         <li><a href = "<c:url value = '/#'/>"> Privacy & Cookies</a></li> 
                         <li><a href = "<c:url value = '/#'/>"> Algemene voorwaarden </a></li> 
                         <li><a href = "<c:url value = '/#'/>"> Klantenservice </a></li> 
                         <li><a href = "<c:url value = '/home'/>"> Login </a></li> 
                
                    </ul>  </div>
                         <div class = "pull-right"> <ul>
                        <c:set var="now" value="<%=new java.util.Date()%>" />
                        <li>Website updated on: <fmt:formatDate type="both" 
                           dateStyle="long" timeStyle="long" 
                           value="${now}" /></li>
                         <li><a href = "<c:url value = '#'/>"> Facebook link</a></li>    
                         <li><a href = "<c:url value = '/#'/>"> Twitter link</a></li> 
                         <li><a href = "<c:url value = '/#'/>"> Veilig webwinkel </a></li> 
                         
                    </ul>  </div>
                </div>
            </div>    
            
            
            
    </body>
</html>
