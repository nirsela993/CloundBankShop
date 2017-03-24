/**
 * 
 */

function createRequest() {
  var result = null;
  if (window.XMLHttpRequest) {
	    // code for modern browsers
	    result = new XMLHttpRequest();
	 } else {
	    // code for old IE browsers
	    result = new ActiveXObject("Microsoft.XMLHTTP");
   }
  return result;
}

function GetJson(uri,handler) {

	var req = createRequest(); // defined above
	// Create the callback:
	req.onreadystatechange = function() {
	  if (req.readyState != 4) return; // Not there yet
	  if (req.status != 200) {
	    return;
	  }
	  // Request successful, read the response
	  var resp = req.responseText;
	  handler(JSON.parse(resp));
	}
	
	req.open("GET",uri,true);
	req.send();
	return;
}

function showNotifications(jsonArray) {
	htmlString = "";
	var i;
	for (i=0; i<jsonArray.length; i++) {
		htmlString += "<tr><td>"+i+"</td><td>"+jsonArray[i].sender+"</td><td>"+jsonArray[i].data+"</td></tr>";
	}
	
	document.getElementById("TableBody").innerHTML = htmlString;
	return;
}


function jsonSerialze() {
	var json = {};
	json['f_name'] = document.getElementById("f_name").value;
	json['l_name'] = document.getElementById("l_name").value;
	
	alert (JSON.stringify(json));
}


function submitForm() {
	var json = {};
	json['f_name'] = document.getElementById("f_name").value;
	json['l_name'] = document.getElementById("l_name").value;
	var req = createRequest();
	req.onreadystatechange = function() {
		  if (req.readyState != 4) return; // Not there yet
		  if (req.status != 200) {
			alert("error :("+req.statusText);
		    return;
		  }
		}
	req.open("POST","https://282a72b9-3652-45ce-9da5-01e77457e72a-bluemix.cloudant.com/algawidb",true);
	req.setRequestHeader("Content-Type","application/json");
	req.send(JSON.stringify(json));
}

function storeInDB(name,data) {
	var json = {};
	json['file'] = name;
	json['data'] = data;
	json['type'] = 'File';
	alert(JSON.stringify(json));
	var req = createRequest();
	req.onreadystatechange = function() {
		  if (req.readyState != 4) return; // Not there yet
		  if (req.status != 200) {
			alert("error :("+req.status);
		    return;
		  }
		}
	req.open("POST","https://282a72b9-3652-45ce-9da5-01e77457e72a-bluemix.cloudant.com/algawidb",true);
	req.setRequestHeader("Content-Type","application/json");
	req.send(JSON.stringify(json));
}

function fileUpload() {
	var reader = new FileReader();
	reader.readAsDataURL(document.getElementById("file").files[0]);
	reader.onload= function () {
		storeInDB(document.getElementById("file").value,reader.result);
	}
}

function fillDropDown(json) {
	var i;
	var rows = json.rows;
	var menu = document.getElementById("picture_scroller");
	var html
	for (i=0; i<rows.length; i++) {
		var node = document.createElement("option");
		var text = document.createTextNode(rows[i].key);
		node.appendChild(text);
		node.setAttribute("id",rows[i].value);
		menu.appendChild(node);
	}
	
	
}

function showImage(json) {
	document.getElementById("picture").setAttribute("src",json.data);
}


function getImage() {
	var list = document.getElementById("picture_scroller");	
	var item = document.getElementById("picture_scroller").selectedIndex;
	var image_path = "https://282a72b9-3652-45ce-9da5-01e77457e72a-bluemix.cloudant.com/algawidb/"+list[item].id;
	GetJson(image_path,showImage);
}

function getFileList() {
	GetJson("https://282a72b9-3652-45ce-9da5-01e77457e72a-bluemix.cloudant.com/algawidb/_design/GetFiles/_view/new-view?limit=20&reduce=false",fillDropDown);
}

function doPost() {
	var json = {};
	json['f_name'] = "asaf";
	json['l_name'] = "algawi";
	var req = createRequest();
	req.onreadystatechange = function() {
		  if (req.readyState != 4) return; // Not there yet
		  if (req.status != 200) {
			alert("error :("+req.statusText);
		    return;
		  }
		}
	req.open("POST","QWriter",true);
	req.setRequestHeader("Content-Type","application/json");
	req.send(JSON.stringify(json));
	
}

function CreatePsuedoFaceBookPost() {
	var user = document.getElementById("user").value;
	var post = document.getElementById("post").value;
	var tags = document.getElementById("tags").value.split(';'); //tags are split by a ';' in the UI.
	
	var json = {};
	json["user"] = user;
	json["post"] = post;
	json["tags"] = tags;
	
	var req = createRequest();
	req.onreadystatechange = function() {
		  if (req.readyState != 4) return; // Not there yet
		  if (req.status != 200) {
			alert("error :("+req.statusText);
		    return;
		  }
		}
	req.open("POST","QWriter",true);
	req.setRequestHeader("Content-Type","application/json");
	req.send(JSON.stringify(json));
	
}


function ParsePosts(jsonData) {
	var posts = jsonData["rows"];
	var i;
	var posts_table = document.getElementById("posts");
	var lists = document.createElement("ul");
	posts_table.innerHtml = "";
	for (i=0; i<posts.length; i++) {
		var li = document.createElement("li");
		var text = document.createTextNode(posts[i].value.content);
		li.appendChild(text);
		lists.appendChild(li);
		posts_table.appendChild(li);
	}
}

function ParseTags(jsonData) {
	var posts = jsonData["rows"];
	var i;
	var posts_table = document.getElementById("tagsdiv");
	var lists = document.createElement("ul");
	posts_table.innerHtml = "";
	for (i=0; i<posts.length; i++) {
		var li = document.createElement("li");
		var user = posts[i].user;
		var post = posts[i].value.content;
		var text = document.createTextNode(user+ "tagged in the following post"+post);
		li.appendChild(text);
		lists.appendChild(li);
		posts_table.appendChild(li);
	}
}

function TagUpdateWrapper() {
	GetJson("https://282a72b9-3652-45ce-9da5-01e77457e72a-bluemix.cloudant.com/algawidb/_design/Tags/_view/Tags?limit=20&reduce=false",ParseTags);
}

function PostUpdateWrapper() {
	GetJson("https://282a72b9-3652-45ce-9da5-01e77457e72a-bluemix.cloudant.com/algawidb/_design/Tags/_view/Posts?limit=20&reduce=false",ParsePosts);
}
