package model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class CustomerFacade {

    EntityManagerFactory emf;
    EntityManager em;

    public CustomerFacade(EntityManager em, EntityManagerFactory emf) {
        this.emf = emf;
        this.em = em;
    }

    public void openEntityManager(){
        this.emf = Persistence.createEntityManagerFactory("products-unit");
        this.em = emf.createEntityManager();
    }

    public void closeEntityManager(){
        this.em.close();
        this.emf.close();
    }

    public Customer createCustomer(String firstname, String lastname, String email, Long phonenumber, Date dateofbirth, Address address){
        Customer customer = new Customer(firstname, lastname, email, phonenumber, dateofbirth);
        if (address != null)
            customer.setAddress_id(address);
        EntityTransaction tx=em.getTransaction();
        tx.begin();
        em.persist(customer);
        tx.commit();
        return customer;
    }

    public Orders createOrders(Date date, Customer c){
        Orders ord=new Orders(date, c);
        EntityTransaction tx=em.getTransaction();
        tx.begin();
        em.persist(ord);
        tx.commit();
        return ord;
    }

    public List<Orders> getOrdersCustomer(Long customer_id){
        Query query = em.createQuery("SELECT o FROM Orders o  WHERE o.customer_id.id=:id");
        query.setParameter("id", customer_id);
        return query.getResultList();
    }

    public List<Customer> getCustomerAll(){
        Query query= em.createQuery("SELECT c FROM Customer c");
        return query.getResultList();
    }

}

