package com.woniu.mapper;

import com.woniu.entity.User;
import com.woniu.entity.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    long countByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    int deleteByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    int deleteByPrimaryKey(Integer uid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    List<User> selectByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    User selectByPrimaryKey(Integer uid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rbac_role..user
     *
     * @mbg.generated Mon Jun 08 18:41:40 CST 2020
     */
    int updateByPrimaryKey(User record);
}