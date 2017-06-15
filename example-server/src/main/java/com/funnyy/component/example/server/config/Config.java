package com.funnyy.component.example.server.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * Created by sky on 17-6-13.
 */
@EnableAutoConfiguration
@Configuration
@ComponentScan(basePackages={
        "com.funnyy.component.example.server.*",
})
@Import({
    com.funnyy.component.example.services.config.Config.class,

})
public class Config {
}
