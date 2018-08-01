package com.naver.toqur54;

import java.awt.Font;
import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.toqur54.entities.Balance;
import com.naver.toqur54.entities.Buy;
import com.naver.toqur54.entities.BuySearchBean;
import com.naver.toqur54.entities.Pay;
import com.naver.toqur54.entities.PaySearchBean;
import com.naver.toqur54.entities.Product;
import com.naver.toqur54.entities.Vender;
import com.naver.toqur54.service.BuyDao;
import com.naver.toqur54.service.DistributionDao;
import com.naver.toqur54.service.PayDao;
import com.naver.toqur54.service.ProductDao;

@Controller
public class DistributionController {

	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	Balance balance;
	@Autowired
	Vender vender;
	@Autowired
	Product product;
	@Autowired
	private Buy buy;
	@Autowired
	private BuySearchBean buysearchbean;
	@Autowired
	private PaySearchBean paysearchbean;
	@Autowired
	Pay pay;
	
	//전체검색
	@RequestMapping(value = "/balance_search", method = RequestMethod.GET)	
	public String balance_search(Model model, String find, String yyyy) {
		DistributionDao dao = sqlSessoin.getMapper(DistributionDao.class);
		//전체
		if(find==null) find="";
		ArrayList<Balance> balances = dao.selectAll(find);
		model.addAttribute("balances",balances);
		
		return "Distribution/balance_search";
	}
	
	//상호코드번호 클릭
	@RequestMapping(value = "/balance_update_form", method = RequestMethod.GET)	
	public String balance_update_form(Model model, @RequestParam String vendcode,@ModelAttribute Buy buy) {
		DistributionDao dao = sqlSessoin.getMapper(DistributionDao.class);
		Balance balance = dao.selectOne(vendcode);
		balance.setDealtot(balance.getDeal01()+balance.getDeal02()+balance.getDeal03()+balance.getDeal04()+balance.getDeal05()+balance.getDeal06()+balance.getDeal07()+
		balance.getDeal08()+balance.getDeal09()+balance.getDeal10()+balance.getDeal11()+balance.getDeal12());
		
		balance.setCashtot(balance.getCash01()+balance.getCash02()+balance.getCash03()+balance.getCash04()+balance.getCash05()+balance.getCash06()+balance.getCash07()+
		balance.getCash08()+balance.getCash09()+balance.getCash10()+balance.getCash11()+balance.getCash12());
		
		balance.setCardtot(balance.getCard01()+balance.getCard02()+balance.getCard03()+balance.getCard04()+balance.getCard05()+balance.getCard06()+balance.getCard07()+
		balance.getCard08()+balance.getCard09()+balance.getCard10()+balance.getCard11()+balance.getCard12());
		
		balance.setChecktot(balance.getCheck01()+balance.getCheck02()+balance.getCheck03()+balance.getCheck04()+balance.getCheck05()+balance.getCheck06()+
		balance.getCheck07()+balance.getCheck08()+balance.getCheck09()+balance.getCheck10()+balance.getCheck11()+balance.getCheck12());
		
		balance.setEtctot(balance.getEtc01()+balance.getEtc02()+balance.getEtc03()+balance.getEtc04()+balance.getEtc05()+balance.getEtc06()+balance.getEtc07()+
		balance.getEtc08()+balance.getEtc09()+balance.getEtc10()+balance.getEtc11()+balance.getEtc12());
		
		model.addAttribute("balance",balance);
		
		return "Distribution/balance_update";
	}
	
	//update 거래현황 수정
	@RequestMapping(value = "/balance_update", method = RequestMethod.POST)	
	public String balance_update(@ModelAttribute Balance balance, Model model) {
		DistributionDao dao = sqlSessoin.getMapper(DistributionDao.class);
		int result = dao.updateRow(balance);
		try {
			if(result >0) {
				model.addAttribute("msg","매입매출이 수정되었습니다.");
			}
		}catch (Exception e) {
			System.out.println("--->>update err:"+e.getMessage());
		}
		return "member/member_result";
	}
	
	//거래처 삭제
	@RequestMapping(value = "/balanceDelete", method = RequestMethod.GET)	
	public String balanceDelete(Model model,@RequestParam String vendcode) {
		DistributionDao dao = sqlSessoin.getMapper(DistributionDao.class);
		int result = dao.deleteRow(vendcode);
		try {
			if(result > 0) {
				model.addAttribute("msg", "매입매출가 삭제되었습니다.");
			}
		}catch (Exception e) {
			System.out.println("--->>delete err:"+e.getMessage());
		}
		return "member/member_result";
	}
	
