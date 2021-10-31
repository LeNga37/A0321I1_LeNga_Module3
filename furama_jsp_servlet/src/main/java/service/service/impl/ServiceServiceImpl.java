package service.service.impl;

import bean.Service;
import repository.service.ServiceRepository;
import repository.service.impl.ServiceRepositoryImpl;
import service.service.ServiceService;

import java.util.List;

public class ServiceServiceImpl implements ServiceService {
    ServiceRepository serviceRepository = new ServiceRepositoryImpl();
    @Override
    public List<Service> findAll() {
        return serviceRepository.findAll();
    }

    @Override
    public void creatNewService(Service service) {
        serviceRepository.creatNewService(service);
    }
}
