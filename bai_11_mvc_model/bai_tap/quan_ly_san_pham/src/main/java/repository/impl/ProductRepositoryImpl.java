package repository.impl;

import bean.Product;
import repository.ProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository {
    private static Map<Integer, Product> productMap =new HashMap<>();

    static {
        productMap.put(1,new Product(1,"iphone5",2000000,"new","USA"));
        productMap.put(2,new Product(2,"iphone6",3000000,"new","Uk"));
        productMap.put(3,new Product(3,"iphone7",4000000,"new","USA"));
        productMap.put(4,new Product(4,"iphone8",5000000,"new","Japan"));
        productMap.put(5,new Product(5,"iphone9",6000000,"new","USA"));
        productMap.put(6,new Product(6,"iphone10",7000000,"new","Japan"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getProductId(),product);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id,product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public Product view(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> search = new ArrayList<>(productMap.values());
        for(Product product: search){
            if(product.getProductName().equals(name)){
                product.getProductId();
                product.getProductName();
                product.getPrice();
                product.getDescription();
                product.getMaker();
            }else {
                return null;
            }
        }
        return search;
    }


}
