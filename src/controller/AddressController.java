package controller;

import model.Address;
import model.AddressFacade;
import model.Product;
import model.Provider;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import java.util.List;

@ManagedBean
public class AddressController {

    @ManagedProperty(value = "#{param.id}")
    private Long id;
    private String street;
    private String city;
    private String state;
    private Long zipcode;
    private Address address;
    private Provider provider;

    private List<Provider> providers;

    @EJB(beanName = "afacade")
    private AddressFacade addressFacade;

    @PostConstruct
    public void init() {
        this.address= new Address();
    }

    public String createAddress() {
        this.address = addressFacade.createAddress(street, city, state, zipcode);
        return "address";
    }

    public String listProviders(){
        this.providers=addressFacade.getProvidersAll();
        return "providers";
    }

    public String findProvider(Long id){
        this.provider=addressFacade.getProvider(id);
        return "customer";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public List<Provider> getProviders() {
        return providers;
    }

    public void setProviders(List<Provider> providers) {
        this.providers = providers;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }
}

