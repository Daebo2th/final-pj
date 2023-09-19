package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ToDoListVO {
	private String cardName; // 카드명
	private Date cardDate; // 카드날짜
	private String userId; // 회원 아이디
	private String listName; // 리스트 이름
	private int cardNum; // 카드번호
	private int listNum; // 리스트번호
	private int cardTaxis; // 카드순서
}
