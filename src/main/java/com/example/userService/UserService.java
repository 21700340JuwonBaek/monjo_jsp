package com.example.userService;

import com.example.userRepository.UserRepository;

public class UserService {
    public void addUser(String name, int age, String gender){
        UserRepository userRepository = new UserRepository();
        userRepository.addUser(name, age, gender);

        System.out.println(name + " " + age + " " + gender);
    }
}
