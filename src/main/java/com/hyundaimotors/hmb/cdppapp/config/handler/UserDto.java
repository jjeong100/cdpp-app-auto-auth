package com.hyundaimotors.hmb.cdppapp.config.handler;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class UserDto {

    // 사용자 시퀀스
    private int userSq;

    // 사용자 아이디
    private String userId="admin";

    // 사용자 패스워드
    private String userPw="1";

    // 사용자 이름
    private String userNm="adminName";

    // 사용자 상태
    private String userSt="1";

    @Builder
    UserDto(int userSq, String userId, String userPw, String userNm, String userSt) {
        this.userSq = userSq;
        this.userId = userId;
        this.userPw = userPw;
        this.userNm = userNm;
        this.userSt = userSt;
    }

}