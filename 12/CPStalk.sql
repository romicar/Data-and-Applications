-- Hello! Here is our SQL code. 

DROP DATABASE IF EXISTS `CPStalk`;
CREATE DATABASE `CPStalk`;
USE `CPStalk`;
-- creating tables

DROP TABLE IF EXISTS `USERS`;
CREATE TABLE USERS (
  Username VARCHAR(20) NOT NULL,
  Fname VARCHAR(20) NOT NULL,
  Mname VARCHAR(20),
  Lname VARCHAR(20),
  Year_of_Grad YEAR,
  Institute VARCHAR(30),
  Profession VARCHAR(20),
  Country VARCHAR(20),
  UNIQUE (Username),
  PRIMARY KEY (Username)
);
DROP TABLE IF EXISTS `PLATFORM`;
CREATE TABLE PLATFORM (
  Platform_Name VARCHAR(20) NOT NULL,
  Total_Users INT,
  Active_Users INT,
  Launched_Year DATE,
  Headquarters VARCHAR(30),
  Founder VARCHAR(20),
  UNIQUE (Platform_Name),
  PRIMARY KEY (Platform_Name)
);
DROP TABLE IF EXISTS `TEAMS`;
CREATE TABLE TEAMS (
  Team_Id INT NOT NULL,
  Team_Name VARCHAR(50),
  Date_of_Creation DATE,
  Team_Size INT,
  PRIMARY KEY (Team_Id)
);
--
-- WEAK ENTITIES
DROP TABLE IF EXISTS `PROBLEM`;
CREATE TABLE PROBLEM (
  Problem_Id INT NOT NULL,
  PlatN VARCHAR(20) NOT NULL,
  Number_of_Solves INT,
  Total_Attempts INT,
  Problem_Rating INT,
  PRIMARY KEY (Problem_Id, PlatN),
  FOREIGN KEY (PlatN) REFERENCES PLATFORM(Platform_Name)
);
DROP TABLE IF EXISTS `CONTEST`;
CREATE TABLE CONTEST (
  Contest_Id INT NOT NULL,
  PlatN VARCHAR(20) NOT NULL,
  Start_Time DATETIME,
  Duration TIME,
  Number_of_Participants INT,
  Style VARCHAR(20),
  PRIMARY KEY (Contest_Id, PlatN),
  FOREIGN KEY (PlatN) REFERENCES PLATFORM(Platform_Name)
);
-- --------
-- --------
-- MULTIVALUED
DROP TABLE IF EXISTS `PROBLEM_AUTHOR`;
CREATE TABLE PROBLEM_AUTHOR(
  ProbKey INT NOT NULL,
  PlatName VARCHAR(20) NOT NULL,
  Prob_Author VARCHAR(15) NOT NULL,
  PRIMARY KEY (ProbKey, Prob_Author),
  FOREIGN KEY (ProbKey) REFERENCES PROBLEM(Problem_Id),
  FOREIGN KEY (PlatName) REFERENCES PLATFORM(Platform_Name)
);
DROP TABLE IF EXISTS `PROBLEM_TAGS`;
CREATE TABLE PROBLEM_TAGS(
  ProbId INT NOT NULL,
  PlatName VARCHAR(20) NOT NULL,
  Prob_Tags VARCHAR(50) NOT NULL,
  PRIMARY KEY (ProbId, Prob_Tags, PlatName),
  FOREIGN KEY (ProbID) REFERENCES PROBLEM(Problem_Id),
  FOREIGN KEY (PlatName) REFERENCES PLATFORM(Platform_Name)
);
DROP TABLE IF EXISTS `PLATFORM_LANGUAGES`;
CREATE TABLE PLATFORM_LANGUAGES (
  PlatName VARCHAR(20) NOT NULL,
  Plat_Languages VARCHAR(15) NOT NULL,
  PRIMARY KEY (PlatName, Plat_Languages),
  FOREIGN KEY (PlatName) REFERENCES PLATFORM(Platform_Name)
);
-- 
DROP TABLE IF EXISTS `TEAM_REGISTER_ON`;
CREATE TABLE TEAM_REGISTER_ON (
  Pname VARCHAR(50) NOT NULL,
  TeamKey INT NOT NULL,
  TeamName VARCHAR(50),
  Team_Rating INT,
  Rank_ INT,
  PRIMARY KEY (Pname, TeamKey),
  FOREIGN KEY (Pname) REFERENCES PLATFORM(Platform_Name),
  FOREIGN KEY (TeamKey) REFERENCES TEAMS(Team_Id) ON DELETE CASCADE
);
DROP TABLE IF EXISTS `TEAM_USERS`;
CREATE TABLE TEAM_USERS (
  TeamKey INT NOT NULL,
  UName VARCHAR(20),
  PRIMARY KEY (TeamKey, UName),
  FOREIGN KEY (TeamKey) REFERENCES TEAMS(Team_Id) ON DELETE CASCADE,
  FOREIGN KEY (UName) REFERENCES USERS(UserName) ON DELETE CASCADE
);
DROP TABLE IF EXISTS `PRAC1`;
CREATE TABLE PRAC1 (
  PlatName VARCHAR(20) NOT NULL,
  Submission_Id INT NOT NULL,
  ProbId INT,
  Verdict VARCHAR(10),
  Time_of_Submission DATETIME,
  Language_ VARCHAR(15),
  Execution_Time INT,
  Memory_Used INT,
  PRIMARY KEY (PlatName, Submission_Id),
  FOREIGN KEY (PlatName) REFERENCES PLATFORM(Platform_Name),
  FOREIGN KEY (ProbId) REFERENCES PROBLEM(Problem_Id)
);
DROP TABLE IF EXISTS `PRAC2`;
CREATE TABLE PRAC2 (
  Uname VARCHAR(20) NOT NULL,
  PlatName VARCHAR(20) NOT NULL,
  Submission_Id INT NOT NULL,
  PRIMARY KEY (Uname, PlatName, Submission_Id),
  FOREIGN KEY (Uname) REFERENCES USERS(Username) ON DELETE CASCADE,
  FOREIGN KEY (PlatName) REFERENCES PLATFORM(Platform_Name)
);
DROP TABLE IF EXISTS `PRAC3`;
CREATE TABLE PRAC3 (
  PlatName VARCHAR(20) NOT NULL,
  ProbId INT NOT NULL,
  Time_Limit INT,
  Memory_Limit INT,
  PRIMARY KEY (PlatName, ProbId),
  FOREIGN KEY (PlatName) REFERENCES PLATFORM(Platform_Name),
  FOREIGN KEY (ProbId) REFERENCES PROBLEM(Problem_Id)
);
DROP TABLE IF EXISTS `USER_REGISTER_ON`;
CREATE TABLE USER_REGISTER_ON (
  Pname VARCHAR(20) NOT NULL,
  Uname VARCHAR(20) NOT NULL,
  PlatformUserName VARCHAR(15),
  Rating INT,
  Rank_ INT,
  PRIMARY KEY (Pname, Uname),
  FOREIGN KEY (Pname) REFERENCES PLATFORM(Platform_Name),
  FOREIGN KEY (Uname) REFERENCES USERS(Username) ON DELETE CASCADE
);
DROP TABLE IF EXISTS `FRIENDS`;
CREATE TABLE FRIENDS (
  Friend1_name VARCHAR(20) NOT NULL,
  Friend2_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (Friend1_name, Friend2_name),
  FOREIGN KEY (Friend1_name) REFERENCES USERS(Username) ON DELETE CASCADE,
  FOREIGN KEY (Friend2_name) REFERENCES USERS(Username) ON DELETE CASCADE
);
-- ----------------------------------
DROP TABLE IF EXISTS `ATTEMPTS_1`;
CREATE TABLE ATTEMPTS_1 (
  PlatName VARCHAR(20) NOT NULL,
  SubmissionId INT NOT NULL,
  ContestId INT,
  ProbId INT,
  Verdict VARCHAR(10),
  Time_of_Submission DATETIME,
  Memory_Used INT,
  Language_ VARCHAR(15),
  Execution_Time INT,
  PRIMARY KEY (PlatName, SubmissionId),
  FOREIGN KEY (PlatName) REFERENCES PLATFORM(Platform_Name),
  FOREIGN KEY (ContestId) REFERENCES CONTEST(Contest_Id),
  FOREIGN KEY (ProbId) REFERENCES PROBLEM(Problem_Id)
);
DROP TABLE IF EXISTS `ATTEMPTS_2`;
CREATE TABLE ATTEMPTS_2 (
  PlatName VARCHAR(20) NOT NULL,
  ProbId INT NOT NULL,
  ContestId INT,
  Time_Limit INT,
  Memory_Limit INT,
  PRIMARY KEY (PlatName, ProbId),
  FOREIGN KEY (PlatName) REFERENCES PLATFORM(Platform_Name),
  FOREIGN KEY (ProbId) REFERENCES PROBLEM(Problem_Id)
);
DROP TABLE IF EXISTS `ATTEMPTS_3`;
CREATE TABLE ATTEMPTS_3 (
  Uname VARCHAR(20) NOT NULL,
  TeamId INT NOT NULL,
  PlatName VARCHAR(20) NOT NULL,
  SubmissionId INT NOT NULL,
  -- PRIMARY KEY (Uname, TeamId, PlatName, SubmissionId),
  PRIMARY KEY (PlatName, SubmissionId),
  FOREIGN KEY (Uname) REFERENCES USERS(Username) ON DELETE CASCADE,
  FOREIGN KEY (PlatName) REFERENCES PLATFORM(Platform_Name),
  FOREIGN KEY (TeamId) REFERENCES TEAMS(Team_Id) ON DELETE CASCADE
);
-- Inserting values into the tables

