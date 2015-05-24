package model;

import javax.persistence.*;
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
    private Long phonenumber;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String vatin;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
    private Address address_id;

    @ManyToMany
    private List<Product> products;

    public Provider(String name, Long phonenumber, String email, String vatin, Address address_id) {
        this.name = name;
        this.phonenumber = phonenumber;
        this.email = email;
        this.vatin = vatin;
        this.address_id=address_id;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getVatin() {
        return vatin;
    }

    public void setVatin(String vatin) {
        this.vatin = vatin;
    }

    public Long getAddress_id() {
        return address_id.getId();
    }

    public void setAddress_id(Address address_id) {
        this.address_id.setId(address_id.getId());
    }

    @Override
    public String toString() {
        return "Provider{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phonenumber=" + phonenumber +
                ", email='" + email + '\'' +
                ", vatin='" + vatin + '\'' +
                ", address_id=" + address_id +
                ", products=" + products +
                '}';
    }
}
