package analysis.filter;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by ${tianlin} on 2017/5/25.
 */
public class SecurityInterceptor implements HandlerInterceptor {
    private static Logger logger=Logger.getLogger(SecurityInterceptor.class);
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.info("SecurityInterceptor:"+request.getContextPath()+","+request.getRequestURI()+","+request.getMethod());
        HttpSession session=request.getSession();
        String uri = request.getRequestURI();
        if(session.getAttribute("sessionUser")==null){
            logger.info("没有登录信息"+request.getMethod());
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out=response.getWriter();
            String loginPage = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/login/loginpage";
            StringBuilder builder = new StringBuilder();
            builder.append("<script type=\"text/javascript\" language=\"javascript\" charset=\"gb2312\">");
            builder.append("alert('网页过期，请重新登录！');");
            builder.append("window.location.href='");
            builder.append(loginPage);
            builder.append("';");
            builder.append("</script>");
            out.print(builder.toString());
            return false;
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
