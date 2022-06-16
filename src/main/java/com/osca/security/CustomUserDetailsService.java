package com.osca.security;

import com.osca.domain.Member;
import com.osca.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
    private final MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("++++++++++++++");
        log.info("++++++++++++++");
        log.info(username);
        log.info("++++++++++++++");
        log.info("++++++++++++++");
        Member member = memberMapper.memSelectOne(username);
        log.info(member);
        log.info("++++++++++++++");
        log.info("++++++++++++++");
//        username, userPW , role List
        List<SimpleGrantedAuthority> authList = member.getAuthList().stream()
                .map(auth -> new SimpleGrantedAuthority("ROLE_"+auth.getRolename()))
                .collect(Collectors.toList());//문자열이라 다시 권한명에 맞게 인코딩 해줘야한다
        User user = new User(member.getMemID(), member.getMemPW(), authList);

        return user;
    }
}
