package controller;

import model.Address;
import model.Customer;
import model.CustomerFacade;


import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import java.util.Date;
import java.util.List;

/**
 * Created by Gianluca on 24/05/15.
 */
@ManagedBean
public class CustomerController {

    @ManagedProperty(value="#{param.id}")
    public String firstname;
    public String lastname;
    public Date birthDate;
    public String email;
    public String password;
    public Long phonenumber;

    public String street;
    public String city;
    public String state;
    public Long zipcode;

    public Customer customer;

    public List<Customer> customers;
    public List<Address> addresses;


    @EJB(beanName = "cfacade")
    public CustomerFacade customerFacade;

    public String createCustomer(){
        this.customer=customerFacade.createCustomer(firstname, lastname, birthDate, email, password, phonenumber, street, city, state, zipcode);
        return "customer";
    }

    public String listCustomers(){
        this.customers=customerFacade.getCustomerAll();
        return "customers";
    }

    public String listAddress(){
        this.addresses = customerFacade.getAddressAll();
        return "addresses";
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

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(Long phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Long getZipcode() {
        return zipcode;
    }

    public void setZipcode(Long zipcode) {
        this.zipcode = zipcode;
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

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public CustomerFacade getCustomerFacade() {
        return customerFacade;
    }

    public void setCustomerFacade(CustomerFacade customerFacade) {
        this.customerFacade = customerFacade;
    }
}
