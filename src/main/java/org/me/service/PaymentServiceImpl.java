package org.me.service;

import org.me.dao.PaymentDAO;
import org.me.domain.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDAO dao;
	
	@Override
	public void PaymentInsert(PaymentVO vo) {
		dao.PaymentInsert(vo);		
	}
}
