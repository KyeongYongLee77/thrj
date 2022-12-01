package com.thrj.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data // getter setter
@ToString
public class Paging {
	
	private int curPage = 1;		// 현재 페이지 번호
	private int rowPerPage = 18;	// 한 페이지당 레코드 
	private int pageSize = 5;		// 페이지 리스트 수
	private int totalRowCount;			// 총 레코드 건수
	private int totalRowCount_1;
	
	private int firstRow;			// 시작 레코드 번호
	private int lastRow;			// 마지막 레코드 번호
	private int totalPageCount;		// 총 페이지 수
	private int firstPage;			// 페이지 리스트 시작번호
	private int lastPage;			// 페이지 리스트 마지막 번호
	
	public void pageSetting() {
		
		totalPageCount = (totalRowCount-1)/rowPerPage+1;
		firstRow = (curPage-1)*rowPerPage +1;
		lastRow = firstRow+rowPerPage-1;
		if(lastRow >= totalRowCount) {
			lastRow = totalRowCount;
		}
		
		firstPage = ((curPage-1)/pageSize)*pageSize+1;
		
		lastPage = firstPage + pageSize-1;
		if(lastPage > totalPageCount) {
			lastPage = totalPageCount;
		}
	}
	
	public void pageSetting_1() {
		
		totalPageCount = (totalRowCount_1-1)/rowPerPage+1;
		firstRow = (curPage-1)*rowPerPage +1;
		lastRow = firstRow+rowPerPage-1;
		if(lastRow >= totalRowCount_1) {
			lastRow = totalRowCount_1;
		}
		
		firstPage = ((curPage-1)/pageSize)*pageSize+1;
		
		lastPage = firstPage + pageSize-1;
		if(lastPage > totalPageCount) {
			lastPage = totalPageCount;
		}
	}
	
}
