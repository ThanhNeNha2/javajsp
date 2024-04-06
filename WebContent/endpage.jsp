<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.end-code {
	width: 100%;
	display: flex;
}

.box1 {
	background-color: rgb(255, 255, 255);
	width: 33.33%;
	height: 50;
}

.box2 {
	background-color: rgb(255, 255, 255);
	width: 33.33%;
	padding: 0 20px;
	box-sizing: border-box;
}

.box3 ul {
	list-style: none;
	padding: 0;
	display: flex;
	flex-wrap: wrap;
}

.box3 ul li {
	margin-right: 23px;
}

.box3 ul li img {
	border-radius: 5px;
	box-shadow: 2px 2px 10px 0 rgba(139, 139, 139, 0.5);
}

.box2 li {
	line-height: 25px;
}

.box3 {
	background-color: rgb(255, 255, 255);
}

.box {
	width: 33.33%;
	height: auto;
	background: #34373c14;
	font-size: 12px;
}

.box1 ul {
	list-style: none;
	padding: 0;
	display: flex;
	flex-wrap: wrap;
}

.box1 ul li {
	margin-right: 5px;
}

.box1 ul li img {
	border-radius: 5px;
	box-shadow: 2px 2px 10px 0 rgba(139, 139, 139, 0.5);
}

.cssinput {
	display: flex;
	flex-wrap: wrap;
}

.cssinput input {
	width: 80%;
	margin-bottom: 10px;
	outline: none;
	border: none;
	border: 1px solid rgb(156, 156, 156);
	padding: 5px;
	border-radius: 5px;
}

.dashed-line {
	width: 100%; /* Chiều rộng của đường ngang */
	border-bottom: 1px dashed black;
	/* Sử dụng border-bottom để tạo đường ngang dạng nét đứt */
}

.trenne {
	display: flex;
	padding: 20px 0;
	align-items: center;
}

.trenne h3 {
	margin: 0;
	padding: 0;
}

.trenne p {
	margin: 0;
	padding: 0;
}

#iconpayne {
	color: rgb(255, 76, 76);
	font-size: 28px;
	margin-right: 16px;
}
</style>
</head>
<body>
	<div class="dashed-line  " style="padding: 0 20px;">
		<div class="end-code hihi">
			<div class="trenne box">
				<i class="fas fa-credit-card" id="iconpayne"></i>
				<div>
					<h3>CHINH SACH GIAO HANG</h3>
					<p>Nhan hang va thanh toan tai nha</p>

				</div>
			</div>
			<div class="trenne box ">
				<i class="fas fa-shipping-fast" id="iconpayne"></i>
				<div>
					<h3>CHINH SACH GIAO HANG</h3>
					<p>Nhan hang va thanh toan tai nha</p>

				</div>
			</div>
			<div class="trenne box">
				<i class="fas fa-comments" id="iconpayne"></i>
				<div>
					<h3>CHINH SACH GIAO HANG</h3>
					<p>Nhan hang va thanh toan tai nha</p>

				</div>
			</div>
		</div>

		<div class="dashed-line"></div>

		<div class="end-code">

			<div class="box1 box">
				<h3>Tong dai ho tro mien phi</h3>
				 

				</ul>
				<span>DANG KY NHAN TIN KHUYEN MAI <br>
				<a style="color: red; margin-top: px;">(*) Nhan ngay voucher 10%</a><br>
					<p>*Voucher se duoc gui sau 24h, chi ap dung cho khac hang moi
					</p>
				</span>
				<div class="cssinput">
					<input type="email" placeholder="Email"> <input type="text"
						placeholder="Number phone">
					<div>
						<input type="checkbox" style="width: 4%;"> Toi dong y voi
						dieu khoan cua shop
					</div>
				</div>
				<button>Dang ky ngay</button>
			</div>
			<div class="box2 box ">
				<h3 class="title2">Thong tin va chinh sach</h3>

				<ul>
					<li>Mua hang va thanh toan Online</li>
					<li>Mua hang tra gop Online</li>
					<li>Mua hang ban the tin dung</li>
					<li>Chinh sach giao hang</li>
					<li>Tra diem Smember</li>
					<li>Xem uu dai Smember</li>
					 

				</ul>
			</div>
			<div class="box3 box">
				<h3>Ket noi voi SHOP</h3>
				<div>
					<ul style="font-size: 25px;">
						<li><i class="fab fa-tiktok"></i></li>
						<li><i class="fab fa-facebook-square"></i></li>
						<li><i class="fab fa-instagram"></i></li>
						<li><i class="fab fa-telegram-plane"></i></li>
						<li><i class="fab fa-rocketchat"></i></li>
					</ul>
				</div>
				 

				<div></div>
			</div>
		</div>
	</div>
</body>
</html>