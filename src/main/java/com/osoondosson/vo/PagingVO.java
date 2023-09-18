package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class PagingVO {
    // 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
    private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
    private int cntPage = 5;

    public PagingVO(int total, int nowPage, int cntPerPage) {
        setNowPage(nowPage);
        setCntPerPage(cntPerPage);
        setTotal(total);
        calcLastPage(getTotal(), getCntPerPage());
        calcStartEndPage(getNowPage(), cntPage);
        calcStartEnd(getNowPage(), getCntPerPage());
    }
    // 제일 마지막 페이지 계산
    public void calcLastPage(int total, int cntPerPage) {
        setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
    }

// 시작, 끝 페이지 계산
    public void calcStartEndPage(int nowPage, int cntPage) {
        // 전체 마지막 페이지 번호 계산
        int totalLastPage = getLastPage();
        /*int totalLastPage = (int)Math.ceil((double)this.total / cntPerPage);
*/
        // 시작페이지번호는 현재페이지에서 cntPage의 절반만큼 뺀 값입니다.
        setStartPage(Math.max(1, nowPage - (cntPage / 2)));

        // 마지막페이지번호는 시작페이지번호에서 cntPage만큼 더한 값과,
        // 총 필요한 마지막페이지번호 중 작은 값을 선택합니다.
        setEndPage(Math.min(getStartPage() + cntPage - 1, totalLastPage));

        if (getEndPage() > totalLastPage) { // 만약 끝 페이지가 전체 마지막 페이지보다 크다면,
            setStartPage(Math.max(1,getEndPage() - cntPage + 1)); // 시작 페이지 재조정
            if(getStartPage() < 1){
                setStartPage(1);
            }
            setEndPage(totalLastPage);
        }
    }




    // DB 쿼리에서 사용할 start, end값 계산
    public void calcStartEnd(int nowPage, int cntPerPage) {
        setEnd(nowPage * cntPerPage);
        setStart((nowPage - 1) * cntPerPage + 1);
    }

}
