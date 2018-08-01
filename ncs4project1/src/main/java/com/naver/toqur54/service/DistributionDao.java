package com.naver.toqur54.service;

import java.util.ArrayList;

import com.naver.toqur54.entities.Balance;
import com.naver.toqur54.entities.Buy;
import com.naver.toqur54.entities.Pay;
import com.naver.toqur54.entities.Product;
import com.naver.toqur54.entities.Vender;

public interface DistributionDao {
	//balance
	ArrayList<Balance> selectAll(String find);
	ArrayList<Balance> selectAll2();
	
	Balance selectOne(String vendcode);
	
	int updateRow(Balance balance);
	
	int deleteRow(String vendcode);
	
	//buy
	ArrayList<Vender> selectVender();
	ArrayList<Product> selectProduct();
	
	//
	void buyBalanceAdd(Buy buy);
	void buyBalanceSub(Buy buy);
	
	void payBalanceAdd(Pay pay);
	void payBalanceSub(Pay pay);
	
	
	void payBalanceAddCash(Pay pay); 
	void payBalanceAddCard(Pay pay); 
	void payBalanceAddCheck(Pay pay); 
	void payBalanceAddEtc(Pay pay); 
	
	void payBalanceSubCash(Pay pay);
	void payBalanceSubCard(Pay pay);
	void payBalanceSubCheck(Pay pay);
	void payBalanceSubEtc(Pay pay);
	
}
