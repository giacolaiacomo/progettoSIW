package controller;

import model.Address;
import model.Product;
import model.Provider;
import model.ProviderFacade;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import java.util.List;

/**
 * Created by Fabio on 09/06/15.
 */
@ManagedBean
@SessionScoped
public class ProviderController {

    private Long id;
    private Provider provider;
    private String name;
    private String email;
    private String vatin;
    private Long phonenumber;
    private Address address;
    private String street;
    private String city;
    private String state;
    private Long zipcode;
    private List<Product> products;
    private List<Provider> providers;

    @EJB(beanName = "provfacade")
    private ProviderFacade providerFacade;

    public String createProvider(){
        this.provider=providerFacade.createProvider(name, email, phonenumber, street, city, state, zipcode, vatin);
        return "provider";
    }

    public String findProvider() {
        this.provider = providerFacade.getProvider(id);
        return "provider";
    }

    public String findProvider(Long id) {
        this.provider = providerFacade.getProvider(id);
        return "provider";
    }

    public String listProducts() {
        this.products = this.provider.getProduct_id();
        return "products";
    }

    public String listProviders(){
        this.providers=providerFacade.getAllProvider();
        return "providers";
    }
    public List<Provider> getAllProviders(){
        return this.providerFacade.getAllProvider();
    }

    /* Getter & Setter */

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Long getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(Long phonenumber) {
        this.phonenumber = phonenumber;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
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

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<Provider> getProviders() {
        return providers;
    }

    public void setProviders(List<Provider> providers) {
        this.providers = providers;
    }

    public ProviderFacade getProviderFacade() {
        return providerFacade;
    }

    public void setProviderFacade(ProviderFacade providerFacade) {
        this.providerFacade = providerFacade;
    }
}
