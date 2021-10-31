package service.service;

import bean.Service;

import java.util.List;

public interface ServiceService {
    List<Service> findAll();
    void creatNewService(Service service);
}
