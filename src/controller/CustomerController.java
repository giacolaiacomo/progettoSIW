package controller;

import model.Customer;
import model.CustomerFacade;
import model.Orders;
import model.OrdersFacade;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.util.Date;
import java.util.List;

@ManagedBean
@SessionScoped
public class CustomerController {

    private Long id;
    private String firstname;
    private String lastname;
    private Date birthDate;
    private String street;
    private String city;
    private String state;
    private Long zipcode;
    private String email;
    private String password;
    private Long phonenumber;
    private Customer customer;
    private List<Customer> customers;

    @EJB(beanName = "cfacade")
    private CustomerFacade customerFacade;

    @EJB(beanName = "ordfacade")
    private OrdersFacade ordersFacade;

    private List<Orders> orders;

    public String createCustomer(){
        this.customer=customerFacade.createCustomer(firstname, lastname, birthDate, email, password, phonenumber, street, city, state, zipcode);
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("customerController");
        return "registrationComplete";
    }

    public String login(){
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("administratorController");
        try{
            Customer customer = customerFacade.getCustomerByEmail(email);
            if (customer.checkPassword(this.password)) {
                setCustomer(customer);
                return "index";
            }
            else{
                // Password Errata
                FacesContext.getCurrentInstance().addMessage("loginCustomer:accedi", new FacesMessage("Login Errato! Email o password non inseriti correttamente!"));
                return "signin";
            }
        }
        catch (Exception e) {
            // Cliente non trovato
            FacesContext.getCurrentInstance().addMessage("loginCustomer:accedi", new FacesMessage("Login Errato! Email o password non inseriti correttamente!"));
            return "signin";
        }
    }

    public String logoutCustomer() {

        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        return "index";
    }

    public String updateCustomer(){
        this.customerFacade.updateCustomer(this.customer);
        return "customers";
    }

    public String listCustomers(){
        this.customers=customerFacade.getCustomerAll();
        return "customers";
    }

    public String findCustomer(){
        this.customer=customerFacade.getCustomer(this.id);
        return "customer";
    }

    public String findOrderCustomer(){
        this.orders=this.ordersFacade.getAllOrderCustomer(id);
        return "orders";
    }


    /* Getter & Setter */

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public OrdersFacade getOrdersFacade() {
        return ordersFacade;
    }

    public void setOrdersFacade(OrdersFacade ordersFacade) {
        this.ordersFacade = ordersFacade;
    }

    public List<Orders> getOrders() {
        return orders;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
