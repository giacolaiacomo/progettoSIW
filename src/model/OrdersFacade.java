package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Stateless(name = "ordfacade")
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

    public Orders getOrder(Long id) {
        Orders order = em.find(Orders.class, id);
        return order;
    }

    public List<Orders> getAllOrder() {
        Query q = em.createQuery("SELECT o FROM Orders o ORDER BY o.id");
        List<Orders> orders = q.getResultList();
        return orders;
    }

    private void deleteOrder(Orders order) {
        em.remove(order);
    }

    public void deleteOrder(Long id) {
        Orders order = em.find(Orders.class, id);
        deleteOrder(order);
    }

}
