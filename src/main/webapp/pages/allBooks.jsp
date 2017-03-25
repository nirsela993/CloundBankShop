
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

			<div class="row justify-content-md-center" id="pageContent">
			</div>

			<hr>
			<button id="loadMore" type="button" class="btn btn-info" onclick="loadBooks()">Load More</button>
			<hr>

			<footer>
				<p>© Nir Sela and Omer Mintz 2017</p>
			</footer>
		</div> 


		<script >
			var paging = 0
			window.loadBooks = ()=>{
				bookStoreAPI.getAllBooks(paging++,(books)=>{
					document.getElementById('pageContent').innerHTML += listBooks(books)
					if(books.length < 6 ){
						document.getElementById('loadMore').style = "display:none"
					}
				})
			}
			loadBooks()
		</script>

	</body>
	</html>