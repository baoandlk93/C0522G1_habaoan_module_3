package model.person;

public class Division {
    private int id;
    private String divisionName;

    public Division() {
    }

    public Division(int id, String divisionName) {
        this.id = id;
        this.divisionName = divisionName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }
}
