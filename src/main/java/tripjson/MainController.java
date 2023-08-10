package tripjson;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("/tripjson")
	public ModelAndView tripjson(JSONObject obj){
		//@RequestBody : json데이터로 받아옴 body는 객체, param은 하나
		ModelAndView mv = new ModelAndView();
		System.out.println("tripjson controller");
		mv.addObject("tripaddr",obj);
		mv.setViewName("tripjson");
		
		return mv;
	}
	
	//ajax

	
}
