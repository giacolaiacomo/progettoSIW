package controller;

import model.Address;
import model.Customer;
import model.CustomerFacade;

import javax.annotation.ManagedBean;
import javax.ejb.EJB;
import java.util.Date;
import java.util.List;

/**
 * Created by Gianluca on 24/05/15.
 */
@ManagedBean
public class CustomerController {

    public String firstname;
    public String lastname;
    public Date dob;
    public Address address;
    public String email;
    public String password;
    public Long phonenumber;
    public Customer customer;
    public List<Customer> customers;

    @EJB(beanName = "cfacade")
    public CustomerFacade customerFacade;

    public String createCustomer(){
        this.customer=customerFacade.createCustomer(firstname, lastname, dob, address, email, password, phonenumber);
        return "customer";
    }

    public String listCustomers(){
        this.customers=customerFacade.getCustomerAll();
        return "customers";
    }

    public String findCustomer(Long id){
        this.customer=customerFacade.getCustomer(id);
        return "customer";
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Long getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(Long phonenumber) {
        this.phonenumber = phonenumber;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
    }

    public CustomerFacade getCustomerFacade() {
        return customerFacade;
    }

    public void setCustomerFacade(CustomerFacade customerFacade) {
        this.customerFacade = customerFacade;
    }
}
