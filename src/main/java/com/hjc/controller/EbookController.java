package com.hjc.controller;

import com.hjc.req.EbookReq;
import com.hjc.resp.CommonResp;
import com.hjc.resp.EbookResp;
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
    public CommonResp<List<EbookResp>> list(EbookReq req) {
        List<EbookResp> list = ebookService.list(req);
        return new CommonResp<>(list);
    }
}
