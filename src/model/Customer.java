package model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

import static javax.persistence.TemporalType.*;

@Entity
public class Customer {
    public Customer() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false)
    private String firstname;

    @Column(nullable = false)
    private String lastname;

    private String email;

    private Long phonenumber;

    @Temporal(DATE)
    private Date dateofbirth;

    @Temporal(DATE)
    private Date registrationdate=new Date();

    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
    private Address address_id;

    @OneToMany
    private List<Orders> orders;


    public Customer(String firstname, String lastname, String email, Long phonenumber, Date dateofbirth, Date registrationdate, Address address_id) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.phonenumber = phonenumber;
        this.dateofbirth = dateofbirth;
        this.registrationdate = registrationdate;
        this.address_id=address_id;
    }

    public Customer(String firstname, String lastname, String email, Long phonenumber, Date dateofbirth) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.phonenumber = phonenumber;
        this.dateofbirth = dateofbirth;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(Long phonenumber) {
        this.phonenumber = phonenumber;
    }

    public Date getDateofbirth() {
        return dateofbirth;
    }

    public void setDateofbirth(Date dateofbirth) {
        this.dateofbirth = dateofbirth;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Customer customer = (Customer) o;

        if (address_id != null ? !address_id.equals(customer.address_id) : customer.address_id != null) return false;
        if (dateofbirth != null ? !dateofbirth.equals(customer.dateofbirth) : customer.dateofbirth != null)
            return false;
        if (email != null ? !email.equals(customer.email) : customer.email != null) return false;
        if (firstname != null ? !firstname.equals(customer.firstname) : customer.firstname != null) return false;
        if (id != null ? !id.equals(customer.id) : customer.id != null) return false;
        if (lastname != null ? !lastname.equals(customer.lastname) : customer.lastname != null) return false;
        if (phonenumber != null ? !phonenumber.equals(customer.phonenumber) : customer.phonenumber != null)
            return false;
        if (registrationdate != null ? !registrationdate.equals(customer.registrationdate) : customer.registrationdate != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (firstname != null ? firstname.hashCode() : 0);
        result = 31 * result + (lastname != null ? lastname.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (phonenumber != null ? phonenumber.hashCode() : 0);
        result = 31 * result + (dateofbirth != null ? dateofbirth.hashCode() : 0);
        result = 31 * result + (registrationdate != null ? registrationdate.hashCode() : 0);
        result = 31 * result + (address_id != null ? address_id.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", email='" + email + '\'' +
                ", phonenumber=" + phonenumber +
                ", dateofbirth=" + dateofbirth +
                ", registrationdate=" + registrationdate +
                ", address_id=" + address_id +
                '}';
    }
}
