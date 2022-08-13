package com.hjc.mapper;

import com.hjc.domain.Doc;
import com.hjc.domain.DocExample;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface DocMapper {
    long countByExample(DocExample example);

    int deleteByExample(DocExample example);

    int deleteByPrimaryKey(Long id);

    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Doc record);

    int insertSelective(Doc record);

    List<Doc> selectByExample(DocExample example);

    Doc selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Doc record, @Param("example") DocExample example);

    int updateByExample(@Param("record") Doc record, @Param("example") DocExample example);

    int updateByPrimaryKeySelective(Doc record);

    int updateByPrimaryKey(Doc record);

    @Update("update doc set view_count = view_count + 1 where id = #{id}")
    void increaseViewCount(@Param("id") Long id);

    @Update("update doc set vote_count = vote_count + 1 where id = #{id}")
    void increaseVoteCount(@Param("id") Long id);


}