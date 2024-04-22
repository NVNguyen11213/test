package vn.devpro.javaweb27.configurer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import vn.devpro.javaweb27.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class SecureConfigurer extends WebSecurityConfigurerAdapter {
	@Override
	protected void configure(final HttpSecurity http) throws Exception{
		//Bắt đầu cấu hình
		http.csrf().disable().authorizeRequests() // Bắt các request từ browser
		.antMatchers("/frontend/**", "/backend/**", "/FileUploads/**", "/login", "/logout").permitAll()
		
//		.antMatchers("/admin/**").authenticated()
		.antMatchers("/admin/**").hasAuthority("ADMIN")
		
		.and()
		// Nếu chưa login(xác thực) thì redirect đến trang login
		//Voi "/login" la 1 request (trong LoginController)
		.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")
		
//		.defaultSuccessUrl("/admin/home",true)// Login thành công thì đưua tới trang chủ của admin
		.successHandler(new UrlAuthenticationSuccessHandler())
		//Login không thành công
		.failureUrl("/login?login_error = true")
		
		.and()
		
		.logout().logoutUrl("/logout").logoutSuccessUrl("/login").invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		
		.and()
		.rememberMe().key("uniqueAndSecret").tokenValiditySeconds(8600);
	}
	@Autowired
	private UserDetailsServiceImpl userDetailsService;
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}
//	public static void main(String[] args) {
//		System.out.println(new BCryptPasswordEncoder(4).encode("123"));
//	}
}
