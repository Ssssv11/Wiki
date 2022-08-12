package com.hjc.service;

import com.hjc.domain.Ebook;
import com.hjc.domain.EbookExample;
import com.hjc.mapper.EbookMapper;
import com.hjc.req.EbookReq;
import com.hjc.resp.EbookResp;
import com.hjc.utils.CopyUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EbookService {
    @Resource
    private EbookMapper ebookMapper;

    public List<EbookResp> list(EbookReq req) {
        EbookExample ebookExample = new EbookExample();
        EbookExample.Criteria criteria = ebookExample.createCriteria();
        criteria.andNameLike("%" + req.getName() + "%");
        List<Ebook> ebookList = ebookMapper.selectByExample(ebookExample);
        return CopyUtil.copyList(ebookList, EbookResp.class);
    }
}
