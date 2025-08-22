package com.musicismylife.domain.test;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestMapper {

	List<TestDTO> getPostList();

	TestDTO getPost(TestDTO testDTO);

	List<TestDTO> getPostListByEmotion(String emotionCode);
}
