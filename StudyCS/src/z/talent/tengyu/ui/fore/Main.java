package z.talent.tengyu.ui.fore;
import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import z.talent.tengyu.bean.Journal;
import z.talent.tengyu.mapper.JournalMapper;

@Controller
@RequestMapping("/")
public class Main {
	
	@Autowired
	private JournalMapper journalMapper;
	@GetMapping("/")
    public String ProfileMain(Model model,@RequestParam(value = "page",required = false)Integer page) {
		
		
		int counts = journalMapper.getJournalCounts();
		page = page==null?0:page;
		int offset = page*10;
		ArrayList<Journal> arg1 = journalMapper.getJournals(offset, 10);
		model.addAttribute("datas", arg1);
		model.addAttribute("next", offset+10>counts?-1:page+1);
		model.addAttribute("previous", page==0?-1:page-1);
		return "index";
    }
	
	@GetMapping("/show")
    public String ShowMain(Model model,@RequestParam("uuid")String uuid) {
		model.addAttribute("data", journalMapper.getJournalByUuid(uuid));
		return "showPage";
    }
}
