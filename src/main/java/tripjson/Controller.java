package tripjson;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

//@org.springframework.stereotype.Controller
@RestController
public class Controller {

	
//	@RequestMapping(value="/ajaxtest", method=RequestMethod.POST)
//	public void ajaxtest(@RequestBody VO vo) {
//		System.out.println(vo.toString());
//	}
	
//	@RequestMapping(value="/ajaxtest", method=RequestMethod.POST)
//	public int ajaxtest(@RequestParam Map<String, Object> param) {
//		System.out.println(param);
//		String name = (String)param.get("보건기관명");
//		System.out.println(name);
//		return 1;
//	}
	
//	@RequestMapping(value="/ajaxtest", method=RequestMethod.POST)
//	public int ajaxtest(@RequestParam Map<String, Object> param) {
//		System.out.println(param);
//		String name = (String)param.get("name");
//		System.out.println(name);
//		return 1;
//	}
	
//	@RequestMapping("/sendjson")
//	public String send(@RequestParam List<Map<String, Object>> param){
//		System.out.println(param.get(0).get("name"));
//		System.out.println(param.getClass().getName());
//		return "test";
//	}

//	@PostMapping("/sendjson")
//	public String sendJson(@RequestBody Map<String, Object> ppp) {
//	    System.out.println(ppp.get("name"));
//	    return "test";
//	}
	
//	@PostMapping("/senddata")
//	public String senddata(@RequestBody TripVO vo) {
//		System.out.println(vo.getAddr1() + "," + vo.getTitle());
//	    return "test";
//	}
	
	@PostMapping("/senddata")
	public String senddata(@RequestBody List<Map<String, Object>> t) {
		System.out.println("addrl : " + t.get(1).get("addr1"));
		TripVO[] vo = null;
		for(int i = 0; i < 10; i++) {
			vo[i] = new TripVO();
			vo[i].setAddr1((String)t.get(i).get("addr1"));
			vo[i].setAddr2((String)t.get(i).get("addr2"));
			vo[i].setFirstimage((String)t.get(i).get("firstimage"));
			vo[i].setTitle((String)t.get(i).get("title"));
			
			System.out.println(vo[i].getAddr1()+","+vo[i].getAddr2()+","+vo[i].getTitle());
		}
		
		
		
	    return "test";
	}
	
	
//	@PostMapping("/sendjson")
//	public String send(@RequestBody Person p){
//		//System.out.println(p.toString());
//		System.out.println(p.toString());
//		
//		return "ok";
//		
//	}
	
//	@PostMapping("/sendjson")
//	public String sendJson(@RequestBody List<Map<String, Object>> ppp) {
//	    System.out.println("보건기관명:"+ppp.get(10).get("보건기관명"));
//	    System.out.println("보건기관 유형:"+ppp.get("보건기관 유형"));
//	    String name = (String) ppp.get("보건기관명");
//	    System.out.println("name="+name);
//	    return "test";
//	}
	
	
	@PostMapping("/resttripjson")
	public JSONObject tripjson(@RequestBody List<Map<String,Object>> info) {
		System.out.println("test");
		System.out.println(info.get(1));
//		String addr1 = (String) info.get(1).get("addr1");
//		System.out.println(addr1);
		
		JSONObject addrJsonObject = new JSONObject(info.get(1));
		
		return addrJsonObject;
	}
	
//	@PostMapping("/resttripjson")
//	public ModelAndView tripjson(@RequestBody List<Map<String,Object>> info) {
//		ModelAndView mv = new ModelAndView();
//		System.out.println("test");
//		System.out.println(info.get(1));
//		String addr = (String)info.get(1).get("addr1");
//		mv.addObject("tripaddr",addr);
//		mv.setViewName("tripjson");
//		
//		return mv;
//	}
}
