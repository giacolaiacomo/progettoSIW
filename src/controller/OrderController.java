package controller;

import model.*;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.persistence.criteria.Order;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

@ManagedBean
@SessionScoped
public class OrderController {

    private Long id;
    private Customer customer;
    private Orders order;
    private Product product;
    private int quantity=1;
    private Long ordlId;
    private OrderLine orderLine;
    private String message=null;


    @EJB(beanName = "ordfacade")
    private OrdersFacade ordersFacade;
    @EJB(beanName = "cfacade")
    private CustomerFacade customerFacade;
    @EJB(beanName = "ordlfacade")
    private OrderLineFacade orderLineFacade;
    @EJB(beanName = "prodfacade")
    private ProductFacade productFacade;

    public String createOrder(){
        this.order=this.ordersFacade.createOrder(customer);
        this.customer.addOrder(order);
        return "newOrder";
    }

    public String addOrderLine(){
        if(this.order==null) {
            this.order = this.ordersFacade.createOrder(customer);
            this.customer.addOrder(order);
        }
        if(this.quantity<=0)
            return "Error! Quantity must be >0";
        else {
            OrderLine ordl = this.order.checkOrderLine(this.product);
            if (ordl != null) {
                ordl.setQuantity(ordl.getQuantity() + this.quantity);
            } else {
                ordl = new OrderLine(this.product.getPrice(), this.quantity, this.order, this.product);
                this.order.addOrderLine(ordl);
            }
            return "mybasket";
        }
    }

    public void deleteOrderLine(OrderLine ordl) {
        this.order.removeOrderLine(ordl);
        orderLineFacade.deleteOrderLine(ordl.getId());
        if(this.order.getOrderLines().size()==0)
            this.deleteOrder();
    }

    public void deleteOrder(){
        for(OrderLine o : this.order.getOrderLines())
            this.orderLineFacade.deleteOrderLine(o.getId());
        this.ordersFacade.deleteOrder(this.order.getId());
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("orderController");
    }

    public void setClosedOrder(){
        this.order.setCompletedTime(Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome")));
        this.order.setClosed();
        ordersFacade.updateOrder(order);
        customerFacade.updateCustomer(customer);
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("orderController");
    }

    public void setProcessedOrder(){
        if(checkQuantityOrder()) {
            this.order.setProcessedTime(Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome")));
            this.order.setProcessed();
            ordersFacade.updateOrder(order);
            updateQuantity();
            customerFacade.updateCustomer(customer);
        } else
            this.message="errore ordine non processato";
    }

    public boolean checkQuantityOrder(){
        for(OrderLine ordl: this.order.getOrderLines()){
            if(ordl.getProduct().getQuantity() < ordl.getQuantity())
                return false;
        }
        return true;
    }

    public void updateQuantity(){
        for (OrderLine ordl: this.order.getOrderLines()){
            ordl.getProduct().setQuantity(ordl.getProduct().getQuantity() - ordl.getQuantity());
            productFacade.updateProduct(ordl.getProduct());
        }

    }

    public String findOrderById(){
        this.order=this.ordersFacade.getOrder(this.id);
        return "order";
    }
    public String findOrderById(Long id){
        this.order=this.ordersFacade.getOrder(id);
        return "order";
    }

    public String myBasket(){
        return "mybasket";
    }

    /* Getter & Setter */

    public OrderLine getOrderLine() {
        return orderLine;
    }

    public void setOrderLine(OrderLine orderLine) {
        this.orderLine = orderLine;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ProductFacade getProductFacade() {
        return productFacade;
    }

    public void setProductFacade(ProductFacade productFacade) {
        this.productFacade = productFacade;
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

    public OrdersFacade getOrdersFacade() {
        return ordersFacade;
    }

    public void setOrdersFacade(OrdersFacade ordersFacade) {
        this.ordersFacade = ordersFacade;
    }

    public CustomerFacade getCustomerFacade() {
        return customerFacade;
    }

    public void setCustomerFacade(CustomerFacade customerFacade) {
        this.customerFacade = customerFacade;
    }

    public OrderLineFacade getOrderLineFacade() {
        return orderLineFacade;
    }

    public void setOrderLineFacade(OrderLineFacade orderLineFacade) {
        this.orderLineFacade = orderLineFacade;
    }

}
