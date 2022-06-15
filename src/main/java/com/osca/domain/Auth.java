package com.osca.domain;


import lombok.*;

@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Auth {
    private String memID;
    private String rolename;
}
