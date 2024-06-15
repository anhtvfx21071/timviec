package com.example.asm2.entity;

import javax.persistence.*;

@Entity
@Table(name = "cv")
public class Cv {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "file_name")
    private String fileName;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "user_id")
    private User userCv;

    public Cv() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public User getUserCv() {
        return userCv;
    }

    public void setUserCv(User userCv) {
        this.userCv = userCv;
    }
}
