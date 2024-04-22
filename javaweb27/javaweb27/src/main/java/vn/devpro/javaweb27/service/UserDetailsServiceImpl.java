package vn.devpro.javaweb27.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import vn.devpro.javaweb27.model.User;

@Service
public class UserDetailsServiceImpl extends BaseService<User> implements UserDetailsService{
	@Override
	public Class<User> clazz(){
		return User.class;
	}
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
		String sql = "select * from tbl_user u where u.username = '" + username + "' and u.status = 1";
		User user = this.getEntityByNativeSQL(sql);
		if(user != null) {
			return user;
		}
		else {
			return new User(); // USerDetails không được null
		}
	}
}
