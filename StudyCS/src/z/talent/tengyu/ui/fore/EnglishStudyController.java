package z.talent.tengyu.ui.fore;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

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

import z.talent.tengyu.bean.EnglishAudio;
import z.talent.tengyu.bean.EnglishListenData;
import z.talent.tengyu.bean.EnglishPassage;
import z.talent.tengyu.bean.EnglishReadData;
import z.talent.tengyu.bean.Journal;
import z.talent.tengyu.mapper.EnglishAudioMapper;
import z.talent.tengyu.mapper.EnglishListenDataMapper;
import z.talent.tengyu.mapper.EnglishPassageMapper;
import z.talent.tengyu.mapper.EnglishReadDataMapper;
import z.talent.tengyu.mapper.JournalMapper;
import z.talent.tengyu.mapper.JournalTypesMapper;


/**
 * 
 * 
 * @author zhangtalent
 * 每日英语
 */

@Controller
@RequestMapping("/english")
public class EnglishStudyController {
	
	@Autowired
	EnglishAudioMapper englishAudioMapper;

	@Autowired
	EnglishPassageMapper englishPassageMapper;
	@Autowired
	EnglishListenDataMapper englishListenDataMapper;
	@Autowired
	EnglishReadDataMapper englishReadDataMapper;
	
	@GetMapping("/index")
    public String ProfileMain(Model model,@RequestParam(value = "page",required = false)Integer page) {
		page = page==null?0:page;
		int offset = page*5;
		ArrayList<EnglishReadData> readdata = englishReadDataMapper.getEnglishReadDatas(offset, 5);
		ArrayList<EnglishListenData> listenData = englishListenDataMapper.getEnglishListenDatas(offset, 5);
		int rlen = readdata.size();
		int llen =listenData.size();
		System.out.println(rlen);
		if(rlen < 5) {
			for (int i = rlen; i < 5; i++) {
				readdata.add(new EnglishReadData("", "无", "", "", 0));
			}
		}
		if(llen < 5) {
			for (int i = llen; i < 5; i++) {
				listenData.add(new EnglishListenData("", 0, "无", "", 0, ""));
			}
		}
		model.addAttribute("readdata", readdata);
		model.addAttribute("listendata", listenData);
		model.addAttribute("previous", page+1);
		model.addAttribute("next", page==0?-1:page-1);
		return "english_index";
    }
	@GetMapping("/listen")
    public String ListenPage(Model model,@RequestParam(value = "page",required = false)Integer page) {
		
		//System.err.println("正在被访问");
        //model.addAttribute("number", photoUploadServe.getNumber());
		int counts = englishAudioMapper.getEnglishAudioCounts();
		page = page==null?0:page;
		int offset = page*10;
		ArrayList<EnglishAudio> arg1 = englishAudioMapper.getEnglishAudios(offset, 10);
		model.addAttribute("datas", arg1);
		model.addAttribute("previous", offset+10>counts?-1:page+1);
		model.addAttribute("next", page==0?-1:page-1);
		
		return "english_listen";
    }
	@GetMapping("/read")
    public String ForeRead(Model model,@RequestParam(value = "page",required = false)Integer page) {
		
		//System.err.println("正在被访问");
        //model.addAttribute("number", photoUploadServe.getNumber());
		int counts = englishPassageMapper.getEnglishPassageCounts();
		page = page==null?0:page;
		int offset = page*10;
		ArrayList<EnglishPassage> arg1 = englishPassageMapper.getEnglishPassages(offset, 10);
		model.addAttribute("datas", arg1);
		model.addAttribute("previous", offset+10>counts?-1:page+1);
		model.addAttribute("next", page==0?-1:page-1);
		return "english_read";
    }
	
	@GetMapping("/readshow")
    public String ForeShowRead(Model model,@RequestParam(value = "uuid")String uuid) {
		
		//System.err.println("正在被访问");
        //model.addAttribute("number", photoUploadServe.getNumber());
		
		model.addAttribute("data", englishPassageMapper.getEnglishPassageByUuid(uuid));
		return "english_read_showPage";
    }
	
	@GetMapping("/listenshow")
    public String ForeShowListen(Model model,@RequestParam(value = "uuid")String uuid) {
		
		//System.err.println("正在被访问");
        //model.addAttribute("number", photoUploadServe.getNumber());
		
		model.addAttribute("data", englishAudioMapper.getEnglishAudioByUuid(uuid));
		return "english_listen_showPage";
    }
	
	@ResponseBody
	@PostMapping("updatelistendata")
    public String AdminEnglishListen(@RequestParam("audioid")String audioid,@RequestParam("rateofcorrect")Integer rateofcorrect,@RequestParam("listentime")Integer listentime,
			HttpServletRequest request) {
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		String time = format0.format(new Date());
		if(englishListenDataMapper.getEnglishListenDataByAudioIdAndUserId(audioid, "yss033tengyu520", time)>0) {
			boolean del_ok = englishListenDataMapper.updateEnglishListenData(rateofcorrect, listentime, audioid, "yss033tengyu520", time);
	        return del_ok == true ? "{\"result\":\"ok\"}": "{\"result\":\"fail\"}";
		}else {
			String uuid = UUID.randomUUID().toString();
			boolean del_ok = englishListenDataMapper.insertEnglishListenData(new EnglishListenData(audioid, listentime, time, uuid, rateofcorrect, "yss033tengyu520"));
			return del_ok == true ? "{\"result\":\"ok\"}": "{\"result\":\"fail\"}";
		}
		
    }
	
	@ResponseBody
	@PostMapping("updatereaddata")
    public String AdminEnglishRead(@RequestParam("pageid")String pageid,@RequestParam("readtime")Integer readtime,
			HttpServletRequest request) {
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		String time = format0.format(new Date());
		
		if(englishReadDataMapper.getEnglishReadDataByPageIdAndUserId(pageid, "yss033tengyu520", time)>0) {
			
			boolean del_ok = englishReadDataMapper.updateEnglishReadData(readtime, pageid, "yss033tengyu520", time);
	        return del_ok == true ? "{\"result\":\"ok\"}": "{\"result\":\"fail\"}";
		}else {
			String uuid = UUID.randomUUID().toString();
			
			boolean del_ok = englishReadDataMapper.insertEnglishReadData(new EnglishReadData(pageid, time, uuid, "yss033tengyu520", readtime));
			return del_ok == true ? "{\"result\":\"ok\"}": "{\"result\":\"fail\"}";
		}
		
    }
	
	
}
