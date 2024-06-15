package com.example.asm2.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "address")
    private String address;
    @Column(name = "description")
    private String description;
    @Column(name = "email")
    private String email;
    @Column(name = "full_name")
    private String fullName;
    @Column(name = "image")
    private String image;
    @Column(name = "password")
    private String password;
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "status")
    private int status;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "role_id")
    private Role role;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userCompany")
    private Set<Company> companies;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userCv")
    private Set<Cv> cvs;
    @ManyToMany()
    @JoinTable(name = "save_job", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "recruitment_id"))
    private Set<Recruitment> recruitments = new HashSet<>();
    @ManyToMany()
    @JoinTable(name = "follow_company", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "company_id"))
    private Set<Company> companyFollows = new HashSet<>();
    @ManyToMany()
    @JoinTable(name = "applypost", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "recruitment_id"))
    private Set<Recruitment> recruitmentApply = new HashSet<>();

    public User() {
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Set<Company> getCompanies() {
        return companies;
    }

    public void setCompanies(Set<Company> companies) {
        this.companies = companies;
    }

    public Set<Cv> getCvs() {
        return cvs;
    }

    public void setCvs(Set<Cv> cvs) {
        this.cvs = cvs;
    }

    public Set<Recruitment> getRecruitments() {
        return recruitments;
    }

    public void setRecruitments(Set<Recruitment> recruitments) {
        this.recruitments = recruitments;
    }

    public Set<Company> getCompanyFollows() {
        return companyFollows;
    }

    public void setCompanyFollows(Set<Company> companyFollows) {
        this.companyFollows = companyFollows;
    }

    public Set<Recruitment> getRecruitmentApply() {
        return recruitmentApply;
    }

    public void setRecruitmentApply(Set<Recruitment> recruitmentApply) {
        this.recruitmentApply = recruitmentApply;
    }

}
