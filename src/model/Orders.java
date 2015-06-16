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

    @Column
    @Temporal (TemporalType.TIMESTAMP)
    private Calendar creationtime;

    @Column
    @Temporal (TemporalType.TIMESTAMP)
    private Calendar completedTime;

    @Column
    @Temporal (TemporalType.TIMESTAMP)
    private Calendar processedTime;

    @Column
    boolean closed;

    @Column
    boolean processed;

    @ManyToOne
    private Customer customer_id;

    @OneToMany(mappedBy = "orders_id", fetch=FetchType.EAGER, cascade=CascadeType.ALL)
    private List<OrderLine> orderLines;

    public Orders(Customer customer_id) {
        this.creationtime = Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome"));
        this.customer_id = customer_id;
        this.closed = false;
        this.processed = false;
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

    public Calendar getCompletedTime() {
        return completedTime;
    }

    public void setCompletedTime(Calendar completedTime) {
        this.completedTime = completedTime;
    }

    public Calendar getProcessedTime() {
        return processedTime;
    }

    public void setProcessedTime(Calendar processedTime) {
        this.processedTime = processedTime;
    }

    public boolean isClosed(){
        return closed;
    }

    public boolean isProcessed() {
        return processed;
    }

    public void setProcessed() {
        this.processed = true;
    }

    public void setClosed() {
        this.closed = true;
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
