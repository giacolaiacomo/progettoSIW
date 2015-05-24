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

    public OrderLine createOrderLine(Long unitprice, Long quantity, Orders orders_id, Product product_id){
        OrderLine orderLine = new OrderLine(unitprice,quantity,orders_id,product_id);
        em.persist(orderLine);
        return orderLine;
    }
}
