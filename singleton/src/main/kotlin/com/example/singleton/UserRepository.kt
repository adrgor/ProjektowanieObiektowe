package com.example.singleton

import org.springframework.stereotype.Repository

@Repository
class UserRepository {

    val users = mutableListOf<User>(
        User("user", "password"),
        User("admin", "admin"),
        User("root", "toor"),
        User("user", "12345"),
        )

    fun exists(username: String, password: String): Boolean {
        return users.stream()
            .filter {user -> user.username == username && user.password == password}
            .count() > 0
    }
}