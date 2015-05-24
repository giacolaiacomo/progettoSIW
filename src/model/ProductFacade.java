package model;

import javax.ejb.Stateless;
import javax.persistence.*;
import javax.persistence.criteria.CriteriaQuery;
import java.util.List;

@Stateless(name = "prodfacade")
public class ProductFacade {

    @PersistenceContext(unitName = "products")
    EntityManager em;

    public ProductFacade() {
    }

    public List<Provider> retrieveProviders(Long idProdotto){
        Query query=em.createQuery("SELECT p FROM Product p WHERE p.id=:id");
        query.setParameter("id", idProdotto);
        Product p= (Product) query.getSingleResult();
        return p.getProviders();
    }

    public Product createProduct(String name, String code, Float price, String description) {
        Product product = new Product(name, code, price, description);
        em.persist(product);
        return product;
    }

    public Product getProduct(Long id) {
        Product product = em.find(Product.class, id);
        return product;
    }

    public List<Product> getAllProducts() {
        CriteriaQuery<Product> cq = em.getCriteriaBuilder().createQuery(Product.class);
        cq.select(cq.from(Product.class));
        List<Product> products = em.createQuery(cq).getResultList();
        return products;
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
