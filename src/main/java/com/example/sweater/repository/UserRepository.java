package com.example.sweater.repository;

import com.example.sweater.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);


    User findByActivationCode(String code);
}

