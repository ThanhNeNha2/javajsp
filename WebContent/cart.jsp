<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="cn.techtutorial.model.*"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("auth", auth);
	}

	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DbCon.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total", total);

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cart page</title>

<%@include file="includes/head.jsp"%>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">

		<section class="h-100 gradient-custom">
			<div class="container py-5">
				<div class="row d-flex justify-content-center my-4">
					<div class="col-md-8">
						<div class="card mb-4">
							<div class="card-header py-3">
								<h5 class="mb-0">Cart</h5>
							</div>
							<div class="card-body">

								<%
									if (cart_list != null) {
										for (Cart c : cartProduct) {
											  
								%>

								<!-- Single item -->
								<div class="row">
									<div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
										<!-- Image -->
										<div class="bg-image hover-overlay hover-zoom ripple rounded"
											data-mdb-ripple-color="light">
											<img src="product-images/<%=c.getImage()%>" class="w-100"
												alt="Blue Jeans Jacket" /> <a href="#!">
												<div class="mask"
													style="background-color: rgba(251, 251, 251, 0.2)"></div>
											</a>
										</div>
										<!-- Image -->
									</div>

									<div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
										<!-- Data -->
										<p>
											<strong><%=c.getName()%></strong>
										</p>
										<p><%=c.getCategory()%></p>
										<p>Size: M</p>
										<a href="remove-from-cart?id=<%=c.getId()%>"
											class="btn btn-primary btn-sm me-1 mb-2"
											data-mdb-toggle="tooltip" title="Remove item"> <i
											class="fas fa-trash"></i>
										</a>
										<button type="button" class="btn btn-danger btn-sm mb-2"
											data-mdb-toggle="tooltip" title="Move to the wish list">
											<i class="fas fa-heart"></i>
										</button>
										<!-- Data -->
									</div>

									<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
										<!-- Quantity -->
										<div class="d-flex mb-4"
											style="display: flex; max-width: 300px;">
											<form action="order-now" method="post" class="form-inline">
												<input type="hidden" name="id" value="<%=c.getId()%>"
													class="form-input" />
												<div class="form-group d-flex justify-content-between w-50">
													<a class="btn btn-sm btn-decre"
														href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">
														<i class="fas fa-minus-square"></i>
													</a> <input type="text" name="quantity"
														class="form-control w-50" value="<%=c.getQuantity()%>"
														readonly /> <a class="btn btn-sm btn-incre"
														href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">
														<i class="fas fa-plus-square"></i>
													</a>

												</div>

											</form>
										</div>
										<!-- Quantity -->

										<!-- Price -->
										<p class="text-start text-md-center">
											<strong>Total: <%=dcf.format(c.getPrice())%></strong>
										</p>
										<!-- Price -->
									</div>
								</div>
								<!-- Single item -->

								<hr class="my-4" />


								<%
									}
									}
								%>
							</div>
						</div>
						<div class="card mb-4">
							<div class="card-body">
								<p>
									<strong>Expected shipping delivery</strong>
								</p>
								<p class="mb-0">12.10.2020 - 14.10.2020</p>
							</div>
						</div>
						<div class="card mb-4 mb-lg-0">
							<div class="card-body">
								<p>
									<strong>We accept</strong>
								</p>
								<img class="me-2" width="45px"
									src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
									alt="Visa" /> <img class="me-2" width="45px"
									src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
									alt="American Express" /> <img class="me-2" width="45px"
									src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
									alt="Mastercard" />  
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4">
							<div class="card-header py-3">
								<h5 class="mb-0">Summary</h5>
							</div>
							<div class="card-body">
								<ul class="list-group list-group-flush">
									<li
										class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
										Products <span> $ ${(total>0)?dcf.format(total):0}</span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center px-0">
										Voucher <span> Don't</span>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
										<div>
											<strong>Total amount</strong> <strong>
												<p class="mb-0">(including VAT)</p>
											</strong>
										</div> <span><strong> $
												${(total>0)?dcf.format(total):0}</strong></span>
									</li>
								</ul>

								<button type="button" class="btn btn-primary btn-lg btn-block">
									<a href="cart-check-out" style="color: white;"> Go to
										checkout </a>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>