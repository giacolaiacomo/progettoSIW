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


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Long getOrdlId() {
        return ordlId;
    }

    public void setOrdlId(Long ordlId) {
        this.ordlId = ordlId;
    }
}
