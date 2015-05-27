package model;

import javax.ejb.Stateless;
import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Stateless(name = "cfacade")
public class CustomerFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public CustomerFacade(){

    }

    public Customer createCustomer(String firstname, String lastname, Date birthDate, String email, String password, Long phonenumber,
                                   String street, String city, String state, Long zipcode){
        Address address = new Address(street, city, state, zipcode);
        em.persist(address);
        Customer customer = new Customer(firstname, lastname, birthDate, address, email, password, phonenumber);
        em.persist(customer);
        return customer;
    }

    public Orders createOrders(Customer c){
        Orders ord = new Orders(c);
        em.persist(ord);
        return ord;
    }

    public List<Orders> getOrdersCustomer(Long customer_id){
        Query query = em.createQuery("SELECT o FROM Orders o  WHERE o.customer_id.id=:id");
        query.setParameter("id", customer_id);
        return query.getResultList();
    }

    public List<Customer> getCustomerAll(){
        Query query = em.createQuery("SELECT c FROM Customer c");
        return query.getResultList();
    }

    public List<Address> getAddressAll(){
        Query query = em.createQuery("SELECT a FROM Address a");
        return query.getResultList();
    }

    public Customer getCustomer(Long customer_id){
        Query query=em.createQuery("SELECT c FROM Customer c WHERE c.Id=:id");
        query.setParameter("id", customer_id);
        return (Customer) query.getResultList().get(0);
    }

}

