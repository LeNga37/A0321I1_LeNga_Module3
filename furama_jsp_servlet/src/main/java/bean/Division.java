package bean;

public class Division {
    private int division;
    private String divisionName;

    public Division(int division, String divisionName) {
        this.division = division;
        this.divisionName = divisionName;
    }

    public int getDivision() {
        return division;
    }

    public void setDivision(int division) {
        this.division = division;
    }

    public String getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }
}
