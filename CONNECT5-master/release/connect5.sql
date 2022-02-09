-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: connect5
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `BoardId` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시글 일련번호',
  `Title` varchar(100) NOT NULL COMMENT '게시글 제목',
  `Content` varchar(255) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ContentImg` varchar(255) DEFAULT NULL,
  `Category` int(11) NOT NULL,
  `MemberId` int(11) DEFAULT NULL,
  `viewcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`BoardId`),
  KEY `fk_Board_User1_idx` (`MemberId`),
  CONSTRAINT `fk_Board_User1` FOREIGN KEY (`MemberId`) REFERENCES `user` (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'12월의 공지사항','12월의 공지사항 입니다. ','2019-11-30 17:04:25','se.gif',2,1,2),(2,'배세은 님의 성혼 스토리 입니다.','배세은 님의 성혼 스토리 입니다.','2019-12-28 17:47:26',NULL,1,1,1),(3,'최유한 님의 성혼 스토리 입니다.','성혼 스토리 입니다.','2019-12-09 17:02:02',NULL,1,1,1),(4,'박경동 님의 성혼 스토리 입니다.','성혼 스토리 입니다.','2019-12-15 17:02:02',NULL,1,1,1),(5,'남희권 님의 성혼 스토리 입니다.','성혼 스토리 입니다.','2019-12-16 17:02:02',NULL,1,1,1),(6,'정유빈 님의 성혼 스토리 입니다.','성혼 스토리 입니다.','2019-12-24 17:02:02',NULL,1,1,1),(7,'결제관련 공지','결제관련 공지드립니다.','2019-12-16 17:04:25','',2,1,2),(8,'매칭관련 공지','매칭관련 수정사항 전해드립니다.','2020-01-06 07:39:17','',2,1,3),(9,'후기 남겨요~~','너무 좋았어요!','2019-12-23 17:09:36',NULL,3,2,0),(10,'너무 좋았습니다.','후기 남겨요~','2019-12-24 17:09:36',NULL,3,3,0),(12,'궁금해요','궁금합니다!','2019-12-10 17:11:30',NULL,4,6,0),(13,'질문!','질문 있습니다!','2019-12-19 17:11:30',NULL,4,5,0),(14,'매칭관련 질문드립니다.','매칭은 어떻게 이루어지나요?','2019-12-24 17:11:30',NULL,4,2,0);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `ManagerId` int(11) NOT NULL AUTO_INCREMENT,
  `M_Name` varchar(30) NOT NULL,
  `M_Tel` int(13) NOT NULL,
  `M_Email` varchar(30) NOT NULL,
  `M_Content` varchar(255) NOT NULL,
  `M_Img` varchar(255) NOT NULL,
  `M_Position` varchar(30) NOT NULL,
  `M_Gender` tinyint(4) NOT NULL,
  `MemberId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ManagerId`),
  KEY `fk_Manager_User1_idx` (`MemberId`),
  CONSTRAINT `fk_Manager_User1` FOREIGN KEY (`MemberId`) REFERENCES `user` (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'배세은',1045462387,'seeun@connect5.com','오랜 경력의 노하우로 VIP, 전문직, 명문가집안 결혼을 최고의 성혼 율로 믿고 맡길 수 있습니다. 따뜻한 햇살보다 눈부시고 아름다운 동행을 저와 함께 시작해요~','se.gif','매니저1',1,2),(2,'최유한',1012219928,'yuhan@connect5.com','건강한 사랑, 행복한 결혼생활을 꿈꾸시나요? 행복은 노력하는 자에게 주어지는 선물입니다! 하루 빨리 내 인생의 보물찾기를 시작하세요~ 진실된 마음과 항상 응원하는 마음으로, 든든한 동반자가 되어 드립니다♥','yh.gif','매니저2',0,3),(3,'박경동',1038279182,'kyungdong@connect5.com','결혼에서의 성공이란, 단순히 올바른 상대를 찾음으로써 오는게 아니라 올바른 상대가 됨으로써 온다고 합니다. 사랑을 듬뿍 주실 준비가 되신분이라면 용기내세요!! 귀한 인연 함께 찾아 봐 드릴께요^^','gd.gif','매니저3',0,4),(4,'남희권',1047385930,'heekwon@connect5.com','결혼은 이제 필수가 아닌 선택입니다. 가족중 유일하게 선택하실 수 있는 것이 배우자이기도합니다.어떤 배우자를 선택 하느냐에 따라 인생의 행복지수가 달라집니다. 최선의 선택을 도와 드리는 매니저가 되겠습니다.','hg.gif','매니저4',0,5),(5,'정유빈',1027930192,'yubin@connect5.com','누군가의 새로운 가족으로..아이들의 부모로 살아가야 하는 새로운 인생이 결혼입니다. 평생을 함께할 한 사람과 미래를 꿈꿀수 있도록 만남부터 연애 결혼까지 도움을 드리고 싶습니다.','yb.gif','매니저5',1,6);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `ServiceType` int(11) DEFAULT NULL COMMENT '결제 수단',
  `PmtType` tinyint(4) DEFAULT NULL COMMENT '결제 은행',
  `ServiceBank` int(11) DEFAULT NULL COMMENT '결제 입금자 명',
  `PayerName` varchar(20) DEFAULT NULL COMMENT '카드사',
  `Card` int(11) DEFAULT NULL COMMENT '할부선택',
  `PmtPlan` int(11) DEFAULT NULL,
  `MemberId` int(11) NOT NULL,
  `datetime` timestamp NULL DEFAULT NULL,
  `clear` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `fk_Payment_User1_idx` (`MemberId`),
  CONSTRAINT `fk_Payment_User1` FOREIGN KEY (`MemberId`) REFERENCES `user` (`MemberId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (3,3,2,0,NULL,1,0,2,NULL,'1'),(4,3,1,0,'최유한',0,0,3,NULL,'1'),(5,4,2,0,NULL,3,3,4,NULL,'1'),(6,2,1,4,'정유빈',0,0,6,NULL,'1'),(7,4,2,0,NULL,4,3,4,NULL,'1'),(8,2,2,0,NULL,2,2,5,NULL,'1'),(9,2,2,0,NULL,2,0,2,NULL,'1'),(10,4,2,0,NULL,1,4,3,NULL,'1'),(11,3,2,0,NULL,1,1,2,NULL,'1');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `ReplyId` int(11) NOT NULL AUTO_INCREMENT,
  `Re_Title` varchar(100) NOT NULL,
  `Re_Content` varchar(255) NOT NULL,
  `Re_CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `BoardId` int(11) NOT NULL,
  `MemberId` int(11) DEFAULT NULL,
  `Reply_Ok` int(2) DEFAULT NULL,
  PRIMARY KEY (`ReplyId`),
  KEY `fk_reply_Board1_idx` (`BoardId`),
  KEY `fk_reply_User1_idx` (`MemberId`),
  CONSTRAINT `fk_reply_Board1` FOREIGN KEY (`BoardId`) REFERENCES `board` (`BoardId`),
  CONSTRAINT `fk_reply_User1` FOREIGN KEY (`MemberId`) REFERENCES `user` (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (58,'댓글달기','제가 알기론...','2020-01-07 02:23:54',14,3,NULL),(59,'댓글달기','질문이 뭐죠?','2020-01-03 05:02:45',13,3,NULL);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reqmatch`
--

DROP TABLE IF EXISTS `reqmatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reqmatch` (
  `ReqMatchId` int(11) NOT NULL AUTO_INCREMENT,
  `Select_Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MemberId` int(11) DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `reqSpService` int(11) DEFAULT NULL,
  PRIMARY KEY (`ReqMatchId`),
  KEY `fk_ReqMatch_User1_idx` (`MemberId`),
  CONSTRAINT `fk_ReqMatch_User1` FOREIGN KEY (`MemberId`) REFERENCES `user` (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reqmatch`
--

LOCK TABLES `reqmatch` WRITE;
/*!40000 ALTER TABLE `reqmatch` DISABLE KEYS */;
INSERT INTO `reqmatch` VALUES (1,'2020-01-07 09:22:10',3,'2020-01-07 15:00:00',NULL,1),(2,'2020-01-07 08:21:20',5,'2019-12-30 15:00:00',NULL,0),(3,'2020-12-28 02:41:53',6,'2019-12-29 15:00:00',NULL,1),(4,'2020-12-28 02:41:53',8,'2020-01-07 15:00:00',NULL,1),(5,'2020-12-29 02:41:53',10,'2020-01-08 15:00:00',NULL,0),(6,'2020-12-29 02:41:53',13,'2020-01-09 15:00:00',NULL,0),(7,'2020-12-29 02:41:53',14,'2020-01-11 15:00:00',NULL,1),(8,'2020-12-30 02:41:53',16,'2020-01-07 15:00:00',NULL,1),(9,'2020-12-31 02:41:53',17,'2020-01-08 15:00:00',NULL,1),(10,'2020-01-02 02:41:53',18,'2020-01-07 15:00:00',NULL,0),(11,'2020-01-03 02:41:53',20,'2020-01-14 15:00:00',NULL,0),(12,'2020-01-03 02:41:53',22,'2020-01-14 15:00:00',NULL,0),(13,'2020-01-04 02:41:53',25,'2020-01-15 15:00:00',NULL,1),(14,'2020-01-04 02:41:53',27,'2020-01-18 15:00:00',NULL,1),(15,'2020-01-05 02:41:53',29,'2020-01-18 15:00:00',NULL,0),(16,'2020-01-07 02:41:53',30,'2020-01-18 15:00:00',NULL,1),(17,'2020-01-07 02:41:53',31,'2020-01-19 15:00:00',NULL,1),(18,'2020-01-08 02:41:53',32,'2020-01-19 15:00:00',NULL,0),(19,'2020-01-09 02:41:53',35,'2020-01-24 15:00:00',NULL,1);
/*!40000 ALTER TABLE `reqmatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucmatch`
--

DROP TABLE IF EXISTS `sucmatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucmatch` (
  `SucMatchId` int(11) NOT NULL AUTO_INCREMENT,
  `Status` int(11) NOT NULL,
  `ReqMatchId` int(11) NOT NULL,
  `OtherMemberId` int(11) DEFAULT NULL,
  `MemberId` int(11) NOT NULL,
  PRIMARY KEY (`SucMatchId`),
  KEY `fk_SucMatch_ReqMatch1_idx` (`ReqMatchId`),
  KEY `fk_sucmatch_user1_idx` (`MemberId`),
  CONSTRAINT `fk_SucMatch_ReqMatch1` FOREIGN KEY (`ReqMatchId`) REFERENCES `reqmatch` (`ReqMatchId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sucmatch_user1` FOREIGN KEY (`MemberId`) REFERENCES `user` (`MemberId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucmatch`
--

LOCK TABLES `sucmatch` WRITE;
/*!40000 ALTER TABLE `sucmatch` DISABLE KEYS */;
INSERT INTO `sucmatch` VALUES (1,2,6,13,11),(2,2,9,17,15),(3,2,15,29,28),(4,2,18,32,34),(5,2,19,35,33);
/*!40000 ALTER TABLE `sucmatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `TestId` int(11) NOT NULL AUTO_INCREMENT,
  `TestQ1` tinyint(4) DEFAULT NULL,
  `TestQ2` tinyint(4) DEFAULT NULL,
  `TestQ3` tinyint(4) DEFAULT NULL,
  `TestQ4` tinyint(4) DEFAULT NULL,
  `ResultTitle` varchar(100) NOT NULL,
  `ResultContent` varchar(255) NOT NULL,
  PRIMARY KEY (`TestId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,0,0,NULL,NULL,'좌좌(input-좌뇌, output-좌뇌) 타입','논리적으로 이해하고 논리적으로 표현하는 인간형인 당신, 논리적인 성향이 굉장히 강하기 때문에 수학, 과학과 같은것에 강하다.(보통 공부를 잘하는 유형이라고 한다.)하지만, 감정적 표현이 서툴러서 딱딱한 사람으로 보여지기도 한다.'),(2,0,1,NULL,NULL,'좌우(input-좌뇌, output-우뇌) 타입','논리적으로 이해하고 이를 감각적으로 표현하는 인간형인 당신. 이해는 논리적으로 잘하지만 직관적, 감각적으로 그것을 표현하기 때문에 상대방이 오해를 하는 경우도 있다. 표현력에 주의를 기울이고 연습을 하면 새로운 것을 창조해 낼 가능성이 있다.'),(3,1,0,NULL,NULL,'우좌(input-우뇌, output-좌뇌) 타입','감각적으로 이해하고 이를 논리적으로 표현하는 인간형인 당신. 감각적인 이해를 논리적으로 표현하기에 괴짜형으로 보일 수 있는 드문 타입이다. 하지만 그 특별함이 장점이 되어 진급이나 출세에 강하다.'),(4,1,1,NULL,NULL,'우우(input-우뇌, output-우뇌) 타입','감각과 이미지로 이해하고 표현하는 인간형인 당신.'),(5,NULL,NULL,0,0,'두 가지 모습을 가지고 있는 신비함이 매력.','태양과 같은 밝음과 달과 같은 침착함을 함께 가지고 있는 것이 당신의 가장 큰 매력입니다. 배려심이 깊은 당신은 사람들 앞에서 늘 밝은 모습으로 즐겁게 행동하고 즐거운 분위기를 만드는 당신은 모두에게 사랑받는 타입입니다 하지만 가끔씩 보이는 당신의 외로운 표정이 이성의 마음을 흔들리게 만들기도 합니다.'),(6,NULL,NULL,0,1,'믿음직스러움과 두둑한 배짱이 매력.','어려운 이웃을 그냥 내버려 둘 수 없는 모습은 당신의 가장 큰 매력입니다. 언제나 활동적인 당신은 자신의 일부터 우선시하는 듯한 인상을 주고는 있지만 사실은 늘 자신보다는 타인을 먼저 배련 하는 타입입니다. 친구들을 잘 챙겨주거나 친구의 고민을 함께 주의 깊게 들어주는 모습을 보며 매력을 느끼게 되는 이성들이 많습니다.'),(7,NULL,NULL,1,0,'따듯한 마음이 매력.','난로와 같은 따뜻한 마음이야말로 최고의 매력입니다. 언제나 멋지고 화려한 인상을 주변 이들에게 주고 있는 당신에게 한눈에 반해 버리는 이성들이 매우 많습니다. 하지만 그런 당신을 보며 인기가 좋을 것이라고 생각해버리고 미리 포기해버리는 일들이 자주 생깁니다.'),(8,NULL,NULL,1,1,'장난스러운 백치미가 매력.','의외로 장난기가 많은 것이 최고의 매력입니다. 늘 열심히 노력하는 착실한 모습의 당신은 남들 앞에서도 최선을 다하지 않으면 안 된다는 생각을 늘 가지고 있습니다. 그래서 당신이 얼빠진 모습을 보일 때 이성들이 호감을 가지게 되네요. 뭐든 너무 완벽해야 한다는 생각에 많은 힘을 써버리면 매력이 퇴색되어 버립니다.');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `MemberId` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `UserId` varchar(30) NOT NULL COMMENT '회원아이디',
  `UserPw` varchar(30) NOT NULL COMMENT '회원비밀번호',
  `UserName` varchar(20) NOT NULL COMMENT '회원이름',
  `BirthDate` varchar(6) NOT NULL COMMENT '생년월일',
  `Gender` int(11) NOT NULL COMMENT '성별',
  `IsMarried` int(11) NOT NULL COMMENT '결혼여부',
  `Mobile` varchar(13) NOT NULL COMMENT '핸드폰번호',
  `TEL` varchar(13) DEFAULT NULL COMMENT '전화번호',
  `Email` varchar(30) NOT NULL COMMENT '이메일',
  `PostCode` varchar(5) NOT NULL COMMENT '우편번호',
  `BasicAddress` varchar(100) NOT NULL COMMENT '기본주소',
  `StateAddress` varchar(45) NOT NULL,
  `DetailAddress` varchar(100) NOT NULL COMMENT '상세주소',
  `Join_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isadmin` int(11) DEFAULT NULL,
  `Member_Lv` int(11) DEFAULT NULL,
  `Job` varchar(20) DEFAULT NULL,
  `Edu_Lv` varchar(30) DEFAULT NULL,
  `User_Img` varchar(255) DEFAULT NULL,
  `Height` varchar(30) DEFAULT NULL,
  `BldType` varchar(5) DEFAULT NULL,
  `Date_Loc` varchar(30) DEFAULT NULL,
  `Style` varchar(30) DEFAULT NULL,
  `Personality` varchar(30) DEFAULT NULL,
  `Sal_Annual` varchar(30) DEFAULT NULL,
  `Date_Count` varchar(30) DEFAULT NULL,
  `Date_Rest` varchar(30) DEFAULT NULL,
  `isSpUser` int(2) DEFAULT NULL,
  `ManagerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`MemberId`,`UserName`),
  KEY `fk_user_manager1_idx` (`ManagerId`),
  CONSTRAINT `fk_user_manager1` FOREIGN KEY (`ManagerId`) REFERENCES `manager` (`ManagerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','관리자','901111',1,0,'01012345678',NULL,'qwer@connect5.com','06267','서울 강남구 강남대로 238-4','(도곡동)','연결빌딩','2019-12-28 16:50:10',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'seeun','1234','배세은','960210',1,0,'01012345678',NULL,'tteni2@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 09:19:46',0,3,'검사','대졸','/15775536197730.PNG','161~170cm','AB','서울','귀여움','외향적','7000이하',NULL,'2',0,1),(3,'yuhan','1234','최유한','930210',0,0,'01012345678','','tteni1@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 09:20:07',0,3,'개발자','대졸','/15776877455450.PNG','171~180cm','O','경기도','귀여움','외향적','7000이하',NULL,'2',1,2),(4,'rudehd','1234','박경동','900210',0,0,'01012345678',NULL,'tteni0@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 09:20:39',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'heekwon','1234','남희권','950210',0,0,'01012345678',NULL,'tteni3@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 14:52:39',0,2,'개발자','대졸','/15775547528260.PNG','171~180cm','A','강원도','귀여움','감성적','5000이하',NULL,'3',1,4),(6,'yubin','1234','정유빈','890210',1,0,'01012345678',NULL,'tteni4@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 14:52:39',0,3,'개발자','대졸','/15775545597390.PNG','151~160cm','B','서울','남성스러움','자상함','5000이하',NULL,'3',1,5),(7,'yeon','1234','김서연','910210',1,0,'01012345678',NULL,'tteni5@naver.com','06267','서울 강남구 강남대로 708','(개포동)','123','2020-01-06 14:52:39',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'minseo','1234','김민서','920210',1,0,'01012345678',NULL,'tteni6@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:06:31',0,2,'검사','고졸','/15775536197730.PNG','161~170cm','A','충청도','남성스러움','외향적','3000이하',NULL,'3',0,1),(9,'seojun','1234','김서준','930210',0,0,'01012345678',NULL,'tteni7@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:17:25',0,1,'판사','대졸','/15775536197730.PNG','181cm이상','B','전라도','여성스러움','내향적','5000이하',NULL,'3',0,4),(10,'jiho','1234','김지호','880210',0,0,'01012345678',NULL,'tteni8@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:17:25',0,2,'국회의원','석사이상','/15775536197730.PNG','181cm이상','A','경기도','여성스러움','외향적','7000이하',NULL,'4',0,1),(11,'hajoon','1234','김하준','870210',0,0,'01012345678',NULL,'tteni9@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:06:31',0,4,'디자이너','대졸','/15775536197730.PNG','171~180cm','AB','충청도','마름','외향적','7000이하',NULL,'99',0,4),(12,'siwoo','1234','김시우','860210',0,0,'01012345678',NULL,'tteni10@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:06:31',0,2,'아티스트','석사이상','/15775536197730.PNG','171~180cm','AB','제주도','마름','감성적','5000이하',NULL,'6',0,2),(13,'jian','1234','김지안','940210',1,0,'01012345678',NULL,'tteni11@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:06:31',0,3,'형사','석사이상','/15775536197730.PNG','161~170cm','A','서울','통통','외향적','7000이하',NULL,'5',0,1),(14,'sua','1234','김수아','850210',1,0,'01012345678',NULL,'tteni12@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:06:31',0,2,'경찰','대졸','/15775536197730.PNG','151~160cm','AB','전라도','통통','외향적','1억이상',NULL,'7',0,5),(15,'seoa','1234','김서아','840210',1,0,'01012345678',NULL,'tteni13@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,2,'건축가','대졸','/15775536197730.PNG','151~160cm','B','서울','귀여움','직관적','7000이하',NULL,'4',0,3),(16,'seoyun','1234','김서윤','870211',1,0,'01012345678',NULL,'tteni14@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:06:31',0,4,'교사','대졸','/15775536197730.PNG','161~170cm','B','서울','귀여움','자상함','5000이하',NULL,'99',0,2),(17,'doyun','1234','김도윤','830210',0,0,'01012345678',NULL,'tteni15@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,3,'강사','대졸','/15775536197730.PNG','171~180cm','B','강원도','여성스러움','외향적','7000이하',NULL,'3',0,3),(18,'seojin','1234','김서진','840211',0,0,'01012345678',NULL,'tteni16@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,1,'학생','고졸','/15775536197730.PNG','171~180cm','O','서울','여성스러움','내향적','5000이하',NULL,'2',0,4),(19,'minjun','1234','김민준','881112',0,0,'01012345678',NULL,'tteni17@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 14:56:44',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'juwon','1234','김주원','891212',0,1,'01012345678',NULL,'tteni18@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,3,'교수','대졸','/15775536197730.PNG','171~180cm','O','강원도','마름','외향적','3000이하',NULL,'5',0,1),(21,'woojin','1234','김우진','910213',0,0,'01012345678',NULL,'tteni19@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,2,'자영업','고졸','/15775536197730.PNG','171~180cm','O','서울','귀여움','감성적','7000이하',NULL,'3',0,1),(22,'yeojun','1234','김예준','910214',0,0,'01012345678',NULL,'tteni20@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,2,'공무원','대졸','/15775536197730.PNG','161~170cm','AB','서울','마름','내향적','1억이상',NULL,'4',0,2),(23,'jiwoo','1234','김지우','920111',1,0,'01012345678',NULL,'tteni21@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,3,'국회의원','석사이상','/15775536197730.PNG','161~170cm','AB','충청도','통통','외향적','7000이하',NULL,'4',0,3),(24,'seoyeon','1234','김서연','920314',1,0,'01012345678',NULL,'tteni22@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,4,'자영업','중졸','/15775536197730.PNG','151~160cm','AB','경기도','귀여움','직관적','1억이상',NULL,'6',0,5),(25,'haeun','1234','김하은','890315',1,0,'01012345678',NULL,'tteni23@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,2,'교사','석사이상','/15775536197730.PNG','151~160cm','A','경기도','귀여움','외향적','7000이하',NULL,'6',0,1),(26,'hayun','1234','김하윤','891210',1,0,'01012345678',NULL,'tteni24@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,1,'변호사','대졸','/15775536197730.PNG','161~170cm','A','전라도','통통','자상함','5000이하',NULL,'3',0,1),(27,'chaerin','1234','김채린','881211',1,1,'01012345678',NULL,'tteni25@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,3,'의사','대졸','/15775536197730.PNG','151~160cm','A','경상도','남성스러움','외향적','7000이하',NULL,'2',0,3),(28,'jia','1234','김지아','880819',1,0,'01012345678',NULL,'tteni26@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:01:01',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'jihoon','1234','김지훈','870215',0,0,'01012345678',NULL,'tteni27@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,2,'의사','대졸','/15775536197730.PNG','161~170cm','B','서울','남성스러움','외향적','3000이하',NULL,'5',0,5),(30,'minho','1234','김민호','870415',0,0,'01012345678',NULL,'tteni28@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:06:31',0,4,'간호사','고졸','/15775536197730.PNG','181~190cm','AB','서울','마름','자상함','7000이하',NULL,'99',0,2),(31,'jisu','1234','김지수','860515',0,1,'01012345678',NULL,'tteni29@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,2,'회계사','대졸','/15775536197730.PNG','161~170cm','B','경상도','귀여움','외향적','5000이하',NULL,'1',0,4),(32,'hyunsu','1234','김현수','860505',0,0,'01012345678',NULL,'tteni30@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 03:36:33',0,3,'박사','석사이상','/15775536197730.PNG','171~180cm','B','충청도','귀여움','내향적','5000이하',NULL,'1',0,4),(33,'jinyoung','1234','김진영','860726',0,0,'01012345678',NULL,'tteni31@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:06:31',0,4,'자영업','고졸','/15775536197730.PNG','171~180cm','AB','제주도','통통','직관적','3000이하',NULL,'99',0,5),(34,'bora','1234','박보라','850908',1,0,'01012345678',NULL,'tteni32@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,2,'판사','대졸','/15775536197730.PNG','161~170cm','AB','서울','귀여움','감성적','7000이하',NULL,'7',0,2),(35,'parkjisu','1234','박지수','850724',1,0,'01012345678',NULL,'tteni33@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,1,'경찰','고졸','/15775536197730.PNG','151~160cm','AB','제주도','남성스러움','외향적','7000이하',NULL,'6',0,3),(36,'jeneey','1234','박제니','850910',1,1,'01012345678',NULL,'tteni34@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,3,'기자','중졸','/15775536197730.PNG','151~160cm','O','전라도','남성스러움','외향적','5000이하',NULL,'2',0,3),(37,'parkjiyeon','1234','박지연','840605',1,0,'01012345678',NULL,'tteni35@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 14:53:59',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'parkminju','1234','박민주','840318',1,0,'01012345678',NULL,'tteni36@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,1,'가수','중졸','/15775536197730.PNG','171~180cm','O','경기도','귀여움','감성적','1억이상',NULL,'5',0,5),(39,'jiyeong','1234','박지영','830526',1,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:17:25',0,3,'연구원','석사이상','/15775536197730.PNG','150cm이하','O','서울','귀여움','외향적','7000이하',NULL,'3',0,2),(40,'jisung','1234','윤지성','910227',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','150cm이하','A','서울','귀여움','외향적','3000이하',NULL,'3',0,3),(41,'sungwoon','1234','하성운','920227',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','151~160cm','A','서울','귀여움','외향적','3000이하',NULL,'3',0,4),(42,'jihwan','1234','강지환','890227',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','161~170cm','A','서울','귀여움','외향적','3000이하',NULL,'3',0,5),(43,'jongsuk','1234','이종석','880227',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','171~180cm','A','서울','귀여움','외향적','3000이하',NULL,'3',0,1),(44,'sungwo','1234','박성우','910227',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','181cm이상','A','서울','귀여움','외향적','3000이하',NULL,'3',0,3),(45,'jinyoung','1234','배진영','920227',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','150cm이하','B','서울','귀여움','외향적','3000이하',NULL,'3',0,5),(46,'daehwi','1234','이대휘','920224',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','150cm이하','B','서울','귀여움','외향적','3000이하',NULL,'3',0,3),(47,'minhyun','1234','황민현','890210',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','151~160cm','B','서울','귀여움','외향적','3000이하',NULL,'3',0,2),(48,'youngsu','1234','김영수','880527',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','161~170cm','B','서울','귀여움','외향적','3000이하',NULL,'3',0,5),(49,'youngho','1234','김영호','860816',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','171~180cm','B','서울','귀여움','외향적','3000이하',NULL,'3',0,1),(50,'youngsik','1234','김영식','830527',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','181cm이상','B','서울','귀여움','외향적','3000이하',NULL,'3',0,1),(51,'younggil','1234','김영길','841027',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','150cm이하','AB','서울','귀여움','외향적','3000이하',NULL,'3',0,3),(52,'youngil','1234','김영일','850927',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','151~160cm','AB','서울','귀여움','외향적','3000이하',NULL,'3',0,5),(53,'su','1234','이광수','910417',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-07 05:40:55',0,3,'연구원','석사이상','/15775536197730.PNG','161~170cm','AB','서울','귀여움','외향적','3000이하',NULL,'3',0,2),(54,'young','1234','김영철','930708',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,3,'연구원','석사이상','/15775536197730.PNG','171~180cm','AB','서울','귀여움','외향적','3000이하',NULL,'3',0,5),(55,'jungsu','1234','김정수','941001',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,3,'연구원','석사이상','/15775536197730.PNG','180cm이상','AB','서울','귀여움','외향적','3000이하',NULL,'3',0,3),(56,'parkjungsu','1234','박정수','880430',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,3,'연구원','석사이상','/15775536197730.PNG','150cm이하','O','서울','귀여움','외향적','3000이하',NULL,'3',0,2),(57,'leejungsu','1234','이정수','870101',0,0,'01012345678',NULL,'tteni37@naver.com','13467','경기 성남시 분당구 판교로 35','(운중동)','123','2020-01-06 15:07:25',0,3,'연구원','석사이상','/15775536197730.PNG','161~170cm','O','서울','귀여움','외향적','3000이하',NULL,'3',0,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-07 19:16:54
