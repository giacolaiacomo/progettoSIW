package model;

import javax.persistence.*;

@Entity
public class OrderLine {
    public OrderLine() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false)
    private Double unitprice;

    @Column(nullable = false)
    private int quantity;

    @ManyToOne
    private Orders orders_id;

    @OneToOne(fetch = FetchType.EAGER)
    private Product product;

    public OrderLine(Double unitprice, int quantity, Orders orders_id, Product product) {
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

    public Double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Double unitprice) {
        this.unitprice = unitprice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
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
