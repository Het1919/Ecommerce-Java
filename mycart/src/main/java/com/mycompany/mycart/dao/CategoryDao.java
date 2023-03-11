package com.mycompany.mycart.dao;

import com.mycompany.mycart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //saves the category to db
    public int saveCaregory(Category category){
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int)session.save(category);
        tx.commit();
        session.close();
        return catId;
    }
    
    
    public List<Category> getcategories()
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }
}
