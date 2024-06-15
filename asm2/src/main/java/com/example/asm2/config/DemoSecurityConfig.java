
package com.example.asm2.config;

import com.example.asm2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private DataSource securityDataSource;
    @Autowired
    UserService userService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .dataSource(securityDataSource)
                .usersByUsernameQuery("SELECT u.email, u.password, u.status FROM user u WHERE u.email = ?")
                .authoritiesByUsernameQuery("SELECT u.email, r.role_name FROM user u JOIN role r ON u.role_id = r.id WHERE u.email = ?")
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/user/**", "/search/**").hasRole("USER")
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/auth/**", "/resources/**").permitAll()
                .and()
                .formLogin()
                .loginPage("/auth/home")
                .loginProcessingUrl("/authenticateTheUser")
                .usernameParameter("username")
                .passwordParameter("password")
                .failureHandler((request, response, exception) -> {
                    String errorMessage = "";
                    String username = request.getParameter("username");
                    if (!userService.existsByUsername(username)) {
                        errorMessage = "Email không tồn tại.";
                    } else if (exception instanceof BadCredentialsException) {
                        errorMessage = "Sai mật khẩu.";
                    } else {
                        errorMessage = "Tài khoản đã bị khóa.";
                    }
                    HttpSession session = request.getSession(true);
                    session.setAttribute("errorMessage", errorMessage);
                    response.sendRedirect("/asm2_war_exploded/auth/login?error=true");
                })
                .defaultSuccessUrl("/auth/home?access=true", true)
                .and()
                .exceptionHandling().accessDeniedPage("/auth/access-denied")
                .and()
                .logout().permitAll();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new PasswordEncoder() {
            @Override
            public String encode(CharSequence rawPassword) {
                return BCrypt.hashpw(rawPassword.toString(), BCrypt.gensalt());
            }

            @Override
            public boolean matches(CharSequence rawPassword, String encodedPassword) {
                return BCrypt.checkpw(rawPassword.toString(), encodedPassword);
            }
        };
    }

}
