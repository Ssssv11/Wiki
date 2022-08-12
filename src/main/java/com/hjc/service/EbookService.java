package com.hjc.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hjc.domain.Ebook;
import com.hjc.domain.EbookExample;
import com.hjc.mapper.EbookMapper;
import com.hjc.req.EbookReq;
import com.hjc.resp.EbookResp;
import com.hjc.resp.PageResp;
import com.hjc.utils.CopyUtil;
import com.mysql.cj.util.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EbookService {
    @Resource
    private EbookMapper ebookMapper;

    public PageResp<EbookResp> list(EbookReq req) {
        EbookExample ebookExample = new EbookExample();
        EbookExample.Criteria criteria = ebookExample.createCriteria();
        if (!StringUtils.isNullOrEmpty(req.getName())) {
            criteria.andNameLike("%" + req.getName() + "%");
        }
        PageHelper.startPage(req.getPage(), req.getSize());
        List<Ebook> ebookList = ebookMapper.selectByExample(ebookExample);
        PageInfo<Ebook> pageInfo = new PageInfo<>(ebookList);
        List<EbookResp> list = CopyUtil.copyList(ebookList, EbookResp.class);
        PageResp<EbookResp> pageResp = new PageResp<>();
        pageResp.setTotal(pageInfo.getTotal());
        pageResp.setList(list);
        return pageResp;
    }
}
