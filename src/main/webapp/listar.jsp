<%-- 
    Document   : listar
    Created on : 05-mar-2021, 20:53:22
    Author     : DAW2-PROFESOR
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   
        <title>JSP Page</title>
        <style>
            #lista { padding: 30px}
        </style>
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
      <li class="nav-item active">
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
</nav>
        <div  id="lista">
        <h1>Listado de productos</h1>
        <% List<Productos> misProductos = (List<Productos>) request.getAttribute("misProductos");
        int num_paginas = (int) request.getAttribute("num_paginas");
        int pagina = (int) request.getAttribute("pagina");
        %>
          <p>Mostrando página: ${pagina} de ${num_paginas}>
        <table class="table table-hover">
            <tr><th>id</th><th>Nombre</th><td>Imagen</td><td>Categoría</td><td>Precio</td><td>Borrar</td><td>Actualizar</td></tr>
            <% for( Productos p: misProductos) { 
            String cadenaBorrar = "<a onclick='return Confirmation()' href='ServletProductos?op=borrar&id="+p.getId()+"'><i class='far fa-trash-alt'></i></a>";
            String cadenaActualizar = "<a href='ServletProductos?op=update1&id="+p.getId()+"'><i class='far fa-edit'></i></a>";
             %>
            <tr>
                <td><%=p.getId()%></td><td><%=p.getNombre() %></td><td><%=p.getImagen() %></td>
                <td><%=p.getCategoria() %></td><td><%=p.getPrecio() %></td><td><%=cadenaBorrar%></td><td><%=cadenaActualizar%></td>
        
            </tr>    
            
            <% } %>
        </table>
        <% 
            for ( int i=1; i<=num_paginas; i++){ 
                if ( pagina==i ){
             %>     <%=i%>
                     <%}
                        else {
                         %>
                         <a href="ServletProductos?op=listar&pagina=<%=i%>"><%=i%></a>
                        
                         <% }
            
               
               
} %>
        
        
        </div>
        <script>
            function Confirmation(){
                if ( confirm("Está seguro?")==true) {
                    alert("Procedo a borrar");
                    return true;
                }else {
                    alert("Operación cancelada");
                    return false;
                }
            }
        </script>

 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
