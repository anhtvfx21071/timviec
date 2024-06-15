package com.example.asm2.entity;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "recruitment")
public class Recruitment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "address")
    private String address;
    @Column(name = "description")
    private String description;
    @Column(name = "experience")
    private String experience;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "salary")
    private String salary;
    @Column(name = "status")
    private int status;
    @Column(name = "title")
    private String title;
    @Column(name = "type")
    private String type;
    @Column(name = "deadline")
    private String deadline;
    @ManyToMany(mappedBy = "recruitments")
    private Set<User> usersSave;
    @ManyToMany(mappedBy = "recruitmentApply")
    private Set<User> usersApplypost;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "category_id")
    private Category categoryRe;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "company_id")
    private Company companyRe;

    public Recruitment() {
    }

    public Recruitment(String address, String title, String type, Company companyRe) {
        this.address = address;
        this.title = title;
        this.type = type;
        this.companyRe = companyRe;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public Set<User> getUsersSave() {
        return usersSave;
    }

    public void setUsersSave(Set<User> usersSave) {
        this.usersSave = usersSave;
    }

    public Set<User> getUsersApplypost() {
        return usersApplypost;
    }

    public void setUsersApplypost(Set<User> usersApplypost) {
        this.usersApplypost = usersApplypost;
    }

    public Category getCategoryRe() {
        return categoryRe;
    }

    public void setCategoryRe(Category categoryRe) {
        this.categoryRe = categoryRe;
    }

    public Company getCompanyRe() {
        return companyRe;
    }

    public void setCompanyRe(Company companyRe) {
        this.companyRe = companyRe;
    }
}
