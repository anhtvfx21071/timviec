package com.example.asm2.dao;

import com.example.asm2.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public class JobSearchDaoImp implements JobSearchDao {
    @Autowired
    private SessionFactory sessionFactory;

    //Lưu đối tượng
    @Override
    @Transactional
    public <T> void saveOrUpdate(T t) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(t);
    }

    //lấy role theo tên
    @Override
    @Transactional
    public Role getRoleByName(String roleName) {
        Session session = sessionFactory.getCurrentSession();
        Query<Role> theQuery = session.createQuery("from Role where roleName=:name", Role.class);
        theQuery.setParameter("name", roleName);
        Role role = theQuery.getSingleResult();
        return role;
    }

    // Kiểm tra xem email có tồn tại không
    @Override
    public boolean existsByUsername(String email) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<User> theQuery = session.createQuery("from User where email=:email", User.class);
            theQuery.setParameter("email", email);
            User user = theQuery.getSingleResult();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    //Lấy user bằng email
    @Override
    public User getUserByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query<User> theQuery = session.createQuery("from User where email=:email", User.class);
        theQuery.setParameter("email", email);
        User user = theQuery.getSingleResult();
        return user;
    }

    //Lấy công ty bằng id của user
    @Override
    public Company getCompanyByIdUser(int idUser) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<Company> theQuery = session.createQuery("from Company where userCompany.id=:id", Company.class);
            theQuery.setParameter("id", idUser);
            Company company = theQuery.getSingleResult();
            return company;
        } catch (Exception e) {
        }
        return null;
    }

    //Lấy User bằng id
    @Override
    public User getUserCompanyByUserId(int idUser) {
        Session session = sessionFactory.getCurrentSession();
        Query<User> theQuery = session.createQuery(" from User u where u.id = :userId", User.class);
        theQuery.setParameter("userId", idUser);
        User user = theQuery.uniqueResult();
        return user;
    }

    //lấy danh sách category
    @Override
    public List<Category> getListCategory() {
        Session session = sessionFactory.getCurrentSession();
        Query<Category> theQuery = session.createQuery("from Category ", Category.class);
        List<Category> list = theQuery.getResultList();
        return list;
    }

    // Lấy category theo id
    @Override
    public Category getCategoryById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Category> theQuery = session.createQuery("from Category WHERE id =:id", Category.class);
        theQuery.setParameter("id", id);
        return theQuery.getSingleResult();
    }

    //lấy danh sách tuyển dụng của công ty
    @Override
    public List<Recruitment> getListRecruitmentByIdCompany(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Recruitment> theQuery = session.createQuery("from Recruitment where companyRe.id=:id", Recruitment.class);
        theQuery.setParameter("id", id);
        return theQuery.getResultList();
    }

    //Xóa bài tuyển dụng
    @Override
    public void deleteRecruitment(int idRecruitment) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("delete from Recruitment where id=:id");
        theQuery.setParameter("id", idRecruitment);
        theQuery.executeUpdate();
    }

    //lấy bài tuyển dụng theo id
    @Override
    public Recruitment getRecruitment(int idRecruitment) {
        Session session = sessionFactory.getCurrentSession();
        Query<Recruitment> theQuery = session.createQuery("from Recruitment where id=:id", Recruitment.class);
        theQuery.setParameter("id", idRecruitment);
        return theQuery.getSingleResult();
    }

    //Lấy danh sách tuyển dụng
    @Override
    public List<Recruitment> getListRecruitment() {
        Session session = sessionFactory.getCurrentSession();
        Query<Recruitment> theQuery = session.createQuery("from Recruitment", Recruitment.class);
        return theQuery.getResultList();
    }

    //Lấy Cv bằng idUser
    @Override
    public Cv getCVByIdUser(int idUser) {
        Session session = sessionFactory.getCurrentSession();
        Query<Cv> theQuery = session.createQuery("from Cv where userCv.id =:idUser", Cv.class);
        theQuery.setParameter("idUser", idUser);
        return theQuery.getSingleResult();
    }

    //Xóa đối tượng cv
    @Override
    public void deleteCvByIdCv(int idCv) {
        Session session = sessionFactory.getCurrentSession();
        Query theQuery = session.createQuery("delete from Cv where id=:idCv");
        theQuery.setParameter("idCv", idCv);
        theQuery.executeUpdate();
    }

    //cập nhật category
    @Override
    public void updateCategory() {
        Session session = sessionFactory.getCurrentSession();
        Query theQuery = session.createQuery("select c.id, c.name, sum(r.quantity) from Category c left join c.recruitments r group by c.id, c.name");
        List<Object[]> results = theQuery.list();
        for (Object[] result : results) {
            int categoryId = (Integer) result[0];
            String categoryName = (String) result[1];
            Long choss = (Long) result[2];
            if (choss == null) {
                choss = 0l;
            }
            Category category = new Category(categoryId, categoryName, choss.intValue());
            session.saveOrUpdate(category);
        }
    }

    //Lấy 4 category nổi bật với số lượng tuyển lớn
    @Override
    public List<Category> getFourFeaturedCategories() {
        Session session = sessionFactory.getCurrentSession();
        Query<Category> theQuery = session.createQuery(" from Category order by numberChoose desc ", Category.class);
        theQuery.setMaxResults(4);
        return theQuery.getResultList();
    }

    //lấy 10 bài đang tuyển dụng có số lượng tuyển lớn
    @Override
    public List<Recruitment> getTenFeaturedRecruitment() {
        Session session = sessionFactory.getCurrentSession();
        Query<Recruitment> theQuery = session.createQuery(" from Recruitment where status = 1 order by quantity desc ", Recruitment.class);
        theQuery.setMaxResults(10);
        return theQuery.getResultList();
    }

    //lấy 5  công ty nổi bật có người apply nhiều nhất
    @Override
    public List<Company> getFiveFeaturedCompany() {
        Session session = sessionFactory.getCurrentSession();
        Query theQuery = session.createQuery("select r.companyRe.id " +
                "from Recruitment r left join ApplyPost a on r.id = a.recruitment.id group by  r.companyRe.id");
        theQuery.setMaxResults(5);
        List<Integer> results = theQuery.list();
        List<Company> companies = new ArrayList<>();
        for (Integer idCompany : results) {
            Query<Company> companyQuery = session.createQuery("from Company where id=:id", Company.class);
            companyQuery.setParameter("id", idCompany);
            companies.add(companyQuery.getSingleResult());
        }
        return companies;
    }

    //lấy danh sách apply bằng id của công ty
    @Override
    public List<ApplyPost> getListApplyByIdCompany(int idCompany) {
        Session session = sessionFactory.getCurrentSession();
        Query theQuery = session.createQuery(" select a.id, a.recruitment, a.user, a.nameCv, a.status, a.text " +
                "from Company c join Recruitment r on c.id = r.companyRe.id " +
                "join ApplyPost a on r.id = a.recruitment.id where c.id=:idCompany");
        theQuery.setParameter("idCompany", idCompany);
        List<Object[]> results = theQuery.list();
        List<ApplyPost> applyPosts = new ArrayList<>();
        for (Object[] result : results) {
            int id = (Integer) result[0];
            Recruitment recruitment = (Recruitment) result[1];
            User user = (User) result[2];
            String nameCv = (String) result[3];
            int status = (Integer) result[4];
            String text = (String) result[5];
            ApplyPost applyPost = new ApplyPost(id, nameCv, status, text, recruitment, user);
            applyPosts.add(applyPost);
        }
        return applyPosts;
    }

    //lấy danh sách bài tuyển dụng đã apply
    @Override
    public List<Recruitment> getListRecruitmentByIdUserHaveApplied(int idUser) {
        Session session = sessionFactory.getCurrentSession();
        Query theQuery = session.createQuery(" select r.companyRe, r.type, r.title, r.address from User u inner join ApplyPost a on u.id = a.user.id" +
                " inner join Recruitment r on r.id = a.recruitment.id where u.id =:idUser");
        theQuery.setParameter("idUser", idUser);
        List<Recruitment> recruitments = new ArrayList<>();
        List<Object[]> results = theQuery.list();
        for (Object[] result : results
        ) {
            Company company = (Company) result[0];
            String type = (String) result[1];
            String title = (String) result[2];
            String address = (String) result[3];
            Recruitment recruitment = new Recruitment(address, title, type, company);
            recruitments.add(recruitment);
        }
        return recruitments;
    }

    //lưu job
    @Override
    public SaveJob getSavedJob(int idRe, int idUser) {
        Session session = sessionFactory.getCurrentSession();
        Query<SaveJob> theQuery = session.createQuery("from SaveJob where recruitmentSave.id =:idRe" +
                " and userSave.id=:idUser", SaveJob.class);
        theQuery.setParameter("idRe", idRe);
        theQuery.setParameter("idUser", idUser);
        SaveJob saveJob = theQuery.getSingleResult();
        return saveJob;
    }

    //xóa job
    @Override
    public void deleteSaveJob(int idSaveJob) {
        Session session = sessionFactory.getCurrentSession();
        Query theQuery = session.createQuery("delete from SaveJob where id=:idSaveJob ");
        theQuery.setParameter("idSaveJob", idSaveJob);
        theQuery.executeUpdate();
    }

    //lấy danh sách job đã lưu
    @Override
    public List<SaveJob> getListSaveJob(int idUser) {
        Session session = sessionFactory.getCurrentSession();
        Query<SaveJob> theQuery = session.createQuery("from SaveJob where userSave.id =:idUser", SaveJob.class);
        theQuery.setParameter("idUser", idUser);
        return theQuery.getResultList();
    }

    //lấy thông tin công ty chỉ định
    @Override
    public Company getCompanyByIdCompany(int idCompany) {
        Session session = sessionFactory.getCurrentSession();
        Query<Company> theQuery = session.createQuery("from  Company  where id=:idCompany", Company.class);
        theQuery.setParameter("idCompany", idCompany);
        return theQuery.getSingleResult();
    }

    //lấy công ty đã theo dõi theo điều kiện
    @Override
    public FollowCompany getFollowComany(int idCompany, int idUser) {
        Session session = sessionFactory.getCurrentSession();
        Query<FollowCompany> theQuery = session.createQuery("from FollowCompany where companyFollow.id =:idCompany" +
                " and userFollow.id =:idUser", FollowCompany.class);
        theQuery.setParameter("idCompany", idCompany);
        theQuery.setParameter("idUser", idUser);
        return theQuery.getSingleResult();
    }

    //Xóa công ty đã theo dõi
    @Override
    public void deleteFollowCompany(int idFollowCompany) {
        Session session = sessionFactory.getCurrentSession();
        Query theQuery = session.createQuery("delete from FollowCompany where id=:idFollowCompany");
        theQuery.setParameter("idFollowCompany", idFollowCompany);
        theQuery.executeUpdate();
    }

    // lấy danh sách công ty đã theo dõi
    @Override
    public List<FollowCompany> getListFollowCompany(int idUser) {
        Session session = sessionFactory.getCurrentSession();
        Query<FollowCompany> theQuery = session.createQuery("from FollowCompany where userFollow.id =:idUser", FollowCompany.class);
        theQuery.setParameter("idUser", idUser);
        return theQuery.getResultList();
    }

    //lấy anh sach đã apply bằng idrecruitment
    @Override
    public List<ApplyPost> getListApplyByIdRecruitment(int idrecruitment) {
        Session session = sessionFactory.getCurrentSession();
        Query<ApplyPost> theQuery = session.createQuery("from ApplyPost where recruitment.id=:idRecruitment", ApplyPost.class);
        theQuery.setParameter("idRecruitment", idrecruitment);
        return theQuery.getResultList();
    }
}
