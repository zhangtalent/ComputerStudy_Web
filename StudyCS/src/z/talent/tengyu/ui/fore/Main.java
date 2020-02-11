package z.talent.tengyu.ui.fore;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author zhangtalent

 * 主页控制器
 * 前端控制器
 * 
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import z.talent.tengyu.bean.Journal;
import z.talent.tengyu.mapper.JournalMapper;
import z.talent.tengyu.mapper.JournalTypesMapper;

@Controller
@RequestMapping("/")
public class Main {
	
	@Autowired
	private JournalMapper journalMapper;
	
	@Autowired
	JournalTypesMapper journalTypesMapper;
	
	@GetMapping("/")
    public String ProfileMain(Model model,@RequestParam(value = "page",required = false)Integer page) {
		
		
		int counts = journalMapper.getJournalCounts();
		page = page==null?0:page;
		int offset = page*10;
		ArrayList<Journal> arg1 = journalMapper.getJournals(offset, 10);
		model.addAttribute("datas", arg1);
		model.addAttribute("types", journalTypesMapper.getTypeAndCount());
		model.addAttribute("next", offset+10>counts?-1:page+1);
		model.addAttribute("previous", page==0?-1:page-1);
		return "index";
    }
	
	@GetMapping("/searchbytype")
    public String SearchByType(Model model,@RequestParam("type")String type,@RequestParam(value = "page",required = false)Integer page) {
		
		int counts = journalMapper.getJournalCountsByType(type);
		page = page==null?0:page;
		int offset = page*10;
		ArrayList<Journal> arg1 = journalMapper.getJournalsByType(type,offset, 10);
		model.addAttribute("datas", arg1);
		model.addAttribute("types", journalTypesMapper.getTypeAndCount());
		model.addAttribute("type", type);
		model.addAttribute("next", offset+10>counts?-1:page+1);
		model.addAttribute("previous", page==0?-1:page-1);
		return "searchbytype";
    }
	
	@GetMapping("/show")
    public String ShowMain(Model model,@RequestParam("uuid")String uuid) {
		model.addAttribute("data", journalMapper.getJournalByUuid(uuid));
		return "showPage";
    }
	/***
	 * 
	 * @param file
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 * 
	 * 学习时间api
	 * 
	 * 
	 */
	@ResponseBody
	@PostMapping("/studydata")
    public String AdminPage(@RequestParam(value="date",required=false) String date) {
		//System.out.println(file.getName()+"----------------"+file.getOriginalFilename());
		//System.out.println(date);
		ArrayList<Journal> arrayList = journalMapper.getJournalByDate(date);
		String dataString = "";
		
		for (int i = 0; i < arrayList.size(); i++) {
			dataString += arrayList.get(i).getTime()+"|";
		}
		int len = dataString.length();
		dataString = len>1?dataString.substring(0, dataString.length()-1):"";
        return "{\"result\":\"ok\",\"data\":\""+dataString+"\"}";
    }
	
	
}
