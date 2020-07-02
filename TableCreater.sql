-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE if exists category;
create table category(
    categoryId varchar(36) NOT NULL,
    categoryName varchar(50) DEFAULT NULL,
    primary key (categoryId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*设置生成UUID的触发器*/
CREATE TRIGGER `category_before_insert` BEFORE INSERT ON `category` FOR EACH ROW
BEGIN
    IF new.categoryId is NULL THEN
        #改变UUID的格式，把UUID中的“-”去掉
        SET new.categoryId = REPLACE(UUID(),"-","");
    END IF;
END;
INSERT INTO category value ('4b8da975b5f211eabcfc00e04d367256','手机');
INSERT INTO category value ('4b9c885bb5f211eabcfc00e04d367256','笔记本电脑');
INSERT INTO category value ('3a63481db5f311eabcfc00e04d367256','平板电脑');
INSERT INTO category value ('9ad2cfe1b5f211eabcfc00e04d367256','数码配件');


-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE if exists product;
create table product(
    productId varchar(36) NOT NULL,
    productName varchar(50) NOT NULL ,
    productPrice double DEFAULT 0,
    productNum INTEGER DEFAULT 0,
    productDesc varchar(500) DEFAULT NULL,
    categoryId varchar(36) DEFAULT NULL,
    imgUrl varchar(50) DEFAULT NULL,
    primary key (productId),
    foreign key (categoryId) references category(categoryId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*设置生成UUID的触发器*/
CREATE TRIGGER `product_before_insert` BEFORE INSERT ON `product` FOR EACH ROW
BEGIN
    IF new.productId is NULL THEN
        #改变UUID的格式，把UUID中的“-”去掉
        SET new.productId = REPLACE(UUID(),"-","");
    END IF;
END;
INSERT INTO product(productId, productName, productPrice, productNum, categoryId) values ('c3b61c28b5f311eabcfc00e04d367256','iphone 11','7999.0','100','4b8da975b5f211eabcfc00e04d367256');
INSERT INTO product(productId, productName, productPrice, productNum, categoryId) values ('c3bd3daab5f311eabcfc00e04d367256','ipad mini4','3999.0','10','3a63481db5f311eabcfc00e04d367256');
INSERT INTO product(productId, productName, productPrice, productNum, categoryId) values ('c3c0cd32b5f311eabcfc00e04d367256','ipods 2','999.0','105','9ad2cfe1b5f211eabcfc00e04d367256');
INSERT INTO product(productId, productName, productPrice, productNum, categoryId) values ('c3ce79d6b5f311eabcfc00e04d367256','MacBook Air13.3','9999.0','15','4b9c885bb5f211eabcfc00e04d367256');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE if exists user;
create table user(
    userId varchar(36) NOT NULL PRIMARY KEY ,
    userName varchar(40) NOT NULL,
    `password` varchar(100) NOT NULL,
    `email` varchar(100) DEFAULT NULL,
    `role` varchar(100) NOT NULL,
    `state` bool DEFAULT 1,
    `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*设置生成UUID的触发器*/
CREATE TRIGGER `user_before_insert` BEFORE INSERT ON `user` FOR EACH ROW
BEGIN
    IF new.userId is NULL THEN
        #改变UUID的格式，把UUID中的“-”去掉
        SET new.userId = REPLACE(UUID(),"-","");
    END IF;
END;
INSERT INTO user(userId, userName, password, role) values ('41d327bab5f411eabcfc00e04d367256','小白','123456abc','admin');
INSERT INTO user(userId, userName, password, role) values ('41ec2804b5f411eabcfc00e04d367256','小黑','654321abc','customer');
INSERT INTO user(userId, userName, password, role) values ('9db8e628b5f411eabcfc00e04d367256','小花','123abc','customer');


-- ------------------------------------
-- Table structure for `shoppingCart`
-- ------------------------------------
DROP TABLE IF EXISTS shoppingCart;
create table shoppingCart(
    scId varchar(36) NOT NULL primary key ,
    userId varchar(36) NOT NULL references user(userId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*设置生成UUID的触发器*/
CREATE TRIGGER `sc_before_insert` BEFORE INSERT ON `shoppingCart` FOR EACH ROW
BEGIN
    IF new.scId is NULL THEN
        #改变UUID的格式，把UUID中的“-”去掉
        SET new.scId = REPLACE(UUID(),"-","");
    END IF;
END;
INSERT INTO shoppingCart(scId, userId) VALUES ('f2a29ab3b5f411eabcfc00e04d367256','41ec2804b5f411eabcfc00e04d367256');
INSERT INTO shoppingCart(scId, userId) VALUES ('f2b0260fb5f411eabcfc00e04d367256','9db8e628b5f411eabcfc00e04d367256');
INSERT INTO shoppingCart(scId, userId) VALUES ('f2bf2903b5f411eabcfc00e04d367256','41ec2804b5f411eabcfc00e04d367256');


-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS orders;
create table orders(
    ordersId varchar(36) NOT NULL PRIMARY KEY ,
    userId varchar(36) DEFAULT NULL ,
    createTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    scId varchar(36) DEFAULT NULL references shoppingCart(scId),
    foreign key (userId) references user(userId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*设置生成UUID的触发器*/
CREATE TRIGGER `orders_before_insert` BEFORE INSERT ON `orders` FOR EACH ROW
BEGIN
    IF new.ordersId is NULL THEN
        #改变UUID的格式，把UUID中的“-”去掉
        SET new.ordersId = REPLACE(UUID(),"-","");
    END IF;
END;
INSERT INTO orders(ordersId, userId) values ('63f3851ab5f511eabcfc00e04d367256','41ec2804b5f411eabcfc00e04d367256');
INSERT INTO orders(ordersId, userId) values ('640215ceb5f511eabcfc00e04d367256','9db8e628b5f411eabcfc00e04d367256');
INSERT INTO orders(ordersId, scId) values ('a15c9183b5f511eabcfc00e04d367256','f2a29ab3b5f411eabcfc00e04d367256');


-- ------------------------------------
-- Table structure for `orders_product`
-- ------------------------------------
DROP TABLE if exists orders_product;
create table orders_product(
    opId varchar(36) NOT NULL PRIMARY KEY ,
    productId varchar(36) NOT NULL ,
    orderId varchar(36) NOT NULL,
    productNum INTEGER DEFAULT 1,
    foreign key (productId) references product(productId),
    foreign key (orderId) references orders(ordersId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*设置生成UUID的触发器*/
CREATE TRIGGER `op_before_insert` BEFORE INSERT ON `orders_product` FOR EACH ROW
BEGIN
    IF new.opId is NULL THEN
        #改变UUID的格式，把UUID中的“-”去掉
        SET new.opId = REPLACE(UUID(),"-","");
    END IF;
END;
INSERT INTO orders_product(opId, productId, orderId) VALUES('fe94f1a9b5f611eabcfc00e04d367256','c3b61c28b5f311eabcfc00e04d367256','640215ceb5f511eabcfc00e04d367256');
INSERT INTO orders_product(opId, productId, orderId) VALUES('fe9a4324b5f611eabcfc00e04d367256','c3bd3daab5f311eabcfc00e04d367256','640215ceb5f511eabcfc00e04d367256');
INSERT INTO orders_product(opId, productId, orderId) VALUES('fea96ccdb5f611eabcfc00e04d367256','c3bd3daab5f311eabcfc00e04d367256','a15c9183b5f511eabcfc00e04d367256');


-- ------------------------------------
-- Table structure for `sc_pro`
-- ------------------------------------
DROP TABLE IF EXISTS sc_pro;
create table sc_pro(
    sc_proId varchar(36) NOT NULL PRIMARY KEY ,
    scId varchar(36) NOT NULL REFERENCES shoppingCart(scId),
    productId varchar(36) NOT NULL REFERENCES product(productId),
    productNum INTEGER DEFAULT 1
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*设置生成UUID的触发器*/
CREATE TRIGGER `sc_pro_before_insert` BEFORE INSERT ON `sc_pro` FOR EACH ROW
BEGIN
    IF new.sc_proId is NULL THEN
        #改变UUID的格式，把UUID中的“-”去掉
        SET new.sc_proId = REPLACE(UUID(),"-","");
    END IF;
END;
INSERT INTO sc_pro(sc_proId, scId, productId) VALUES ('f6b4e1f4b5f811eabcfc00e04d367256','f2a29ab3b5f411eabcfc00e04d367256','c3b61c28b5f311eabcfc00e04d367256');
INSERT INTO sc_pro(sc_proId, scId, productId) VALUES ('f6be6ef4b5f811eabcfc00e04d367256','f2a29ab3b5f411eabcfc00e04d367256','c3bd3daab5f311eabcfc00e04d367256');
INSERT INTO sc_pro(sc_proId, scId, productId) VALUES ('f6c52ed7b5f811eabcfc00e04d367256','f2b0260fb5f411eabcfc00e04d367256','c3bd3daab5f311eabcfc00e04d367256');
INSERT INTO sc_pro(sc_proId, scId, productId) VALUES ('f6c878f5b5f811eabcfc00e04d367256','f2bf2903b5f411eabcfc00e04d367256','c3c0cd32b5f311eabcfc00e04d367256');
INSERT INTO sc_pro(sc_proId, scId, productId) VALUES ('f6d6196cb5f811eabcfc00e04d367256','f2bf2903b5f411eabcfc00e04d367256','c3ce79d6b5f311eabcfc00e04d367256');