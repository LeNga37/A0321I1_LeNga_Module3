package controller;

import bean.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"","/product"})
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request,response);
                break;
            case "update":
                updateProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
//            case "search":
//                searchProductByName(request,response);
//                break;
        }
    }

//    private void searchProductByName(HttpServletRequest request, HttpServletResponse response) {
//        String name = request.getParameter("nameSearch");
//    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        response.sendRedirect("/product");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String maker = request.getParameter("maker");
        Product product = this.productService.findById(id);
        product.setProductName(name);
        product.setPrice(price);
        product.setDescription(description);
        product.setMaker(maker);
        this.productService.update(id,product);
        response.sendRedirect("/product");
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String maker = request.getParameter("maker");
        Product product = new Product(id,name,price,description,maker);
        productService.create(product);
        response.sendRedirect("/product");
//        showListProduct(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showFormAddNewProduct(request,response);
                break;
            case "update":
                showFormUpdateProduct(request,response);
                break;
            case "delete":
                showFormDeleteProduct(request,response);
                break;
            case "detail":
                showFormDetailProduct(request,response);
                break;
            case "search":
                showResultSearchByName(request,response);
                break;
            default:
                showListProduct(request,response);
                break;
        }
    }

    private void showResultSearchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameSearch");
        List<Product> searchByNameList = productService.searchByName(name);
        request.setAttribute("productList",searchByNameList);
        request.getRequestDispatcher("/product/list.jsp").forward(request,response);

    }

    private void showFormDetailProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("/product/view.jsp").forward(request,response);
    }

    private void showFormDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("/product/delete.jsp").forward(request,response);
    }

    private void showFormUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("/product/update.jsp").forward(request,response);
    }

    private void showFormAddNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/product/create.jsp").forward(request,response);
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList",productList);
        request.getRequestDispatcher("/product/list.jsp").forward(request,response);
    }

}
