ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER Khotel_khj IDENTIFIED BY khotel1234;

ALTER USER Khotel_khj DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;

GRANT CONNECT, RESOURCE, CREATE VIEW TO Khotel_khj;

-- KHOTEL ( 테이블 생성 + PRIMARY KEY + 시퀀스 )

DROP TABLE "MEMBER";
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER Khotel_khj IDENTIFIED BY khotel1234;

ALTER USER Khotel_khj DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;

GRANT CONNECT, RESOURCE, CREATE VIEW TO Khotel_khj;
-- 기존 유저 삭제
drop user KHotel_khj cascade;

CREATE TABLE "MEMBER" (
   "MEMBER_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "MEMBER_ID"   VARCHAR2(50)      NOT NULL,
   "MEMBER_PW"   VARCHAR2(100)      NOT NULL,
   "MEMBER_NM"   VARCHAR2(30)      NOT NULL,
   "MEMBER_PNO"   VARCHAR2(30)      NOT NULL,
   "MEMBER_TEL"   VARCHAR2(30)      NOT NULL,
   "MEMBER_EMAIL"   VARCHAR2(50)      NOT NULL,
   "MEMBER_ADD"   VARCHAR2(300)      NOT NULL,
   "SECESSION_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "MEMBER_ADMIN"   CHAR(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원아이디';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NM" IS '회원이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_PNO" IS '주민등록번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '전화번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADD" IS '주소';

COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS '탈퇴Y''회원N';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADMIN" IS '관리자Y''회원N';

DROP TABLE "RESERVATION";

CREATE TABLE "RESERVATION" (
   "BOOK_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "CHECKIN_DT"   DATE      NOT NULL,
   "CHECKOUT_DT"   DATE      NOT NULL,
   "BOOK_PERSON"   NUMBER   DEFAULT 0   NOT NULL,
   "CHECK_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL,
   "ROOM_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "RESERVATION"."BOOK_NO" IS '예약번호(시퀀스)';

COMMENT ON COLUMN "RESERVATION"."CHECKIN_DT" IS '체크인 날짜';

COMMENT ON COLUMN "RESERVATION"."CHECKOUT_DT" IS '체크아웃 날짜';

COMMENT ON COLUMN "RESERVATION"."BOOK_PERSON" IS '인원';

COMMENT ON COLUMN "RESERVATION"."CHECK_FL" IS '체크인 여부';

COMMENT ON COLUMN "RESERVATION"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "RESERVATION"."ROOM_NO" IS '객실 번호(시퀀스)';

DROP TABLE "ROOM";

CREATE TABLE "ROOM" (
   "ROOM_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "ROOM_NM"   VARCHAR2(30)      NOT NULL,
   "ROOM_PRICE"   NUMBER      NOT NULL,
   "ROOM_IMG"   VARCHAR2(4000)      NOT NULL,
   "ROOM_INFO"   VARCHAR2(4000)      NOT NULL,
   "ROOM_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "HOTEL_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "ROOM"."ROOM_NO" IS '객실 번호(시퀀스)';

COMMENT ON COLUMN "ROOM"."ROOM_NM" IS '객실명';

COMMENT ON COLUMN "ROOM"."ROOM_PRICE" IS '객실 가격';

COMMENT ON COLUMN "ROOM"."ROOM_IMG" IS '객실 사진';

COMMENT ON COLUMN "ROOM"."ROOM_INFO" IS '객실 소개';

COMMENT ON COLUMN "ROOM"."ROOM_FL" IS '객실 예약 여부';

COMMENT ON COLUMN "ROOM"."HOTEL_NO" IS '호텔번호';

DROP TABLE "BOARD";

CREATE TABLE "BOARD" (
   "BOARD_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "BOARD_TITLE"   VARCHAR2(150)      NOT NULL,
   "BOARD_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "BOARD_DT"   DATE   DEFAULT SYSDATE   NOT NULL,
   "BOARD_ST"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "BOARD_CD"   NUMBER      NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL,
   "REVIEW_STAR"   NUMBER       NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글내용';

COMMENT ON COLUMN "BOARD"."BOARD_DT" IS '작성일';

COMMENT ON COLUMN "BOARD"."BOARD_ST" IS '게시글상태(정상N,삭제Y)';

COMMENT ON COLUMN "BOARD"."BOARD_CD" IS '게시판 코드';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "BOARD"."REVIEW_STAR" IS '별점';

DROP TABLE "BOARD_TYPE";

CREATE TABLE "BOARD_TYPE" (
   "BOARD_CD"   NUMBER   PRIMARY KEY   NOT NULL,
   "BOARD_NM"   VARCHAR2(100)      NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CD" IS '게시판 코드';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NM" IS '게시판 이름';

DROP TABLE "EVENT";

CREATE TABLE "EVENT" (
   "EVENT_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "EVENT_TITLE"   VARCHAR2(100)      NOT NULL,
   "EVENT_CONTENT"   VARCHAR2(100)      NULL,
   "EVENT_IMG"   VARCHAR2(4000)      NOT NULL,
   "EVENT_ST"   CHAR(1)   DEFAULT 'Y'   NOT NULL
);

COMMENT ON COLUMN "EVENT"."EVENT_NO" IS '이벤트 번호 (시퀀스)';

COMMENT ON COLUMN "EVENT"."EVENT_TITLE" IS '이벤트 제목';

COMMENT ON COLUMN "EVENT"."EVENT_CONTENT" IS '이벤트 내용';

COMMENT ON COLUMN "EVENT"."EVENT_IMG" IS '이벤트 사진';

COMMENT ON COLUMN "EVENT"."EVENT_ST" IS '진행Y''종료N';

CREATE TABLE "EVENT_FL" (
   "BINGO_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "UPDOWN_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL,
   "EVENT_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "EVENT_FL"."BINGO_FL" IS '빙고참여여부';

COMMENT ON COLUMN "EVENT_FL"."UPDOWN_FL" IS '업다운참여여부';

COMMENT ON COLUMN "EVENT_FL"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "EVENT_FL"."EVENT_NO" IS '이벤트 번호 (시퀀스)';

DROP TABLE "REPLY";

CREATE TABLE "REPLY" (
   "REPLY_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "REPLY_CONTENT"   VARCHAR2(1000)      NOT NULL,
   "CREATE_DT"   DATE   DEFAULT SYSDATE   NOT NULL,
   "REPLY_ST"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호(시퀀스)';

COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "REPLY"."CREATE_DT" IS '댓글 작성일';

COMMENT ON COLUMN "REPLY"."REPLY_ST" IS '댓글 상태';

COMMENT ON COLUMN "REPLY"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시글번호(시퀀스)';

DROP TABLE "LIKELIST";

CREATE TABLE "LIKELIST" (
   "ROOM_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "LIKELIST"."ROOM_NO" IS '객실 번호(시퀀스)';

COMMENT ON COLUMN "LIKELIST"."MEMBER_NO" IS '회원번호';

DROP TABLE "CALCULATE";

CREATE TABLE "CALCULATE" (
   "CALCULATE_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "CALCULATE_WAY"   VARCHAR2(30)      NOT NULL,
   "CALCULATE_ST"   CHAR(1)   DEFAULT 'N'   CHECK(CALCULATE_ST IN ('N','I','Y'))  ,
   "CALCULATE_PRICE"   NUMBER      NOT NULL,
   "ACCOUNT_NUMBER"   VARCHAR2(100)      NOT NULL,
   "BOOK_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "CALCULATE"."CALCULATE_NO" IS '결제번호';

COMMENT ON COLUMN "CALCULATE"."CALCULATE_WAY" IS '결제수단';

COMMENT ON COLUMN "CALCULATE"."CALCULATE_ST" IS '결제여부';

COMMENT ON COLUMN "CALCULATE"."CALCULATE_PRICE" IS '결제금액';

COMMENT ON COLUMN "CALCULATE"."ACCOUNT_NUMBER" IS '입금계좌';

COMMENT ON COLUMN "CALCULATE"."BOOK_NO" IS '예약번호(시퀀스)';

DROP TABLE "REVIEW_IMG";

CREATE TABLE "REVIEW_IMG" (
   "IMG_REVIEW_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "IMG_REVIEW_RENAME"   VARCHAR2(4000)      NOT NULL,
   "IMG_REVIEW_LEVEL"   NUMBER      NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "REVIEW_IMG"."IMG_REVIEW_NO" IS '이미지 번호';

COMMENT ON COLUMN "REVIEW_IMG"."IMG_REVIEW_RENAME" IS '이미지 저장 경로+ 변경명';

COMMENT ON COLUMN "REVIEW_IMG"."IMG_REVIEW_LEVEL" IS '이미지 위치 지정 번호';

COMMENT ON COLUMN "REVIEW_IMG"."BOARD_NO" IS '게시글번호(시퀀스)';

DROP TABLE "EVENT_IMG";

CREATE TABLE "EVENT_IMG" (
   "IMG_EVENT_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "IMG_EVENT_RENAME"   VARCHAR2(4000)      NOT NULL,
   "IMG_EVENT_LEVEL"   NUMBER      NOT NULL,
   "EVENT_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "EVENT_IMG"."IMG_EVENT_NO" IS '이미지 번호';

COMMENT ON COLUMN "EVENT_IMG"."IMG_EVENT_RENAME" IS '이미지 저장 경로+ 변경명';

COMMENT ON COLUMN "EVENT_IMG"."IMG_EVENT_LEVEL" IS '이미지 위치 지정 번호';

COMMENT ON COLUMN "EVENT_IMG"."EVENT_NO" IS '이벤트 번호 (시퀀스)';

DROP TABLE "COUPON";

CREATE TABLE "COUPON" (
   "COUPON_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "MEMBER_NO"   NUMBER      NOT NULL,
   "COUPON_NM"   VARCHAR2(100)      NOT NULL,
   "COUPON_SALE"   NUMBER   DEFAULT 30000   NOT NULL,
   "COUPON_DT"   DATE   DEFAULT '2023-12-31'   NOT NULL,
   "COUPON_ST"   CHAR(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN "COUPON"."COUPON_NO" IS '쿠폰 번호';

COMMENT ON COLUMN "COUPON"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "COUPON"."COUPON_NM" IS '쿠폰명';

COMMENT ON COLUMN "COUPON"."COUPON_SALE" IS '할인금액';

COMMENT ON COLUMN "COUPON"."COUPON_DT" IS '유효기간';

COMMENT ON COLUMN "COUPON"."COUPON_ST" IS '사용Y''사용안함N';

DROP TABLE "HOTEL";

CREATE TABLE "HOTEL" (
   "HOTEL_NO"   NUMBER   PRIMARY KEY   NOT NULL,
   "HOTEL_TITLE"   VARCHAR2(100)      NOT NULL
);

COMMENT ON COLUMN "HOTEL"."HOTEL_NO" IS '호텔번호';

COMMENT ON COLUMN "HOTEL"."HOTEL_TITLE" IS '호텔 지점';

DROP TABLE "TAG";

CREATE TABLE "TAG" (
   "TAG_CONTENT"   VARCHAR2(100)      NULL,
   "BOARD_NO"   NUMBER      NOT NULL,
   "TAG_ST"   CHAR(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN "TAG"."TAG_CONTENT" IS '태그내용';

COMMENT ON COLUMN "TAG"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "TAG"."TAG_ST" IS '태그 상태';

COMMENT ON COLUMN "TAG"."TAG_NO" IS '태그번호';

COMMENT ON COLUMN "TAG"."TAG_CONTENT" IS '태그내용';

COMMENT ON COLUMN "TAG"."TAG_ST" IS '태그상태';

COMMENT ON COLUMN "TAG"."BOARD_NO" IS '게시글번호(시퀀스)';


DROP TABLE "REPORT";

CREATE TABLE "REPORT" (
   "MEMBER_NO"   NUMBER      NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL,
   "REPORT_CONTENT"   VARCHAR2(4000)      NULL
);

COMMENT ON COLUMN "REPORT"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "REPORT"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고내용';

CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE; -- 회원 번호 시퀀스

CREATE SEQUENCE SEQ_BOOK_NO NOCACHE; -- 예약 번호 시퀀스

CREATE SEQUENCE SEQ_ROOM_NO NOCACHE; -- 객실 번호 시퀀스

CREATE SEQUENCE SEQ_BOARD_NO NOCACHE; -- 게시길 번호 시퀀스

CREATE SEQUENCE SEQ_BOOK_TYPE_NO NOCACHE; -- 게시판 코드 시퀀스

CREATE SEQUENCE SEQ_EVENT_NO NOCACHE; -- 이벤트 번호 시퀀스

CREATE SEQUENCE SEQ_REPLY_NO NOCACHE; -- 댓글 번호 시퀀스

CREATE SEQUENCE SEQ_CALCULATE_NO NOCACHE; -- 결제 번호 시퀀스

CREATE SEQUENCE SEQ_IMG_REVIEW_NO NOCACHE; -- 댓글 이미지 번호 시퀀스

CREATE SEQUENCE SEQ_IMG_EVENT_NO NOCACHE; -- 이벤트 이미지 번호 시퀀스

CREATE SEQUENCE SEQ_COUPON_NO NOCACHE; -- 쿠폰 번호 시퀀스

CREATE SEQUENCE SEQ_HOTEL_NO NOCACHE; -- 호텔 번호 시퀀스

-- CREATE SEQUENCE SEQ_TAG_NO NOCACHE; -- 태그 번호 시퀀스

CREATE SEQUENCE SEQ_REPORT_NO NOCACHE; -- 신고 번호 시퀀스

CREATE SEQUENCE SEQ_BOARD_CD NOCACHE; -- 게시판 코드 시퀀스


DROP SEQUENCE SEQ_MEMBER_NO; 
DROP SEQUENCE SEQ_BOOK_NO;
DROP SEQUENCE SEQ_ROOM_NO;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_BOOK_TYPE_NO;
DROP SEQUENCE SEQ_EVENT_NO;
DROP SEQUENCE SEQ_REPLY_NO;
DROP SEQUENCE SEQ_CALCULATE_NO;
DROP SEQUENCE SEQ_IMG_REVIEW_NO;
DROP SEQUENCE SEQ_IMG_EVENT_NO;
DROP SEQUENCE SEQ_COUPON_NO;
DROP SEQUENCE SEQ_HOTEL_NO;
DROP SEQUENCE SEQ_TAG_NO; 
DROP SEQUENCE SEQ_REPORT_NO;

ALTER TABLE RESERVATION
ADD FOREIGN KEY("MEMBER_NO")
REFERENCES "MEMBER"; -- 예약 테이블에 멤버 번호 참조

ALTER TABLE RESERVATION
ADD FOREIGN KEY("ROOM_NO")
REFERENCES "ROOM";  -- 예약 테이블에 객실 번호 참조

ALTER TABLE ROOM
ADD FOREIGN KEY("HOTEL_NO")
REFERENCES "HOTEL";  -- 객실 테이블에 호텔 번호 참조

ALTER TABLE BOARD
ADD FOREIGN KEY("MEMBER_NO")
REFERENCES "MEMBER";   -- 게시글 테이블에 멤버 번호 참조

ALTER TABLE BOARD
ADD FOREIGN KEY("BOARD_CD")
REFERENCES "BOARD_TYPE";   -- 게시글 테이블에 게시글 코드 참조

--ALTER TABLE EVENT
--ADD FOREIGN KEY("MEMBER_NO")
--REFERENCES "MEMBER";  -- 이벤트 테이블에 멤버 번호 참조

ALTER TABLE REPLY
ADD FOREIGN KEY("MEMBER_NO")
REFERENCES "MEMBER"; -- 댓글 테이블에 멤버 번호 참조

ALTER TABLE REPLY
ADD FOREIGN KEY("BOARD_NO")
REFERENCES "BOARD"; -- 댓글 테이블에 게시글 번호 참조

ALTER TABLE LIKELIST
ADD FOREIGN KEY("ROOM_NO")
REFERENCES "ROOM"; -- 찜목록 테이블에 객실 번호 참조

ALTER TABLE LIKELIST
ADD FOREIGN KEY("MEMBER_NO")
REFERENCES "MEMBER"; -- 찜목록 테이블에 멤버 번호 참조

ALTER TABLE CALCULATE
ADD FOREIGN KEY("BOOK_NO")
REFERENCES "RESERVATION"; -- 찜 목록에 예약 번호 참조

ALTER TABLE REVIEW_IMG
ADD FOREIGN KEY("BOARD_NO")
REFERENCES "BOARD"; -- 리뷰 이미지 테이블에 게시글 번호 참조

ALTER TABLE EVENT_IMG
ADD FOREIGN KEY("EVENT_NO")
REFERENCES "EVENT"; -- 이벤트 이미지 테이블에 이벤트 번호 참조

ALTER TABLE COUPON
ADD FOREIGN KEY("MEMBER_NO")
REFERENCES "MEMBER"; -- 쿠폰 테이블에 멤버 번호 참조

ALTER TABLE TAG
ADD FOREIGN KEY("BOARD_NO")
REFERENCES "BOARD"; -- 태그 테이블에 게시글 번호 참조

ALTER TABLE REPORT
ADD FOREIGN KEY("MEMBER_NO")
REFERENCES "MEMBER"; -- 신고 테이블에 회원 번호 참조


ALTER TABLE REPORT
ADD FOREIGN KEY("BOARD_NO")
REFERENCES "BOARD"; -- 신고 테이블에 회원 번호 참조

-- 유저 더미 데이터
INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL,'admin01','admin01','관리자','970521-1346782','01012345678','admin@naver.com','04651,,서울특별시,,주소는몰라요',DEFAULT,'Y');
INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL,'user01','pass01','유저일','970521-1346782','01012345678','user01@naver.com','04651,,서울특별시,,주소는몰라요',DEFAULT,DEFAULT);


DELETE FROM MEMBER;

-- 게시글 종류
INSERT INTO BOARD_TYPE VALUES(SEQ_BOARD_CD.NEXTVAL,'공지사항');
INSERT INTO BOARD_TYPE VALUES(SEQ_BOARD_CD.NEXTVAL,'질문게시판');
INSERT INTO BOARD_TYPE VALUES(SEQ_BOARD_CD.NEXTVAL,'리뷰게시판');
INSERT INTO BOARD_TYPE VALUES(SEQ_BOARD_CD.NEXTVAL,'FAQ');

DELETE FROM BOARD_TYPE;
-- 게시글 더미 데이터
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'공지사항 더미 데이터 1','공지사항 더미 데이터 1번 입니다. ㅋㅋ',DEFAULT,DEFAULT,1,1,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'공지사항 더미 데이터 2','공지사항 더미 데이터 2번 입니다. ㅎㅎ',DEFAULT,DEFAULT,1,1,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'공지사항 더미 데이터 3','공지사항 더미 데이터 3번 입니다. ^^',DEFAULT,DEFAULT,1,1,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'공지사항 더미 데이터 4','공지사항 더미 데이터 4번 입니다. ㅗㅗ',DEFAULT,DEFAULT,1,1,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'공지사항 더미 데이터 5','공지사항 더미 데이터 5번 입니다. ㅜㅜ',DEFAULT,DEFAULT,1,1,NULL);

-- FAQ 더미 데이터
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'FAQ 더미 데이터 1','FAQ 더미 데이터 1번 입니다. ㅋㅋ',DEFAULT,DEFAULT,2,1,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'FAQ 더미 데이터 2','FAQ 더미 데이터 2번 입니다. ㅋㅋ',DEFAULT,DEFAULT,2,1,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'FAQ 더미 데이터 3','FAQ 더미 데이터 3번 입니다. ㅋㅋ',DEFAULT,DEFAULT,2,1,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'FAQ 더미 데이터 4','FAQ 더미 데이터 4번 입니다. ㅋㅋ',DEFAULT,DEFAULT,2,1,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'FAQ 더미 데이터 5','FAQ 더미 데이터 5번 입니다. ㅋㅋ',DEFAULT,DEFAULT,2,1,NULL);

-- Q/A 더미 데이터
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 1','질문게시판 더미 데이터 1번 입니다. ㅋㅋ',DEFAULT,DEFAULT,1,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 2','질문게시판 더미 데이터 2번 입니다. ㅎㅎ',DEFAULT,DEFAULT,1,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 3','질문게시판 더미 데이터 3번 입니다. ^^',DEFAULT,DEFAULT,1,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 4','질문게시판 더미 데이터 4번 입니다. ㅗㅗ',DEFAULT,DEFAULT,1,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 5','질문게시판 더미 데이터 5번 입니다. ㅜㅜ',DEFAULT,DEFAULT,1,2,NULL);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 6','질문게시판 더미 데이터 6번 입니다. ㅋㅋ',DEFAULT,DEFAULT,2,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 7','질문게시판 더미 데이터 7번 입니다. ㅎㅎ',DEFAULT,DEFAULT,2,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 8','질문게시판 더미 데이터 8번 입니다. ^^',DEFAULT,DEFAULT,2,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 9','질문게시판 더미 데이터 9번 입니다. ㅗㅗ',DEFAULT,DEFAULT,2,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 10','질문게시판 더미 데이터 10번 입니다. ㅜㅜ',DEFAULT,DEFAULT,2,2,NULL);

INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 11','질문게시판 더미 데이터 11번 입니다. ㅋㅋ',DEFAULT,DEFAULT,2,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 12','질문게시판 더미 데이터 12번 입니다. ㅎㅎ',DEFAULT,DEFAULT,2,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 13','질문게시판 더미 데이터 13번 입니다. ^^',DEFAULT,DEFAULT,2,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 14','질문게시판 더미 데이터 14번 입니다. ㅗㅗ',DEFAULT,DEFAULT,2,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'질문게시판 더미 데이터 15','질문게시판 더미 데이터 15번 입니다. ㅜㅜ',DEFAULT,DEFAULT,2,2,NULL);

-- 리뷰 더미 데이터
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'리뷰 더미 데이터 1','리뷰 더미 데이터 1번 입니다. ㅋㅋ',DEFAULT,DEFAULT,3,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'리뷰 더미 데이터 2','리뷰 더미 데이터 2번 입니다. ㅎㅎ',DEFAULT,DEFAULT,3,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'리뷰 더미 데이터 3','리뷰 더미 데이터 3번 입니다. ^^',DEFAULT,DEFAULT,3,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'리뷰 더미 데이터 4','리뷰 더미 데이터 4번 입니다. ㅗㅗ',DEFAULT,DEFAULT,3,2,NULL);
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,'리뷰 더미 데이터 5','리뷰 더미 데이터 5번 입니다. ㅜㅜ',DEFAULT,DEFAULT,3,2,NULL);

-- 댓글 더미 데이터 (Q/A 댓글)
INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL,'7번 게시글의 더미 데이터 입니다.',DEFAULT,DEFAULT,1,7);
INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL,'8번 게시글의 더미 데이터 입니다.',DEFAULT,DEFAULT,1,8);
INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL,'9번 게시글의 더미 데이터 입니다.',DEFAULT,DEFAULT,1,9);
INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL,'10번 게시글의 더미 데이터 입니다.',DEFAULT,DEFAULT,1,10);


COMMIT;

-- 태그 더미 데이터
INSERT INTO TAG VALUES('깨끗해요',17,DEFAULT);
INSERT INTO TAG VALUES('아이와 가기 좋아요',17,DEFAULT);
INSERT INTO TAG VALUES('조용해서 쉬기 좋아요',17,DEFAULT);
INSERT INTO TAG VALUES('침구가 고급스러워요',17,DEFAULT);
INSERT INTO TAG VALUES('애인과 가기 좋아요',17,DEFAULT);
INSERT INTO TAG VALUES('파티하기 좋아요',17,DEFAULT);

-- 신고 더미 데이터 
INSERT INTO REPORT VALUES(2,17,'몰라요 이상해요');

-- 결제 더미 데이터 
INSERT INTO CALCULATE VALUES(SEQ_CALCULATE_NO.NEXTVAL,'무통장입금',DEFAULT,'400000','1000-2161-4567',2);

-- 예약 더미 데이터 
INSERT INTO RESERVATION VALUES(SEQ_BOOK_NO.NEXTVAL,'2023-10-12','2023-10-14',2,DEFAULT,2,1);

-- 호텔 더미 데이터 
INSERT INTO HOTEL VALUES(SEQ_HOTEL_NO.NEXTVAL,'GANGNAM');
INSERT INTO HOTEL VALUES(SEQ_HOTEL_NO.NEXTVAL,'JONGRO');
INSERT INTO HOTEL VALUES(SEQ_HOTEL_NO.NEXTVAL,'DANGSAN');

-- 객실 더미 데이터 
INSERT INTO ROOM VALUES(SEQ_ROOM_NO.NEXTVAL,'DELUXE','400000','${contextPath}/resources/images/Deluxe-Room_1.jpg','강남점 디럭스룸 소개글','N',1);
INSERT INTO ROOM VALUES(SEQ_ROOM_NO.NEXTVAL,'STANDARD','600000','${contextPath}/resources/images/standard-Room_1.jpg','강남점 스탠다드룸 소개글','N',1);
INSERT INTO ROOM VALUES(SEQ_ROOM_NO.NEXTVAL,'SUITE','800000','${contextPath}/resources/images/suite-Room_1.jpg','강남점 스위트룸 소개글','N',1);

INSERT INTO ROOM VALUES(SEQ_ROOM_NO.NEXTVAL,'DELUXE','400000','${contextPath}/resources/images/Deluxe-Room_JongRo_1.jpg','종로점 디럭스룸 소개글','N',2);
INSERT INTO ROOM VALUES(SEQ_ROOM_NO.NEXTVAL,'STANDARD','600000','${contextPath}/resources/images/standard-Room_JongRo_2.jpg','종로점 스탠다드룸 소개글','N',2);
INSERT INTO ROOM VALUES(SEQ_ROOM_NO.NEXTVAL,'SUITE','800000','${contextPath}/resources/images/suite-Room_JongRo_2.jpg','종로점 스위트룸 소개글','N',2);

INSERT INTO ROOM VALUES(SEQ_ROOM_NO.NEXTVAL,'DELUXE','400000','${contextPath}/resources/images/Deluxe-Room_DangSan_3.jpg','당산점 디럭스룸 소개글','N',3);
INSERT INTO ROOM VALUES(SEQ_ROOM_NO.NEXTVAL,'STANDARD','600000','${contextPath}/resources/images/standard-Room_DangSan_3.jpg','당산점 스탠다드룸 소개글','N',3);
INSERT INTO ROOM VALUES(SEQ_ROOM_NO.NEXTVAL,'SUITE','800000','${contextPath}/resources/images/suite-Room_DangSan_3.jpg','당산점 스위트룸 소개글','N',3);

--쿠폰 더미 데이터
INSERT INTO COUPON VALUES(SEQ_COUPON_NO.NEXTVAL,2,'30000만원 할인 쿠폰',30000,DEFAULT,DEFAULT);

-- 이벤트 더미 데이터 
INSERT INTO EVENT VALUES(SEQ_EVENT_NO.NEXTVAL,'이벤트1','이벤트 1 내용입니다','${contextPath}/resources/images/suite-Room_DangSan_3.jpg',DEFAULT); 

-- 찜목록 더미 데이터
INSERT INTO LIKELIST VALUES(1,2);

commit;

DROP TABLE "REPORT";

CREATE TABLE "REPORT" (
   "MEMBER_NO"   NUMBER      NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL,
   "REPORT_CONTENT"   VARCHAR2(4000)  NULL,
   "REPORT_ST"  CHAR(1) DEFAULT 'N' NOT NULL
);

COMMENT ON COLUMN "REPORT"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "REPORT"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고내용';

COMMENT ON COLUMN "REPORT"."REPORT_ST" IS '신고처리현황';

INSERT INTO REPORT VALUES(2,26,'신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다', DEFAULT);
INSERT INTO REPORT VALUES(2,27,'신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다', DEFAULT);
INSERT INTO REPORT VALUES(2,28,'신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다', DEFAULT);
INSERT INTO REPORT VALUES(2,29,'신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다', DEFAULT);
INSERT INTO REPORT VALUES(2,30,'신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다신고합니다', DEFAULT);

INSERT INTO BOARD_TYPE VALUES(SEQ_BOARD_CD.NEXTVAL,'관리자회원정보관리');
INSERT INTO BOARD_TYPE VALUES(SEQ_BOARD_CD.NEXTVAL,'관리자리뷰신고목록');
INSERT INTO BOARD_TYPE VALUES(SEQ_BOARD_CD.NEXTVAL,'관리자예약관리');
INSERT INTO BOARD_TYPE VALUES(SEQ_BOARD_CD.NEXTVAL,'관리자결제관리');

-- 특정 게시판 글 수 조회
SELECT COUNT(*) FROM BOARD
WHERE BOARD_CD = 2;

-- 특정 게시판 글 목록 조회
SELECT * FROM(
    SELECT ROWNUM RNUM, A.* FROM(
        SELECT BOARD_NO, BOARD_TITLE, MEMBER_ID, 
                TO_CHAR(BOARD_DT,'YYYY-MM-DD') AS BOARD_DT
        FROM BOARD
        JOIN MEMBER USING (MEMBER_NO)
        WHERE BOARD_CD = 2
        AND BOARD_ST = 'N'
        ORDER BY BOARD_NO DESC
    ) A
)
WHERE RNUM BETWEEN 1 AND 10;


-- 특정 게시판 이름 조회
SELECT BOARD_NM FROM BOARD_TYPE
WHERE BOARD_CD = 2;

-- 검색 조건에 맞는 글 목록 조회(QNA)
SELECT count(*) FROM BOARD
WHERE BOARD_TITLE LIKE '%1%';

SELECT * FROM(
		    SELECT ROWNUM RNUM, A.* FROM(
		        SELECT BOARD_NO, BOARD_TITLE, MEMBER_NM, 
		                TO_CHAR(BOARD_DT,'YYYY-MM-DD') AS BOARD_DT
		        FROM BOARD
		        JOIN MEMBER USING (MEMBER_NO)
		        WHERE BOARD_CD = ?
		        AND BOARD_ST = 'N'
                AND ? LIKE '%?%'
		        ORDER BY BOARD_NO DESC
		    ) A
		)
		WHERE RNUM BETWEEN ? AND ?;