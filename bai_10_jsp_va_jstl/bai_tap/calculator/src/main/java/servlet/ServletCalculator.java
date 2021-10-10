package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletCalculator", urlPatterns = "/calculator")
public class ServletCalculator extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double number1 = Double.parseDouble(request.getParameter("number1"));
        double number2 = Double.parseDouble(request.getParameter("number2"));
        String operator = request.getParameter("operator");
        double result = 0;

        try {
            switch (operator){
                case "+":
                    result = number1 + number2;
                    break;
                case "-":
                    result = number1 - number2;
                    break;
                case "*":
                    result = number1 * number2;
                    break;
                case "/":
                    result = number1 / number2;
                    break;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        request.setAttribute("result",result);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("calculator.jsp").forward(request,response);
    }
}
