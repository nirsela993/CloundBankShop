document.body.innerHTML = `
		<nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="/index.jsp">IBM Book store</a>

			<div class="collapse navbar-collapse" id="navbarsExampleDefault">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="/index.jsp">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/pages/adminLogin.jsp">Admin Login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/pages/about.jsp">About</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Genre</a>
						<div class="dropdown-menu" aria-labelledby="dropdown01">
							<a class="dropdown-item" href="/pages/booksByGenre.jsp?genre=Action">Action</a>
							<a class="dropdown-item" href="/pages/booksByGenre.jsp?genre=Comedy">Comedy</a>
							<a class="dropdown-item" href="/pages/booksByGenre.jsp?genre=Drama">Drama</a>
							<a class="dropdown-item" href="/pages/booksByGenre.jsp?genre=Kids">Kids</a>
							<a class="dropdown-item" href="/pages/booksByGenre.jsp?genre=Fiction">Fiction</a>
							<a class="dropdown-item" href="/pages/booksByGenre.jsp?genre=Horror">Horror</a>
						</div>
					</li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="text" placeholder="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search by Book Title</button>
				</form>
			</div>
		</nav>
` + document.body.innerHTML;