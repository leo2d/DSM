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
    private Registration registration;
    private double value;
    private boolean isInstallment;

    public Payment() {
    }

    public Payment(int id, Registration registration, double value, boolean isInstallment) {
        this.id = id;
        this.registration = registration;
        this.value = value;
        this.isInstallment = isInstallment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Registration getRegistration() {
        return registration;
    }

    public void setRegistration(Registration registration) {
        this.registration = registration;
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
