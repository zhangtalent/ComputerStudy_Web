package z.talent.tengyu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor{
 
 
	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		if(arg0.getSession().getAttribute("logined")!=null&&(boolean)arg0.getSession().getAttribute("logined")==true) {
			return true;
		}
		arg1.sendRedirect("../admin/login");
		return false;
	}
 
}
