package vn.devpro.javaweb27.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.devpro.javaweb27.model.Role;

@Service
public class RoleService extends BaseService<Role>{
	@Override
	public Class<Role> clazz(){
		return Role.class;
	}
	public Role getRoleByName(String name){
		String sql = "Select * from tbl_role where name = '" + name + "'";
		List<Role> roles = super.executeNativeSql(sql);
		if(roles.size() > 0) {
			return roles.get(0);
		}else {
			return new Role();
		}
	}
}
