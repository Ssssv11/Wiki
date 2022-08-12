package com.hjc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;


@SpringBootApplication
public class WikiApplication {
    private static final Logger LOG = LoggerFactory.getLogger(WikiApplication.class);

    public static void main(String[] args) {
        Environment env = SpringApplication.run(WikiApplication.class, args).getEnvironment();
        LOG.info("Start Success!");
        LOG.info("At: \thttp://127.0.0.1:{}", env.getProperty("server port"));
    }

}
