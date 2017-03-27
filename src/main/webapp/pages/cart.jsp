
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>IBM book shop</title>
	<meta name="description" content="The best book shop ever">
	<meta name="author" content="Omer Mintz & Nir Sela">

	<link rel="stylesheet" href="../style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</head>

<body>
	<script src="../script/Book.js"></script>
	<script src="../script/cloudAPI.js"></script>
	<script src="../script/bookDisplay.js"></script>
	<script src="../script/loadNavigation.js"></script>

	<body>


		<div class="container">
			<div class="row justify-content-md-center" style="padding-top: 80px;    margin-bottom: -60px;">
				<h3>Cart</h3>
			</div>
			<div class="row justify-content-md-center" id="pageContent">
				<ul class="list-group" id="cartList" style="width:35rem">
	
				</ul>

			</div>

			<hr>
			<button id="loadMore" type="button" class="btn btn-info" onclick="loadBooks()">Load More</button>
			<hr>

			<footer>
				<p>© Nir Sela and Omer Mintz 2017</p>
			</footer>
		</div> 


		<script >
			let currentUser = JSON.parse( localStorage.getItem("user"))
			if(currentUser == null){
				currentUser = { email: prompt("enter your email",""), bookIds:[]}
			}
			console.log('currentUser',currentUser)
			window.loadBooks = ()=>{
				bookStoreAPI.getBookReddis(currentUser.email,(bookIds)=>{
					console.log(bookIds)
					bookStoreAPI.getNamesFromIds(bookIds,(bookNames)=>{
						for (var i = bookNames.length - 1; i >= 0; i--) {
							document.getElementById('cartList').innerHTML += `
							<li class="list-group-item justify-content-between">
								${bookNames[i]}
								<span class="badge badge-danger badge-pill" onclick="removeFromCart('${bookIds[i]}')">remove</span>
							</li>
							`
						}
					})
				})
			}
			loadBooks()
		</script>

	</body>
	</html>