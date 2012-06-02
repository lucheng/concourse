package edu.bupt.spring.web.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resources;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import edu.bupt.spring.entity.User;
import edu.bupt.spring.entity.Resource;
import edu.bupt.spring.entity.Role;
import edu.bupt.spring.service.UserService;

public class MyUserDetailServiceImpl implements UserDetailsService {  
      
    private UserService adminService;
    
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {  
        System.out.println("username is " + username);  
        User admin = adminService.findByName(username);  
        if(admin == null) {  
            throw new UsernameNotFoundException(username);  
        }  
        Collection<GrantedAuthority> grantedAuths = obtionGrantedAuthorities(admin);  
          
        boolean enables = true;  
        boolean accountNonExpired = true;  
        boolean credentialsNonExpired = true;  
        boolean accountNonLocked = true;  
          
        UserDetails userdetail = new User(admin.getUsername(), admin.getPassword(), enables, accountNonExpired, credentialsNonExpired, accountNonLocked, grantedAuths);  
        return userdetail;  
    }  
      
    //取得用户的权限  
    private Set<GrantedAuthority> obtionGrantedAuthorities(User user) {  
        Set<GrantedAuthority> authSet = new HashSet<GrantedAuthority>();  
        Set<Role> roles = user.getRoleSet();  
          
        for(Role role : roles) {  
            Set<Resource> tempRes = role.getResourceSet();  
            for(Resource res : tempRes) {  
                authSet.add(new GrantedAuthorityImpl(res.getName()));  
           }  
        }  
        return authSet;  
    }

	public UserService getAdminService() {
		return adminService;
	}

	public void setAdminService(UserService adminService) {
		this.adminService = adminService;
	}  
}  