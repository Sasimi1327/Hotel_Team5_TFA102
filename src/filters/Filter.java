package filters;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Filter implements javax.servlet.Filter {
	private FilterConfig config;

	public void init(FilterConfig fConfig) throws ServletException {
		this.config = config;
	}

	public void destroy() {
		config=null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Object obj =session.getAttribute("empVO");
		if(obj==null){
			req.getSession().setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath()+"/employee/login.jsp");
			return;
		}else
		chain.doFilter(request, response);
	}

}
