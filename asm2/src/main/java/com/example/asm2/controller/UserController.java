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

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private JobSearchService jobSearchService;

    //Thông tin user
    @RequestMapping("/userInformation")
    public String userInfor(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = jobSearchService.getUserByEmail(userDetails.getUsername());
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
        model.addAttribute("user", user);
        try {
            Cv cv = jobSearchService.getCVByIdUser(user.getId());
            String path = "C:/image/fileCV/" + cv.getFileName();
            File file = new File(path);
            FileInputStream fis = new FileInputStream(file);
            byte[] imageBytes = new byte[(int) file.length()];
            fis.read(imageBytes);
            fis.close();
            String base64Image = Base64.encodeBase64String(imageBytes);
            model.addAttribute("fileCv", base64Image);
            model.addAttribute("Cv", cv);
        } catch (Exception e) {

        }
        return "public/profile";
    }

    //Cập nhật thông tin user
    @PostMapping("/updateUser")
    public String updateuser(@ModelAttribute User user, @RequestParam("roleName") String roleName) {
        User user1 = jobSearchService.getUserByEmail(user.getEmail());
        user.setImage(user1.getImage());
        user.setRole(jobSearchService.getRoleByName(roleName));
        jobSearchService.saveOrUpdate(user);
        return "redirect:/user/userInformation";
    }

    // Cập nhật Cv
    @RequestMapping("/updateCV")
    public String updateCV(@RequestParam("email") String email, @RequestParam("fileCV") MultipartFile fileCV) {
        User user = jobSearchService.getUserByEmail(email);
        Cv cv = new Cv();
        try {
            cv = jobSearchService.getCVByIdUser(user.getId());
            File logoCurrent = new File("C:\\image\\fileCV\\" + cv.getFileName());
            if (logoCurrent.exists()) {
                logoCurrent.delete();
            }
        } catch (Exception e) {
        }
        if (fileCV != null) {
            File file = new File("C:\\image\\fileCV");
            if (!file.exists()) {
                file.mkdirs();
            }
            String nameCV = "-" + user.getId() + "-" + fileCV.getOriginalFilename();
            File CVNew = new File("C:\\image\\fileCV\\" + nameCV);
            try {
                fileCV.transferTo(CVNew);
                cv.setUserCv(user);
                cv.setFileName(nameCV);
                jobSearchService.saveOrUpdate(cv);
            } catch (Exception e) {
            }
        }
        return "redirect:/user/userInformation";
    }

    //Xóa Cv
    @PostMapping("/deleteCv")
    public String deleteCv(@RequestParam("idUser") int idUser) {
        Cv cv = jobSearchService.getCVByIdUser(idUser);
        File logoCurrent = new File("C:\\image\\fileCV\\" + cv.getFileName());
        if (logoCurrent.exists()) {
            logoCurrent.delete();
        }
        jobSearchService.deleteCvByIdCv(cv.getId());
        return "redirect:/user/userInformation";
    }

    //Apply vào job
    @PostMapping("/apply")
    public String apply(@RequestParam("idRecruitment") int idRecruitment,
                        @RequestParam("status") int status,
                        @RequestParam(value = "fileCv", required = false) MultipartFile fileCv,
                        @RequestParam("text") String text) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = jobSearchService.getUserByEmail(userDetails.getUsername());
        Recruitment recruitment = jobSearchService.getRecruitment(idRecruitment);
        if (!fileCv.isEmpty() && fileCv != null) {
            File file = new File("C:\\image\\fileCV");
            if (!file.exists()) {
                file.mkdirs();
            }
            String nameCV = "-" + user.getId() + "-" + fileCv.getOriginalFilename();
            File CVNew = new File("C:\\image\\fileCV\\" + nameCV);
            try {
                fileCv.transferTo(CVNew);
                ApplyPost applyPost = new ApplyPost(nameCV, status, text, recruitment, user);
                jobSearchService.saveOrUpdate(applyPost);
                return "redirect:/auth/home?apply=true";
            } catch (Exception e) {

            }
        } else {
            try {
                Cv cv = jobSearchService.getCVByIdUser(user.getId());
                if (jobSearchService.getCVByIdUser(user.getId()).getFileName() != null && !cv.getFileName().isEmpty()) {
                    ApplyPost applyPost = new ApplyPost(cv.getFileName(), status, text, recruitment, user);
                    jobSearchService.saveOrUpdate(applyPost);
                    return "redirect:/auth/home?apply=true";
                }
            } catch (Exception e) {

            }
        }
        return "redirect:/auth/home?apply=false";
    }

    //Danh sách công ty đã apply
    @RequestMapping("/applied")
    public String applied(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = jobSearchService.getUserByEmail(userDetails.getUsername());
        List<Recruitment> recruitments = jobSearchService.getListRecruitmentByIdUserHaveApplied(user.getId());
        model.addAttribute("recruitments", recruitments);
        return "public/list-apply-job";
    }

    //Danh sách job đã lưu
    @RequestMapping("/listSaveJob")
    public String listSaveJob(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = jobSearchService.getUserByEmail(userDetails.getUsername());
        List<SaveJob> saveJobs = jobSearchService.getListSaveJob(user.getId());
        model.addAttribute("listSaveJob", saveJobs);
        return "public/list-save-job";
    }

    //Danh sách công ty đã theo dõi
    @RequestMapping("/listFollowCompany")
    public String listFollowCompany(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = jobSearchService.getUserByEmail(userDetails.getUsername());
        List<FollowCompany> followCompanies = jobSearchService.getListFollowCompany(user.getId());
        model.addAttribute("followComanies", followCompanies);
        return "public/list-follow-company";
    }

}