INSERT INTO USERS
VALUES (
    'tourist',
    'Grennady',
    'N',
    'Korotkevich',
    1995,
    'ITMO University',
    'Student',
    'Belarus'
  ),
  (
    'jiangly',
    'Jinag',
    'M',
    'Lingyu',
    1998,
    'Beijing National University',
    'Microsoft',
    'China'
  ),
  (
    'baba',
    'Tanuj',
    'C',
    'Khattar',
    2017,
    'IIIT Hyderabad',
    'Google',
    'India'
  ),
  (
    'akcube',
    'Kishore',
    'T',
    'Kumar',
    2024,
    'IIIT Hyderabad',
    'Student',
    'India'
  ),
  (
    'BenQ',
    'Benjamin',
    'L',
    'Qi',
    2023,
    'MIT',
    'Student',
    'Tesla'
  ),
  (
    'SecondThread',
    'Erin',
    'N',
    'Chancer',
    2017,
    'ITMO University',
    'Google',
    'USA'
  ),
  (
    'codelegend',
    'Anurudh',
    'N',
    'Peduri',
    2020,
    'Ruhr University',
    'Student',
    'India'
  ),
  (
    'kal013',
    'Kalash',
    'S',
    'Gupta',
    2022,
    'IIT Delhi',
    'Student',
    'India'
  );
