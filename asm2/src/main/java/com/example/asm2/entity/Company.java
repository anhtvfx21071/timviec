package com.example.asm2.entity;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "company")
public class Company {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "address")
    private String address;
    @Column(name = "description")
    private String description;
    @Column(name = "email")
    private String email;
    @Column(name = "logo")
    private String logo;
    @Column(name = "name_company")
    private String nameCompany;
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "status")
    private int status;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "user_id")
    private User userCompany;
    @ManyToMany(mappedBy = "companyFollows")
    private Set<User> usersFollow;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "companyRe")
    private Set<Recruitment> recruitments;

    public Company() {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getNameCompany() {
        return nameCompany;
    }

    public void setNameCompany(String nameCompany) {
        this.nameCompany = nameCompany;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User getUserCompany() {
        return userCompany;
    }

    public void setUserCompany(User userCompany) {
        this.userCompany = userCompany;
    }

    public Set<User> getUsersFollow() {
        return usersFollow;
    }

    public void setUsersFollow(Set<User> usersFollow) {
        this.usersFollow = usersFollow;
    }

    public Set<Recruitment> getRecruitments() {
        return recruitments;
    }

    public void setRecruitments(Set<Recruitment> recruitments) {
        this.recruitments = recruitments;
    }
}
