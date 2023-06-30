package org.me.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {

	String imp_uid;
	String merchant_uid; 
	int paid_amount;      // 결제금액
	String apply_num;     // 카드사 승인번호
	Date paid_at;	      // 결제일자
	
}
