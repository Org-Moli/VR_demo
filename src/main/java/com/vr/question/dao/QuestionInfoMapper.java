package com.vr.question.dao;

import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

/**
 * <p>名称</p>
 * <p/>
 * <p>wikiURL</p>
 *
 * @author zb.jiang
 * @version 1.0
 * @Date 2017/5/9
 */
public interface QuestionInfoMapper {

    @Select({
            "select * from question_info",
            "limit #{startPos},#{maxRows}"
    })
    List<Map<String,Object>> listQuestionInfo(@Param("startPos") Integer startPos, @Param("maxRows") Integer maxRows);

    @Select({
            "select * from question_info",
            "where id = #{id}"
    })
    Map<String,Object> getQuestionInfoById(@Param("id") Integer id);

    @Insert({
            "insert into question_info",
            "(userId,userName,content,state,createTime)",
            "values",
            "(#{userId},#{userName},#{content},0,now())"
    })
    int insert(Map<String,Object> paramsMap);

    @Delete({
            "delete from question_info where id = #{id}"
    })
    int delete(Integer id);

    @Update({
            "update question_info set state = #{state}",
            "where id = #{id}"
    })
    int updateStateById(@Param("state") Integer state, @Param("id") Integer id);

}
