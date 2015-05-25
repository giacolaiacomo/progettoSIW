package model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Provider {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToMany
    private List<Product> products;

    @Column(nullable = false)
    private String vatin;

    private String phoneNumber;

    @Column(nullable = false)
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "address")
    private Address address;

    @Column(nullable = false,unique = true)
    private String email;

    public Provider(List<Product> providedProducts, String vatin, String phoneNumber, Address address, String email) {
        this.products = providedProducts;
        this.vatin = vatin;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
    }

    public Provider() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> providedProducts) {
        this.products = providedProducts;
    }

    public String getVatin() {
        return vatin;
    }

    public void setVatin(String vatNumber) {
        this.vatin = vatNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
