package product_discount_calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountCalculator", urlPatterns = {"","/display-discount"})
public class DiscountCalculator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description =request.getParameter("description");
        double price = Double.parseDouble((request.getParameter("price")));
        double percent = Double.parseDouble(request.getParameter("percent"));

        double discount_amount = price * percent * 0.01;
        double discount_price = price - discount_amount;

        request.setAttribute("ProductDescription",description);
        request.setAttribute("ListPrice",price);
        request.setAttribute("DiscountPercent",percent);
        request.setAttribute("DiscountAmount",discount_amount);
        request.setAttribute("DiscountPrice",discount_price);

        request.getRequestDispatcher("result.jsp").forward(request,response);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("discountCalculator.jsp").forward(request,response);
    }
}
