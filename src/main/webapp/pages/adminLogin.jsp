
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
				<!-- <h3>Add book</h3> -->
				<div id="addForm" style="width: 35rem;">
					<div class="form-group">
						<input type="email" class="form-control" id="inputTitle" aria-describedby="emailHelp" placeholder="Enter Title" value="Cloud Computing: A Hands-On Approach">
						<small id="emailHelp" class="form-text text-muted">the book title</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Author</label>
						<input type="text" class="form-control" id="inputAuthor" placeholder="Author Name" value="Nir and Omer">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Number Of Pages</label>
						<input type="text" class="form-control" id="inputPages" placeholder="Number Of Pages" value="200">
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
						<textarea class="form-control" id="exampleTextarea" rows="7">Recent industry surveys expect the cloud computing services market to be in excess of $20 billion and cloud computing jobs to be in excess of 10 million worldwide in 2014 alone
						</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputFile">Cover Pictures</label>
						<input type="text" class="form-control" id="inputPicture" placeholder="cover picture" value="data:image/jpeg;base64,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">
						<small id="fileHelp" class="form-text text-muted">add a picture data/source or url</small>
					</div>
					
					<button type="submit" class="btn btn-primary" onclick="addBook()">Submit</button>
				</div>
			</div>

			<hr>
			<button id="login" type="button" class="btn btn-info" onclick="login()">login</button>
			<hr>

			<footer>
				<p>© Nir Sela and Omer Mintz 2017</p>
			</footer>
		</div> 


		<script >

			document.getElementById('addForm').style = "display:none"

			window.login = ()=>{
				var password = prompt("enter password","")
				if(password == "ibm")
				{
					document.getElementById('addForm').style = "display:block;width:35rem;"
					document.getElementById('login').style = "display:none"
				} else {
					alert("incorrect password")
				}
			}

			window.addBook = ()=>{
				let newBook = Book.sampleBook();
				newBook.title = document.getElementById('inputTitle').value
				newBook.author = document.getElementById('inputAuthor').value
				newBook.summary = document.getElementById('exampleTextarea').value
				newBook.genre = document.getElementById('exampleSelect1').value
				newBook.coverPicture = document.getElementById('inputPicture').value
				bookStoreAPI.addBookToDataBase(newBook,()=>{
					alert(`uploaded - ${newBook.title}`)
					location.reload()
				})
				// console.log(newBook)
			}
		</script>

	</body>
	</html>