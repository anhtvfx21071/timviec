package com.example.asm2.entity;

import javax.persistence.*;

@Entity
@Table(name = "save_job")
public class SaveJob {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "recruitment_id")
    private Recruitment recruitmentSave;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "user_id")
    private User userSave;

    public SaveJob() {
    }

    public SaveJob(Recruitment recruitmentSave, User userSave) {
        this.recruitmentSave = recruitmentSave;
        this.userSave = userSave;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Recruitment getRecruitmentSave() {
        return recruitmentSave;
    }

    public void setRecruitmentSave(Recruitment recruitmentSave) {
        this.recruitmentSave = recruitmentSave;
    }

    public User getUserSave() {
        return userSave;
    }

    public void setUserSave(User userSave) {
        this.userSave = userSave;
    }
}
