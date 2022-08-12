package com.hjc.controller;

import com.hjc.domain.Test;
import com.hjc.service.TestService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class TestController {

    @Resource
    private TestService testService;

    @GetMapping("/list")
    public List<Test> list() {
        return testService.list();
    }
}
