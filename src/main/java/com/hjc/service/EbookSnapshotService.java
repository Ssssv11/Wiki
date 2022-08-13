package com.hjc.service;

import com.hjc.mapper.EbookSnapshotMapper;
import com.hjc.resp.StatisticResp;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EbookSnapshotService {

    @Resource
    private EbookSnapshotMapper ebookSnapshotMapper;

    public void genSnapshot() {
        ebookSnapshotMapper.genSnapshot();
    }

    public List<StatisticResp> getStatistic() {
        return ebookSnapshotMapper.getStatistic();
    }

    public List<StatisticResp> get30Statistic() {
        return ebookSnapshotMapper.get30Statistic();
    }

}
