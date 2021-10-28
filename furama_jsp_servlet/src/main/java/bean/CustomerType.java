package bean;

public class CustomerType {
    private int customerType;
    private String customerTypeName;

    public CustomerType(int customerType, String customerTypeName) {
        this.customerType = customerType;
        this.customerTypeName = customerTypeName;
    }

    public int getCustomerType() {
        return customerType;
    }

    public void setCustomerType(int customerType) {
        this.customerType = customerType;
    }

    public String getCustomerTypeName() {
        return customerTypeName;
    }

    public void setCustomerTypeName(String customerTypeName) {
        this.customerTypeName = customerTypeName;
    }
}
