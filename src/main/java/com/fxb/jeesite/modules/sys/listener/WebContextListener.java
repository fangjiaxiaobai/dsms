package com.fxb.jeesite.modules.sys.listener;

import javax.servlet.ServletContext;

import org.springframework.web.context.WebApplicationContext;

import com.fxb.jeesite.modules.sys.service.SystemService;

public class WebContextListener extends org.springframework.web.context.ContextLoaderListener {
	
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		if (!SystemService.printKeyLoadMessage()){
			return null;
		}
		StringBuilder sb = new StringBuilder();
		sb.append(" _____  __    __  _____  \n" +
                  "|  ___| \\ \\  / / |  _  \\ \n" +
                  "| |__    \\ \\/ /  | |_| | \n" +
                  "|  __|    }  {   |  _  { \n" +
                  "| |      / /\\ \\  | |_| | \n" +
                  "|_|     /_/  \\_\\ |_____/ \n\n\n");
        System.out.println(sb.toString());
        return super.initWebApplicationContext(servletContext);
	}
}
