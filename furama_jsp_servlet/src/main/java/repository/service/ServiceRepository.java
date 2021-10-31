package repository.service;

import bean.Service;

import java.util.List;

public interface ServiceRepository {
    List<Service> findAll();
    void creatNewService(Service service);
}
