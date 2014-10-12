DROP DATABASE msgSystem;
CREATE DATABASE msgSystem;
USE msgSystem;
DROP TABLE user;
CREATE TABLE user (
	id int not null auto_increment,
	username char(10),
	realname char(10),
	password char(11),
	primary key (id)
);
DROP TABLE msg;
CREATE TABLE msg (
	id int not null auto_increment,
	userid int not null,
	realname char(10),
	content char(140),
	primary key (id)
);

INSERT INTO user (username,realname,password) VALUES ('lu','陆卫忠','lu');
INSERT INTO user (username,realname,password) VALUES ('xie','谢静','xie');
INSERT INTO msg (userid,realname,content) VALUES (1,'陆卫忠','嗯嗯...不错！');
INSERT INTO msg (userid,realname,content) VALUES (2,'谢静','好想穿越。。。。。。最近太迷古言了。。。。。。想去看真正的历史。。。。。');
INSERT INTO msg (userid,realname,content) VALUES (2,'谢静','上课遇奇葩了 涂着大红色艳俗艳俗的唇彩 脸上厚厚一层粉 怎么说你都多上两年学 怎么每节课还要抄我笔记啊啊啊');