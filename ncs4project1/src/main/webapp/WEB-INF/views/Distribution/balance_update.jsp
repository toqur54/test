<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/js/myquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	
</head>
<body>
	<form id="balance_update_form" name="balance_update_form" method="post"	action="balance_update" data-parsley-validate="true">
		<input type="hidden" id="confirm_yn" value="n">
		<div class="container" style="margin-top: 100px">
			
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp <i class="far fa-building"> ${balance.vendname} 거래 현황 </i></span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 80px"> 연도 </span>
					</div>
					<span style="width: 150px">
						<input type="text" id="yyyy" name="yyyy" class="form-control" placeholder="barcode" aria-label="Useremail" value="${balance.yyyy}" readonly="readonly"
						style="ime-mode:disabled" aria-describedby="basic-addon1">
					</span>
					<span class="input-group-text" style="width: 80px"> 코드 </span>
					<span style="width: 150px">
						<input type="text" id="vendcode" name="vendcode" class="form-control" placeholder="barcode" aria-label="Useremail" value="${balance.vendcode}" readonly="readonly"
						style="ime-mode:disabled" aria-describedby="basic-addon1">
					</span>
					<span class="input-group-text" style="width: 80px"> 상호명 </span>
					<span style="width: 150px">
						<input type="text" id="vendname" name="vendname" class="form-control" placeholder="barcode" aria-label="Useremail" value="${balance.vendname}" readonly="readonly"
						style="ime-mode:disabled" aria-describedby="basic-addon1">
					</span>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px;text-align: center">
						<span class="input-group-text" style="width: 80px">  월 </span>
						<span class="input-group-text" style="width: 150px"> 전월이월 </span>
						<span class="input-group-text" style="width: 150px"> 지급 금액 </span>
						<span class="input-group-text" style="width: 150px"> 현금금액 </span>
						<span class="input-group-text" style="width: 150px"> 카드금액 </span>
						<span class="input-group-text" style="width: 150px"> 어음금액 </span>
						<span class="input-group-text" style="width: 150px"> 기타금액 </span>
						<span class="input-group-text" style="width: 150px"> 잔액 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 1월 </span>
						<span style="width: 150px">
							<input id="prebalance01" name="prebalance01" type="text" class="form-control" value="${balance.prebalance01}"
					 	 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal01" name="deal01" type="text" class="form-control" value="${balance.deal01}"
						 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash01}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card01}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check01}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc01}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance01" name="balance01" type="text" class="form-control" value="${balance.balance01}"
						 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 2월 </span>
						<span style="width: 150px">
							<input id="prebalance02" name="prebalance02" type="text" class="form-control" value="${balance.prebalance02}"
					 	 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal02" name="deal02" type="text" class="form-control" value="${balance.deal02}"
						 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash02}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card02}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check02}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc02}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance02" name="balance02" type="text" class="form-control" value="${balance.balance02}"
						 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 3월 </span>
						<span style="width: 150px">
							<input id="prebalance03" name="prebalance03" type="text" class="form-control" value="${balance.prebalance03}"
					 	 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal03" name="deal03" type="text" class="form-control" value="${balance.deal03}"
						 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 		 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash03}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card03}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check03}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc03}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance03" name="balance03" type="text" class="form-control" value="${balance.balance03}"
						 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 4월 </span>
						<span style="width: 150px">
							<input id="prebalance04" name="prebalance04" type="text" class="form-control" value="${balance.prebalance04}"
					 	 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal04" name="deal04" type="text" class="form-control" value="${balance.deal04}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash04}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card04}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check04}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc04}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance04" name="balance04" type="text" class="form-control" value="${balance.balance04}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 5월 </span>
						<span style="width: 150px">
							<input id="prebalance05" name="prebalance05" type="text" class="form-control" value="${balance.prebalance05}"
					 	 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal05" name="deal05" type="text" class="form-control" value="${balance.deal05}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash05}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card05}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check05}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc05}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance05" name="balance05" type="text" class="form-control" value="${balance.balance05}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 6월 </span>
						<span style="width: 150px">
							<input id="prebalance06" name="prebalance06" type="text" class="form-control" value="${balance.prebalance06}"
					 	 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal06" name="deal06" type="text" class="form-control" value="${balance.deal06}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash06}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card06}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check06}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc06}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance06" name="balance06" type="text" class="form-control" value="${balance.balance06}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 7월 </span>
						<span style="width: 150px">
							<input id="prebalance07" name="prebalance07" type="text" class="form-control" value="${balance.prebalance07}"
					 	 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal07" name="deal07" type="text" class="form-control" value="${balance.deal07}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash07}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card07}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check07}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc07}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance07" name="balance07" type="text" class="form-control" value="${balance.balance07}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 8월 </span>
						<span style="width: 150px">
							<input id="prebalance08" name="prebalance08" type="text" class="form-control" value="${balance.prebalance08}"
					 	 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal08" name="deal08" type="text" class="form-control" value="${balance.deal08}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash08}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card08}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check08}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc08}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance08" name="balance08" type="text" class="form-control" value="${balance.balance08}"
						 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 9월 </span>
						<span style="width: 150px">
							<input id="prebalance09" name="prebalance09" type="text" class="form-control" value="${balance.prebalance09}"
					 	 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal09" name="deal09" type="text" class="form-control" value="${balance.deal09}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash09}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card09}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check09}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc09}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance09" name="balance09" type="text" class="form-control" value="${balance.balance09}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 10월 </span>
						<span style="width: 150px">
							<input id="prebalance10" name="prebalance10" type="text" class="form-control" value="${balance.prebalance10}"
					 	 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal10" name="deal10" type="text" class="form-control" value="${balance.deal10}"
						 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash10}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card10}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check10}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc10}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance10" name="balance10" type="text" class="form-control" value="${balance.balance10}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 11월 </span>
						<span style="width: 150px">
							<input id="prebalance11" name="prebalance11" type="text" class="form-control" value="${balance.prebalance11}"
					 	 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal11" name="deal11" type="text" class="form-control" value="${balance.deal11}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash11}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card11}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check11}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc11}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance11" name="balance11" type="text" class="form-control" value="${balance.balance11}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 12월 </span>
						<span style="width: 150px">
							<input id="prebalance12" name="prebalance12" type="text" class="form-control" value="${balance.prebalance12}"
					 	 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="deal12" name="deal12" type="text" class="form-control" value="${balance.deal12}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.cash12}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.card12}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.check12}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="pay01" name="pay01" type="text" class="form-control" value="${balance.etc12}"
						 	placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance12" name="balance12" type="text" class="form-control" value="${balance.balance12}"
						 	  placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend" style="margin-top: 8px">
						<span class="input-group-text" style="width: 80px"> 이월(합계) </span>
						<span style="width: 150px">
							<input id="preyybalance" name="preyybalance" type="text" class="form-control" value="${balance.preyybalance}"
					 	 	 placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="dealtot" name="dealtot" type="text" class="form-control" value="${balance.dealtot}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="paytot" name="paytot" type="text" class="form-control" value="${balance.cashtot}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="paytot" name="paytot" type="text" class="form-control" value="${balance.cardtot}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="paytot" name="paytot" type="text" class="form-control" value="${balance.checktot}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="paytot" name="paytot" type="text" class="form-control" value="${balance.etctot}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					 	 <span style="width: 150px">
							<input id="balance" name="balance" type="text" class="form-control" value="${balance.balance}"
						 	   placeholder="0" aria-label="Username" aria-describedby="basic-addon1"	>
					 	 </span>
					</div>
				</div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="balance_update_btn" name="balance_update_btn" type="submit" class="btn btn-success save" style="margin-right: 10px; color: #000000">수 정</button>
					<button id="balance_delete_btn" name="balance_delete_btn" type="button" class="btn btn-danger delete" style="margin-right: 10px; color: #000000">삭 제</button>
					<button id="cancel_btn" name="cancel_btn"  type="reset" class="btn btn-primary" style="color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		</div>
	</form>
</body>
</html>