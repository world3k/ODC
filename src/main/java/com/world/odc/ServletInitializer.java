package com.world.odc;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.support.MultipartFilter;

import javax.servlet.ServletContext;

/**

 * <li>Description : It is necessary to run on Java container.</li>

 */
public class ServletInitializer extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        logger.info("SpringApplicationBuilder....");
        return application.sources(CrmApplication.class);
    }

    @Override
    protected WebApplicationContext createRootApplicationContext(ServletContext servletContext) {
        logger.info("WebApplicationContext....");
        servletContext.addFilter("multipartFilter", new MultipartFilter());
        return super.createRootApplicationContext(servletContext);
    }
}
