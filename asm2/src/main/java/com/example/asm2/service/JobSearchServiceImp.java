package com.example.asm2.service;

import com.example.asm2.dao.JobSearchDao;
import com.example.asm2.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class JobSearchServiceImp implements JobSearchService {
    @Autowired
    private JobSearchDao jobSearchDao;

    //lưu đối tượng
    @Override
    @Transactional
    public <T> void saveOrUpdate(T t) {
        jobSearchDao.saveOrUpdate(t);
    }

    //Lấy role theo tên
    @Override
    @Transactional
    public Role getRoleByName(String roleName) {
        return jobSearchDao.getRoleByName(roleName);
    }

    //Lấy user theo email
    @Override
    @Transactional
    public User getUserByEmail(String email) {
        return jobSearchDao.getUserByEmail(email);
    }

    //lấy công ty theo id của user
    @Override
    @Transactional
    public Company getCompanyByIdUser(int idUser) {
        return jobSearchDao.getCompanyByIdUser(idUser);
    }

    //lấy user theo id
    @Override
    @Transactional
    public User getUserCompanyByUserId(int idUser) {
        return jobSearchDao.getUserCompanyByUserId(idUser);
    }

    //lấy danh sách thể loại
    @Override
    @Transactional
    public List<Category> getListCategory() {
        return jobSearchDao.getListCategory();
    }

    //lấy thể loại theo id
    @Override
    @Transactional
    public Category getCategoryById(int id) {
        return jobSearchDao.getCategoryById(id);
    }

    //lấy danh sách bài đăng của công ty
    @Override
    @Transactional
    public List<Recruitment> getListRecruitmentByIdCompany(int id) {
        return jobSearchDao.getListRecruitmentByIdCompany(id);
    }

    //xóa bài đăng theo id
    @Override
    @Transactional
    public void deleteRecruitment(int idRecruitment) {
        jobSearchDao.deleteRecruitment(idRecruitment);
    }

    //lấy bài đăng theo id
    @Override
    @Transactional
    public Recruitment getRecruitment(int idRecruitment) {
        return jobSearchDao.getRecruitment(idRecruitment);
    }

    //lấy danh sách bài tuyển dụng
    @Override
    @Transactional
    public List<Recruitment> getListRecruitment() {
        return jobSearchDao.getListRecruitment();
    }

    //lấy cv theo id user
    @Override
    @Transactional
    public Cv getCVByIdUser(int idUser) {
        return jobSearchDao.getCVByIdUser(idUser);
    }

    //Xóa Cv
    @Override
    @Transactional
    public void deleteCvByIdCv(int idCv) {
        jobSearchDao.deleteCvByIdCv(idCv);
    }

    //cập nhật categogy
    @Override
    @Transactional
    public void updateCategory() {
        jobSearchDao.updateCategory();
    }

    //Lâ 4 thể loại có số lượng ứng tuyể lớn
    @Override
    @Transactional
    public List<Category> getFourFeaturedCategories() {
        return jobSearchDao.getFourFeaturedCategories();
    }

    //Lấy 10 bài tuyển dụng có số lượng tuyển lớn
    @Override
    @Transactional
    public List<Recruitment> getTenFeaturedRecruitment() {
        return jobSearchDao.getTenFeaturedRecruitment();
    }

    //lấy 5 công ty có người apply nhiều
    @Override
    @Transactional
    public List<Company> getFiveFeaturedCompany() {
        return jobSearchDao.getFiveFeaturedCompany();
    }

    //lấy danh sách công ty đã apply
    @Override
    @Transactional
    public List<ApplyPost> getListApplyByIdCompany(int idCompany) {
        return jobSearchDao.getListApplyByIdCompany(idCompany);
    }

    //lấy danh scahs bài tuyển dụng đã apply
    @Override
    @Transactional
    public List<Recruitment> getListRecruitmentByIdUserHaveApplied(int idUser) {
        return jobSearchDao.getListRecruitmentByIdUserHaveApplied(idUser);
    }

    //lưu job
    @Override
    @Transactional
    public SaveJob getSavedJob(int idRe, int idUser) {
        return jobSearchDao.getSavedJob(idRe, idUser);
    }

    //xóa job đã lưu
    @Override
    @Transactional
    public void deleteSaveJob(int idSaveJob) {
        jobSearchDao.deleteSaveJob(idSaveJob);
    }

    //lấy danh sách job đã lưu
    @Override
    @Transactional
    public List<SaveJob> getListSaveJob(int idUser) {
        return jobSearchDao.getListSaveJob(idUser);
    }

    //lấy công ty theo id
    @Override
    @Transactional
    public Company getCompanyByIdCompany(int idCompany) {
        return jobSearchDao.getCompanyByIdCompany(idCompany);
    }

    //láy công ty đã theo dõi
    @Override
    @Transactional
    public FollowCompany getFollowComany(int idCompany, int idUser) {
        return jobSearchDao.getFollowComany(idCompany, idUser);
    }

    //xóa theo dõi công ty
    @Override
    @Transactional
    public void deleteFollowCompany(int idFollowCompany) {
        jobSearchDao.deleteFollowCompany(idFollowCompany);
    }

    //lấy danh sách công ty theo dõi
    @Override
    @Transactional
    public List<FollowCompany> getListFollowCompany(int idUser) {
        return jobSearchDao.getListFollowCompany(idUser);
    }

    //lấy danh sách apply của bài tuyển dụng
    @Override
    @Transactional
    public List<ApplyPost> getListApplyByIdRecruitment(int idRecruitment) {
        return jobSearchDao.getListApplyByIdRecruitment(idRecruitment);
    }
}
