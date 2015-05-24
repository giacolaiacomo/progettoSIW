package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Fabio on 24/05/15.
 */
@Stateless(name = "provfacade")
public class ProviderFacade {

    @PersistenceContext(unitName = "providers")
    EntityManager em;

    public ProviderFacade(){

    }

    public Provider createProvider(String name, Long phonenumber, String email, String vatin, Address address_id){
        Provider provider = new Provider(name, phonenumber, email, vatin, address_id);
        em.persist(provider);
        return provider;
    }

}
