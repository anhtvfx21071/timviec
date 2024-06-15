package com.example.asm2.service;

import com.example.asm2.dao.JobSearchDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private JobSearchDao jobSearchDao;

    //kiểm tra email có tồn tại không
    @Override
    @Transactional
    public boolean existsByUsername(String email) {
        return jobSearchDao.existsByUsername(email);
    }
}
