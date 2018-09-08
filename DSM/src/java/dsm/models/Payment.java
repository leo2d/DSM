/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

/**
 *
 * @author leo-r
 */
public class Payment {
    private int id;
    private Student student;
    private double value;
    private boolean isInstallment;  
    
    public Payment(int id, Student student, double value, boolean isInstallment) {
        this.id = id;
        this.student = student;
        this.value = value;
        this.isInstallment = isInstallment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public boolean isIsInstallment() {
        return isInstallment;
    }

    public void setIsInstallment(boolean isInstallment) {
        this.isInstallment = isInstallment;
    }
    
    
}
