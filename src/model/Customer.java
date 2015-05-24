package model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Customer extends User {
    public Customer() {
    }

    @Column(nullable = false)
    private Long phonenumber;

    @OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
    private List<Orders> orders;


    public Customer(String firstname, String lastname, Date birthDate, String email, Address address, Long phonenumber) {
        super(firstname, lastname, birthDate, email, address);
        this.phonenumber = phonenumber;
    }

    public Long getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(Long phonenumber) {
        this.phonenumber = phonenumber;
    }

    public List<Orders> getOrders() {
        return orders;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "Customer{" +
                super.toString() +
                "phonenumber=" + phonenumber +
                ", orders=" + orders +
                "} ";
    }

    @Override //da sistemare
    public boolean equals(Object o) {
        return super.equals(o);
    }

    @Override //da sistemare
    public int hashCode() {
        return super.hashCode();
    }
}
