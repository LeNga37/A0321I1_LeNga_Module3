package repository;

import bean.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    void save(Product product);
    void update(int id,Product product);
    Product findById(int id);
    void delete(int id);
    Product view(int id);
}
