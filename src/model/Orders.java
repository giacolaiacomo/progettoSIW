package model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

import static javax.persistence.TemporalType.DATE;

@Entity

public class Orders {
    public Orders() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Temporal(DATE)
    private Date creationtime;

    @ManyToOne
    private Customer customer_id;

    @OneToMany(mappedBy = "orders_id")
    private List<OrderLine> orderLines;

    public Orders(Date creationtime, Customer customer_id) {
        this.creationtime = creationtime;
        this.customer_id = customer_id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreationtime() {
        return creationtime;
    }

    public void setCreationtime(Date creationtime) {
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
