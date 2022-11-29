package com.thrj.Mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HistoryMapper {

	public void deleteHistory(String mb_id); // 사용자 이력삭제
	
}
