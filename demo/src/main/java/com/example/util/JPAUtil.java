package com.example.util;

import jakarta.persistence.*;

public class JPAUtil {
    private static EntityManagerFactory emf;

    public static EntityManager getEntityManager() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("myPU");
        }
        return emf.createEntityManager();
    }
}
