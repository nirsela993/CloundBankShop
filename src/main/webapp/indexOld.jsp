<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="script/scripts.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
    	<div style="border: 1px solid">
        <h1>HTTP GET direct from javascript</h1>
        <p>this example uses the javascript function GetJson (defined at the file script/scripts.js) to make an http request<br/>
        	the request is to the address /liber/asaf (at the current domain), at this address sits a Java based custom REST service<br/>
        	the request executes in async fashion, you state what happens when the request status change using the event onreadystatechanged<br/>
        	we do this by adding an anonymous function which runs when the request status is changed. <br/>
        	after setting that function we call the req.open and set the method for the request (GET) and the address (/liber/asaf)</br>
        	lastly we call the req.send() method which sends the request.</br>
        	when the request state is changed due to success or failure, the anonymous function we created for the event is executed. <br/>
        	if the status is good, the "notifications" will show up<br/>
        	 </p>
        
        <table id="notificationTable">
        	<thead>
        	<tr>
        		<td>id</td><td>sender</td><td>data</td>
        	</tr>
        	</thead>
        	<tbody id="TableBody">
        	</tbody>
        </table>
        </div>
        <script>
        	GetJson("liber/asaf",showNotifications);
        </script>
        
        <div style="border: 1px solid">
        <h1>POST directly from JS to database</h1>
        <p>
        	this example shows how to post data directly from a form to Cloudant CouchDB document database.
        	<br/> we achieve this by creating a simple form which holds two inputs, one for first name and one for last name
        	<br/> when the client presses the submit button the javascript function "onsubmit" is executed,
        	<br/> at that point we create a new request sent to the following address<br/>
        			<a href="https://282a72b9-3652-45ce-9da5-01e77457e72a-bluemix.cloudant.com/algawidb">https://282a72b9-3652-45ce-9da5-01e77457e72a-bluemix.cloudant.com/algawidb</a>
        	<br/>which is my cloudantDB address.
        	<br/>we create it as a POST request (note that this is stated at the script, not just the form)
        	<br/>we create an empty JSON object using the command "var json = {};"
        	<br/>add two keys and set their values to the inputs in the form.
        	<br/>we set the request header using the following "req.setRequestHeader("Content-Type","application/json");"
        	<br/>if you look at the cloudant documentation you will notice that this is required when sending a POST request.
        	<br/>we open the request using req.open("POST",address)
        	<br/>and we send it via the req.send(JSON.stringify), this will put the string value ot the json request as the request body.
        	<br/>if you would like to see how the json looks like click the link below the form before submitting.
        </p>
        <form name="frm1" id="frm2" method="post" action="#">
        	<input type="text" id="f_name" placeholder="enter first name"></input>
        	<input type="text" id="l_name" placeholder="enter last name"></input>
        	
        	<input type="button" onclick="submitForm()"/>
        	
        </form>
        
       	<a href="javascript:jsonSerialze()">click me to see how the json looks like</a>
        </div>
        <div style="border: 1px solid">
        <h1>File Upload to CloudantDB</h1>
        <form name="frm2" id="frm2" method="post" action="#">
        	<input type="file" id="file"></input>
        	<input type="button" onclick="fileUpload()"/>
        </form>
        </div>
        
        <div style="border:1px solid">
        	<h1>image scroller</h1>
        	this examples requests all documents with type File from the DB using this view
        	<br/><a href="https://282a72b9-3652-45ce-9da5-01e77457e72a-bluemix.cloudant.com/algawidb/_design/GetFiles/_view/new-view?limit=20&reduce=false">click here</a>
        	<br/>we start with an empty drop down menu
        	<br/> we use javascript to populate it using the view above.
        	<br/> when we change our selection the image will appear below.
        	<select id="picture_scroller" onchange="getImage()">
        		<option></option>
        	</select>
        	<script type="text/javascript">
        	getFileList();
        	</script>
        	<img src="none" id="picture"></img>
        </div>
        <div style="border:1px solid;">
        	<h1>custom post example</h1>
        	<form name="frm3" id="frm3" method="post" action="#">
        	<input type="text" id="user" placeholder="your name"></input>
        	<input type="text" id="post" placeholder="your post"></input>
        	<input type="text" id="tags" placeholder="tag list seperated by ;"></input>
        	<input type="button" onclick="CreatePsuedoFaceBookPost()"/>
        </form>
        <div id="posts" style="float:left; clear:none;">
        </div>
        <div id="tagsdiv" style="float:right; clear:none;">
       	</div>
       	
       	<script>
       		setInterval(TagUpdateWrapper,5000);
			setInterval(PostUpdateWrapper,5000);
       	</script>
       	
    </body>
</html>
