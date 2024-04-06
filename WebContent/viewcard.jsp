<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet">
<style>
/*****************globals*************/
body {
	font-family: 'open sans';
	overflow-x: hidden;
}

img {
	max-width: 100%;
}

.preview {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
}

@media screen and (max-width: 996px) {
	.preview {
		margin-bottom: 20px;
	}
}

.preview-pic {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.preview-thumbnail.nav-tabs {
	border: none;
	margin-top: 15px;
}

.preview-thumbnail.nav-tabs li {
	width: 18%;
	margin-right: 2.5%;
}

.preview-thumbnail.nav-tabs li img {
	max-width: 100%;
	display: block;
}

.preview-thumbnail.nav-tabs li a {
	padding: 0;
	margin: 0;
}

.preview-thumbnail.nav-tabs li:last-of-type {
	margin-right: 0;
}

.tab-content {
	overflow: hidden;
}

.tab-content img {
	width: 100%;
	-webkit-animation-name: opacity;
	animation-name: opacity;
	-webkit-animation-duration: .3s;
	animation-duration: .3s;
}

.card {
	margin-top: 50px;
	background: #eee;
	padding: 3em;
	line-height: 1.5em;
}

@media screen and (min-width: 997px) {
	.wrapper {
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
	}
}

.details {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
}

.colors {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.product-title, .price, .sizes, .colors {
	text-transform: UPPERCASE;
	font-weight: bold;
}

.checked, .price span {
	color: #ff9f1a;
}

.product-title, .rating, .product-description, .price, .vote, .sizes {
	margin-bottom: 15px;
}

.product-title {
	margin-top: 0;
}

.size {
	margin-right: 10px;
}

.size:first-of-type {
	margin-left: 40px;
}

.color {
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
	height: 2em;
	width: 2em;
	border-radius: 2px;
}

.color:first-of-type {
	margin-left: 20px;
}

.add-to-cart, .like {
	background: #ff9f1a;
	padding: 1.2em 1.5em;
	border: none;
	text-transform: UPPERCASE;
	font-weight: bold;
	color: #fff;
	-webkit-transition: background .3s ease;
	transition: background .3s ease;
}

.add-to-cart:hover, .like:hover {
	background: #b36800;
	color: #fff;
}

.not-available {
	text-align: center;
	line-height: 2em;
}

.not-available:before {
	font-family: fontawesome;
	content: "\f00d";
	color: #fff;
}

.orange {
	background: #ff9f1a;
}

.green {
	background: #85ad00;
}

.blue {
	background: #0076ad;
}

.tooltip-inner {
	padding: 1.3em;
}

@
-webkit-keyframes opacity { 0% {
	opacity: 0;
	-webkit-transform: scale(3);
	transform: scale(3);
}

100%
{
opacity


:

 

1;
-webkit-transform


:

 

scale


(1);
transform


:

 

scale


(1);
}
}
@
keyframes opacity { 0% {
	opacity: 0;
	-webkit-transform: scale(3);
	transform: scale(3);
}
100%
{
opacity


:

 

1;
-webkit-transform


:

 

scale


(1);
transform


:

 

scale


(1);
}
}

/*# sourceMappingURL=style.css.map */
</style>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	%>
	<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>
	<div class="container  ">
		<div class="row  pagination justify-content-center"
			style="display: flex;">
			<%
				try {

					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root",
							"020903");
					Statement st = con.createStatement();
					String id = request.getParameter("id");
					String sqlStr = "SELECT * FROM products  WHERE id LIKE '" + id + "'";

					ResultSet rs = st.executeQuery(sqlStr);
					while (rs.next()) {
			%>


			<div class="card">
				<div class="container-fliud">
					<div class="wrapper row">
						<div class="preview col-md-6">

							<div class="preview-pic tab-content">
								<div class="tab-pane active" id="pic-1">
									<img src="product-images/<%=rs.getString("image")%>" />
								</div>
								<div class="tab-pane" id="pic-2">
									<img src="product-images/<%=rs.getString("image")%>" />
								</div>
								<div class="tab-pane" id="pic-3">
									<img src="product-images/<%=rs.getString("image")%>" />
								</div>
								<div class="tab-pane" id="pic-4">
									<img src="product-images/<%=rs.getString("image")%>" />
								</div>
								<div class="tab-pane" id="pic-5">
									<img src="product-images/<%=rs.getString("image")%>" />
								</div>
							</div>

						</div>
						<div class="details col-md-6">
							<h3 class="product-title"><%=rs.getString("name")%></h3>
							<div class="rating">
								<div class="stars">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
								<span class="review-no">41 reviews</span>
							</div>
							<p class="product-description">
								Here, we proudly introduce a diverse and extensive collection of
								clothing, from classic ensembles to the latest trends. With
								exquisite designs and quality materials, each of our products is
								crafted to showcase your individual style and provide all-day
								comfort. <br> For gentlemen, we offer sophisticated outfits
								ranging from elegant dress shirts to casual yet stylish
								t-shirts, from versatile jeans to refined trousers.
								Additionally, our sportswear and streetwear designs will make
								you stand out in any occasion. <br> For the ladies, our
								collection features a variety of options from chic dresses and
								stylish blouses to comfortable leggings and trendy t-shirts.
								Whether you prefer a feminine, dynamic, or edgy style, we have
								suitable choices to help you confidently shine. <br>
								Explore and experience the diversity and style at our store
								today to find the perfect products that suit you best!
							</p>
							<h4 class="price">
								current price: <span><%=rs.getString("price")%> $ </span>
							</h4>
							<p class="vote">
								<strong>91%</strong> of buyers enjoyed this product! <strong>(87
									votes)</strong>
							</p>
							<h5 class="sizes">
								sizes: <span class="size" data-toggle="tooltip" title="small">s</span>
								<span class="size" data-toggle="tooltip" title="medium">m</span>
								<span class="size" data-toggle="tooltip" title="large">l</span>
								<span class="size" data-toggle="tooltip" title="xtra large">xl</span>
							</h5>
							<h5 class="colors">
								colors: <span class="color orange not-available"
									data-toggle="tooltip" title="Not In store"></span> <span
									class="color green"></span> <span class="color blue"></span>
							</h5>
							<div class="action">
								<button class="add-to-cart btn btn-default" type="button"><a href="add-to-cart?id=<%=rs.getString("id")%>"><i
									class="fa fa-shopping-bag"></i> Add to cart</a></button>
								<button class="like btn btn-default" type="button">
									<span class="fa fa-heart"></span>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>


			<%
				}
				} catch (Exception e) {
					System.out.print(e.getMessage());
				}
			%>
		</div>
	</div>
	hi
</body>
</html>