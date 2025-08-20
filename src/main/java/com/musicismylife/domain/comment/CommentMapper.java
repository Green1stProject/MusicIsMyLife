package com.musicismylife.domain.comment;

import java.util.List;

public interface CommentMapper {
	List<CommentDTO> getCommentList();
	int insertComment(CommentDTO comment);
	int deleteComment(int commentId);
	int updateComment(CommentDTO comment);
}