package com.hjc.controller;

import com.hjc.domain.Ebook;
import com.hjc.resp.CommonResp;
import com.hjc.service.EbookService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/ebook")
public class EbookController {

    @Resource
    private EbookService ebookService;

    @GetMapping("/list")
    public CommonResp<List<Ebook>> list() {
        List<Ebook> list = ebookService.list();
        return new CommonResp<>(list);
    }
}
