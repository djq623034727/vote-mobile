
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vote_mobi`
--

-- --------------------------------------------------------

--
-- 表的结构 `candidate`
--

CREATE TABLE IF NOT EXISTS `candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `summary` text NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(30) NOT NULL,
  `poll` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='候选人' AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `parameter`
--

CREATE TABLE IF NOT EXISTS `parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL COMMENT '投票标题',
  `total` int(11) NOT NULL COMMENT '投票总数',
  `begintime` datetime NOT NULL COMMENT '投票开始时间',
  `endtime` datetime NOT NULL COMMENT '投票结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL COMMENT '用户名',
  `realname` varchar(15) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `lastlogin` datetime DEFAULT NULL COMMENT '最后登录时间',
  `ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `state` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  KEY `uid` (`uid`,`cid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 限制导出的表
--

--
-- 限制表 `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `candidate` (`id`),
  ADD CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;