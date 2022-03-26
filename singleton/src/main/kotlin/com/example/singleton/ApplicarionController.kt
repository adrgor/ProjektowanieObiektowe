package com.example.singleton

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class ApplicarionController {

    @Autowired
    private lateinit var authenticator: Authenticator

    @PostMapping("/authenticate")
    fun authenticateUser(@RequestBody user: User): ResponseEntity<String>{
        if (authenticator.authenticate(user.username, user.password)) {
            return ResponseEntity("Ok", HttpStatus.OK)
        } else {
            return ResponseEntity("Unauthorized", HttpStatus.UNAUTHORIZED)
        }
    }
}