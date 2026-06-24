package com.example.api;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import java.util.List;
import com.example.model.Student;
import com.example.util.JPAUtil;
import jakarta.persistence.EntityManager;

@Path("/students")
public class StudentResource {

    @GET
    @Path("/hello")
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello, SWDev2026!";
    }

    @GET
    @Path("/getall")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Student> getAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT s FROM Student s", Student.class).getResultList();
        } finally {
            em.close();
        }
    }

    @POST
    @Path("/add")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public void add(@FormParam("name") String name, @FormParam("address") String address) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Student s = new Student();
            s.setName(name);
            s.setAddress(address);
            em.getTransaction().begin();
            em.persist(s);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @POST
    @Path("/delete/{id}")
    public void delete(@PathParam("id") Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Student s = em.find(Student.class, id);
            if (s != null) {
                em.getTransaction().begin();
                em.remove(s);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }
    }
}
