package controller;

import model.*;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;
import javax.persistence.criteria.Order;

@ManagedBean
public class OrderController {

    @ManagedProperty(value="#{param.id}")
    private Long id;

    private Customer customer;
    private Orders order;
    private Product product;
    private int quantity=1;
    private Long ordlId;

    @EJB(beanName = "ordfacade")
    private OrdersFacade ordersFacade;
    @EJB(beanName = "cfacade")
    private CustomerFacade customerFacade;
    @EJB(beanName = "ordlfacade")
    private OrderLineFacade orderLineFacade;



    public String createOrder(){
        this.order=this.ordersFacade.createOrder(customer);
        this.customer.addOrder(order);
        return "order";
    }

    public String addOrderLine(){
        if(this.quantity<=0)
            return "Error! Quantity must be >0";
        else {
            OrderLine ordl = this.order.checkOrderLine(this.product);
            if (ordl != null) {
                ordl.setQuantity(ordl.getQuantity() + this.quantity);
                this.orderLineFacade.updateOrderLine(ordl);
            } else {
                ordl = new OrderLine(this.product.getPrice(), this.quantity, this.order, this.product);
                this.order.addOrderLine(ordl);
                this.ordersFacade.updateOrder(this.order);
            }
            return "order";
        }
    }

    public String deleteOrderLine(){
        OrderLine ordl = this.orderLineFacade.getOrderLine(this.ordlId);
        this.order.removeOrderLine(ordl);
        this.orderLineFacade.deleteOrderLine(this.ordlId);
        this.ordersFacade.updateOrder(this.order);
        return "order";
    }



}
