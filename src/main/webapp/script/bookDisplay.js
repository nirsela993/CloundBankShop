window.listBooks = (books)=>{
	let returnHtml = ""
	for (var bookIndex = books.length - 1; bookIndex >= 0; bookIndex--) {
			returnHtml += window.bookCardTemplate( books[bookIndex] )
	}	
	return returnHtml
}

window.bookCardTemplate = (book)=>{
	let template =
	`
			<div class="card book-card" style="width: 20rem;">
					<img class="card-img-top book-image" src="${book.coverPicture}" alt="book cover image">
					<div class="card-block">
						<h4 class="card-title">${book.title}</h4>
						<div class="btn-group" role="group" aria-label="Basic example">
						  <a type="button" class="btn btn-secondary" href="/pages/moreInfoBook.jsp?id=${book._id}">More Info</a>`
						let currentUser = JSON.parse( localStorage.getItem("user"))
						if(currentUser != null){
							let isBookInCart = currentUser.bookIds.includes(book._id)
							if(isBookInCart){
								template += `<a type="button" class="btn btn-danger" onclick="removeFromCart('${book._id}')">remove from cart</a>`
							}else{
								template += `<a type="button" class="btn btn-success" onclick="addToCart('${book._id}')">Buy for ${book.price}$</a>`
							}
						} else {
							template += `<a type="button" class="btn btn-success" onclick="addToCart('${book._id}')">Buy for ${book.price}$</a>`
						}
						template +=
						`</div>
						 <ul class="list-group list-group-flush">
						    <li class="list-group-item">
						    	<span class="badge badge-default">${book.genre}</span>
						    </li>
						    <li class="list-group-item">${book.author}</li>
						    <li class="list-group-item">
						    </li>
					    </ul>
						<p class="card-text">${book.summary}</p>
					</div>
				</div>
`
return template
}

window.fullBookCardTemplate = (book)=>{
	let template =
		`
			<div class="card book-card" style="width: 50rem;">
					<img class="card-img-top book-image book-full" src="${book.coverPicture}" alt="book cover image">
					<div class="card-block">
						<h4 class="card-title">${book.title}</h4>
						<div class="btn-group" role="group" aria-label="Basic example">`
						let currentUser = JSON.parse( localStorage.getItem("user"))
						if(currentUser != null){
							let isBookInCart = currentUser.bookIds.includes(book._id)
							if(isBookInCart){
								template += `<a type="button" class="btn btn-danger" onclick="removeFromCart('${book._id}')">remove from cart</a>`
							}else{
								template += `<a type="button" class="btn btn-info" onclick="addToCart('${book._id}')">add to cart</a>`
							}
						} else {
							template += `<a type="button" class="btn btn-info" onclick="addToCart('${book._id}')">add to cart</a>`
						}
						template +=`
						  <a type="button" class="btn btn-secondary">${book.price}$</a>
						</div>
						 <ul class="list-group list-group-flush">
						    <li class="list-group-item">
						    	<span class="badge badge-default">${book.genre}</span>
						    </li>
						    <li class="list-group-item">${book.author}, pages: ${book.numberOfPages}, rating: ${book.rating}/100</li>
						    <li class="list-group-item">
						    </li>
					    </ul>
						<p class="card-text">${book.summary}</p>
					</div>
				</div>
`
return template
}

window.addToCart = (bookId)=>{
	let currentUser = JSON.parse( localStorage.getItem("user"))
	if(currentUser == null){
		currentUser = { email: prompt("enter your email",""), bookIds:[]}
	}
	currentUser.bookIds.push(bookId)
	localStorage.setItem("user",JSON.stringify( currentUser ) )
	location.reload()
}


window.removeFromCart = (removeBookId)=>{
	let currentUser = JSON.parse( localStorage.getItem("user"))
	if(currentUser == null){
		return
		// currentUser = { email: prompt("enter your email",""), bookIds:[]}
	}
	currentUser.bookIds = currentUser.bookIds.filter((bookId)=>{ return (bookId != removeBookId)})
	localStorage.setItem("user",JSON.stringify( currentUser ) )
	location.reload()
}
