<%-- 
    Document   : login
    Created on : 19-mar-2021, 21:13:49
    Author     : Ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>${mensaje}</p>
        <h1>Restaurante Bosco</h1>
        <form action="servletLogin" method="post">
            Usuario: <input type="text" name="usuario"><br><!-- comment -->
            Contraseña: <input type="password" name="contrase"><br>
            <input type="submit" value="entrar">
        </form>
    </body>
</html>
