
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
				<h3>Add book</h3>
				<form id="addForm">
					<div class="form-group">
						<input type="email" class="form-control" id="inputTitle" aria-describedby="emailHelp" placeholder="Enter Title">
						<small id="emailHelp" class="form-text text-muted">the book title</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Author</label>
						<input type="text" class="form-control" id="inputAuthor" placeholder="Author Name">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Number Of Pages</label>
						<input type="text" class="form-control" id="inputPages" placeholder="Number Of Pages">
					</div>
					<div class="form-group">
						<label for="exampleSelect1">Genre</label>
						<select class="form-control" id="exampleSelect1">
							<option>Action</option>
							<option>Comedy</option>
							<option>Drama</option>
							<option>Kids</option>
							<option>Fiction</option>
							<option>Horror</option>
						</select>
					</div>
					
					<div class="form-group">
						<label for="exampleTextarea">Summary</label>
						<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputFile">Cover Pictures</label>
						<input type="text" class="form-control" id="inputPicture" placeholder="cover picture">
						<small id="fileHelp" class="form-text text-muted">add a picture data/source or url</small>
					</div>
					
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>

			<hr>
			<button id="login" type="button" class="btn btn-info" onclick="login()">login</button>
			<hr>

			<footer>
				<p>© Nir Sela and Omer Mintz 2017</p>
			</footer>
		</div> 


		<script >
			window.login = ()=>{
				var password = prompt("enter password","")
				if(password == "ibm")
				{
					document.getElementById('login').style = "display:none"
				} else {
					alert("incorrect password")
				}
			}
		</script>

	</body>
	</html>