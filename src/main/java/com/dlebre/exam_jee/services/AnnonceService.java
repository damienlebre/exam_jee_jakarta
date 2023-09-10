package com.dlebre.exam_jee.services;

import com.dlebre.exam_jee.models.Annonce;
import com.dlebre.exam_jee.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class AnnonceService {
    public List<Annonce> getAll(){
        SessionFactory sf = HibernateUtils.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        List<Annonce> annonces = session.createQuery("FROM Annonce ", Annonce.class).getResultList();
        tx.commit();
        session.close();

        return annonces;
    }

    public Annonce getOne(Long id){
        SessionFactory sf = HibernateUtils.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        Annonce annonce = session.get(Annonce.class,id);


        tx.commit();
        session.close();

        return annonce;
    }

    public void add(Annonce annonce){
        SessionFactory sf = HibernateUtils.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        session.persist(annonce);

        tx.commit();
        session.close();
    }

    public Annonce update(Annonce annonce){
        SessionFactory sf = HibernateUtils.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        session.merge(annonce);


        tx.commit();
        session.close();

        return annonce;
    }

    public Annonce removeAnnonce(Annonce annonce){
        SessionFactory sf = HibernateUtils.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        session.remove(annonce);


        tx.commit();
        session.close();

        return annonce;
    }
}
