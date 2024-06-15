package com.example.asm2.entity;

import javax.persistence.*;

@Entity
@Table(name = "applypost")
public class ApplyPost {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "name_cv")
    private String nameCv;
    @Column(name = "status")
    private int status;
    @Column(name = "text")
    private String text;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "recruitment_id")
    private Recruitment recruitment;

    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "user_id")
    private User user;

    public ApplyPost() {
    }

    public ApplyPost(String nameCv, int status, String text, Recruitment recruitment, User user) {
        this.nameCv = nameCv;
        this.status = status;
        this.text = text;
        this.recruitment = recruitment;
        this.user = user;
    }

    public ApplyPost(int id, String nameCv, int status, String text, Recruitment recruitment, User user) {
        this.id = id;
        this.nameCv = nameCv;
        this.status = status;
        this.text = text;
        this.recruitment = recruitment;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameCv() {
        return nameCv;
    }

    public void setNameCv(String nameCv) {
        this.nameCv = nameCv;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Recruitment getRecruitment() {
        return recruitment;
    }

    public void setRecruitment(Recruitment recruitment) {
        this.recruitment = recruitment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
