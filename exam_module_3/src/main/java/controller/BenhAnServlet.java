package controller;

import bean.BenhAn;
import bean.BenhNhan;
import service.benh_an.BenhAnService;
import service.benh_an.impl.BenhAnServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BenhAnServlet",urlPatterns = {"","/benhan"})
public class BenhAnServlet extends HttpServlet {
    BenhAnService benhAnService = new BenhAnServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "edit":
                EditBenhAn(request,response);
                break;
            case "delete":
                deleteBenhAn(request,response);
                break;

        }
    }

    private void deleteBenhAn(HttpServletRequest request, HttpServletResponse response) {
        String idBenhAn = request.getParameter("idBenhAn");
        benhAnService.deleteBenhAn(idBenhAn);
        try {
            response.sendRedirect("/benhan");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void EditBenhAn(HttpServletRequest request, HttpServletResponse response) {
        String idBenhAn = request.getParameter("idBenhAn");
        String idBenhNhan = request.getParameter("idBenhNhan");
        String tenBenhNhan = request.getParameter("tenBenhNhan");
        String ngayNhapVien = request.getParameter("ngayNhapVien");
        String ngayRaVien = request.getParameter("ngayRaVien");
        String lyDoNhapVien = request.getParameter("lyDoNhapVien");
        BenhAn benhAn = new BenhAn(idBenhNhan,tenBenhNhan,ngayNhapVien,ngayRaVien,lyDoNhapVien);
        benhAn.setIdBenhAn(idBenhAn);
        benhAn.setIdBenhNhan(idBenhNhan);
        benhAn.setTenBenhNhan(tenBenhNhan);
        benhAn.setNgayNhapVien(ngayNhapVien);
        benhAn.setNgayRaVien(ngayRaVien);
        benhAn.setLyDoNhapVien(lyDoNhapVien);
        benhAnService.editBenhAn(benhAn);
        try {
            response.sendRedirect("/benhan");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "edit":
                showFormEdit(request,response);
                break;
            default:
                showListBenhAn(request,response);
                break;
        }
    }


    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        String idBenhAn =request.getParameter("idBenhAn");
        BenhAn benhAn=benhAnService.selectBenhAn(idBenhAn);
        request.setAttribute("benhAn",benhAn);
        try {
            request.getRequestDispatcher("/benh_an/edit_benh_an.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListBenhAn(HttpServletRequest request, HttpServletResponse response) {
        List<BenhAn> benhAnList = benhAnService.findAll();
        request.setAttribute("benhAnList", benhAnList);

        try {
            request.getRequestDispatcher("/benh_an/list_benh_an.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
