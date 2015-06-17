package controller;

import model.*;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.util.Date;
import java.util.List;

@ManagedBean
@SessionScoped
public class AdministratorController {

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
    private Long prodId;
    private String emailCust;

    private List<Orders> closedOrders;
    private List<Orders> processedOrders;
    private List<Provider> providers;

    @EJB(beanName="adminfacade")
    private AdministratorFacade administratorFacade;
    private Administrator administrator;

    @EJB(beanName = "prodfacade")
    private ProductFacade productFacade;
    private Product product;

    @EJB(beanName = "cfacade")
    private CustomerFacade customerFacade;
    private Customer customer;

    @EJB(beanName = "provfacade")
    private ProviderFacade providerFacade;
    private Provider provider;

    @EJB(beanName = "ordfacade")
    private OrdersFacade ordersFacade;

    public String createAdministrator() {
        this.administrator = administratorFacade.createAdministrator(firstname, lastname, birthDate, email, password, street, city, state, zipcode);
        return "administratorPage";
    }

    public String loginAdministrator() {
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("customerController");
        try{
            Administrator administrator = administratorFacade.getAdministratorByEmail(email);
            if (administrator.checkPassword(this.password)) {
                setAdministrator(administrator);
                return "index";
            }
            else{
                // Password Errata
                FacesContext.getCurrentInstance().addMessage("loginAdmin:accedi", new FacesMessage("Login Errato! Email o password non inseriti correttamente!"));
                return "loginAdmin";
            }
        }
        catch (Exception e) {
            // Amministratore non trovato
            FacesContext.getCurrentInstance().addMessage("loginAdmin:accedi", new FacesMessage("Login Errato! Email o password non inseriti correttamente!"));
            return "loginAdmin";
        }
    }

    public String logout() {
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        return "index";
    }

    public String allClosedOrders(){
        this.closedOrders = ordersFacade.getAllClosedOrder();
        return "adminOrders";
    }

    public String allProcessedOrders(){
        this.processedOrders = ordersFacade.getAllProcessedOrder();
        return "processedOrders";
    }

    public void deleteCustomer() {
        customerFacade.deleteCustomerByEmail(this.emailCust);
    }

    public void deleteProduct() {
        productFacade.deleteProduct(this.prodId);
    }


    /* Getter & Setter */

    public Long getProdId() {
        return prodId;
    }

    public void setProdId(Long prodId) {
        this.prodId = prodId;
    }

    public List<Orders> getProcessedOrders() {
        return processedOrders;
    }

    public void setProcessedOrders(List<Orders> processedOrders) {
        this.processedOrders = processedOrders;
    }

    public OrdersFacade getOrdersFacade() {
        return ordersFacade;
    }

    public void setOrdersFacade(OrdersFacade ordersFacade) {
        this.ordersFacade = ordersFacade;
    }

    public List<Orders> getClosedOrders() {
        return closedOrders;
    }

    public void setClosedOrders(List<Orders> closedOrders) {
        this.closedOrders = closedOrders;
    }

    public Administrator getAdministrator() {
        return administrator;
    }

    public void setAdministrator(Administrator administrator) {
        this.administrator = administrator;
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

    public List<Provider> getProviders() {
        return providers;
    }

    public void setProviders(List<Provider> providers) {
        this.providers = providers;
    }

    public AdministratorFacade getAdministratorFacade() {
        return administratorFacade;
    }

    public void setAdministratorFacade(AdministratorFacade administratorFacade) {
        this.administratorFacade = administratorFacade;
    }

    public ProductFacade getProductFacade() {
        return productFacade;
    }

    public void setProductFacade(ProductFacade productFacade) {
        this.productFacade = productFacade;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public CustomerFacade getCustomerFacade() {
        return customerFacade;
    }

    public void setCustomerFacade(CustomerFacade customerFacade) {
        this.customerFacade = customerFacade;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public ProviderFacade getProviderFacade() {
        return providerFacade;
    }

    public void setProviderFacade(ProviderFacade providerFacade) {
        this.providerFacade = providerFacade;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmailCust() {
        return emailCust;
    }

    public void setEmailCust(String emailCust) {
        this.emailCust = emailCust;
    }
}
