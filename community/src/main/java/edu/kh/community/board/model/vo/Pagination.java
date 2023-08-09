package edu.kh.community.board.model.vo;

public class Pagination {
	// 페이지네이션(페이징 처리)에 필요한 모든 값들을 저장하고 있는 객체
	
	private int currentPage;	 // 현재 페이지 번호
	private int listCount;		 // 전체 게시글 수
	
	private int limit = 10;		 // 한 페이지에 보여질 게시글의 수
	private int pageSize = 10;	 // 목록 하단 페이지 번호의 노출 개수
	
	private int maxPage;		 // 제일 큰 페이지 번호 == 마지막 페이지 번호
	private int startPage;		 // 목록 하단에 노출된 페이지의 시작 번호
	private int endPage;		 // 목록 하단에 노출된 페이지의 끝 번호
	
	private int prevPage;		 // 목록 하단에 노출된 번호의 이전 목록 끝 번호
	private int nextPage;		 // 목록 하단에 노출된 번호의 다음 목록 시작 번호
	
	
	// 생성자
	public Pagination(int currentPage, int listCount) {
		this.currentPage = currentPage;
		this.listCount = listCount;
		
		calculatePagination();
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		
		calculatePagination();
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
		
		calculatePagination();
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
		
		calculatePagination();
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		
		calculatePagination();
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getPrevPage() {
		return prevPage;
	}


	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}


	public int getNextPage() {
		return nextPage;
	}


	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}


	@Override
	public String toString() {
		return "Pagination [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + "]";
	}
	
	// 페이징 처리에 필요한 값을 계산하는 메소드
	private void calculatePagination() {
		
		// 전체 게시글 수 : 500 // 보여지는 게시글 수 : 10
		// -> 마지막 페이지 번호는? 500 / 10 = 50
		
		// 전체 게시글 수 : 501 // 보여지는 게시글 수 : 10
		// -> 마지막 페이지 번호는? 501 / 10 = 51 (50.1 올림)
		
		maxPage = (int)Math.ceil((double)listCount / limit);
		
		// * startPage ; 목록 하단에 노출된 페이지의 시작 번호
		
		// 현재 페이지가 1~10인 경우 : 1
		// 현재 페이지가 11~20인 경우 : 11
		// 현재 페이지가 21~30인 경우 : 21
		
		startPage = (currentPage - 1) / pageSize * pageSize + 1;
		// 빼기 1 안 해도 결과 같은데.. 암튼 주의하기
		
		// * endPage; 목록 하단에 노출된 페이지의 끝 번호
		
		// 현재 페이지가 1~10인 경우 : 10
		// 현재 페이지가 11~20인 경우 : 20
		// 현재 페이지가 21~30인 경우 : 30
		
		endPage = startPage + (pageSize - 1);
		
		// 만약 endPage가 maxPage를 초과하는 경우
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// *prevPage(<) : 목록 하단에 노출된 번호의 이전 목록 끝 번호
		// *nextPage(>) : 목록 하단에 노출된 번호의 다음 목록 시작 번호
		
		// 현재 페이지가 1~10일 경우
		// < : 1 페이지 
		// > : 11 페이지
		
		// 현재 페이지가 11~20일 경우
		// < : 10 페이지
		// > : 21 페이지
		
		// 현재 페이지가 41~50일 경우(maxPage가 50)
		// < : 40
		// > : 50
		
		if(currentPage <= pageSize) { // ex) 페이지가 1~10 사이
			prevPage = 1;
		} else {
			prevPage = startPage - 1;
		}
		
		if(endPage == maxPage) {
			nextPage = maxPage;
		} else {
			nextPage = endPage + 1;
		}
		
		
		
		
		
		
		
	}
	

}
