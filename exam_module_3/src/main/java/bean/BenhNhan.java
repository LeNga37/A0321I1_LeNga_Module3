package bean;

public class BenhNhan {
    private String idBenhNhan;
    private String tenBenhNhan;

    public BenhNhan() {
    }

    public BenhNhan(String idBenhNhan, String tenBenhNhan) {
        this.idBenhNhan = idBenhNhan;
        this.tenBenhNhan = tenBenhNhan;
    }

    public BenhNhan(String tenBenhNhan) {
        this.idBenhNhan = idBenhNhan;
    }

    public String getIdBenhNhan() {
        return idBenhNhan;
    }

    public void setIdBenhNhan(String idBenhNhan) {
        this.idBenhNhan = idBenhNhan;
    }

    public String getTenBenhNhan() {
        return tenBenhNhan;
    }

    public void setTenBenhNhan(String tenBenhNhan) {
        this.tenBenhNhan = tenBenhNhan;
    }
}
