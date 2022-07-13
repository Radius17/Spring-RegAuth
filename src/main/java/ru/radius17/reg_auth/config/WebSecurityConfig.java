package ru.radius17.reg_auth.config;

import ru.radius17.reg_auth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    UserService userService;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        /*
        httpSecurity
                .csrf()
                    .disable()
                .authorizeRequests()
                    //Доступ только для не зарегистрированных пользователей
                    .antMatchers("/registration").not().fullyAuthenticated()
                    //Доступ только для пользователей с ролью Администратор
                    .antMatchers("/admin/**").hasRole("ADMIN")
                    .antMatchers("/profile").hasRole("USER")
                    //.antMatchers("/news").hasRole("USER")
                    //Доступ разрешен всем пользователей
                    .antMatchers("/", "/news", "/resources/**").permitAll()
                //Все остальные страницы требуют аутентификации
                .anyRequest().authenticated()
                .and()
                    //Настройка для входа в систему
                    .formLogin()
                    .loginPage("/login")
                    //Перенарпавление на главную страницу после успешного входа
                    .defaultSuccessUrl("/")
                    .permitAll()
                .and()
                    .logout()
                    .permitAll()
                    .logoutSuccessUrl("/");
        */
        httpSecurity.csrf().disable();
        //Доступ только для не зарегистрированных пользователей
        httpSecurity.authorizeRequests().antMatchers("/registration").not().fullyAuthenticated();
        //Доступ только для пользователей с ролью Администратор
        httpSecurity.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");
        //Доступ только для пользователей с ролью Пользователь
        httpSecurity.authorizeRequests().antMatchers("/profile").hasRole("USER");
        //Доступ разрешен всем подряд
        httpSecurity.authorizeRequests().antMatchers("/", "/news", "/resources/**").permitAll();
        //Все остальные страницы требуют аутентификации
        httpSecurity.authorizeRequests().anyRequest().authenticated();
//      .and()
        //Настройка для входа в систему и перенарпавление на главную страницу после успешного входа
        httpSecurity.formLogin().loginPage("/login").defaultSuccessUrl("/").permitAll();
        // Настройки для выхода из системы
        httpSecurity.logout().permitAll().logoutSuccessUrl("/").deleteCookies("JSESSIONID");
    }

    @Autowired
    protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(bCryptPasswordEncoder());
    }
}
