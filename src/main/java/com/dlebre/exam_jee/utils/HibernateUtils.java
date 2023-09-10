package com.dlebre.exam_jee.utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
    private static final SessionFactory sf= buildSessionFactory();

    public static SessionFactory buildSessionFactory(){
        try {
            return new Configuration().configure().buildSessionFactory();
        }catch (Throwable ex){
            System.err.println("Impossible de créer la Session Factory"+ ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory(){
        return sf;
    }

    public void close(){
        sf.close();
    }
}
