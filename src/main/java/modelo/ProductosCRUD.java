/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import javax.persistence.*;
import java.util.List;

/**
 *
 * @author DAW2-PROFESOR
 */
public class ProductosCRUD {
     public static List<Productos> getProductos() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_productosCRUDupdate_war_1PU");
        EntityManager manager = factory.createEntityManager();
        String sql = "SELECT * FROM productos";
        Query q = manager.createNativeQuery(sql,Productos.class); //método para consultas en SQL
        q.setFirstResult(0);
        q.setMaxResults(4);
        List<Productos> productosBD =  q.getResultList();

        return productosBD;        
        }    
     public static List<Productos> getProductosPaginado(int offset, int tamanio_pagina) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_productosCRUDupdate_war_1PU");
        EntityManager manager = factory.createEntityManager();
        String sql = "SELECT * FROM productos";
        Query q = manager.createNativeQuery(sql,Productos.class); //método para consultas en SQL
        q.setFirstResult(offset);
        q.setMaxResults(tamanio_pagina);
        List<Productos> productosBD =  q.getResultList();

        return productosBD;        
        }    
     
        public static int actualizaProductoTest() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_productosCRUDupdate_war_1PU");
        EntityManager manager = factory.createEntityManager();
        String sql = "UPDATE Productos p SET p.categoria = 'zumos' WHERE p.id = 10";
        Query q = manager.createQuery(sql,Productos.class);
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate();
        manager.getTransaction().commit();
        //manager.close();
        return filasAfectadas;      
    }
        
       public static int actualizaProductoParams() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_productosCRUDupdate_war_1PU");
        EntityManager manager = factory.createEntityManager();
        String sql = "UPDATE Productos p SET p.nombre = :nombre, p.imagen = :imagen, p.categoria = :categoria, p.precio = :precio WHERE p.id = 10";
        Query q = manager.createQuery(sql,Productos.class);
        q.setParameter("categoria", "Digestivos");
        q.setParameter("nombre", "Pacharán");
        q.setParameter("imagen", "pacharan.jpg");
        q.setParameter("precio", 4.0);
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate();
        manager.getTransaction().commit();
        //manager.close();
        return filasAfectadas;      
    }
       
       public static int actualizaProducto(Productos miProducto) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_productosCRUDupdate_war_1PU");
        EntityManager manager = factory.createEntityManager();
        String sql = "UPDATE Productos p SET p.nombre = :nombre, p.imagen = :imagen, p.categoria = :categoria, p.precio = :precio WHERE p.id = :id";
        Query q = manager.createQuery(sql,Productos.class);
        q.setParameter("id", miProducto.getId());
        q.setParameter("categoria", miProducto.getCategoria());
        q.setParameter("nombre", miProducto.getNombre());
        q.setParameter("imagen", miProducto.getImagen());
        q.setParameter("precio", miProducto.getPrecio());
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate();
        manager.getTransaction().commit();
        //manager.close();
        return filasAfectadas;      
    }
       
        public static void insertaProducto(Productos producto) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_productosCRUDupdate_war_1PU");
        EntityManager manager = factory.createEntityManager();
         manager.getTransaction().begin();
        manager.merge(producto);
        manager.getTransaction().commit();
        }
        
        public static int destroyProducto(int id) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_productosCRUDupdate_war_1PU"
                + "");
        EntityManager manager = factory.createEntityManager();
        String sql = "DELETE from Productos p WHERE p.id = " + id;
        Query q = manager.createQuery(sql);
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate(); //para las consultas de modif. datos se usa el método executeUpdate
        manager.getTransaction().commit();
        return filasAfectadas;  
    }

}
