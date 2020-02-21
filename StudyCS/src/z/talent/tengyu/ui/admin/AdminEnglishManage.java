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

import z.talent.tengyu.bean.EnglishAudio;
import z.talent.tengyu.bean.EnglishPassage;
import z.talent.tengyu.bean.Journal;
import z.talent.tengyu.bean.JournalTypes;
import z.talent.tengyu.mapper.EnglishAudioMapper;
import z.talent.tengyu.mapper.EnglishPassageMapper;
import z.talent.tengyu.mapper.JournalMapper;
import z.talent.tengyu.mapper.JournalTypesMapper;
import z.talent.tengyu.server.PhotoUploadServe;
import z.talent.tengyu.server.inf.PhotoUploadServeImpl;

@Controller
@SessionScope
@RequestMapping("/admin")
public class AdminEnglishManage {
	
	@Resource(name="PhotoUploadServeImpl")
	PhotoUploadServe photoUploadServe;
	
	@Autowired
	EnglishAudioMapper englishAudioMapper;
	//后台主页
	@Autowired
	EnglishPassageMapper englishPassageMapper;
	
	//后台的听力管理主页
	@GetMapping("/english/audio")
    public String AdminJournalPage(Model model,@RequestParam(value = "page",required = false)Integer page) {
		//System.err.println("正在被访问");
        //model.addAttribute("number", photoUploadServe.getNumber());
		int counts = englishAudioMapper.getEnglishAudioCounts();
		page = page==null?0:page;
		int offset = page*10;
		ArrayList<EnglishAudio> arg1 = englishAudioMapper.getEnglishAudios(offset, 10);
		model.addAttribute("datas", arg1);
		model.addAttribute("next", offset+10>counts?-1:page+1);
		model.addAttribute("previous", page==0?-1:page-1);
        return "admin_english_audio";
    }
	
	//后台的音频添加主页
	@GetMapping("/english/audioadd")
    public String AdminJournalAdd(Model model) {
		//System.err.println("正在被访问");
        //model.addAttribute("message", "Hello World!");
        return "admin_english_audio_add";
    }
	
	//后台的添加主页
	@PostMapping("english/audio_add")
    public String AdminJournalAddVerify(Model model,HttpServletResponse response,@RequestParam("audiourl")String audiourl,@RequestParam("title")String title,@RequestParam("content")String content) throws IOException {
		//System.err.println("正在被访问");
        //model.addAttribute("message", "Hello World!");
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		String time = format0.format(new Date());
		String uuid = UUID.randomUUID().toString();
		EnglishAudio englishAudio = new EnglishAudio(title,audiourl,content,time,uuid);
		boolean b = englishAudioMapper.insertEnglishAudio(englishAudio);
		//response.sendRedirect("journal");
		return "redirect:audio";
    }

	@ResponseBody
	@PostMapping("/english/upload_file")
    public String AdminPage(@RequestParam(value="file",required=false) MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException {
		//System.out.println(file.getName()+"----------------"+file.getOriginalFilename());
		
		String filenameString = photoUploadServe.transportFile(file);
		String resultString = photoUploadServe.uploadAudioToserve(filenameString);
        return resultString;
    }
	
	
	@ResponseBody
	@PostMapping("/english/deleteaudio")
    public String AdminEnglishAudioDelete(@RequestParam("uuid")String uuid,
			HttpServletRequest request) {
		boolean del_ok = englishAudioMapper.DeleteEnglishAudioByUuid(uuid);
        return del_ok == true ? "{\"result\":\"ok\"}": "{\"result\":\"fail\"}";
    }
	
	
	
	
	
	
	
	/**
	 * 上传阅读的内容
	 * 
	 */
	//后台的管理主页
		@GetMapping("/english/read")
	    public String AdminReadPage(Model model,@RequestParam(value = "page",required = false)Integer page) {
			//System.err.println("正在被访问");
	        //model.addAttribute("number", photoUploadServe.getNumber());
			int counts = englishPassageMapper.getEnglishPassageCounts();
			page = page==null?0:page;
			int offset = page*10;
			ArrayList<EnglishPassage> arg1 = englishPassageMapper.getEnglishPassages(offset, 10);
			model.addAttribute("datas", arg1);
			model.addAttribute("next", offset+10>counts?-1:page+1);
			model.addAttribute("previous", page==0?-1:page-1);
	        return "admin_english_read";
	    }
		
		//后台的添加主页
		@GetMapping("/english/readadd")
	    public String AdminReadAdd(Model model) {
			//System.err.println("正在被访问");
	        //model.addAttribute("message", "Hello World!");
	        return "admin_english_read_add";
	    }
		
		//后台的添加主页
		@PostMapping("english/read_add")
	    public String AdminReadAddVerify(Model model,HttpServletResponse response,@RequestParam("title")String title,@RequestParam("content")String content) throws IOException {
			//System.err.println("正在被访问");
	        //model.addAttribute("message", "Hello World!");
			SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
			String time = format0.format(new Date());
			String uuid = UUID.randomUUID().toString();
			EnglishPassage englishPassage = new EnglishPassage(title, content, time, uuid);
			boolean b = englishPassageMapper.insertEnglishPassage(englishPassage);
			//response.sendRedirect("journal");
			return "redirect:read";
	    }

		
		@ResponseBody
		@PostMapping("/english/deleteread")
	    public String AdminEnglishReadDelete(@RequestParam("uuid")String uuid,
				HttpServletRequest request) {
			boolean del_ok = englishPassageMapper.DeleteEnglishPassageByUuid(uuid);
	        return del_ok == true ? "{\"result\":\"ok\"}": "{\"result\":\"fail\"}";
	    }
	
	
	
	
	
}
