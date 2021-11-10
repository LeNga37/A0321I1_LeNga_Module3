package service.benh_an.impl;

import bean.BenhAn;
import repository.benh_an.BenhAnRepository;
import repository.benh_an.impl.BenhAnRepositoryImpl;
import service.benh_an.BenhAnService;

import java.util.List;

public class BenhAnServiceImpl implements BenhAnService {
    BenhAnRepository benhAnRepository = new BenhAnRepositoryImpl();
    @Override
    public List<BenhAn> findAll() {
        return benhAnRepository.findAll();
    }

    @Override
    public BenhAn selectBenhAn(String idBenhAn) {
        return benhAnRepository.selectBenhAn(idBenhAn);
    }

    @Override
    public void editBenhAn(BenhAn benhAn) {
        benhAnRepository.editBenhAn(benhAn);
    }

    @Override
    public void deleteBenhAn(String idBenhAn) {
        benhAnRepository.deleteBenhAn(idBenhAn);
    }

}
