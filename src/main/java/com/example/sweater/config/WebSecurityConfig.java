package com.example.sweater.config;

import com.example.sweater.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;



    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //http.csrf().disable()
        http
                .authorizeRequests()
                    .antMatchers("/", "/registration", "/static/**", "/activate/*").permitAll()
                    .antMatchers("/h2-console/**")
                .permitAll()
                    .anyRequest().authenticated()
                    .and()
                .formLogin()
                    .loginPage("/login")
                    .permitAll()
                    .and()
                .logout()
                    .permitAll();

        http.headers().frameOptions().disable();
    }

//    @Bean
//    @Override
//    protected UserDetailsService userDetailsService() {
//        UserDetails user =
//                User.withDefaultPasswordEncoder()
//                        .username("u")
//                        .password("p")
//                        .roles("USER")
//                        .build();
//        return new InMemoryUserDetailsManager(user);
//    }


//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.
//                jdbcAuthentication()
//                .dataSource(dataSource)
//                .passwordEncoder(NoOpPasswordEncoder.getInstance())
//                .usersByUsernameQuery("select username, password, active from usr where username=?")
//                .authoritiesByUsernameQuery("select u.username, ur.roles " +
//                        "from usr u inner join user_role ur on u.id=ur.user_id " +
//                        "where u.username=?");
//    }
    /*
    * 1.Валидация: добавьте зависимость spring-boot-starter-validation из мавен репозитория.
    1.1 над полем Password2 не ставьте @Notblank или @NotEmpty(поможет при маппинге данных из логин формы в юзера)
    2. если есть циклическая(Bean circles) зависимость. вынесите бин PasswordEndcoder  в отдельный класс.
    3.flyway   в файл пропертей добавьте spring.flyway.enabled=false(после миграции отключит проверку checkSum)
    4. в RegestrationController:  вместо model.mergeAttributes(errorsMap) ->model.addAtributes("map", errorMap), и в шаблоне вызов class="form-control <#if (errorMap['textError'])??>is-invalid</#if>"
    5. консоль постгреса: psql postgres. потом пароль: он не видимый. коннект к базе \c sweater. выход \q
    Посмотреть записи Select username from usr;  первая буква->Select или большая или маленькая, в конце точка с запятой.
    6. В одном файле совместить формы логина и регистрации не получилось. разбил на два отдельных файла убрав макросы.
    *
    **/
@Override
protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(userService)
            .passwordEncoder(passwordEncoder);
}

}
