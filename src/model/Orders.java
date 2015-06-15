package model;

import javax.persistence.*;
import java.util.*;

import static javax.persistence.TemporalType.DATE;

@Entity
public class Orders {

    public Orders() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Temporal(DATE)
    private Calendar creationtime;

    boolean closed;

    boolean processed;

    @ManyToOne
    private Customer customer_id;

    @OneToMany(mappedBy = "orders_id", fetch=FetchType.EAGER, cascade=CascadeType.MERGE)
    private List<OrderLine> orderLines;

    public Orders(Customer customer_id) {
        this.creationtime = Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome"));
        this.customer_id = customer_id;
        this.closed = false;
        this.orderLines = new ArrayList<>();
    }

    public OrderLine checkOrderLine(Product product) {
        for(OrderLine line : this.orderLines){
            if(line.getProduct().getId().equals(product.getId()))
                return line;
        }
        return null;
    }


    /* Getter & Setter */
    public boolean isClosed(){
        return closed;
    }

    public boolean isProcessed() {
        return processed;
    }

    public void setProcessed(boolean processed) {
        this.processed = processed;
    }

    public void setClosed(boolean closed) {
        this.closed = closed;
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

    public List<OrderLine> getOrderLines() {
        return orderLines;
    }

    public void setOrderLines(List<OrderLine> orderLines) {
        this.orderLines = orderLines;
    }
}
