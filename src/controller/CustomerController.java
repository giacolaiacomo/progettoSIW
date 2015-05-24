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
    public String email;
    public Address address;
    public Long phonenumber;
    public Customer customer;
    public List<Customer> customers;

    @EJB(beanName = "cfacade")
    public CustomerFacade customerFacade;

    public String createCustomer(){
        this.customer=customerFacade.createCustomer(firstname, lastname, dob, email, address, phonenumber);
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

}
