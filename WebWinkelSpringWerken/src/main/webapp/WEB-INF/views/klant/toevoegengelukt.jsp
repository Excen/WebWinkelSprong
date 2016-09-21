<%-- 
    Document   : toevoegengelukt
    Created on : 19-sep-2016, 22:58:08
    Author     : Anne
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Toevoegen gelukt</h1>
      
        <div>
        ${success}
        </div>
        
        <c:redirect url ="/account/createaccountklant-${klantId}"/>
        <%--
        <a href="<c:url value='/account/createaccountklant-${klantId}' />">acoount toevoegen</a>
        --%>
    </body>
</html>
