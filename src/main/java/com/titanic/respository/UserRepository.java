package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

}
