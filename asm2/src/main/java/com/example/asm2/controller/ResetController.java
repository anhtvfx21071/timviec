package com.example.asm2.controller;

import com.example.asm2.entity.*;
import com.example.asm2.service.JobSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/user")
public class ResetController {
    @Autowired
    private JobSearchService jobSearchService;

    //thực hiện lưu hoặc bỏ lưu 1 job chỉ định
    @RequestMapping("/save")
    public String saveJob(@RequestParam("idRe") int idRe) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = jobSearchService.getUserByEmail(userDetails.getUsername());
        Recruitment recruitment = jobSearchService.getRecruitment(idRe);
        SaveJob saveJob;
        try {
            saveJob = jobSearchService.getSavedJob(idRe, user.getId());
        } catch (Exception e) {
            SaveJob saveJob1 = new SaveJob(recruitment, user);
            jobSearchService.saveOrUpdate(saveJob1);
            return "true";
        }
        jobSearchService.deleteSaveJob(saveJob.getId());
        return "false";
    }

    //thực hiện lưu hoặc bỏ lưu 1 công ty chỉ định
    @RequestMapping("/followCompany")
    public String followCompany(@RequestParam("idCompany") int idCompany) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = jobSearchService.getUserByEmail(userDetails.getUsername());
        Company company = jobSearchService.getCompanyByIdCompany(idCompany);
        FollowCompany followCompany;
        try {
            followCompany = jobSearchService.getFollowComany(idCompany, user.getId());
        } catch (Exception e) {
            FollowCompany followCompany1 = new FollowCompany(company, user);
            jobSearchService.saveOrUpdate(followCompany1);
            return "true";
        }
        jobSearchService.deleteFollowCompany(followCompany.getId());
        return "false";
    }
}