INSERT INTO PLATFORM -- Name, Total users, active users, launched year, Headquarters, founder
VALUES (
    'Codeforces',
    '600000',
    '134178',
    '2009-04-10',
    'ITMO University',
    'Mikhail Mirzayanov'
  ),
  (
    'Codechef',
    '544635',
    '239970',
    '2009-09-02',
    '	Bangalore, India',
    'Bhavin Turakhia'
  ),
  (
    'SPOJ',
    '1007749',
    NULL,
    '2004-09-09',
    'Gdynia, Pomorskie, Poland',
    'Sphere Research Labs'
  ),
  (
    'AtCoder',
    '50966',
    '33524',
    '2012-04-06',
    'Tokyo, Japan',
    'Naohiro Takahashi'
  ),
  (
    'TopCoder',
    '1740525',
    NULL,
    '2001-04-01',
    'Indianapolis, USA',
    'Jack Hughes'
  );
INSERT INTO TEAMS
VALUES ('1', 'Travelling Salesman', '2015-06-20', 3),
  ('2', 'The_P_is_Hard', '2022-06-15', 3),
  ('3', 'ladaiLadai', '2019-02-28', 4);
INSERT INTO PROBLEM
VALUES (1, 'Codeforces', 25, 56, 1700),
  (2, 'Codeforces', 152, 230, 1200),
  (3, 'Codeforces', 43, 526, 1400),
  (4, 'Codeforces', 2125, 2600, 800),
  (5, 'Codeforces', 18, 50, 2000),
  (1, 'Codechef', 32, 44, 2200),
  (2, 'Codechef', 22, 34, 1300),
  (3, 'Codechef', 256, 546, 1400),
  (4, 'Codechef', 256, 536, 1900),
  (1, 'SPOJ', 125, 156, 2600),
  (2, 'SPOJ', 235, 526, 2800),
  (3, 'SPOJ', 654, 5200, 1800),
  (4, 'SPOJ', 100, 206, 1700),
  (5, 'SPOJ', 34, 990, 1500),
  (6, 'SPOJ', 56, 57, 2100),
  (1, 'AtCoder', 125, 129, 1100),
  (2, 'AtCoder', 235, 256, 900),
  (3, 'AtCoder', 45, 543, 2400),
  (4, 'AtCoder', 243, 554, 2400),
  (1, 'TopCoder', 324, 744, 3000),
  (2, 'TopCoder', 239, 543, 1300),
  (3, 'TopCoder', 2762, 5624, 1400),
  (4, 'TopCoder', 3244, 4446, 800),
  (5, 'TopCoder', 215, 516, 1500);
