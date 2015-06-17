package model;

import javax.ejb.Stateless;
import javax.persistence.*;
import java.util.List;

@Stateless(name = "prodfacade")
public class ProductFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public ProductFacade() {
    }

    public List<Provider> retrieveProvidersByProduct(Long idProdotto){
        Query query=em.createQuery("SELECT p FROM Product p WHERE p.id=:id");
        query.setParameter("id", idProdotto);
        Product p= (Product) query.getSingleResult();
        return p.getProviders();
    }

    public Product createProduct(String name, String code, Float price, String description, int quantity, String providername) {
        Product product = new Product(name, code, price, description, quantity);
        Provider provider = getProvider(providername);
        if(provider != null){
            product.addProvider(provider);
            provider.addProduct(product);
            em.persist(product);
            return product;
        }else {
            return null;
        }
    }

    private Provider getProvider(String providername) {
        Provider p;
        Query q = em.createQuery("SELECT p FROM Provider p WHERE p.name=:providername");
        q.setParameter("providername", providername);
        if(q.getResultList().isEmpty())
            return null;
        else{
            p = (Provider) q.getSingleResult();
            return p;
        }
    }

    public Product getProduct(Long id) {
        Product product = em.find(Product.class, id);
        return product;
    }

    public Product getProductByName(String name) {
        Product p;
        Query q = em.createQuery("SELECT p FROM Product p WHERE p.name=:name");
        q.setParameter("name", name);
        if (q.getResultList().isEmpty())
            return null;
        else {
            p = (Product) q.getSingleResult();
            return p;
        }
    }

    public List<Product> getAllProducts() {
        Query query= em.createQuery("SELECT p FROM Product p");
        return query.getResultList();
    }

    public void updateProduct(Product product) {
        em.merge(product);
    }

    private void deleteProduct(Product product) {
        em.remove(product);
    }

    public void deleteProduct(Long id) {
        Product product = em.find(Product.class, id);
        deleteProduct(product);
    }

    public void setProvider(Provider provider, Product product){
        product.getProviders().add(provider);
        em.persist(provider);
    }

}
