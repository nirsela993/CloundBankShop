package org.colman.liberty;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import com.lambdaworks.redis.RedisClient;
import com.lambdaworks.redis.api.StatefulRedisConnection;
import com.lambdaworks.redis.api.sync.RedisCommands;


@Path("/books")
public class Books {
	
	@Context
	private UriInfo context;
	
	@GET
	@Path("/setBook")
	@Produces("application/json")
	public Response setBook(@QueryParam("email") String email, @QueryParam("book") String id) {
		 
		 RedisClient client = RedisClient.create("redis://Aa123456@pub-redis-17484.dal-05.1.sl.garantiadata.com:17484");
		 StatefulRedisConnection<String, String> con = client.connect(); 
		 RedisCommands<String, String> coms =  con.sync();
		 String books_ids = coms.get(email);
		 if (books_ids == null) {
			 books_ids = id;
		 }
		 else {
			 books_ids += " " + id;
		 }
		 String res = coms.set(email, books_ids);
		 coms.close();
		 client.shutdown();
		 
		 if (res != "OK") {
			 System.out.println("Could not set a new book to the cart");
			 return Response.status(500).build();
		 }

		 return Response.status(200).build();
	}
	
	@GET
	@Path("/getBooks")
	@Produces("application/json")
	public String getBooks(@QueryParam("email") String email) {
		 
		 RedisClient client = RedisClient.create("redis://Aa123456@pub-redis-17484.dal-05.1.sl.garantiadata.com:17484");
		 StatefulRedisConnection<String, String> con = client.connect(); 
		 RedisCommands<String, String> coms =  con.sync();
		 String res = coms.get(email);
		 if (res == null) {
			 res = "";
		 }
		 coms.close();
		 client.shutdown();
		 return res;
	}
}
