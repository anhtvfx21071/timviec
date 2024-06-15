package com.example.asm2.controller;

import com.example.asm2.entity.*;
import com.example.asm2.service.JobSearchService;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.util.List;
import java.util.Properties;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private JobSearchService jobSearchService;

    //Hiển thị thoonh tin hr và cty
    @RequestMapping("/editProfile")
    public String addUserInformation(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        User user = jobSearchService.getUserByEmail(username);
        model.addAttribute("user", user);
        Company company = jobSearchService.getCompanyByIdUser(user.getId());
        model.addAttribute("company", company);
        if (company != null) {
            try {
                String path = "C:/image/logo/" + company.getLogo();
                File file = new File(path);
                FileInputStream fis = new FileInputStream(file);
                byte[] imageBytes = new byte[(int) file.length()];
                fis.read(imageBytes);
                fis.close();
                String base64Image = Base64.encodeBase64String(imageBytes);
                model.addAttribute("base64Image", base64Image);
            } catch (IOException e) {
            }
        }
        try {
            String path = "C:/image/avatar/" + user.getImage();
            File file = new File(path);
            FileInputStream fis = new FileInputStream(file);
            byte[] imageBytes = new byte[(int) file.length()];
            fis.read(imageBytes);
            fis.close();
            String base64Image = Base64.encodeBase64String(imageBytes);
            model.addAttribute("avatar", base64Image);
        } catch (IOException e) {
        }
        return "public/profile";
    }

    //cập nhật lại thông tin Hr
    @RequestMapping("/updateUser")
    public String updateUser(@ModelAttribute User user, @RequestParam("roleName") String roleName) {
        User user1 = jobSearchService.getUserByEmail(user.getEmail());
        user.setImage(user1.getImage());
        user.setRole(jobSearchService.getRoleByName(roleName));
        jobSearchService.saveOrUpdate(user);
        return "redirect:/admin/editProfile";
    }

    //Cập nhật lại thông tin công ty
    @PostMapping("/updateCompany")
    public String updateCompany(@RequestParam("idUser") int idUser,
                                @RequestParam("photo") MultipartFile logo,
                                @ModelAttribute Company company) {
        File logoCurrent = new File("C:\\image\\logo\\" + company.getLogo());
        if (logoCurrent.exists()) {
            logoCurrent.delete();
        }
        if (logo != null) {
            String nameLogo = "-" + company.getId() + "-" + logo.getOriginalFilename();
            File file = new File("C:\\image\\logo\\");
            if (!file.exists()) {
                file.mkdirs();
            }
            File logoNew = new File("C:\\image\\logo\\" + nameLogo);
            try {
                logo.transferTo(logoNew);
            } catch (Exception e) {

            }
            company.setLogo(nameLogo);
        }
        company.setUserCompany(jobSearchService.getUserCompanyByUserId(idUser));
        jobSearchService.saveOrUpdate(company);
        return "redirect:/admin/editProfile";
    }

    //Lấy danh sách bài đăng
    @RequestMapping("/postList")
    public String postList(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        User user = jobSearchService.getUserByEmail(username);
        Company company = jobSearchService.getCompanyByIdUser(user.getId());
        if (company != null) {
            List<Recruitment> recruitments = jobSearchService.getListRecruitmentByIdCompany(company.getId());
            model.addAttribute("recruitments", recruitments);
        }
        return "public/post-list";
    }

    //đưa danh mục catelogy về trang post job
    @RequestMapping("/postJob")
    public String postJob(Model model) {
        List<Category> categories = jobSearchService.getListCategory();
        model.addAttribute("listCategory", categories);
        return "public/post-job";
    }

    //Tuyển dụng
    @PostMapping("/recruitment")
    public String recruitment(@ModelAttribute Recruitment recruitment,
                              @RequestParam("categoryId") int categoryId) {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String username = userDetails.getUsername();
            User user = jobSearchService.getUserByEmail(username);
            Company company = jobSearchService.getCompanyByIdUser(user.getId());
            Category category = jobSearchService.getCategoryById(categoryId);
            recruitment.setCompanyRe(company);
            recruitment.setCategoryRe(category);
            jobSearchService.saveOrUpdate(recruitment);
        } catch (Exception e) {
            return "redirect:/auth/home?error=true";
        }
        return "redirect:/auth/home?recruitment=true";
    }

    //Xóa bài tuyển dụng
    @PostMapping("/deleteRecruitment")
    public String deleteRecruitment(@RequestParam("idRecruitment") int idRecruitment) {
        jobSearchService.deleteRecruitment(idRecruitment);
        return "redirect:/admin/postList";
    }

    //hiển thị trang chỉnh sửa job
    @GetMapping("/editJob")
    public String editJob(Model model, @RequestParam("idRecruitment") int idRecruitment) {
        Recruitment recruitment = jobSearchService.getRecruitment(idRecruitment);
        System.out.println(recruitment.getTitle());
        model.addAttribute("recruitment", recruitment);
        List<Category> categories = jobSearchService.getListCategory();
        model.addAttribute("listCategory", categories);
        return "public/edit-job";
    }

    //Cập nhật bài tuyển dụng
    @PostMapping("/updateRecruitment")
    public String updateRecruitment(@ModelAttribute Recruitment recruitment, @RequestParam("idCategory") int idCategory,
                                    @RequestParam("idUser") int idUser) {
        Category category = jobSearchService.getCategoryById(idCategory);
        Company company = jobSearchService.getCompanyByIdUser(idUser);
        recruitment.setCompanyRe(company);
        recruitment.setCategoryRe(category);
        jobSearchService.saveOrUpdate(recruitment);
        return "redirect:/admin/editJob?idRecruitment=" + recruitment.getId();
    }

    //chi tiết công việc
    @GetMapping("/detailJob")
    public String detailJob(Model model, @RequestParam("idRecruitment") int idRecruitment) {
        Recruitment recruitment = jobSearchService.getRecruitment(idRecruitment);
        Company company = recruitment.getCompanyRe();
        if (company.getLogo() != null) {
            try {
                String path = "C:/image/logo/" + company.getLogo();
                File file = new File(path);
                FileInputStream fis = new FileInputStream(file);
                byte[] imageBytes = new byte[(int) file.length()];
                fis.read(imageBytes);
                fis.close();
                String base64Image = Base64.encodeBase64String(imageBytes);
                model.addAttribute("logoCompany", base64Image);
            } catch (IOException e) {
            }
        }
        model.addAttribute("recruitment", recruitment);
        List<ApplyPost> applyPosts = jobSearchService.getListApplyByIdRecruitment(recruitment.getId());
        model.addAttribute("applyPosts", applyPosts);
        return "public/detail-post";
    }

    //danh sách ứng viên
    @RequestMapping("/getListCandidates")
    public String getListCandidates(Model model) {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String username = userDetails.getUsername();
            User user = jobSearchService.getUserByEmail(username);
            Company company = jobSearchService.getCompanyByIdUser(user.getId());
            List<ApplyPost> applyPosts = jobSearchService.getListApplyByIdCompany(company.getId());
            model.addAttribute("applyPosts", applyPosts);
        } catch (Exception e) {

        }
        return "public/list-user";
    }

    //Gửi mã 6 số cho email
    @RequestMapping("/verifyEmail")
    public String verifyEmail(@RequestParam("email") String email, HttpServletRequest request) {
        String senderEmail = "tranvananh332000@gmail.com";
        String senderPassword = "nzvsmidzpecoyzld";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.auth", "true");
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });
        int min = 100000;
        int max = 999999;
        String code = String.valueOf((int) (Math.random() * (max - min + 1) + min));
        HttpSession saveCode = request.getSession();
        saveCode.setAttribute("verificationCode", code);
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Ma xac thuc WorkCV");
            message.setText("Ma xac thuc cua ban la: " + code);
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/editProfile?verifyEmail=true";
    }

    //xác thực email
    @RequestMapping("/emailAuthentication")
    public String emailAuthentication(@RequestParam("email") String email, @RequestParam("code") String code,
                                      HttpServletRequest request) {
        HttpSession session = request.getSession();
        String value = (String) session.getAttribute("verificationCode");
        if (code.equals(value)) {
            User user = jobSearchService.getUserByEmail(email);
            user.setStatus(2);
            jobSearchService.saveOrUpdate(user);
            return "redirect:/admin/editProfile";
        }
        return "redirect:/auth/home?verifyEmail=false";
    }
}
