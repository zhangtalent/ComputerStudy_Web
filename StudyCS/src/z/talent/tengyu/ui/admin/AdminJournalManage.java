package z.talent.tengyu.ui.admin;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.tools.framedump;
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
import org.springframework.web.multipart.MultipartFile;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.exception.CosClientException;
import com.qcloud.cos.exception.CosServiceException;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.model.StorageClass;
import com.qcloud.cos.region.Region;

import z.talent.tengyu.bean.Journal;
import z.talent.tengyu.mapper.JournalMapper;
import z.talent.tengyu.server.PhotoUploadServe;
import z.talent.tengyu.server.inf.PhotoUploadServeImpl;

@Controller
@SessionScope
@RequestMapping("/admin")
public class AdminJournalManage {
	
	@Resource(name="PhotoUploadServeImpl")
	PhotoUploadServe photoUploadServe;
	
	@Autowired
	JournalMapper journalMapper;
	//后台主页
	
	
	//后台的日志管理主页
	@GetMapping("/journal")
    public String AdminJournalPage(Model model,@RequestParam(value = "page",required = false)Integer page) {
		//System.err.println("正在被访问");
        //model.addAttribute("number", photoUploadServe.getNumber());
		int counts = journalMapper.getJournalCounts();
		page = page==null?0:page;
		int offset = page*10;
		ArrayList<Journal> arg1 = journalMapper.getJournals(offset, 10);
		model.addAttribute("datas", arg1);
		model.addAttribute("next", offset+10>counts?-1:page+1);
		model.addAttribute("previous", page==0?-1:page-1);
        return "admin_journal";
    }
	
	//后台的日志添加主页
	@GetMapping("/journal/add")
    public String AdminJournalAdd(Model model) {
		//System.err.println("正在被访问");
        //model.addAttribute("message", "Hello World!");
        return "admin_journal_add";
    }
	
	//后台的日志添加主页
	@PostMapping("/journal_add")
    public String AdminJournalAddVerify(Model model,HttpServletResponse response,@RequestParam("title")String title,@RequestParam("content")String content) throws IOException {
		//System.err.println("正在被访问");
        //model.addAttribute("message", "Hello World!");
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		String time = format0.format(new Date());
		String uuid = UUID.randomUUID().toString();
		Journal journal = new Journal(title,content, time, uuid, "", "", "");
		boolean b = journalMapper.insertJournal(journal);
		//response.sendRedirect("journal");
		return "redirect:journal";
    }
	
	//后台的日志修该主页
		@GetMapping("/journal/edit")
	    public String AdminJournalGetEdit(Model model,@RequestParam("uuid")String uuid) {
			//System.err.println("正在被访问");
	        //model.addAttribute("message", "Hello World!");
			model.addAttribute("data", journalMapper.getJournalByUuid(uuid));
	        return "admin_journal_edit";
	    }
	
	//后台的日志添加主页
		@PostMapping("/journal_edit")
	    public String AdminJournalEdit(Model model,HttpServletResponse response,@RequestParam("uuid")String uuid,@RequestParam("title")String title,@RequestParam("content")String content) throws IOException {
			//System.err.println("正在被访问");
			boolean b = journalMapper.updateJournal(title, content, uuid);
			//response.sendRedirect("journal");
			return "redirect:journal";
	    }

	@ResponseBody
	@PostMapping("/journal/upload_photo")
    public String AdminPage(@RequestParam(value="file",required=false) MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException {
		//System.out.println(file.getName()+"----------------"+file.getOriginalFilename());
		
		String filenameString = photoUploadServe.transportFile(file);
		String resultString = photoUploadServe.uploadToserve(filenameString);
        return resultString;
    }
	
	@GetMapping("/journal/show")
    public String ShowMain(Model model,@RequestParam("uuid")String uuid) {
		model.addAttribute("data", journalMapper.getJournalByUuid(uuid));
		return "showPage";
    }
	
	@ResponseBody
	@PostMapping("/journal/deletejournal")
    public String AdminPage(@RequestParam("uuid")String uuid,
			HttpServletRequest request) {
		boolean del_ok = journalMapper.DeleteJournalByUuid(uuid);
        return del_ok == true ? "{\"result\":\"ok\"}": "{\"result\":\"fail\"}";
    }
	
}
