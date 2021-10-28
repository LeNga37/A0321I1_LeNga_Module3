package bean;

public class ServiceType {
    private int serviceType;
    private String serviceTypeName;

    public ServiceType(int serviceType, String serviceTypeName) {
        this.serviceType = serviceType;
        this.serviceTypeName = serviceTypeName;
    }

    public int getServiceType() {
        return serviceType;
    }

    public void setServiceType(int serviceType) {
        this.serviceType = serviceType;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }
}
