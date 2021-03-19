<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <% 
            HttpSession sesion = request.getSession();
              		  String usuarioLogeado = ( String ) sesion.getAttribute("usuarioLogeado");
                if ( usuarioLogeado == null ) {
                    String mensaje="debe logearse";
                    request.setAttribute("mensaje", mensaje);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    
                }   
%>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#">Restaurante Bosco</a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="ServletProductos?op=listar">Listar productos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="ServletProductos?op=insert1"">Nuevo Producto</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">TPV</a>
      </li>
    </ul>
  </div>
  <div style="color: white">Usuario: <%=usuarioLogeado%> | <a href="servletLogin">Salir</a>
  
  </div>
</nav>
        <h1>Gestión de Productos</h1>
        <p><a href="ServletProductos?op=listar">Listar</a></p>
        <p><a href="ServletProductos?op=insert1">Insert</a></p>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
