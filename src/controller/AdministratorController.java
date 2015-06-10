package controller;

import model.*;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.util.Date;

@ManagedBean
@SessionScoped
public class AdministratorController {

    public String firstname;
    public String lastname;
    public Date birthDate;
    public String street;
    public String city;
    public String state;
    public Long zipcode;
    public String email;
    public String password;

    @EJB(beanName="adminfacade")
    private AdministratorFacade administratorFacade;
    public Administrator administrator;

    @EJB(beanName = "pfacade")
    private ProductFacade productFacade;
    public Product product;

    @EJB(beanName = "cfacade")
    private CustomerFacade customerFacade;
    public Customer customer;

    @EJB(beanName = "provfacade")
    private ProviderFacade providerFacade;
    public Provider provider;

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
                return "admin";
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

    public String allProviders(){
        return "providers";
    }

    public String newProduct(){ return "newProduct"; }

    public String newCustomer(){
        return "newCustomer";
    }

    public String newProvider(){
        return "newProvider";
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
}
