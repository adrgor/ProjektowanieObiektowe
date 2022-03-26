package com.example.singleton

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SingletonApplication

fun main(args: Array<String>) {
    runApplication<SingletonApplication>(*args)
}
