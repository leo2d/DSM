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
public class Address {

    private String cep;
    private String street;
    private String number;
    private String district;
    private Student student;

    public Address() {
    }

    public Address(String cep, String street, String number, String district, Student student) {
        this.cep = cep;
        this.street = street;
        this.number = number;
        this.district = district;
        this.student = student;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

}
