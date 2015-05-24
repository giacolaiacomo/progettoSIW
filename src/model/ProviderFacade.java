package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;

/**
 * Created by Fabio on 24/05/15.
 */
@Stateless(name = "provfacade")
public class ProviderFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public Provider ProviderFacade(String firstname, String lastname, Date birthDate, String email, Address address, Long phonenumber, String vatin){
        Provider provider = new Provider(firstname, lastname, birthDate, email, address, phonenumber, vatin);
        if (address != null)
            provider.setAddress(address);
        em.persist(provider);
        return provider;
    }

    public Provider createProvider(){

    }

}
