package com.musicismylife.domain.comment;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.musicismylife.domain.post.PostDTO;

@Mapper
public interface CommentMapper {
	
	List<CommentDTO> getCommentList(PostDTO postDTO);
	
	int getCommentCount(PostDTO postDTO);

	void insertComment(CommentDTO commentDTO);

	void deleteComment(CommentDTO commentDTO);

	CommentDTO getComment(CommentDTO commentDTO);

	void updateComment(CommentDTO commentDTO);
}