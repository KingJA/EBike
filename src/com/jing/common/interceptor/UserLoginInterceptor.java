package com.jing.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jing.ebike.model.User;
import com.jing.utils.AddressUtils;

public class UserLoginInterceptor implements HandlerInterceptor{
    public String[] allowUrls;//还没发现可以直接配置不拦截的资源，所以在代码里面来排除  
	private Logger logger = Logger.getLogger(UserLoginInterceptor.class); 
    public void setAllowUrls(String[] allowUrls) {  
        this.allowUrls = allowUrls;  
    }  
	// afterCompletion()方法在DispatcherServlet完全处理完请求后被调用   
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}
	// postHandle()方法在业务处理器处理请求之后被调用   
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView view) throws Exception {

	}
	// preHandle()方法在业务处理器处理请求之前被调用   
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
        String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
        HttpSession session = request.getSession();
        logger.info("requestUrl:"+requestUrl);
        if("".equals(requestUrl.trim()) || requestUrl.indexOf("/favicon.ico")>0) return true;
        if(null != allowUrls && allowUrls.length>=1)  
            for(String url : allowUrls) {    
                if(requestUrl.contains(url)  || requestUrl.toLowerCase().indexOf(url)!=(-1)) {    
                    return true;    
                }    
            }
        if(request.getParameter("mobile")!=null && request.getParameter("mobile").equals("1")){
        	Map<String,String[]> map = request.getParameterMap();
        	return true;
        }
		
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
            throw new SessionTimeoutException();//返回到配置文件中定义的路径  
		}else{
			return true;
		}
		
	}
}
