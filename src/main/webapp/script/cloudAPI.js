const CLOUDENT_QUERY_URL = 'https://nirsela993.cloudant.com/comics_shop/_find'
const DB_STATS_URL = 'https://nirsela993.cloudant.com/comics_shop/'
const booksQueryAmountAtOnce = 6
const ALL_BOOKS_VIEW = `https://nirsela993.cloudant.com/comics_shop/_design/GetBooks/_view/GetBooks?limit=${booksQueryAmountAtOnce}`
const GET_BOOK_BY_TITLE_URL = `https://nirsela993.cloudant.com/comics_shop/_design/GetBooks/_search/title?query=`

const bookStoreAPI = {}

bookStoreAPI.getAllBooks = (paging,callback)=>{
	let headers = new Headers()
	headers.set("Content-Type","application/json")

	let options = {
		method: 'GET',
		headers: headers,
	}

	fetch(`${ALL_BOOKS_VIEW}&skip=${booksQueryAmountAtOnce*paging}`, options)
	.then((response)=> {return response.json()}).then((resultJson)=> {
		let books = Book.createBooksFromJsonArray(resultJson.rows.map((book)=>{ return book.value}))
		callback( books )
	})
}

bookStoreAPI.getBooksByGenre = (genre,paging,callback)=>{
	let headers = new Headers()
	headers.set("Content-Type","application/json")

	let payload = {
		"selector": {	"genre":genre	},
		"fields": [	"_id","title","coverPicture","price","summary","author","genre"],
		"sort": [{"_id": "asc"}],
		"skip":paging*booksQueryAmountAtOnce,"limit":booksQueryAmountAtOnce
	}
	let options = {
		method: 'POST',
		headers: headers,
		body: JSON.stringify(payload)
	}

	fetch(CLOUDENT_QUERY_URL, options)
	.then((response)=> {return response.json()}).then((resultJson)=> {
		let books = Book.createBooksFromJsonArray(resultJson.docs)
		callback( books )
	})
}

bookStoreAPI.getBookById = (id,callback)=>{
	let headers = new Headers()
	headers.set("Content-Type","application/json")

	let payload = {
		"selector": { "_id" : id },

		"fields": [	"_id", "title","picture", "genre", "dateAdded",
		"author", "numberOfPages", "rating", "aumountOfBooksInStore", "coverPicture","price","summary"]
		
	}
	let options = {
		method: 'POST',
		headers: headers,
		body: JSON.stringify(payload)
	}

	fetch(CLOUDENT_QUERY_URL, options)
	.then((response)=> {return response.json()}).then((resultJson)=> {
		let book = new Book(resultJson.docs[0])
		callback( book )
	})
}

bookStoreAPI.getBooksByTitle = (title,callback)=>{
	let headers = new Headers()
	headers.set("Content-Type","application/json")

	let options = {
		method: 'GET',
		headers: headers,
	}

	fetch(`${GET_BOOK_BY_TITLE_URL}title:${title}`, options)
	.then((response)=> {return response.json()}).then((resultJson)=> {
		let book = (resultJson.rows)
		callback( book )
	})
}

bookStoreAPI.getNumberOfTitlesAvalible = (callback)=>{
	let headers = new Headers()
	headers.set("Content-Type","application/json")
	let options = {
		method: 'GET',
		headers: headers,
	}

	fetch(DB_STATS_URL, options)
	.then((response)=> {	return response.json()	}).then((resultJson)=> {
		callback( resultJson.doc_count )
	})
}

const ADMIN_API_URL = 'https://nirsela993.cloudant.com/comics_shop'

bookStoreAPI.addBookToDataBase = (book,callback)=>{
	let headers = new Headers()
	headers.set("Content-Type","application/json")

	bookStoreAPI.getNumberOfTitlesAvalible((numberOfBookTitles)=>{
		book._id = 'book:'+(++numberOfBookTitles)
		let payload = book
		let options = {
			method: 'POST',
			headers: headers,
			body: JSON.stringify(payload),
		}

		fetch(ADMIN_API_URL, options)
		.then((response)=> {return response.json()}).then((resultJson)=> {
			callback( resultJson )
		})		
	})
}

window.bookStoreAPI = bookStoreAPI