package com.example.asm2.entity;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "number_choose")
    private Integer numberChoose;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "categoryRe")
    private Set<Recruitment> recruitments;

    public Category() {
    }

    public Category(int id, String name, Integer numberChoose) {
        this.id = id;
        this.name = name;
        this.numberChoose = numberChoose;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumberChoose() {
        return numberChoose;
    }

    public void setNumberChoose(int numberChoose) {
        this.numberChoose = numberChoose;
    }

    public Set<Recruitment> getRecruitments() {
        return recruitments;
    }

    public void setRecruitments(Set<Recruitment> recruitments) {
        this.recruitments = recruitments;
    }
}
