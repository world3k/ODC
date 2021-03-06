package com.world.odc.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.world.odc.interceptor.AuthInterceptor;
import com.world.odc.interceptor.LoginInterceptor;

@Configuration
public class WebAppConfigurer extends WebMvcConfigurerAdapter {

    /**
     * 添加拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // 注册登录拦截器
        InterceptorRegistration loginReg = registry.addInterceptor(new LoginInterceptor());
        loginReg.addPathPatterns("/**");
        loginReg.excludePathPatterns("/login", "/error", "/reg", "/verify/code","/regions");

        // 注册权限拦截器
        InterceptorRegistration authReg = registry.addInterceptor(new AuthInterceptor());
        authReg.addPathPatterns("/**");
        // 不受权限控制的请求
        authReg.excludePathPatterns("/", "/login", "/error", "/im/**", "/reg", "/verify/code","/regions");

        super.addInterceptors(registry);
    }

}
