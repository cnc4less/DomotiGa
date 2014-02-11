
--
-- Downgrade from InnoDB to MyISAM
--
ALTER TABLE device_values ENGINE=MyISAM;
ALTER TABLE device_values_log ENGINE=MyISAM;

--
-- Table structure for table `settings_velbus`
--
DROP TABLE IF EXISTS `settings_velbus`;
CREATE TABLE `settings_velbus` (
  `id` int(11) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `serialport` varchar(32) DEFAULT NULL,
  `tcphost` varchar(32) DEFAULT NULL,
  `tcpport` int(11) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `relayenabled` tinyint(1) DEFAULT NULL,
  `relayport` int(11) DEFAULT NULL,
  `debug` tinyint(1) DEFAULT NULL,
  `baudrate` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings_velbus`
--
LOCK TABLES `settings_velbus` WRITE;
INSERT INTO `settings_velbus` VALUES (0,0,'/dev/ttyACM0','192.168.1.1',1080,'tcp',0,50000,0,'38400'),(1,0,'/dev/ttyACM0','192.168.1.1',1080,'serial',0,50000,0,'38400');
UNLOCK TABLES;

--
-- Table structure for table `settings_viera`
--
DROP TABLE IF EXISTS `settings_viera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_viera` (
  `id` int(11) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `tcphost` varchar(32) DEFAULT NULL,
  `tcpport` int(11) DEFAULT NULL,
  `refresh` int(11) DEFAULT NULL,
  `debug` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings_viera`
--
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `settings_viera` WRITE;
/*!40000 ALTER TABLE `settings_viera` DISABLE KEYS */;
INSERT INTO `settings_viera` VALUES (0,0,'127.0.0.1',55000,30,0),(1,0,'127.0.0.1',55000,30,0);
/*!40000 ALTER TABLE `settings_viera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Add Velbus interface
--
INSERT INTO interfaces VALUES (53,'Velbus Interface','Velbus','Read Write');

--
-- Add Viera interface
--
LOCK TABLES `interfaces` WRITE;
/*!40000 ALTER TABLE `interfaces` DISABLE KEYS */;
INSERT INTO `interfaces` VALUES (54,'Viera Interface', 'Viera','Read Write');
/*!40000 ALTER TABLE `interfaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Add Velbus devicetypes
--
LOCK TABLES `devicetypes` WRITE;
/*!40000 ALTER TABLE `devicetypes` DISABLE KEYS */;
INSERT INTO devicetypes VALUES (334,'VMB4RY','Velbus - 4 channel relay module','Velbus','10|2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(335,'VMB4DC','Velbus - 4 channel dimmer module','Velbus','11|2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(336,'VMB7IN','Velbus - 7 channel input','Velbus','12|2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(337,'VMBGPO','Velbus - OLED touch panel','Velbus','13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(338,'VMBDME','Velbus - Dimmer module','Velbus','14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

--
-- New devicetypes for RFXtrx plugin
--
INSERT INTO devicetypes VALUES (340,'Alecto SA-30','Smoke Detector','SA30','C9F300','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (341,'Byron SX Doorbell','Doorbell','ByronSX','00F4','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (342,'Byron SX PIR','PIR','ByronSX','00F4','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (343,'Byron SX Door/Window','Door/Window Sensor','ByronSX','00F4','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (344,'Energenie ENER010','Quad Power Socket','Energenie','A01','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO devicetypes VALUES (345,'Livolo Touch Dimmer','Dimmer Module','Livolo','010203 or 0x010203','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (346,'Livolo Touch Switch 1Gang','Appliance Module 1Gang','Livolo','010203 or 0x010203','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (347,'Livolo Touch Switch 3Gang','Appliance Module 3Gang','Livolo','010203 or 0x010203','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (348,'RGB Module','Applicance Module','TRC02','010203 or 0x010203','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (349,'MDRemote LED Dimmer','Dimmer Module','MDREMOTE','010203 or 0x010203','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (350,'Conrad RSL Dimmer','Dimmer Module','RSL','010203 or 0x010203','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (351,'Conrad RSL Appl Module','Applicance Module','RSL','010203 or 0x010203','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (352,'Conrad RSL Switch','Switch Module','RSL','010203 or 0x010203','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (353,'RUBiCSON/IW008T/TX95','Temp/Hygro Sensor','Rubicson','th10 0x123','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (354,'EW109','Temp/Hygro Sensor','Rubicson','th11 0x123','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO devicetypes VALUES (355,'Siemens SF01 Fan','Fan','SF01','0x001234','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UPDATE interfaces SET type = 'X10 X10Security Oregon KAKU RFXCom AC HEUK ATI Digimax Mertik Ninja Flamingo Waveman HEEU ARC HE105 Koppla RTS10 Harrison Anslut Impuls AB400 EMW200 LightwaveRF TFA LaCrosse UPM Cresta Viking Rubicson RisingSun PhilipsSBC EMW100 BBSB Blyss RollerTrol HastaNew HastaOld A-OKRF01 A-OKAC114 Meiantech ByronSX SA30 X10SecDW X10SecMotion X10SecRemote PowerCodeDW PowerCodeMotion PowerCodeAux CodeSecure Energenie Livolo RSL TRC02 MDRemote SF01' WHERE id=35;

UPDATE interfaces SET type = 'X10 X10Security Oregon KAKU RFXCom HEUK ATI Digimax ARC AC HEEU X10SecDW X10SecMotion X10SecRemote' WHERE id=1;
UPDATE interfaces SET type = 'X10 X10Security Oregon KAKU RFXCom AC HEUK ATI Digimax Mertik Ninja Flamingo Waveman HEEU ARC HE105 Koppla RTS10 Harrison RFXLanIO X10SecDW X10SecMotion X10SecRemote' WHERE id=33;

--
-- Split X10Security up into different types for RFXTrx transmit
--
UPDATE devicetypes SET type = 'X10SecDW' WHERE id=1;
UPDATE devicetypes SET type = 'X10SecDW' WHERE id=67;
UPDATE devicetypes SET type = 'X10SecDW' WHERE id=68;
UPDATE devicetypes SET type = 'X10SecDW' WHERE id=105;

UPDATE devicetypes SET type = 'X10SecMotion' WHERE id=69;
UPDATE devicetypes SET type = 'X10SecMotion' WHERE id=111;
UPDATE devicetypes SET type = 'X10SecMotion' WHERE id=176;
UPDATE devicetypes SET type = 'X10SecMotion' WHERE id=179;

UPDATE devicetypes SET type = 'X10SecRemote' WHERE id=70;
UPDATE devicetypes SET type = 'X10SecRemote' WHERE id=71;
UPDATE devicetypes SET type = 'X10SecRemote' WHERE id=103;
UPDATE devicetypes SET type = 'X10SecRemote' WHERE id=104;
UPDATE devicetypes SET type = 'X10SecRemote' WHERE id=178;
UPDATE devicetypes SET type = 'X10SecRemote' WHERE id=220;

UPDATE devicetypes SET type = 'KD101' WHERE id=174;
UPDATE devicetypes SET name = 'Chacon Avidsen NEXA Flamingo' WHERE id=174;
UPDATE devicetypes SET description = 'Smoke Detector' WHERE id=293;

--
-- Add Viera devicetype
--
INSERT INTO `devicetypes` VALUES (339,'Viera','Viera TV Plugin','Viera','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `devicetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Finally update to 1.0.015
--
LOCK TABLES version WRITE;
INSERT INTO version VALUES (60,'1.0.015');
UNLOCK TABLES;

