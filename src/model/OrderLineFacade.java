package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name = "ordlfacade")
public class OrderLineFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public OrderLineFacade(){

    }

    public OrderLine createOrderLine(Double unitprice, int quantity, Orders orders_id, Product product_id){
        OrderLine orderLine = new OrderLine(unitprice, quantity, orders_id, product_id);
        em.persist(orderLine);
        return orderLine;
    }

    public OrderLine getOrderLine(Long id) {
        OrderLine orderLine = em.find(OrderLine.class, id);
        return orderLine;
    }

    public void updateOrderLine(OrderLine orderLine) {
        em.merge(orderLine);
    }

    private void deleteOrderLine(OrderLine orderLine) {
        em.remove(orderLine);
    }

    public void deleteOrderLine(Long id) {
        OrderLine orderLine = em.find(OrderLine.class, id);
        deleteOrderLine(orderLine);
    }
}