	//buy insert
	@RequestMapping(value = "/buy_insert_form", method = RequestMethod.GET)	
	public String buy_insert_form(Model model, @ModelAttribute("buy") Buy buy,
			@ModelAttribute("buys") ArrayList<Buy> buys,
			@ModelAttribute("redirectchk") String redirectchk) {
		DistributionDao dao = sqlSessoin.getMapper(DistributionDao.class);
		BuyDao buydao = sqlSessoin.getMapper(BuyDao.class);
		ArrayList<Vender> vender = dao.selectVender();
		ArrayList<Product> product = dao.selectProduct();
		
		HashMap buysearch = new HashMap();
		buysearch.put("vendcode",buy.getVendcode());
		buysearch.put("yyyy",buy.getYyyy());
		buysearch.put("mm",buy.getMm());
		buysearch.put("dd",buy.getDd());
		
		if(redirectchk.equals("insert")) {
			buys = buydao.selectBuySearchRollup(buysearch);
		}
		
		model.addAttribute("buys",buys);
		model.addAttribute("product",product);
		model.addAttribute("vender", vender);
		model.addAttribute("buy",buy);	//리다이렉트애트리뷰트
		
		return "Distribution/buy_insert_form";
	}
	
	//buyNew ajax
	@RequestMapping(value = "/buyNew", method = RequestMethod.POST)	
	@ResponseBody
	public Buy buyNew(@RequestParam String vendcode) {
		BuyDao dao = sqlSessoin.getMapper(BuyDao.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		buy.setVendcode(vendcode);
		buy.setYyyy(date.substring(0, 4));
		buy.setMm(date.substring(5,7));
		buy.setDd(date.substring(8,10));
		buy.setNo(dao.selectSequenceNo(buy));
		buy.setHang(1);
		
		return buy;
	}
	
	//productSelected
	@RequestMapping(value = "/productSelected", method = RequestMethod.POST)	
	@ResponseBody
	public Product productSelected(@RequestParam String procode) {
		ProductDao dao = sqlSessoin.getMapper(ProductDao.class);
		product = dao.selectOne(procode);
		
		return product;
	}
	
	//buy_insert
	@RequestMapping(value = "/buy_insert", method = RequestMethod.POST)	
	public String buy_insert(@ModelAttribute Buy buy,RedirectAttributes redirectAttributes,Model model) {
		BuyDao dao = sqlSessoin.getMapper(BuyDao.class);
		ProductDao prodao = sqlSessoin.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSessoin.getMapper(DistributionDao.class);
		
		dao.insertRow(buy);
		//상품재고
		buy.setProcolumn("buy"+buy.getMm());
		prodao.buyProductAdd(buy);
		//매입금액 잔액
		buy.setDealcolumn("deal"+buy.getMm());
		buy.setBalancecolumn("balance"+buy.getMm());
		disdao.buyBalanceAdd(buy);
		
		buy.setHang(buy.getHang()+1);
		redirectAttributes.addFlashAttribute("buy",buy);
		redirectAttributes.addFlashAttribute("redirectchk","insert");
		
		return "redirect:buy_insert_form";
	}
	
	//buySearch
	@RequestMapping(value = "/buySearch", method = RequestMethod.GET)	
	public String buySearch(@ModelAttribute("buysearchbean") BuySearchBean buysearchbean,
			RedirectAttributes redirectAttributes ) {
		BuyDao dao = sqlSessoin.getMapper(BuyDao.class);
		
		HashMap buysearch = new HashMap();
		buysearch.put("vendcode",buysearchbean.getSearchvender());
		buysearch.put("yyyy",buysearchbean.getSearchyyyy());
		buysearch.put("mm",String.format("%02d",Integer.parseInt(buysearchbean.getSearchmm())));
		buysearch.put("dd",String.format("%02d",Integer.parseInt(buysearchbean.getSearchdd())));
		ArrayList<Buy> buys;
		if(buysearchbean.getSearchdd().equals("0")) {
			buys = dao.selectBuySearchRollupMM(buysearch);
		}else {
			buys = dao.selectBuySearchRollup(buysearch);
		}
		
		redirectAttributes.addFlashAttribute("buys",buys);
		redirectAttributes.addFlashAttribute("redirectchk","search");
		
		return "redirect:buy_insert_form";
	}
	
	//selectedSeq 0724 buyDetail
	@RequestMapping(value = "/buyDetail", method = RequestMethod.POST)	
	@ResponseBody
	public Buy buyDetail(@RequestParam int seq) {
		BuyDao dao = sqlSessoin.getMapper(BuyDao.class);
		buy = dao.selectRow(seq);
		
		return buy;
	}
	
	//buyUpdate
	@RequestMapping(value = "/buyUpdate", method = RequestMethod.POST)	
	public String buyUpdate(@ModelAttribute Buy buy,RedirectAttributes redirectAttributes) {
		BuyDao dao = sqlSessoin.getMapper(BuyDao.class);
		ProductDao prodao = sqlSessoin.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSessoin.getMapper(DistributionDao.class);
//		BuySearchBean buysearchbean = new BuySearchBean();
		buysearchbean.setSearchvender(buy.getVendcode());
		buysearchbean.setSearchyyyy(buy.getYyyy());
		buysearchbean.setSearchmm(buy.getMm());
		buysearchbean.setSearchdd(buy.getDd());
		
		dao.updateRow(buy);
		
		//qty - 한번 + 한번 product
		buy.setProcolumn("buy"+buy.getMm());
		prodao.buyProductStockSub(buy);
		prodao.buyProductAdd(buy);
		
		//balance -, + 
		buy.setDealcolumn("deal"+buy.getMm());
		buy.setBalancecolumn("balance"+buy.getMm());
		disdao.buyBalanceSub(buy);
		disdao.buyBalanceAdd(buy);
		
		redirectAttributes.addFlashAttribute("buysearchbean",buysearchbean);
		
		return "redirect:buySearch";
	}
	
	//buyDelete
	@RequestMapping(value = "/buyDelete", method = RequestMethod.POST)	
	public String buyDelete(@ModelAttribute Buy buy,RedirectAttributes redirectAttributes) {
		BuyDao dao = sqlSessoin.getMapper(BuyDao.class);
		ProductDao prodao = sqlSessoin.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSessoin.getMapper(DistributionDao.class);
		buysearchbean.setSearchvender(buy.getVendcode());
		buysearchbean.setSearchyyyy(buy.getYyyy());
		buysearchbean.setSearchmm(buy.getMm());
		buysearchbean.setSearchdd(buy.getDd());
		
		dao.deleteRow(buy);
		
		//qty - 
		buy.setProcolumn("buy"+buy.getMm());
		prodao.buyProductStockSub(buy);
		
		//balance - 
		buy.setDealcolumn("deal"+buy.getMm());
		buy.setBalancecolumn("balance"+buy.getMm());
		disdao.buyBalanceSub(buy);
		
		redirectAttributes.addFlashAttribute("buysearchbean",buysearchbean);
		
		return "redirect:buySearch";
	}
	
	
	////////////////////////////pay
	@RequestMapping(value = "/pay_insert_form", method = RequestMethod.GET)	
	public String pay_insert_form(Model model, @ModelAttribute("pay") Pay pay,
			@ModelAttribute("pays") ArrayList<Pay> pays,
			@ModelAttribute("redirectchk") String redirectchk) {
		DistributionDao dao = sqlSessoin.getMapper(DistributionDao.class);
		PayDao paydao = sqlSessoin.getMapper(PayDao.class);
		ArrayList<Vender> vender = dao.selectVender();
		
		HashMap paysearch = new HashMap();
		paysearch.put("vendcode",pay.getVendcode());
		paysearch.put("yyyy",pay.getYyyy());
		paysearch.put("mm",pay.getMm());
		paysearch.put("dd",pay.getDd());
		if(redirectchk.equals("insert")) {
			pays = paydao.selectPaySearchRollup(paysearch);
		}
		
		model.addAttribute("pays",pays);
		
		model.addAttribute("vender", vender);
		model.addAttribute("pay",pay);
		
		return "Distribution/pay_insert_form";
	}
	
	@RequestMapping(value = "/payNew", method = RequestMethod.POST)	
	@ResponseBody
	public Pay payNew(@RequestParam String vendcode) {
		PayDao dao = sqlSessoin.getMapper(PayDao.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		pay.setVendcode(vendcode);
		pay.setYyyy(date.substring(0, 4));
		pay.setMm(date.substring(5,7));
		pay.setDd(date.substring(8,10));
		pay.setNo(dao.selectSequenceNo(pay));
		pay.setHang(1);
		
		return pay;
	}
	
	//pay_insert
	@RequestMapping(value = "/pay_insert", method = RequestMethod.POST)	
	public String pay_insert(@ModelAttribute Pay pay,RedirectAttributes redirectAttributes) {
		PayDao dao = sqlSessoin.getMapper(PayDao.class);
		DistributionDao disdao = sqlSessoin.getMapper(DistributionDao.class);
		
		dao.insertRow(pay);
		
		//교수님방법
		pay.setPaywaycolumn(pay.getPayway()+pay.getMm());
		pay.setBalancecolumn("balance"+pay.getMm());
		disdao.payBalanceAdd(pay);
		
		
//		if(pay.getPayway().equals("cash")) {
//			pay.setCashcolumn("cash"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceAddCash(pay);
//		}else if(pay.getPayway().equals("card")) {
//			pay.setCardcolumn("card"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceAddCard(pay);
//		}else if(pay.getPayway().equals("check")) {
//			pay.setCheckcolumn("check"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceAddCheck(pay);
//		}else if(pay.getPayway().equals("etc")) {
//			pay.setEtccolumn("etc"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceAddEtc(pay);
//		}
		
		
		//지출금액 잔액 pay01~12로 할떄 
//		pay.setPaycolumn("pay"+pay.getMm());
//		pay.setBalancecolumn("balance"+pay.getMm());
//		disdao.payBalanceAdd(pay);
		
		pay.setHang(pay.getHang()+1);
		
		redirectAttributes.addFlashAttribute("pay",pay);
		redirectAttributes.addFlashAttribute("redirectchk","insert");
		return "redirect:pay_insert_form";
	}
	
	//paySearch
	@RequestMapping(value = "/paySearch", method = RequestMethod.GET)	
	public String paySearch(@ModelAttribute("paysearchbean") PaySearchBean paysearchbean,
			RedirectAttributes redirectAttributes ) {
		PayDao dao = sqlSessoin.getMapper(PayDao.class);
		DistributionDao disdao = sqlSessoin.getMapper(DistributionDao.class);
		
		ArrayList<Vender> vender = disdao.selectVender();
		
		HashMap paysearch = new HashMap();
		paysearch.put("vendcode",paysearchbean.getSearchvender());
		paysearch.put("yyyy",paysearchbean.getSearchyyyy());
		paysearch.put("mm",String.format("%02d",Integer.parseInt(paysearchbean.getSearchmm())));
		paysearch.put("dd",String.format("%02d",Integer.parseInt(paysearchbean.getSearchdd())));
		ArrayList<Pay> pays;
		
		if(paysearchbean.getSearchdd().equals("0")) {
			pays = dao.selectPaySearchRollupMM(paysearch);
			
		}else {
			pays = dao.selectPaySearchRollup(paysearch);
		}
		
		redirectAttributes.addFlashAttribute("pays",pays);
		redirectAttributes.addFlashAttribute("redirectchk","search");
		
		return "redirect:pay_insert_form";
	}
	//payDetail
	@RequestMapping(value = "/payDetail", method = RequestMethod.POST)	
	@ResponseBody
	public Pay payDetail(@RequestParam int seq) {
		PayDao dao = sqlSessoin.getMapper(PayDao.class);
		pay = dao.selectRow(seq);
		
		return pay;
	}
	
	
	//payUpdate
	@RequestMapping(value = "/payUpdate", method = RequestMethod.POST)	
	public String payUpdate(@ModelAttribute Pay pay,RedirectAttributes redirectAttributes) {
		PayDao dao = sqlSessoin.getMapper(PayDao.class);
		ProductDao prodao = sqlSessoin.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSessoin.getMapper(DistributionDao.class);
		paysearchbean.setSearchvender(pay.getVendcode());
		paysearchbean.setSearchyyyy(pay.getYyyy());
		paysearchbean.setSearchmm(pay.getMm());
		paysearchbean.setSearchdd(pay.getDd());
		
		dao.updateRow(pay);
		//교수님방법 card cash check etc
		pay.setBeforepaywaycolumn(pay.getBeforepayway()+pay.getMm());
		pay.setPaywaycolumn(pay.getPayway()+pay.getMm());
		pay.setBalancecolumn("balance"+pay.getMm());
		disdao.payBalanceSub(pay);
		disdao.payBalanceAdd(pay);
		
		//balance -, + pay01~12로 할떄 
//		pay.setPaycolumn("pay"+pay.getMm());
//		pay.setBalancecolumn("balance"+pay.getMm());
//		disdao.payBalanceSub(pay);
//		disdao.payBalanceAdd(pay);
		
		
//		if(pay.getPayway().equals("cash")) {
//			pay.setCashcolumn("cash"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceSubCash(pay);
//			disdao.payBalanceAddCash(pay);
//		}else if(pay.getPayway().equals("card")) {
//			pay.setCardcolumn("card"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceSubCard(pay);
//			disdao.payBalanceAddCard(pay);
//		}else if(pay.getPayway().equals("check")) {
//			pay.setCheckcolumn("check"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceSubCheck(pay);
//			disdao.payBalanceAddCheck(pay);
//		}else if(pay.getPayway().equals("etc")) {
//			pay.setEtccolumn("etc"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceSubEtc(pay);
//			disdao.payBalanceAddEtc(pay);
//		}
		
		redirectAttributes.addFlashAttribute("paysearchbean",paysearchbean);
		
		return "redirect:paySearch";
	}
	
	//payDelete
	@RequestMapping(value = "/payDelete", method = RequestMethod.POST)	
	public String payDelete(@ModelAttribute Pay pay,RedirectAttributes redirectAttributes) {
		PayDao dao = sqlSessoin.getMapper(PayDao.class);
		ProductDao prodao = sqlSessoin.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSessoin.getMapper(DistributionDao.class);
		paysearchbean.setSearchvender(pay.getVendcode());
		paysearchbean.setSearchyyyy(pay.getYyyy());
		paysearchbean.setSearchmm(pay.getMm());
		paysearchbean.setSearchdd(pay.getDd());
		
		dao.deleteRow(pay);
		//교수님방법 card cash check etc
		pay.setBeforepaywaycolumn(pay.getBeforepayway()+pay.getMm());
		pay.setPaywaycolumn(pay.getPayway()+pay.getMm());
		pay.setBalancecolumn("balance"+pay.getMm());
		disdao.payBalanceSub(pay);
		
		//balance - pay01~12로 할떄 
//		pay.setPaycolumn("pay"+pay.getMm());
//		pay.setBalancecolumn("balance"+pay.getMm());
//		disdao.payBalanceSub(pay);
		
		
//		if(pay.getPayway().equals("cash")) {
//			pay.setCashcolumn("cash"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceSubCash(pay);
//		}else if(pay.getPayway().equals("card")) {
//			pay.setCardcolumn("card"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceSubCard(pay);
//		}else if(pay.getPayway().equals("check")) {
//			pay.setCheckcolumn("check"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceSubCheck(pay);
//		}else if(pay.getPayway().equals("etc")) {
//			pay.setEtccolumn("etc"+pay.getMm());
//			pay.setBalancecolumn("balance"+pay.getMm());
//			disdao.payBalanceSubEtc(pay);
//		}
		
		redirectAttributes.addFlashAttribute("paysearchbean",paysearchbean);
		
		return "redirect:paySearch";
	}
	
	//jfreeChart
	@RequestMapping(value = "/jfreeChart", method = RequestMethod.GET)	
	public String jfreeChart(Model model,String find) {
		String chartpath = "";
		final DefaultPieDataset data = new DefaultPieDataset();
		DistributionDao dao = sqlSessoin.getMapper(DistributionDao.class);
		ArrayList<Balance> balances = dao.selectAll2();
		for(Balance balance : balances) {
			data.setValue(balance.getVendname(), balance.getDealtot());
		}
		//test
//		data.setValue("One", 30);
//		data.setValue("Two", 30);
//		data.setValue("Three", 40);
		JFreeChart chart = ChartFactory.createPieChart("거래현황 차트",data,true,true,false);//타이틀,data,속성
		//제목 
		chart.getTitle().setFont(new Font("굴림",Font.ITALIC,20));
		//하단
		chart.getLegend().setItemFont(new Font("굴림",Font.TRUETYPE_FONT,12));
		//차트내용
		PiePlot plot = (PiePlot) chart.getPlot();
		plot.setLabelFont(new Font("굴림",Font.TRUETYPE_FONT,12)); 
		//차트내용 표시
		PieSectionLabelGenerator  gen = new StandardPieSectionLabelGenerator("{0}: {1} ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
	    plot.setLabelGenerator(gen);
		
		try {
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			final File file = new File("D:/ncs4webproject/ncs4project1/src/main/webapp/resources/jfreechart/piechart.png");
			chartpath = "resources/jfreechart/"+file.getName();
			ChartUtilities.saveChartAsPNG(file, chart, 600, 400, info); //세이브
			model.addAttribute("chartpath", chartpath);
		} catch (Exception e) {
			System.out.println("chart error : "+e.getMessage());
		}
		
		return "Distribution/jfreechart_view";
	}
	
	
	
	
	
	
	
}
