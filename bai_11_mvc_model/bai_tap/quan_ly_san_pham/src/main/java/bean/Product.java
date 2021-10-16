package bean;

public class Product {
    private int productId;
    private String productName;
    private double price;
    private String description;
    private String maker;

    public Product() {
    }

    public Product(int productId, String productName, double price, String description, String maker) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.maker = maker;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMaker() {
        return maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }
}


