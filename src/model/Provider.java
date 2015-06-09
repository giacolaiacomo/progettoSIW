package model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Provider {

    public Provider() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String vatin;

    @Column(nullable = false)
    private Long phonenumber;

    @Column(nullable = false)
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Address address;

    @Column(nullable = false, unique = true)
    private String email;

    @ManyToMany(mappedBy = "providers", fetch = FetchType.EAGER)
    private List<Product> products;

    public Provider(String name, String email, Long phonenumber, Address address, String vatin) {
        this.name = name;
        this.email = email;
        this.phonenumber = phonenumber;
        this.address = address;
        this.vatin = vatin;
        this.products = new ArrayList<Product>();
    }

    public void addProduct(Product product) {
        this.products.add(product);
    }

    public void removeProduct(Product product) {
        this.products.remove(product);
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(Long phonenumber) {
        this.phonenumber = phonenumber;
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

    @Override
    public String toString() {
        return "Provider{" +
                ", name='" + name + '\'' +
                ", vatin='" + vatin + '\'' +
                ", phonenumber=" + phonenumber +
                ", address=" + address +
                ", email='" + email + '\'' +
                ", products=" + products +
                '}';
    }

}
