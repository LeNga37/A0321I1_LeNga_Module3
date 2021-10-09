package controller;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"","/list","/customer"})
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://hoso.wiki/wp-content/uploads/2020/05/killua-zoldyck.jpg"));
        customerList.add(new Customer("Nguyễn Minh Ánh","1983-08-19","Đà Nẵng","https://elead.com.vn/wp-content/uploads/2020/04/hinh-anh-anime-chibi-de-thuong-.jpg"));
        customerList.add(new Customer("Nguyễn Thái Bình","1983-08-15","Ninh Bình","https://anhdephd.com/wp-content/uploads/2017/04/hinh-anh-anime-chibi-cute.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-17","Quảng Nam","https://i.pinimg.com/564x/28/08/16/280816511f2fb4a957ee50d17502b3f0.jpg"));

        request.setAttribute("customerListServlet",customerList);
        request.getRequestDispatcher("customer_list.jsp").forward(request,response);
    }
}
