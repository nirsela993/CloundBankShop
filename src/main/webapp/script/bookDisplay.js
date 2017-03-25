window.listBooks = (books)=>{
	let returnHtml = ""
	for (var bookIndex = books.length - 1; bookIndex >= 0; bookIndex--) {
			returnHtml += window.bookCardTemplate( books[bookIndex] )
	}	
	return returnHtml
}

window.bookCardTemplate = (book)=>{
	return (
	`
			<div class="card book-card" style="width: 20rem;">
					<img class="card-img-top book-image" src="${book.coverPicture}" alt="book cover image">
					<div class="card-block">
						<h4 class="card-title">${book.title}</h4>
						<div class="btn-group" role="group" aria-label="Basic example">
						  <a type="button" class="btn btn-secondary">More Information</a>
						  <a type="button" class="btn btn-success">Buy for ${book.price}$</a>
						</div>
						 <ul class="list-group list-group-flush">
						    <li class="list-group-item">${book.genre}</li>
						    <li class="list-group-item">${book.author}</li>
						    <li class="list-group-item">
						    </li>
					    </ul>
						<p class="card-text">${book.summary}</p>
					</div>
				</div>
`)
}