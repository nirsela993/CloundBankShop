class Book {
	static createBooksFromJsonArray(jsonArray){
		let books = []
		for (let bookIndex = jsonArray.length - 1; bookIndex >= 0; bookIndex--) {
			books.push(new Book(jsonArray[bookIndex]))
		}
		return books
	}
	static sampleBook(){
		return new Book({
			title:"i am title",
			_id:"book:"+Math.ceil(Math.random()*100),
			genre:"kids",author:"nir nissim",dateAdded:Date.now(),numberOfPages:Math.ceil(Math.random()*100),
			rating:Math.ceil(Math.random()*100),aumountOfBooksInStore:Math.ceil(Math.random()*10),
			summary:"this is a book about life",price:Math.ceil(Math.random()*100)
		})
	}
	constructor(bookJson){
		this.title = bookJson.title
		this._id = bookJson._id
		this.genre = bookJson.genre
		this.dateAdded = bookJson.dateAdded
		this.author = bookJson.author
		this.numberOfPages = bookJson.numberOfPages
		this.rating = bookJson.rating
		this.aumountOfBooksInStore = bookJson.aumountOfBooksInStore
		this.coverPicture = bookJson.coverPicture
		this.price = bookJson.price
		this.summary = bookJson.summary
	}
}