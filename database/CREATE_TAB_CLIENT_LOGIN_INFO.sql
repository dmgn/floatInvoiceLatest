CREATE TABLE `CLIENT_LOGIN_INFO` (
`USER_ID` int(11) NOT NULL AUTO_INCREMENT,
`EMAIL` varchar(45) NOT NULL,
`PASSWORD` varchar(45) NOT NULL,
`INSERT_DT` datetime NOT NULL,
`REGISTRATION_STATUS` int NOT NULL,
PRIMARY KEY (`USER_ID`)
);