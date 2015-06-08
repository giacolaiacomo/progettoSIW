package model;

import javax.persistence.*;
import java.util.*;

import static javax.persistence.TemporalType.DATE;

@Entity

public class Orders {

    boolean closed =false;
    boolean processed =false;

    public Orders() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Temporal(DATE)
    private Calendar creationtime;

    @ManyToOne
    private Customer customer_id;

    @OneToMany(mappedBy = "orders_id")
    private List<OrderLine> orderLines;

    public Orders(Customer customer_id) {
        this.creationtime = Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome"));
        this.customer_id = customer_id;
        this.orderLines = new ArrayList<OrderLine>();
    }

    public OrderLine checkOrderLine(Product product) {
        for(OrderLine line : this.orderLines){
            if(line.getProduct().getId().equals(product.getId()))
                return line;
        }
        return null;
    }

    public List<OrderLine> getOrderLines() {
        return orderLines;
    }

    public void setOrderLines(List<OrderLine> orderLines) {
        this.orderLines = orderLines;
    }

    public boolean isClosed(){
        if(this.closed ==true)
            return true;
        else
            return false;
    }

    public void setClosed(){
        this.closed =true;
    }

    public void setProcessed(){
        this.processed =true;
    }

    public void addOrderLine(OrderLine orderLine) {
        this.orderLines.add(orderLine);
    }

    public void removeOrderLine(OrderLine orderLine) {
        this.orderLines.remove(orderLine);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Calendar getCreationtime() {
        return creationtime;
    }

    public void setCreationtime(Calendar creationtime) {
        this.creationtime = creationtime;
    }

    public Customer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Customer customer_id) {
        this.customer_id = customer_id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orders orders = (Orders) o;

        if (creationtime != null ? !creationtime.equals(orders.creationtime) : orders.creationtime != null)
            return false;
        if (customer_id != null ? !customer_id.equals(orders.customer_id) : orders.customer_id != null) return false;
        if (id != null ? !id.equals(orders.id) : orders.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (creationtime != null ? creationtime.hashCode() : 0);
        result = 31 * result + (customer_id != null ? customer_id.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", creationtime=" + creationtime +
                ", customer_id=" + customer_id +
                '}';
    }
}
