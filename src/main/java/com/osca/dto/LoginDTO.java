package com.osca.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;
import java.util.Collection;

@Getter
@Setter
@ToString
public class LoginDTO extends User {

    private String memID, memPW, memName;
    private LocalDateTime regDate, updateDate;

    public LoginDTO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.memID = username;
        this.memPW = password;
    }
}
