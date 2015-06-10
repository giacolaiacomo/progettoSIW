package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Fabio on 24/05/15.
 */
@Stateless(name = "provfacade")
public class ProviderFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public ProviderFacade(){

    }

    public Provider createProvider(String name, String email, Long phonenumber,
                                   String street, String city, String state, Long zipcode, String vatin){
        Address address = new Address(street, city, state, zipcode);
        em.persist(address);
        Provider provider = new Provider(name, email, phonenumber, address, vatin);
        em.persist(provider);
        return provider;
    }

    private void deleteProvider(Provider provider) {
        em.remove(provider);
    }

    public void deleteProvider(Long id) {
        Provider provider = em.find(Provider.class, id);
        deleteProvider(provider);
    }

    public void deleteProviderByEmail(String email) {
        Provider provider = this.getProviderByEmail(email);
        deleteProvider(provider);
    }

    public Provider getProviderByEmail(String email) {
        Provider p;
        Query q = em.createQuery("SELECT p FROM Provider p WHERE p.email=:email");
        q.setParameter("email", email);
        if (q.getResultList().isEmpty())
            return null;
        else {
            p = (Provider) q.getSingleResult();
            return p;
        }
    }

    public List<Provider> getAllProvider() {
        Query query= em.createQuery("SELECT p FROM Provider p");
        return query.getResultList();
    }


    public Provider getProvider(Long id) {
        Provider provider = em.find(Provider.class, id);
        return provider;
    }

    public Provider getProviderByName(String name) {
        Query q = em.createQuery("SELECT p FROM Provider p WHERE p.name = :name");
        q.setParameter("name", name);
        Provider provider = (Provider) q.getSingleResult();
        return provider;
    }

}
