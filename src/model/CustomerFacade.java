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

    private void deleteCustomer(Customer customer) {
        em.remove(customer);
    }

    public void deleteCustomer(Long id) {
        Customer customer = em.find(Customer.class, id);
        deleteCustomer(customer);
    }

    public void deleteCustomerByEmail(String email) {
        Customer customer = this.getCustomerByEmail(email);
        deleteCustomer(customer);
    }

    public Customer getCustomerByEmail(String email) {
        Customer c;
        Query q = em.createQuery("SELECT c FROM Customer c WHERE c.email=:email");
        q.setParameter("email", email);
        if (q.getResultList().isEmpty())
            return null;
        else {
            c = (Customer) q.getSingleResult();
            return c;
        }
    }

    public List<Customer> getCustomerAll(){
        Query query = em.createQuery("SELECT c FROM Customer c");
        return query.getResultList();
    }

    public Customer getCustomer(Long customer_id){
        Query query=em.createQuery("SELECT c FROM Customer c WHERE c.Id=:id");
        query.setParameter("id", customer_id);
        return (Customer) query.getResultList().get(0);
    }
}

