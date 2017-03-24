package ex4.ex4;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;

@ApplicationPath("/Liberty")
@Path("/ServletApplication")
public class RestExample extends Application {
	@Context
	private UriInfo context;
		
	
	@GET
	@Consumes("application/json")
	public String get() {
		return "hello world";
	}
}
