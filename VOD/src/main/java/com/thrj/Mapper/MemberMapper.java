package com.thrj.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.thrj.Entity.Members;
import com.thrj.Entity.Movies;

@Mapper
public interface MemberMapper {
	
	public Members retrieveUser(String mb_id); // 사용자 아이디 체크
	public void createMember(Members vo);   // 유저등록
	public void updateMember(Members vo);   // 사용자수정
	public void deleteMember(String mb_id); // 사용자삭제
	public Members logincheck(Members vo); //사용자 아이디 로그인 찾기
	public Members retrieveSessionInfo(String mb_id);//사용자 상세정보 가져오기
}
