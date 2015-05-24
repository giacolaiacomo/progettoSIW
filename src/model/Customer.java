package model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

import static javax.persistence.TemporalType.*;

@Entity
public class Customer extends User {
    public Customer() {
    }


    @Column(nullable = false)
    private Long phonenumber;

    @Temporal(DATE)
    private Date registrationdate;

    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
    private Address address_id;

    @OneToMany
    private List<Orders> orders;


    public Customer(String firstname, String lastname, Date birthDate, String email, Address address, Long phonenumber) {
        super(firstname, lastname, birthDate, email, address);
        this.registrationdate = new Date();
        this.phonenumber = phonenumber;
    }


    public Long getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(Long phonenumber) {
        this.phonenumber = phonenumber;
    }

    public Date getRegistrationdate() {
        return registrationdate;
    }

    public void setRegistrationdate(Date registrationdate) {
        this.registrationdate = registrationdate;
    }

    public Long getAddress_id() {
        return address_id.getId();
    }

    public List<Orders> getOrders() {
        return orders;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
    }

    public void setAddress_id(Address address_id) {
        this.address_id = address_id;
    }


}