INSERT INTO CONTEST
VALUES (
    1,
    'Codeforces',
    '2021-05-10 20:05:00',
    '05:00:00',
    10075,
    'ICPC'
  ),
  (
    2,
    'Codeforces',
    '2021-07-10 20:05:00',
    '02:30:00',
    6508,
    'Practice'
  ),
  (
    3,
    'Codeforces',
    '2022-01-01 20:05:00',
    '05:00:00',
    15038,
    'Team'
  ),
  (
    4,
    'Codeforces',
    '2022-05-10 20:05:00',
    '02:30:00',
    7415,
    'ioi'
  ),
  (
    1,
    'CodeChef',
    '2020-10-10 18:05:00',
    '03:00:00',
    12082,
    'Team'
  ),
  (
    2,
    'CodeChef',
    '2020-12-10 17:05:00',
    '05:00:00',
    13074,
    'ICPC'
  ),
  (
    3,
    'CodeChef',
    '2021-01-10 14:30:00',
    '02:30:00',
    10005,
    'Practice'
  ),
  (
    1,
    'AtCoder',
    '2022-07-05 20:05:00',
    '02:30:00',
    18745,
    'Team'
  ),
  (
    2,
    'AtCoder',
    '2022-10-06 18:05:00',
    '05:00:00',
    17015,
    'ICPC'
  ),
  (
    1,
    'TopCoder',
    '2022-11-11 17:00:00',
    '03:0:00',
    11214,
    'Practice'
  );
INSERT INTO TEAM_REGISTER_ON -- Platform name, Teamkey, Team Name, Team Rating, Rank
VALUES ('Codeforces', 1, 'Travelling Salesman',3704,1),
  ('Codechef', 1, 'Travelling Salesman',3118,1),
  ('Codeforces', 2, 'The_P_is_Hard',3036,2),
  ('Codeforces', 3, 'ladaiLadai',2180,3),
  ('Codechef', 3, 'ladaiLadai',2251,2);
INSERT INTO TEAM_USERS -- Teamkey, User Name
VALUES (1,"tourist"),
       (1,"jiangly"),
       (2,"SecondThread"),
       (2,"BenQ"),
       (3,"baba"),
       (3,"codelegend"),
       (3,"akcube");

INSERT INTO PRAC1
VALUES (
    'Codeforces',
    1,
    1,
    'AC',
    '2020-10-5 18:32:53',
    'C++',
    280,
    14000
  ),
  (
    'Codechef',
    1,
    1,
    'TLE',
    '2021-2-5 17:32:43',
    'Python',
    2000,
    128000
  ),
  (
    'Codeforces',
    2,
    2,
    'MLE',
    '2021-3-12 11:23:53',
    'Haskell',
    30,
    256000
  ),
  (
    'AtCoder',
    1,
    1,
    'RTE',
    '2019-9-15 08:52:53',
    'C++',
    15,
    1200
  ),
  (
    'Codeforces',
    3,
    1,
    'AC',
    '2020-6-6 23:53:00',
    'Python',
    30,
    8000
  ),
  (
    'TopCoder',
    1,
    1,
    'AC',
    '2022-3-2 1:43:10',
    'C++',
    120,
    7200
  );
INSERT INTO PRAC2
VALUES ('tourist', 'Codeforces', 1),
  ('kal013', 'Codechef', 1),
  ('codelegend', 'Codeforces', 2),
  ('akcube', 'AtCoder', 1),
  ('jiangly', 'Codeforces', 3),
  ('tourist', 'TopCoder', 1);
INSERT INTO PRAC3
VALUES ('Codeforces', 1, 2000, 256000),
  ('Codechef', 1, 2000, 256000),
  ('Codeforces', 2, 1000, 256000),
  ('Atcoder', 1, 1000, 512000),
  ('Codeforces', 3, 3000, 256000),
  ('TopCoder', 1, 1000, 512000);
INSERT INTO FRIENDS
VALUES ('tourist', 'jiangly'),
  ('akcube', 'jiangly'),
  ('akcube', 'tourist'),
  ('SecondThread', 'akcube'),
  ('akcube', 'kal013'),
  ('kal013', 'tourist'),
  ('jiangly', 'SecondThread'),
  ('SecondThread', 'codelegend'),
  ('codelegend', 'tourist'),
  ('codelegend', 'jiangly');
