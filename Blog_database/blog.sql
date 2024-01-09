CREATE DATABASE Blog_Database; 
USE Blog_Database;
-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(100) NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

-- Articles Table
CREATE TABLE Articles (
    article_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    image_url VARCHAR(255),
    publish_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    author_id INT,
    category_id INT,
    FOREIGN KEY (author_id) REFERENCES Users (user_id), -- Assuming author_id is a user_id
    FOREIGN KEY (category_id) REFERENCES Categories (category_id)
);

-- Comments Table
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT,
    user_id INT,
    content TEXT,
    comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (article_id) REFERENCES Articles (article_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);
