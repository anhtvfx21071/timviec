package com.example.asm2.dao;


import com.example.asm2.entity.*;

import java.util.List;

public interface JobSearchDao {
    <T> void saveOrUpdate(T t);

    Role getRoleByName(String roleName);

    boolean existsByUsername(String email);

    User getUserByEmail(String email);

    Company getCompanyByIdUser(int idUser);

    User getUserCompanyByUserId(int idUser);

    List<Category> getListCategory();

    Category getCategoryById(int id);

    List<Recruitment> getListRecruitmentByIdCompany(int id);

    void deleteRecruitment(int idRecruitment);

    Recruitment getRecruitment(int idRecruitment);

    List<Recruitment> getListRecruitment();

    Cv getCVByIdUser(int idUser);

    void deleteCvByIdCv(int idCv);

    void updateCategory();

    List<Category> getFourFeaturedCategories();

    List<Recruitment> getTenFeaturedRecruitment();

    List<Company> getFiveFeaturedCompany();

    List<ApplyPost> getListApplyByIdCompany(int idCompany);

    List<Recruitment> getListRecruitmentByIdUserHaveApplied(int idUser);

    SaveJob getSavedJob(int idRe, int idUser);

    void deleteSaveJob(int idSaveJob);

    List<SaveJob> getListSaveJob(int idUser);

    Company getCompanyByIdCompany(int idCompany);

    FollowCompany getFollowComany(int idCompany, int idUser);

    void deleteFollowCompany(int idFollowCompany);

    List<FollowCompany> getListFollowCompany(int idUser);

    List<ApplyPost> getListApplyByIdRecruitment(int idrecruitment);
}
