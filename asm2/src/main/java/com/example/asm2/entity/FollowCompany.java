package com.example.asm2.entity;

import javax.persistence.*;

@Entity
@Table(name = "follow_company")
public class FollowCompany {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "company_id")
    private Company companyFollow;
    @ManyToOne(cascade = CascadeType.ALL, optional = true)
    @JoinColumn(name = "user_id")
    private User userFollow;

    public FollowCompany() {
    }

    public FollowCompany(Company companyFollow, User userFollow) {
        this.companyFollow = companyFollow;
        this.userFollow = userFollow;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Company getCompanyFollow() {
        return companyFollow;
    }

    public void setCompanyFollow(Company companyFollow) {
        this.companyFollow = companyFollow;
    }

    public User getUserFollow() {
        return userFollow;
    }

    public void setUserFollow(User userFollow) {
        this.userFollow = userFollow;
    }
}
