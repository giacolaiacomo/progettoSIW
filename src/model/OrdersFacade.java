package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;

@Stateless(name = "ofacade")
public class OrdersFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public OrdersFacade(){

    }

    public Orders createOrder(Customer customer_id){
        Orders order = new Orders(customer_id);
        em.persist(order);
        return order;
    }

}
