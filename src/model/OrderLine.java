package model;

import javax.persistence.*;

@Entity
public class OrderLine {
    public OrderLine() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Long unitprice;

    private Long quantity;

    @ManyToOne
    private Orders orders_id;

    @OneToOne
    private Product product;

    public OrderLine(Long unitprice, Long quantity, Orders orders_id, Product product) {
        this.unitprice = unitprice;
        this.quantity = quantity;
        this.orders_id = orders_id;
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Long unitprice) {
        this.unitprice = unitprice;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Orders getOrders_id() {
        return orders_id;
    }

    public void setOrders_id(Orders orders_id) {
        this.orders_id = orders_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
