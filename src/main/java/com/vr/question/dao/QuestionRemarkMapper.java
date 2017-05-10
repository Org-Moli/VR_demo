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
public interface QuestionRemarkMapper {

    @Select({
            "select * from question_remark"
    })
    List<Map<String,Object>> listQuestionRemark();

    @Select({
            "select * from question_remark",
            "where id = #{id}"
    })
    Map<String,Object> getQuestionRemarkById(@Param("id") Integer id);

    @Insert({
            "insert into question_remark",
            "(userId,userName,content,questionId,createTime)",
            "values",
            "(#{userId},#{userName},#{content},#{questionId},now())"
    })
    int insert(Map<String,Object> paramsMap);

    @Delete({
            "delete from question_remark where id = #{id}"
    })
    int delete(Integer id);

    @Select({
            "select * from question_remark",
            "where questionId = #{questionId}"
    })
    List<Map<String,Object>> listQuestionRemarkByQuestionId(@Param("questionId") Integer questionId);

}
