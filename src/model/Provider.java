package model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Provider extends User {
    public Provider() {
    }

    @Column(nullable = false)
    private Long phonenumber;

    @Column(nullable = false)
    private String vatin;

    @ManyToMany
    private List<Product> products;

    public Provider(String firstname, String lastname, Date birthDate, String email, Address address, Long phonenumber, String vatin) {
        super(firstname, lastname, birthDate, email, address);
        this.phonenumber = phonenumber;
        this.vatin = vatin;
    }

    public Long getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(Long phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getVatin() {
        return vatin;
    }

    public void setVatin(String vatin) {
        this.vatin = vatin;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
