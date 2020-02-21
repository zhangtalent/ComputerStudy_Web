package z.talent.tengyu.ui.admin;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author zhangtalent

 * 主页控制器
 * houtai控制器
 * 
 */
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import z.talent.tengyu.mapper.AdminMapper;
import z.talent.tengyu.mapper.JournalMapper;
import z.talent.tengyu.mapper.JournalTypesMapper;

@Controller
@SessionScope
@RequestMapping("/admin")
public class AdminMain {
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	JournalMapper journalMapper;

	@Autowired
	JournalTypesMapper journalTypesMapper;
	
	
	
	//后台主页
	@GetMapping("/index")
    public String AdminPage(Model model) {
		//System.err.println("正在被访问");
        //model.addAttribute("message", "Hello World!");
		int tcounts = journalTypesMapper.getJournalTypeCounts();
		int jcounts = journalMapper.getJournalCounts();
		model.addAttribute("tcount", cal_percentage(tcounts));
		model.addAttribute("jcount", cal_percentage(jcounts));
        return "admin_main";
    }
	
	
	public String cal_percentage(int size) {
		int start = 1;
		while (size > start) {
			start *= 10;
		}
		return ""+size+"/"+start;
	}
	
	//登录
	//后台主页
	@GetMapping("/login")
	public String AdminLogin(Model model) {
		//System.err.println("正在被访问");
	    //model.addAttribute("message", "Hello World!");
	    return "admin_login";
	}
	
	//登陆检查
	@PostMapping("/login")
	public String AdminLoginVerify(HttpServletRequest request,HttpServletResponse repHttpServletResponse,Model model,@RequestParam("username")String username,@RequestParam("password") String password) {

		if (adminMapper.getMember(username, password)>0) {
			request.getSession().setAttribute("logined", true);
			//request.getSession().setAttribute("userid", );
			try {
				repHttpServletResponse.sendRedirect("../admin/index");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	    return "admin_login";
	}
}
