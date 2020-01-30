package z.talent.tengyu.ui.fore;
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

import z.talent.tengyu.mapper.JournalMapper;

@Controller
@RequestMapping("/")
public class Main {
	
	@Autowired
	private JournalMapper journalMapper;
	@GetMapping("/")
    public String ProfileMain(Model model) {
		model.addAttribute("datas", journalMapper.getJournals(0, 10));
		return "index";
    }
	
	@GetMapping("/show")
    public String ShowMain(Model model,@RequestParam("uuid")String uuid) {
		model.addAttribute("data", journalMapper.getJournalByUuid(uuid));
		return "showPage";
    }
}
