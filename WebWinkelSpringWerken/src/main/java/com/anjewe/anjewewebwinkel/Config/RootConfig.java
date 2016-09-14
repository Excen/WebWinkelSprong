/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anjewe.anjewewebwinkel.Config;

import java.sql.SQLException;
import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 *
 * @author Anne
 */
@Configuration
@ComponentScan(basePackages = {"com.anjewe.anjewewebwinkel.Controller","com.anjewe.anjewewebwinkel.DAOs", "com.anjewe.anjewewebwinkel.DAOGenerics",
    "com.anjewe.anjewewebwinkel.POJO", "com.anjewe.anjewewebwinkel.Service", "com.anjewe.anjewewebwinkel.Config"},
        excludeFilters = {
        @Filter(type = FilterType.ANNOTATION, value = EnableWebMvc.class)
    })
@PropertySource(value = {"classpath:database.properties"})
@EnableTransactionManagement
public class RootConfig {
    
    // datafields

    private static final String DATABASE_DRIVER = "db.driver";
    private static final String DATABASE_PASSWORD = "db.password";
    private static final String DATABASE_URL = "db.url";
    private static final String DATABASE_USERNAME = "db.username";

    private static final String HIBERNATE_DIALECT = "hibernate.dialect";
    private static final String HIBERNATE_SHOW_SQL = "hibernate.show_sql";
    private static final String ENTITYMANAGER_PACKAGES_TO_SCAN = "entitymanager.packages_to_scan";
    private static final String HIBERNATE_FORMAT_SQL = "hibernate.format_sql";
    private static final String HIBERNATE_HBM2DDL = "hibernate.hbm2ddl.auto";

// environment - verder uitzoeken >>later: haal gegevens vor databasetoegang op uit een speciale klasse/file 
@Autowired
Environment env; 
    // datasource- access Bean
@Bean
public DataSource dataSource() throws SQLException{
    // drivermanagerdatasource
    DriverManagerDataSource ds = new DriverManagerDataSource();
    ds.setDriverClassName(env.getRequiredProperty(DATABASE_DRIVER));
    ds.setUsername(env.getRequiredProperty(DATABASE_USERNAME));
    ds.setPassword(env.getRequiredProperty(DATABASE_PASSWORD));
    ds.setUrl(env.getRequiredProperty(DATABASE_URL));
    ds.setConnectionProperties(connectionProperties());
    return ds;
}

@Bean
    public Properties connectionProperties(){
    Properties properties = new Properties();
    properties.put("hibernate.dialect", env.getRequiredProperty(HIBERNATE_DIALECT));
    properties.put("hibernate.show_sql", env.getRequiredProperty(HIBERNATE_SHOW_SQL));
    properties.put("hibernate.format_sql", env.getRequiredProperty(HIBERNATE_FORMAT_SQL));
    properties.put("hibernate.hbm2ddl.auto", env.getRequiredProperty(HIBERNATE_HBM2DDL));
return properties; 
}


    // SessionFactory Bean
@Bean(name="sessionBean")
    public LocalSessionFactoryBean sessionFactory() throws SQLException {
    LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
    sessionFactory.setDataSource(dataSource());
    sessionFactory.setPackagesToScan(env.getRequiredProperty(ENTITYMANAGER_PACKAGES_TO_SCAN).split("#"));
    sessionFactory.setHibernateProperties(connectionProperties());
     
    return sessionFactory;
 }

    // transactionmanager Bean
 @Bean
 @Autowired
 public HibernateTransactionManager transactionManager(SessionFactory s) throws SQLException {
    HibernateTransactionManager transactionManager = new HibernateTransactionManager();
    transactionManager.setSessionFactory(s);
    
    return transactionManager;
 }
    
    
    
    
    
}