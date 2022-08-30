package model.person;

import java.awt.*;

public class EducationDegree {
    private int id;
    private String educationDegreeName;

    public EducationDegree() {
    }

    public EducationDegree(int id, String educationDegreeName) {
        this.id = id;
        this.educationDegreeName = educationDegreeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEducationDegreeName() {
        return educationDegreeName;
    }

    public void setEducationDegreeName(String educationDegreeName) {
        this.educationDegreeName = educationDegreeName;
    }
}

