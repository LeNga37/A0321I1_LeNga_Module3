package service.benh_an;

import bean.BenhAn;

import java.util.List;

public interface BenhAnService {
    List<BenhAn> findAll();
    BenhAn selectBenhAn(String idBenhAn);
    void editBenhAn(BenhAn benhAn);
    void deleteBenhAn(String idBenhAn);
}
