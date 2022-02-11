CREATE DATABASE IF NOT EXISTS `yolo_license` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `yolo_license`;

-- Dump della struttura di tabella exilied_license.licenses
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(10) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `used` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT '',
  `total_time` int(10) NOT NULL,
  `license` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license` (`license`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;