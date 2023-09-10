package com.dlebre.exam_jee.services;

import com.dlebre.exam_jee.models.User;
import com.dlebre.exam_jee.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class UserService {

    public void addUser(User user){
        SessionFactory sf = HibernateUtils.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();
//            User user1 = new User("");
        session.persist(user);

        tx.commit();
        session.close();
    }

    public List<User> getByUsername(String username){
        SessionFactory sf = HibernateUtils.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        List<User> users = session.createQuery("FROM User u WHERE u.username = :username", User.class)
                .setParameter("username", username).getResultList();


        tx.commit();
        session.close();

        return users;
    }
}
