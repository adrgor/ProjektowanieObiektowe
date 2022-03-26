package com.example.singleton

import org.springframework.stereotype.Service

@Service
object Authenticator {

    var userRepository = UserRepository()
    var value = 1

    fun authenticate(username: String, password: String): Boolean {
        return userRepository.exists(username, password)
    }

    fun setRandomValue(value: Int) {
        this.value = value
    }
}