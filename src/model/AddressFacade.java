package model;

import javax.ejb.Stateless;
import javax.persistence.*;
import java.util.List;

@Stateless(name = "afacade")
public class AddressFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public AddressFacade() {
    }

    public Address createAddress(String street, String city, String state, Long zipcode) {
        Address address = new Address(street, city, state, zipcode);
        em.persist(address);
        return address;
    }

    public List<Provider> getProvidersAll(){
        Query query = em.createQuery("SELECT  p FROM Provider p");
        return query.getResultList();
    }

    public Provider getProvider(Long provider_id){
        Query query=em.createQuery("SELECT p FROM Provider p WHERE p.id=:id");
        query.setParameter("id", provider_id);
        return (Provider) query.getResultList().get(0);
    }

}