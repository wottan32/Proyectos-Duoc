/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BancoAmigo.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MSI GT70 2PE
 */
public class filter implements Filter {
    
     private static final String LOGIN_PAGE = "/WEB-INF/jsp/login.jsp";
    private static final String PRIVATE_PAGE = "/WEB-INF/jsp/private/private.jsp";

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
                HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpSession session = servletRequest.getSession(false);

        if (session != null && session.getAttribute("autenticado") != null) {
            chain.doFilter(request, response);
        } else {
            servletRequest.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
        }
 
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void destroy() {
        
    }

    
}