INSERT INTO USER_REGISTER_ON -- Platform name, Teamkey, Platform User Name, Rating, Rank
VALUES ('Codeforces', 'tourist','tourist', '3817', 1),
  ('Codechef', 'tourist','tourist', '4092', 1),
  ('AtCoder', 'tourist','tourist', '3976', 1),
  ('Codeforces', 'jiangly','jiangly', '3591', 2),
  ('Codechef', 'jiangly','jiangly', '2143',5),
  ('Codeforces', 'baba','Baba', '2435', 6),
  ('Codechef', 'baba','tanuj_khattar', '2314',4),
  ('Codeforces', 'akcube','akcube', '1725', 8),
  ('Codechef', 'akcube','akcube', '2123', 7),
  ('Codeforces', 'BenQ','BenQ', '3584', 3),
  ('AtCoder', 'BenQ','BenQ', '3658', 2),
  ('Codeforces', 'SecondThread','SecondThread', '2488', 5),
  ('Codechef', 'SecondThread','SecondThread', '2127',6),
  ('Codeforces', 'codelegend','codelegend', '2380', 7),
  ('Codechef', 'codelegend','codelegend', '2317',3),
  ('Codeforces', 'kal013','kal013', '2753', 4),
  ('Codechef', 'kal013','kal013', '2737', 2);
INSERT INTO PROBLEM_AUTHOR
VALUES (1, 'Codeforces', 'amurto'),
  (1, 'Codeforces', 'satyam_343'),
  (2, 'Codeforces', 'SlavicG'),
  (2, 'Codeforces', 'flamestorm'),
  (2, 'Codeforces', 'mesanu'),
  (1, 'CodeChef', 'Gheal'),
  (3, 'CodeChef', 'Aris'),
  (1, 'AtCoder', 'Gol_D'),
  (5, 'SPOJ', 'antontrygubO_o');
INSERT INTO PROBLEM_TAGS
VALUES (1, 'Codeforces', 'binary_search'),
  (1, 'Codeforces', 'bitmasks'),
  (2, 'Codeforces', 'brute_force'),
  (2, 'Codeforces', 'dp'),
  (2, 'Codeforces', 'constructive_algorithms'),
  (1, 'CodeChef', 'dsu'),
  (2, 'CodeChef', 'flows'),
  (5, 'AtCoder', 'geometry'),
  (3, 'SPOJ', 'trees'),
  (3, 'TopCoder', 'two_pointers');
INSERT INTO PLATFORM_LANGUAGES
VALUES ('Codeforces', 'English'),
  ('Codeforces', 'Russian'),
  ('Codeforces', 'Spanish'),
  ('CodeChef', 'English'),
  ('CodeChef', 'Russian'),
  ('AtCoder', 'English'),
  ('AtCoder', 'Russian'),
  ('SPOJ', 'English'),
  ('TopCoder', 'English');
INSERT INTO ATTEMPTS_1 -- PlatName, SubmissionID, ContestID, ProblemID, Verdict, TimeofSubm, MemUsed, Lang, ExecTime
VALUES (
    'Codeforces',
    4,
    1,
    1,
    'AC',
    '2021-05-10 20:10:00',
    14000,
    'C++',
    280
  ),
  (
    'Codechef',
    2,
    1,
    1,
    'AC',
    '2020-10-10 18:09:00',
    17000,
    'C++',
    300
  ),
  (
    'Codeforces',
    5,
    2,
    3,
    'WA',
    '2021-07-10 20:11:00',
    19000,
    'C++',
    170
  ),
  (
    'AtCoder',
    2,
    1,
    1,
    'WA',
    '2022-07-05 20:07:00',
    22000,
    'C++',
    130
  );
INSERT INTO ATTEMPTS_2 -- PlatformName, ProblemID, ContestID, Time Limit, Memory Limit
VALUES ('Codeforces', 1, 1, 56, 1700),
  ('Codechef', 1, 1, 44, 2200),
  ('Codeforces', 2, 1, 526, 1400),
  ('AtCoder', 1, 1, 129, 1100);
INSERT INTO ATTEMPTS_3 -- UserName, TeamID, PlatformName, SubmissionID
VALUES ('tourist', 1, 'Codeforces', 4),
  ('tourist', 1, 'Codechef', 2),
  ('codelegend', 2, 'Codeforces', 5),
  ('jiangly', 1, 'AtCoder', 2);