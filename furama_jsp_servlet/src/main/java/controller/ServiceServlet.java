package controller;

import bean.Customer;
import bean.Service;
import service.service.ServiceService;
import service.service.impl.ServiceServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = "/furama/service")
public class ServiceServlet extends HttpServlet {
    ServiceService serviceService = new ServiceServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewService(request, response);
                break;
//            case "edit":
//                showFormEditCustomer(request, response);
//                break;
        }
    }

    private void createNewService(HttpServletRequest request, HttpServletResponse response) {
        String serviceName = request.getParameter("serviceName");
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        System.out.println("serviceType" +serviceTypeId);
        System.out.println(rentTypeId);
        String standardRoom = request.getParameter("standardRoom");
        String descriptionConvenience = request.getParameter("descriptionConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberFloor = Integer.parseInt(request.getParameter("numberFloor"));
        Service service = new Service(serviceName, serviceArea, serviceCost, serviceMaxPeople, serviceTypeId,
                rentTypeId, standardRoom, descriptionConvenience,poolArea,numberFloor);
        System.out.println(3);
        serviceService.creatNewService(service);
        try {
            response.sendRedirect("/furama/service");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreateNewService(request, response);
                break;
//            case "edit":
//                showFormEditCustomer(request, response);
//                break;
            default:
                showServiceList(request, response);
                break;
        }
    }

    private void showServiceList(HttpServletRequest request, HttpServletResponse response) {
        List<Service> serviceList = serviceService.findAll();
        request.setAttribute("serviceList", serviceList);
        try {
            request.getRequestDispatcher("/furama/service/list_service.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreateNewService(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/furama/service/create_service.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
