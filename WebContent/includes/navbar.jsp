<nav class="navbar navbar-expand-lg navbar-light bg-light "
	style="position: fixed; top: 0; left: 0; right: 0; z-index: 10;">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">SHOP OF YOU</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home </a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart
						<span class="badge badge-danger">${cart_list.size()} </span>
				</a></li>

				<%
					if (auth != null) {
				%>
				<form class="form-inline my-2 my-lg-0" action="search.jsp">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search" name="user">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> TYPES OF CLOTH </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="kindproducts.jsp?category=DRESS ">DRESS</a>
						<a class="dropdown-item"
							href="kindproducts.jsp?category=TROUSERS ">TROUSERS</a> <a
							class="dropdown-item" href="kindproducts.jsp?category=JACKET ">JACKET</a>
						<a class="dropdown-item"
							href="kindproducts.jsp?category=FULL SET ">FULL SET</a> <a
							class="dropdown-item" href="kindproducts.jsp?category=SHIRTS ">SHIRTS</a>
						<a class="dropdown-item" href="kindproducts.jsp?category=POLO ">POLO</a>
						<a class="dropdown-item" href="kindproducts.jsp?category=SHORTS">SHORTS</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</nav>