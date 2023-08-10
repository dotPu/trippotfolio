package tripjson;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/json")
	public String json(){
		return "json";
	}
	
	@RequestMapping("/trip")
	public String trip(){
		return "trip";
	}
	
	@RequestMapping("/tripjsonProc")
	public String tripjsonProc(){
		return "tripjsonProc";
	}
	
}
