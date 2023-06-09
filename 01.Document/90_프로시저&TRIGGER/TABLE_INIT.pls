create or replace PROCEDURE TABLE_INIT
IS
BEGIN
    DECLARE
        -- 오라클 접속 ID
        LOGIN_ID VARCHAR2(10) := 'KK';
        -- 2 차원 중첩 테이블 선언
        TYPE TABLE_INFO_S IS TABLE OF VARCHAR2(4000);
        TYPE TABLE_INFO IS TABLE OF TABLE_INFO_S;
        -- 변수 선언
        T_I TABLE_INFO;
    BEGIN
        T_I := TABLE_INFO(
            -- 회원 가입 종류 정보 관리 테이블
            TABLE_INFO_S('JOIN_KIND', '4', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT JOIN_KIND_PK PRIMARY KEY (CODE)
                        )'
                        ,'(JOIN_KIND_CODE.NEXTVAL, ''KickKick'', DEFAULT, NULL, NULL)'
                        ,'(JOIN_KIND_CODE.NEXTVAL, ''KAKAO'', DEFAULT, NULL, NULL)'
                        ,'(JOIN_KIND_CODE.NEXTVAL, ''NAVER'', DEFAULT, NULL, NULL)'),
            -- 권한 등급 정보 관리하는 테이블
            TABLE_INFO_S('AUTHORITY_GRADE', '4', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT AUTHORITY_GRADE_PK PRIMARY KEY (CODE)
                        )'
                        ,'(AUTHORITY_GRADE_CODE.NEXTVAL, ''회원'', DEFAULT, NULL, NULL)'
                        ,'(AUTHORITY_GRADE_CODE.NEXTVAL, ''관리자1'', DEFAULT, NULL, NULL)'
                        ,'(AUTHORITY_GRADE_CODE.NEXTVAL, ''관리자2'', DEFAULT, NULL, NULL)'
                        ,'(AUTHORITY_GRADE_CODE.NEXTVAL, ''관리자3'', DEFAULT, NULL, NULL)'),
            -- 연고지 정보 관리 테이블
            TABLE_INFO_S('HOMETOWN', 'N', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT HOMETOWN_PK PRIMARY KEY (CODE)
                        )'
                        ,'(1100, ''서울'', DEFAULT, NULL, NULL)'
                        ,'(1101, ''강남구'', DEFAULT, NULL, NULL)'
                        ,'(1102, ''강동구'', DEFAULT, NULL, NULL)'
                        ,'(1103, ''강북구'', DEFAULT, NULL, NULL)'
                        ,'(1104, ''강서구'', DEFAULT, NULL, NULL)'
                        ,'(1105, ''관악구'', DEFAULT, NULL, NULL)'
                        ,'(1106, ''광진구'', DEFAULT, NULL, NULL)'
                        ,'(1107, ''구로구'', DEFAULT, NULL, NULL)'
                        ,'(1108, ''금천구'', DEFAULT, NULL, NULL)'
                        ,'(1109, ''노원구'', DEFAULT, NULL, NULL)'
                        ,'(1110, ''도봉구'', DEFAULT, NULL, NULL)'
                        ,'(1111, ''동대문구'', DEFAULT, NULL, NULL)'
                        ,'(1112, ''동작구'', DEFAULT, NULL, NULL)'
                        ,'(1113, ''마포구'', DEFAULT, NULL, NULL)'
                        ,'(1114, ''서대문구'', DEFAULT, NULL, NULL)'
                        ,'(1115, ''서초구'', DEFAULT, NULL, NULL)'
                        ,'(1116, ''성동구'', DEFAULT, NULL, NULL)'
                        ,'(1117, ''성북구'', DEFAULT, NULL, NULL)'
                        ,'(1118, ''송파구'', DEFAULT, NULL, NULL)'
                        ,'(1119, ''양천구'', DEFAULT, NULL, NULL)'
                        ,'(1120, ''영등포구'', DEFAULT, NULL, NULL)'
                        ,'(1121, ''용산구'', DEFAULT, NULL, NULL)'
                        ,'(1122, ''은평구'', DEFAULT, NULL, NULL)'
                        ,'(1123, ''종로구'', DEFAULT, NULL, NULL)'
                        ,'(1124, ''중구'', DEFAULT, NULL, NULL)'
                        ,'(1125, ''중량구'', DEFAULT, NULL, NULL)'
                        ,'(1200, ''부산'', DEFAULT, NULL, NULL)'
                        ,'(1300, ''대구'', DEFAULT, NULL, NULL)'
                        ,'(1400, ''인천'', DEFAULT, NULL, NULL)'
                        ,'(1500, ''대전'', DEFAULT, NULL, NULL)'
                        ,'(1600, ''광주'', DEFAULT, NULL, NULL)'
                        ,'(1700, ''울산'', DEFAULT, NULL, NULL)'
                        ,'(1800, ''세종'', DEFAULT, NULL, NULL)'
                        ,'(1900, ''제주도'', DEFAULT, NULL, NULL)'
                        ,'(2000, ''경기도'', DEFAULT, NULL, NULL)'
                        ,'(3000, ''강원도'', DEFAULT, NULL, NULL)'
                        ,'(4000, ''충청북도'', DEFAULT, NULL, NULL)'
                        ,'(5000, ''충청남도'', DEFAULT, NULL, NULL)'
                        ,'(6000, ''전라북도'', DEFAULT, NULL, NULL)'
                        ,'(7000, ''전라남도'', DEFAULT, NULL, NULL)'
                        ,'(8000, ''경상북도'', DEFAULT, NULL, NULL)'
                        ,'(9000, ''경상남도'', DEFAULT, NULL, NULL)'),
            -- 로고 경로 정보 관리 테이블
            TABLE_INFO_S('LOGO_PATH', '4', '(
                        CODE NUMBER,
                        PATH VARCHAR2(60) NOT NULL,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT LOGO_PATH_PK PRIMARY KEY (CODE)
                        )'),
            -- 팀에 가입한 회원들의 등급 정보 관리 테이블
            TABLE_INFO_S('TEAM_MEMBER_GRADE', '4', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT TEAM_MEMBER_GRADE_PK PRIMARY KEY (CODE)
                        )'),
            -- 상태 정보 관리 테이블
            TABLE_INFO_S('STATUS', 'N', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT STATUS_PK PRIMARY KEY (CODE)
                        )'
                        ,'(1101, ''경기 등록 중'', DEFAULT, NULL, NULL)'
                        ,'(1102, ''경기 등록 완료'', DEFAULT, NULL, NULL)'
                        ,'(1201, ''경기 신청 중'', DEFAULT, NULL, NULL)'
                        ,'(1202, ''경기 신청 승인'', DEFAULT, NULL, NULL)'
                        ,'(1203, ''경기 신청 거절'', DEFAULT, NULL, NULL)'
                        ,'(1301, ''경기 진행 중'', DEFAULT, NULL, NULL)'
                        ,'(1302, ''경기 진행 완료'', DEFAULT, NULL, NULL)'
                        ,'(2101, ''용병 구함 등록 중'', DEFAULT, NULL, NULL)'
                        ,'(2102, ''용병 구함 완료'', DEFAULT, NULL, NULL)'
                        ,'(2201, ''용병 구함 신청 중'', DEFAULT, NULL, NULL)'
                        ,'(2202, ''용병 구함 신청 승인'', DEFAULT, NULL, NULL)'
                        ,'(2203, ''용병 구함 신청 거절'', DEFAULT, NULL, NULL)'
                        ,'(9101, ''신고 접수'', DEFAULT, NULL, NULL)'
                        ,'(9102, ''신고 처리 중'', DEFAULT, NULL, NULL)'
                        ,'(9103, ''신고 처리 완료'', DEFAULT, NULL, NULL)'
                        ,'(9201, ''문의 접수'', DEFAULT, NULL, NULL)'
                        ,'(9202, ''문의 처리 중'', DEFAULT, NULL, NULL)'
                        ,'(9203, ''문의 처리 완료'', DEFAULT, NULL, NULL)'),
            -- 경기 종류 및 인원 정보 관리 테이블
            TABLE_INFO_S('COMPETITION_KIND', 'N', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        HEADCOUNT NUMBER NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT COMPETITION_KIND_PK PRIMARY KEY (CODE)
                        )'
                        ,'(1001, ''축구'', 12, DEFAULT, NULL, NULL)'
                        ,'(1002, ''축구'', 11, DEFAULT, NULL, NULL)'
                        ,'(1003, ''축구'', 10, DEFAULT, NULL, NULL)'
                        ,'(2001, ''풋살'', 6, DEFAULT, NULL, NULL)'
                        ,'(2002, ''풋살'', 5, DEFAULT, NULL, NULL)'
                        ,'(2003, ''풋살'', 4, DEFAULT, NULL, NULL)'),
            -- 실력 정보 관리 테이블
            TABLE_INFO_S('ABILITY', '4', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT ABILITY_PK PRIMARY KEY (CODE)
                        )'
                        ,'(ABILITY_CODE.NEXTVAL, ''상'', DEFAULT, NULL, NULL)'
                        ,'(ABILITY_CODE.NEXTVAL, ''중'', DEFAULT, NULL, NULL)'
                        ,'(ABILITY_CODE.NEXTVAL, ''하'', DEFAULT, NULL, NULL)'),
            -- 게시판 종류 정보 관리 테이블
            TABLE_INFO_S('BOARD_KIND', '4', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT BOARD_KIND_PK PRIMARY KEY (CODE)
                        )'
                        ,'(BOARD_KIND_CODE.NEXTVAL, ''팀'', DEFAULT, NULL, NULL)'
                        ,'(BOARD_KIND_CODE.NEXTVAL, ''전체 공지'', DEFAULT, NULL, NULL)'
                        ,'(BOARD_KIND_CODE.NEXTVAL, ''자유'', DEFAULT, NULL, NULL)'
                        ,'(BOARD_KIND_CODE.NEXTVAL, ''홍보'', DEFAULT, NULL, NULL)'),
            -- 게시판 말머리 정보 관리 테이블
            TABLE_INFO_S('BOARD_HEADLINE', '4', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT BOARD_HEADLINE_PK PRIMARY KEY (CODE)
                        )'
                        ,'(BOARD_HEADLINE_CODE.NEXTVAL, ''AAAAA'', DEFAULT, NULL, NULL)'
                        ,'(BOARD_HEADLINE_CODE.NEXTVAL, ''BBBBB'', DEFAULT, NULL, NULL)'
                        ,'(BOARD_HEADLINE_CODE.NEXTVAL, ''CCCCC'', DEFAULT, NULL, NULL)'
                        ,'(BOARD_HEADLINE_CODE.NEXTVAL, ''DDDDD'', DEFAULT, NULL, NULL)'
                        ,'(BOARD_HEADLINE_CODE.NEXTVAL, ''EEEEE'', DEFAULT, NULL, NULL)'),
            -- 신고 종류 정보 관리 테이블
            TABLE_INFO_S('REPORT_KIND', '4', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT REPORT_KIND_PK PRIMARY KEY (CODE)
                        )'
                        ,'(REPORT_KIND_CODE.NEXTVAL, ''AAAAA'', DEFAULT, NULL, NULL)'
                        ,'(REPORT_KIND_CODE.NEXTVAL, ''BBBBB'', DEFAULT, NULL, NULL)'
                        ,'(REPORT_KIND_CODE.NEXTVAL, ''CCCCC'', DEFAULT, NULL, NULL)'
                        ,'(REPORT_KIND_CODE.NEXTVAL, ''DDDDD'', DEFAULT, NULL, NULL)'
                        ,'(REPORT_KIND_CODE.NEXTVAL, ''EEEEE'', DEFAULT, NULL, NULL)'),
            -- 문의 종류 정보 관리 테이블
            TABLE_INFO_S('INQUIRE_KIND', '4', '(
                        CODE NUMBER,
                        NAME VARCHAR2(60) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT INQUIRE_KIND_PK PRIMARY KEY (CODE)
                        )'
                        ,'(INQUIRE_KIND_CODE.NEXTVAL, ''AAAAA'', DEFAULT, NULL, NULL)'
                        ,'(INQUIRE_KIND_CODE.NEXTVAL, ''BBBBB'', DEFAULT, NULL, NULL)'
                        ,'(INQUIRE_KIND_CODE.NEXTVAL, ''CCCCC'', DEFAULT, NULL, NULL)'
                        ,'(INQUIRE_KIND_CODE.NEXTVAL, ''DDDDD'', DEFAULT, NULL, NULL)'
                        ,'(INQUIRE_KIND_CODE.NEXTVAL, ''EEEEE'', DEFAULT, NULL, NULL)'),

            -- 회원 정보 관리 테이블
            TABLE_INFO_S('MEMBER', '8', '(
                        CODE NUMBER,
                        JOIN_KIND_CODE NUMBER NOT NULL,
                        ID VARCHAR2(100) UNIQUE NOT NULL,
                        PW VARCHAR2(128) NOT NULL,
                        NAME VARCHAR2(15) NOT NULL,
                        NICKNAME VARCHAR2(30) NOT NULL,
                        BIRTHDATE VARCHAR2(8) NOT NULL,
                        PHONE VARCHAR2(11) UNIQUE NOT NULL,
                        EMAIL VARCHAR2(40) UNIQUE NOT NULL,
                        AGREE VARCHAR2(1) NOT NULL,
                        AUTHORITY_GRADE_CODE NUMBER NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT MEMBER_PK PRIMARY KEY (CODE),
                        CONSTRAINT M_JOIN_KIND_CODE_FK FOREIGN KEY (JOIN_KIND_CODE) REFERENCES JOIN_KIND(CODE) ON DELETE CASCADE,
                        CONSTRAINT AGREE_CHK CHECK (AGREE IN (''Y'', ''N'')),
                        CONSTRAINT M_AUTHORITY_GRADE_CODE_FK FOREIGN KEY (AUTHORITY_GRADE_CODE) REFERENCES AUTHORITY_GRADE(CODE) ON DELETE CASCADE
                        )'),
            -- 팀 정보 관리 테이블
            TABLE_INFO_S('TEAM', '8', '(
                        CODE NUMBER,
                        LOGO_PATH_CODE NUMBER NOT NULL,
                        LOGO VARCHAR2(100) UNIQUE,
                        NAME VARCHAR2(60) UNIQUE NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        HOMETOWN_CODE NUMBER NOT NULL,
                        OUTLINE VARCHAR2(300) NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT TEAM_PK PRIMARY KEY (CODE),
                        CONSTRAINT T_LOGO_PATH_CODE_FK FOREIGN KEY (LOGO_PATH_CODE) REFERENCES LOGO_PATH(CODE) ON DELETE CASCADE,
                        CONSTRAINT T_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE,
                        CONSTRAINT T_HOMETOWN_CODE_FK FOREIGN KEY (HOMETOWN_CODE) REFERENCES HOMETOWN(CODE) ON DELETE CASCADE
                        )'),
            -- 팀에 가입한 회원들 정보 관리 테이블
            TABLE_INFO_S('TEAM_MEMBER', 'N', '(
                        TEAM_CODE NUMBER,
                        MEMBER_CODE NUMBER,
                        TEAM_MEMBER_GRADE_CODE NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT TEAM_MEMBER_PK PRIMARY KEY (TEAM_CODE, MEMBER_CODE),
                        CONSTRAINT T_M_TEAM_CODE_FK FOREIGN KEY (TEAM_CODE) REFERENCES TEAM(CODE) ON DELETE CASCADE,
                        CONSTRAINT T_M_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE,
                        CONSTRAINT T_M_TEAM_MEMBER_GRADE_CODE_FK FOREIGN KEY (TEAM_MEMBER_GRADE_CODE) REFERENCES TEAM_MEMBER_GRADE(CODE) ON DELETE CASCADE
                        )'),
            -- 팀 가입 신청 정보 관리 테이블
            TABLE_INFO_S('TEAM_JOIN_APPLY', '8', '(
                        CODE NUMBER,
                        TEAM_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000),
                        STATUS_CODE NUMBER NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT TEAM_JOIN_APPLY_PK PRIMARY KEY (CODE),
                        CONSTRAINT T_J_A_TEAM_CODE_FK FOREIGN KEY (TEAM_CODE) REFERENCES TEAM(CODE) ON DELETE CASCADE,
                        CONSTRAINT T_J_A_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE,
                        CONSTRAINT T_J_A_STATUS_CODE_FK FOREIGN KEY (STATUS_CODE) REFERENCES STATUS(CODE) ON DELETE CASCADE
                        )'),
            -- 팀 가입 질의 정보 관리 테이블
            TABLE_INFO_S('QUESTION', '8', '(
                        CODE NUMBER,
                        TEAM_CODE NUMBER NOT NULL,
                        QUESTION VARCHAR2(300) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT QUESTION_PK PRIMARY KEY (CODE),
                        CONSTRAINT Q_TEAM_CODE_FK FOREIGN KEY (TEAM_CODE) REFERENCES TEAM(CODE) ON DELETE CASCADE
                        )'),
            -- 팀 가입 질의응답 정보 관리 테이블
            TABLE_INFO_S('QUESTION_ANSWER', 'N', '(
                        TEAM_JOIN_APPLY_CODE NUMBER,
                        QUESTION_CODE NUMBER,
                        ANSWER VARCHAR2(300) NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT QUESTION_ANSWER_PK PRIMARY KEY (TEAM_JOIN_APPLY_CODE, QUESTION_CODE),
                        CONSTRAINT Q_A_TEAM_JOIN_APPLY_CODE_FK FOREIGN KEY (TEAM_JOIN_APPLY_CODE) REFERENCES TEAM_JOIN_APPLY(CODE) ON DELETE CASCADE,
                        CONSTRAINT Q_A_QUESTION_CODE_FK FOREIGN KEY (QUESTION_CODE) REFERENCES QUESTION(CODE) ON DELETE CASCADE
                        )'),

            -- 경기 등록 정보 관리 테이블
            TABLE_INFO_S('COMPETITION_REGISTRATION', '8', '(
                        CODE NUMBER,
                        TEAM_CODE NOT NULL,
                        COMPETITION_KIND_CODE NOT NULL,
                        LATIRUDE NUMBER NOT NULL,
                        LONGITUDE NUMBER NOT NULL,
                        COMPETITION_DATE TIMESTAMP NOT NULL,
                        ABILITY_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000),
                        STATUS_CODE NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT COMPETITION_REGISTRATION_PK PRIMARY KEY (CODE),
                        CONSTRAINT C_R_TEAM_CODE_FK FOREIGN KEY (TEAM_CODE) REFERENCES TEAM(CODE) ON DELETE CASCADE,
                        CONSTRAINT C_R_COMPETITION_KIND_CODE_FK FOREIGN KEY (COMPETITION_KIND_CODE) REFERENCES COMPETITION_KIND(CODE) ON DELETE CASCADE,
                        CONSTRAINT C_R_ABILITY_CODE_FK FOREIGN KEY (ABILITY_CODE) REFERENCES ABILITY(CODE) ON DELETE CASCADE,
                        CONSTRAINT C_R_STATUS_CODE_FK FOREIGN KEY (STATUS_CODE) REFERENCES STATUS(CODE) ON DELETE CASCADE
                        )'),
            -- 경기 신청 정보 관리 테이블
            TABLE_INFO_S('COMPETITION_APPLICATION', '8', '(
                        CODE NUMBER,
                        COMPETITION_REGISTRATION_CODE NUMBER NOT NULL,
                        TEAM_CODE NUMBER NOT NULL,
                        ABILITY_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000),
                        STATUS_CODE NUMBER NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT COMPETITION_APPLICATION_PK PRIMARY KEY (CODE),
                        CONSTRAINT C_A_COMPETITION_REGIST_CODE_FK FOREIGN KEY (COMPETITION_REGISTRATION_CODE) REFERENCES COMPETITION_REGISTRATION(CODE) ON DELETE CASCADE,
                        CONSTRAINT C_A_TEAM_CODE_FK FOREIGN KEY (TEAM_CODE) REFERENCES TEAM(CODE) ON DELETE CASCADE,
                        CONSTRAINT C_A_ABILITY_CODE_FK FOREIGN KEY (ABILITY_CODE) REFERENCES ABILITY(CODE) ON DELETE CASCADE,
                        CONSTRAINT C_A_STATUS_CODE_FK FOREIGN KEY (STATUS_CODE) REFERENCES STATUS(CODE) ON DELETE CASCADE
                        )'),
            -- 경기 결과 정보 관리 테이블
            TABLE_INFO_S('COMPETITION_RESULT', 'N', '(
                        COMPETITION_REGISTRATION_CODE NUMBER,
                        REGISTRATION_TEAM_CODE NUMBER NOT NULL,
                        REGISTRATION_TEAM_SCORE NUMBER DEFAULT 0 NOT NULL,
                        APPLICATION_TEAM_CODE NUMBER NOT NULL,
                        APPLICATION_TEAM_SCORE NUMBER DEFAULT 0 NOT NULL,
                        STATUS_CODE NUMBER NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT COMPETITION_RESULT_PK PRIMARY KEY (COMPETITION_REGISTRATION_CODE),
                        CONSTRAINT CR_COMPETITION_REGIST_CODE_FK FOREIGN KEY (COMPETITION_REGISTRATION_CODE) REFERENCES COMPETITION_REGISTRATION(CODE) ON DELETE CASCADE,
                        CONSTRAINT CR_REGISTRATION_TEAM_CODE_FK FOREIGN KEY (REGISTRATION_TEAM_CODE) REFERENCES TEAM(CODE) ON DELETE CASCADE,
                        CONSTRAINT CR_APPLICATION_TEAM_CODE_FK FOREIGN KEY (APPLICATION_TEAM_CODE) REFERENCES TEAM(CODE) ON DELETE CASCADE,
                        CONSTRAINT CR_STATUS_CODE_FK FOREIGN KEY (STATUS_CODE) REFERENCES STATUS(CODE) ON DELETE CASCADE
                        )'),
            -- 용병 구함 등록 정보 관리 테이블
            TABLE_INFO_S('MERCENARY_REGISTRATION', '8', '(
                        CODE NUMBER,
                        COMPETITION_RESULT_CODE NUMBER NOT NULL,
                        TEAM_CODE NUMBER NOT NULL,
                        ABILITY_CODE NUMBER NOT NULL,
                        HEADCOUNT NUMBER NOT NULL,
                        STATUS_CODE NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT MERCENARY_REGISTRATION_PK PRIMARY KEY (CODE),
                        CONSTRAINT M_R_COMPETITION_RESULT_CODE_FK FOREIGN KEY (COMPETITION_RESULT_CODE) REFERENCES COMPETITION_RESULT(COMPETITION_REGISTRATION_CODE) ON DELETE CASCADE,
                        CONSTRAINT M_R_TEAM_CODE_FK FOREIGN KEY (TEAM_CODE) REFERENCES TEAM(CODE) ON DELETE CASCADE,
                        CONSTRAINT M_R_ABILITY_CODE_FK FOREIGN KEY (ABILITY_CODE) REFERENCES ABILITY(CODE) ON DELETE CASCADE,
                        CONSTRAINT M_R_STATUS_CODE_FK FOREIGN KEY (STATUS_CODE) REFERENCES STATUS(CODE) ON DELETE CASCADE
                        )'),
            -- 용병 구함 신청 정보 관리 테이블
            TABLE_INFO_S('MERCENARY_APPLICATION', '8', '(
                        CODE NUMBER,
                        MERCENARY_REGISTRATION_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        ABILITY_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000),
                        STATUS_CODE NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT MERCENARY_APPLICATION_PK PRIMARY KEY (CODE),
                        CONSTRAINT M_A_MERCENARY_REGIST_CODE_FK FOREIGN KEY (MERCENARY_REGISTRATION_CODE) REFERENCES MERCENARY_REGISTRATION(CODE) ON DELETE CASCADE,
                        CONSTRAINT M_A_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE,
                        CONSTRAINT M_A_ABILITY_CODE_FK FOREIGN KEY (ABILITY_CODE) REFERENCES ABILITY(CODE) ON DELETE CASCADE,
                        CONSTRAINT M_A_STATUS_CODE_FK FOREIGN KEY (STATUS_CODE) REFERENCES STATUS(CODE) ON DELETE CASCADE
                        )'),

            -- 팀 게시판 정보 관리 테이블
            TABLE_INFO_S('BOARD_TEAM', 'M', '(
                        CODE NUMBER,
                        BOARD_KIND_CODE NUMBER NOT NULL,
                        BOARD_HEADLINE_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        TITLE VARCHAR2(300) NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        VIEW_COUNT NUMBER DEFAULT 0 NOT NULL,
                        LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT BOARD_TEAM_PK PRIMARY KEY (CODE),
                        CONSTRAINT B_T_BOARD_KIND_CODE_FK FOREIGN KEY (BOARD_KIND_CODE) REFERENCES BOARD_KIND(CODE) ON DELETE CASCADE,
                        CONSTRAINT B_T_BOARD_HEADLINE_CODE_FK FOREIGN KEY (BOARD_HEADLINE_CODE) REFERENCES BOARD_HEADLINE(CODE) ON DELETE CASCADE,
                        CONSTRAINT B_T_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE
                        )'),
            -- 팀 게시판의 댓글 정보 관리 테이블
            TABLE_INFO_S('REPLY_TEAM', 'M', '(
                        CODE NUMBER,
                        BOARD_TEAM_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT REPLY_TEAM_PK PRIMARY KEY (CODE),
                        CONSTRAINT R_T_BOARD_TEAM_CODE_FK FOREIGN KEY (BOARD_TEAM_CODE) REFERENCES BOARD_TEAM(CODE) ON DELETE CASCADE,
                        CONSTRAINT R_T_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE
                        )'),
            -- 전체 공지 게시판 정보 관리 테이블
            TABLE_INFO_S('BOARD_ANNOUNCEMENT', 'M', '(
                        CODE NUMBER,
                        BOARD_KIND_CODE NUMBER NOT NULL,
                        BOARD_HEADLINE_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        TITLE VARCHAR2(300) NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        VIEW_COUNT NUMBER DEFAULT 0 NOT NULL,
                        LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT BOARD_ANNOUNCEMENT_PK PRIMARY KEY (CODE),
                        CONSTRAINT B_A_BOARD_KIND_CODE_FK FOREIGN KEY (BOARD_KIND_CODE) REFERENCES BOARD_KIND(CODE) ON DELETE CASCADE,
                        CONSTRAINT B_A_BOARD_HEADLINE_CODE_FK FOREIGN KEY (BOARD_HEADLINE_CODE) REFERENCES BOARD_HEADLINE(CODE) ON DELETE CASCADE,
                        CONSTRAINT B_A_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE
                        )'),
            -- 전체 공지 게시판의 댓글 정보 관리 테이블
            TABLE_INFO_S('REPLY_ANNOUNCEMENT', 'M', '(
                        CODE NUMBER,
                        BOARD_ANNOUNCEMENT_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT REPLY_ANNOUNCEMENT_PK PRIMARY KEY (CODE),
                        CONSTRAINT R_A_BOARD_ANNOUNCEMENT_CODE_FK FOREIGN KEY (BOARD_ANNOUNCEMENT_CODE) REFERENCES BOARD_ANNOUNCEMENT(CODE) ON DELETE CASCADE,
                        CONSTRAINT R_A_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE
                        )'),
            -- 자유 게시판 정보 관리 테이블
            TABLE_INFO_S('BOARD_FREE', 'M', '(
                        CODE NUMBER,
                        BOARD_KIND_CODE NUMBER NOT NULL,
                        BOARD_HEADLINE_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        TITLE VARCHAR2(300) NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        VIEW_COUNT NUMBER DEFAULT 0 NOT NULL,
                        LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT BOARD_FREE_PK PRIMARY KEY (CODE),
                        CONSTRAINT B_F_BOARD_KIND_CODE_FK FOREIGN KEY (BOARD_KIND_CODE) REFERENCES BOARD_KIND(CODE) ON DELETE CASCADE,
                        CONSTRAINT B_F_BOARD_HEADLINE_CODE_FK FOREIGN KEY (BOARD_HEADLINE_CODE) REFERENCES BOARD_HEADLINE(CODE) ON DELETE CASCADE,
                        CONSTRAINT B_F_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE
                        )'),
            -- 자유 게시판의 댓글 정보 관리 테이블
            TABLE_INFO_S('REPLY_FREE', 'M', '(
                        CODE NUMBER,
                        BOARD_FREE_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT REPLY_FREE_PK PRIMARY KEY (CODE),
                        CONSTRAINT R_F_BOARD_FREE_CODE_FK FOREIGN KEY (BOARD_FREE_CODE) REFERENCES BOARD_FREE(CODE) ON DELETE CASCADE,
                        CONSTRAINT R_F_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE
                        )'),
            -- 홍보 게시판 정보 관리 테이블
            TABLE_INFO_S('BOARD_PROMOTION', 'M', '(
                        CODE NUMBER,
                        BOARD_KIND_CODE NUMBER NOT NULL,
                        BOARD_HEADLINE_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        TITLE VARCHAR2(300) NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        VIEW_COUNT NUMBER DEFAULT 0 NOT NULL,
                        LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT BOARD_PROMOTION_PK PRIMARY KEY (CODE),
                        CONSTRAINT B_P_BOARD_KIND_CODE_FK FOREIGN KEY (BOARD_KIND_CODE) REFERENCES BOARD_KIND(CODE) ON DELETE CASCADE,
                        CONSTRAINT B_P_BOARD_HEADLINE_CODE_FK FOREIGN KEY (BOARD_HEADLINE_CODE) REFERENCES BOARD_HEADLINE(CODE) ON DELETE CASCADE,
                        CONSTRAINT B_P_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE
                        )'),
            -- 홍보 게시판의 댓글 정보 관리 테이블
            TABLE_INFO_S('REPLY_PROMOTION', 'M', '(
                        CODE NUMBER,
                        BOARD_PROMOTION_CODE NUMBER NOT NULL,
                        MEMBER_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        LIKE_COUNT NUMBER DEFAULT 0 NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT REPLY_PROMOTION_PK PRIMARY KEY (CODE),
                        CONSTRAINT R_P_BOARD_PROMOTION_CODE_FK FOREIGN KEY (BOARD_PROMOTION_CODE) REFERENCES BOARD_PROMOTION(CODE) ON DELETE CASCADE,
                        CONSTRAINT R_P_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE
                        )'),

            -- 신고 정보 관리 테이블
            -- CONSTRAINT R_BOARD_CODE_FK FOREIGN KEY (BOARD_CODE) REFERENCES BOARD(CODE) ON DELETE CASCADE,
            -- CONSTRAINT R_REPLY_CODE_FK FOREIGN KEY (REPLY_CODE) REFERENCES REPLY(CODE) ON DELETE CASCADE,
            TABLE_INFO_S('REPORT', '8', '(
                        CODE NUMBER,
                        MEMBER_CODE NUMBER NOT NULL,
                        BOARD_KIND_CODE NUMBER NOT NULL,
                        BOARD_CODE NUMBER NOT NULL,

                        REPLY_CODE NUMBER NOT NULL,

                        REPORT_KIND_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        STATUS_CODE NUMBER NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT REPORT_PK PRIMARY KEY (CODE),
                        CONSTRAINT R_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE,
                        CONSTRAINT R_BOARD_KIND_CODE_FK FOREIGN KEY (BOARD_KIND_CODE) REFERENCES BOARD_KIND(CODE) ON DELETE CASCADE,
                        CONSTRAINT R_REPORT_KIND_CODE_FK FOREIGN KEY (REPORT_KIND_CODE) REFERENCES REPORT_KIND(CODE) ON DELETE CASCADE,
                        CONSTRAINT R_STATUS_CODE_FK FOREIGN KEY (STATUS_CODE) REFERENCES STATUS(CODE) ON DELETE CASCADE
                        )'),
            -- 문의 정보 관리 테이블
            TABLE_INFO_S('INQUIRE', '8', '(
                        CODE NUMBER,
                        MEMBER_CODE NUMBER NOT NULL,
                        REPORT_KIND_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        STATUS_CODE NUMBER NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT INQUIRE_PK PRIMARY KEY (CODE),
                        CONSTRAINT I_MEMBER_CODE_FK FOREIGN KEY (MEMBER_CODE) REFERENCES MEMBER(CODE) ON DELETE CASCADE,
                        CONSTRAINT I_REPORT_KIND_CODE_FK FOREIGN KEY (REPORT_KIND_CODE) REFERENCES REPORT_KIND(CODE) ON DELETE CASCADE,
                        CONSTRAINT I_STATUS_CODE_FK FOREIGN KEY (STATUS_CODE) REFERENCES STATUS(CODE) ON DELETE CASCADE
                        )'),
            -- 문의 답변 정보 관리 테이블
            TABLE_INFO_S('INQUIRE_ANSWER', '8', '(
                        CODE NUMBER,
                        INQUIRE_CODE NUMBER NOT NULL,
                        CONTENT VARCHAR2(4000) NOT NULL,
                        STATUS_CODE NUMBER NOT NULL,
                        REG_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
                        MOD_DATE TIMESTAMP DEFAULT SYSDATE,
                        DEL_DATE TIMESTAMP DEFAULT SYSDATE,
                        CONSTRAINT INQUIRE_ANSWER_PK PRIMARY KEY (CODE),
                        CONSTRAINT I_A_INQUIRE_CODE_FK FOREIGN KEY (INQUIRE_CODE) REFERENCES INQUIRE(CODE) ON DELETE CASCADE,
                        CONSTRAINT I_A_STATUS_CODE_FK FOREIGN KEY (STATUS_CODE) REFERENCES STATUS(CODE) ON DELETE CASCADE
                        )')
        );
        -- 테이블 삭제
        FOR T IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
            EXECUTE IMMEDIATE 'DROP TABLE '||T.table_name||' CASCADE CONSTRAINTS';
        END LOOP;
        -- 시퀀스 삭제
        FOR P IN (SELECT * FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER=LOGIN_ID) LOOP
            EXECUTE IMMEDIATE 'DROP SEQUENCE '||P.SEQUENCE_NAME;
        END LOOP;

        -- 테이블 및 시퀀스 생성
        FOR i IN 1..T_I.COUNT LOOP
            BEGIN
                -- 시퀀스 생성
                IF T_I(i)(2) = '4' THEN
                    EXECUTE IMMEDIATE 'CREATE SEQUENCE '||T_I(i)(1)||'_CODE START WITH 1001 INCREMENT BY 1 MAXVALUE 9999 NOCACHE NOCYCLE';
                ELSIF T_I(i)(2) = '8' THEN
                    EXECUTE IMMEDIATE 'CREATE SEQUENCE '||T_I(i)(1)||'_CODE START WITH 10000001 INCREMENT BY 1 MAXVALUE 99999999 NOCACHE NOCYCLE';
                ELSIF T_I(i)(2) = 'M' THEN
                    EXECUTE IMMEDIATE 'CREATE SEQUENCE '||T_I(i)(1)||'_CODE START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCACHE';
                END IF;
                -- 테이블 생성
                EXECUTE IMMEDIATE 'CREATE TABLE '||T_I(i)(1)||T_I(i)(3);
                -- 테이블 데이터 입력
                IF T_I(i).COUNT > 3 THEN
                    FOR j IN 4..T_I(i).COUNT LOOP
                        BEGIN
                            EXECUTE IMMEDIATE 'INSERT INTO '||T_I(i)(1)||' VALUES '||T_I(i)(j);
                            COMMIT;
                        END;
                    END LOOP;
                END IF;
            END;
        END LOOP;
    
    -- ERROR
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SYS.dbms_utility.format_error_backtrace);
    END;
END;