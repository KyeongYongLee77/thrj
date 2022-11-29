package com.thrj.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.thrj.Entity.Comments;

@Mapper
public interface CommentsMapper {
	public void createComments(Comments vo);  // 유저등록
	public void ListComments(Comments vo);   //  댓글순서
	public int CommentsCnt(int movieSeq);   //   카운트 수
	public List<Comments> getAllCommentsByPage(int movieSeq); //리스트수
	public void deleteComments(String mb_id); // 댓글삭제
}
