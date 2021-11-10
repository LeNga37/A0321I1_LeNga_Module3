package repository.benh_an.impl;

import bean.BenhAn;
import repository.DBConnection;
import repository.benh_an.BenhAnRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BenhAnRepositoryImpl implements BenhAnRepository {
    private static final String SELECT_ALL_BENHAN = "SELECT * FROM exam_module3.benh_an";
    private static final String SELECT_BENHAN_BY_ID = "SELECT * FROM exam_module3.benh_an WHERE id_benh_an=?";
    private static final String UPDATE_BENHAN_BY_ID = "UPDATE exam_module3.benh_an set ten_benh_nhan= ?, " +
            "ngay_nhap_vien =?,ngay_ra_vien=?,ly_do_nhap_vien=? WHERE id_benh_an = ?;";
    private static final String DELETE_BENHAN = "DELETE FROM exam_module3.benh_an WHERE id_benh_an = ?;";

    @Override
    public List<BenhAn> findAll() {
        List<BenhAn> benhAnList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BENHAN);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String idBenhAn = resultSet.getString("id_benh_an");
                    String idBenhNhan = resultSet.getString("id_benh_nhan");
                    String tenBenhNhan = resultSet.getString("ten_benh_nhan");
                    String ngayNhapVien = resultSet.getString("ngay_nhap_vien");
                    String ngayRaVien = resultSet.getString("ngay_ra_vien");
                    String lyDoNhapVien = resultSet.getString("ly_do_nhap_vien");
                    benhAnList.add(new BenhAn(idBenhAn, idBenhNhan, tenBenhNhan, ngayNhapVien, ngayRaVien, lyDoNhapVien));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return benhAnList;
    }

    @Override
    public BenhAn selectBenhAn(String idBenhAn) {
        BenhAn benhAn = null;
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BENHAN_BY_ID);
            preparedStatement.setString(1, idBenhAn);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                benhAn = new BenhAn();
                benhAn.setIdBenhAn((resultSet.getString("id_benh_an")));
                benhAn.setIdBenhNhan(resultSet.getString("id_benh_nhan"));
                benhAn.setTenBenhNhan((resultSet.getString("ten_benh_nhan")));
                benhAn.setNgayNhapVien(resultSet.getString("ngay_nhap_vien"));
                benhAn.setNgayRaVien((resultSet.getString("ngay_ra_vien")));
                benhAn.setLyDoNhapVien(resultSet.getString("ly_do_nhap_vien"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return benhAn;
    }

    @Override
    public void editBenhAn(BenhAn benhAn) {
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BENHAN_BY_ID);
//                preparedStatement.setString(1, benhAn.getIdBenhNhan());
                preparedStatement.setString(1, benhAn.getTenBenhNhan());
                preparedStatement.setString(2, benhAn.getNgayNhapVien());
                preparedStatement.setString(3, benhAn.getNgayRaVien());
                preparedStatement.setString(4, benhAn.getLyDoNhapVien());
                preparedStatement.setString(5, benhAn.getIdBenhAn());
                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }

    @Override
    public void deleteBenhAn(String idBenhAn) {
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BENHAN);
            preparedStatement.setString(1, idBenhAn);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

}
