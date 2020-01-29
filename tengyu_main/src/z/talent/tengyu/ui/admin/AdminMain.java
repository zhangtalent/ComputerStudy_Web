package z.talent.tengyu.ui.admin;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author zhangtalent

 * ��ҳ������
 * houtai������
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

@Controller
@SessionScope
@RequestMapping("/admin")
public class AdminMain {
	
	@Autowired
	AdminMapper adminMapper;
	//��̨��ҳ
	@GetMapping("/index")
    public String AdminPage(Model model) {
		//System.err.println("���ڱ�����");
        //model.addAttribute("message", "Hello World!");
        return "admin_main";
    }
	//��¼
	//��̨��ҳ
	@GetMapping("/login")
	public String AdminLogin(Model model) {
		//System.err.println("���ڱ�����");
	    //model.addAttribute("message", "Hello World!");
	    return "admin_login";
	}
	//��½���
	@PostMapping("/login")
	public String AdminLoginVerify(HttpServletRequest request,HttpServletResponse repHttpServletResponse,Model model,@RequestParam("username")String username,@RequestParam("password") String password) {

		if (adminMapper.getMember(username, password)>0) {
			request.getSession().setAttribute("logined", true);
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
