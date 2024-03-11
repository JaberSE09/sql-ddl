DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE  craigslist;


CREATE TABLE Region (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(100) UNIQUE
);

CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE,
    preferred_region_id INT,
    FOREIGN KEY (preferred_region_id) REFERENCES Region(region_id)
);

CREATE TABLE Post (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    text TEXT,
    user_id INT,
    location VARCHAR(255),
    region_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) UNIQUE
);

CREATE TABLE Post_Category (
    post_id INT,
    category_id INT,
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
