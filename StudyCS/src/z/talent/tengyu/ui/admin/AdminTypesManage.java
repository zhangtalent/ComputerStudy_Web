package z.talent.tengyu.ui.admin;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.context.annotation.SessionScope;


import z.talent.tengyu.bean.JournalTypes;
import z.talent.tengyu.mapper.JournalTypesMapper;
import z.talent.tengyu.server.PhotoUploadServe;

@Controller
@SessionScope
@RequestMapping("/admin")
public class AdminTypesManage {
	
	@Resource(name="PhotoUploadServeImpl")
	PhotoUploadServe photoUploadServe;
	
	@Autowired
	JournalTypesMapper journalTypesMapper;
	//后台主页
	
	
	//的类型管理主页
	@GetMapping("/types")
    public String AdminTypesPage(Model model,@RequestParam(value = "page",required = false)Integer page) {
		//System.err.println("正在被访问");
        //model.addAttribute("number", photoUploadServe.getNumber());
		//int counts = journalMapper.getJournalCounts();
		//page = page==null?0:page;
		//int offset = page*10;
		ArrayList<JournalTypes> arg1 = journalTypesMapper.getTypes();
		model.addAttribute("datas", arg1);
		//model.addAttribute("next", offset+10>counts?-1:page+1);
		//model.addAttribute("previous", page==0?-1:page-1);
        return "admin_types";
    }
	
	//后台的类型添加主页
	@PostMapping("/types_add")
    public String AdmintypesAdd(Model model,HttpServletResponse response,@RequestParam("title")String title,@RequestParam("keyid")String keyid) throws IOException {
		
		String uuid = UUID.randomUUID().toString();
		JournalTypes journalTypes = new JournalTypes(keyid,title, uuid);
		boolean b = journalTypesMapper.insertType(journalTypes);
		return "redirect:types";
    }
	
	
	@ResponseBody
	@PostMapping("/deletejournaltype")
    public String AdminPage(@RequestParam("uuid")String uuid,
			HttpServletRequest request) {
		boolean del_ok = journalTypesMapper.DeleteTypeByUuid(uuid);
        return del_ok == true ? "{\"result\":\"ok\"}": "{\"result\":\"fail\"}";
    }
	
}
