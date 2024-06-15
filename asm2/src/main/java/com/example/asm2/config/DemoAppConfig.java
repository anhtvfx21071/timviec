
package com.example.asm2.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.Properties;
import java.util.logging.Logger;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.example.asm2")
@PropertySource("classpath:persistence-mysql.properties")
@EnableTransactionManagement
public class DemoAppConfig implements WebMvcConfigurer {
    @Autowired
    private Environment env;
    private Logger logger = Logger.getLogger(getClass().getName());

    @Bean
    public DataSource myDataSource() {
        ComboPooledDataSource sd = new ComboPooledDataSource();
        try {
            sd.setDriverClass(env.getProperty("jdbc.driver"));
        } catch (PropertyVetoException exc) {
            throw new RuntimeException();
        }
        logger.info(">>> jdbc.url= " + env.getProperty("jdbc.url"));
        logger.info(">>> jdbc.user= " + env.getProperty("jdbc.user"));
        sd.setJdbcUrl(env.getProperty("jdbc.url"));
        sd.setUser(env.getProperty("jdbc.user"));
        sd.setPassword(env.getProperty("jdbc.password"));
        sd.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
        sd.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
        sd.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
        sd.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));
        return sd;
    }

    private int getIntProperty(String propName) {
        String propVal = env.getProperty(propName);
        int intProp = Integer.parseInt(propVal);
        return intProp;
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/view/");
        resolver.setSuffix(".jsp");
        return resolver;
    }


    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(myDataSource());
        sessionFactory.setPackagesToScan("com.example.asm2.entity");
        Properties hibernateProperties = new Properties();
        hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        hibernateProperties.setProperty("hibernate.show_sql", "true");
        sessionFactory.setHibernateProperties(hibernateProperties);
        return sessionFactory;
    }

    @Bean
    public HibernateTransactionManager transactionManager() {
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        txManager.setSessionFactory(sessionFactory().getObject());
        return txManager;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/WEB-INF/assets/");
    }

    //cấu hình dung lượng file
    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setDefaultEncoding("utf-8");
        resolver.setMaxUploadSize(268435456);
        return resolver;
    }
}

