package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ToDoListVO {
	private String cardName; // 카드명
	private String cardDate; // 카드날짜
	private String userId; // 회원 아이디
	private String listName; // 리스트 이름
	private int cardNum; // 카드번호
	private int listNum; // 리스트번호
	private int cardTaxis; // 카드순서
	private int isDeleted; // 삭제여부

}
