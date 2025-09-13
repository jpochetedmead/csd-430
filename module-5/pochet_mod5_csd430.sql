-- Name: Julio Pochet
-- Date: 10/07/2025
-- Assignment: Module 5 – CRUD READ Setup (CSD430)
-- Purpose: Create database CSD430, table julio_movies_data, and seed 10 records.

CREATE DATABASE IF NOT EXISTS CSD430 DEFAULT CHARACTER SET utf8mb4;
CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';
FLUSH PRIVILEGES;

USE CSD430;

DROP TABLE IF EXISTS julio_movies_data;
CREATE TABLE julio_movies_data (
  movie_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(120) NOT NULL,
  genre VARCHAR(60) NOT NULL,
  release_year INT NOT NULL,
  rating DECIMAL(2,1) NOT NULL,
  director VARCHAR(120) NOT NULL
);

INSERT INTO julio_movies_data (title, genre, release_year, rating, director) VALUES
('Inception','Sci-Fi',2010,8.8,'Christopher Nolan'),
('The Dark Knight','Action',2008,9.0,'Christopher Nolan'),
('Interstellar','Sci-Fi',2014,8.6,'Christopher Nolan'),
('The Matrix','Sci-Fi',1999,8.7,'Lana & Lilly Wachowski'),
('Gladiator','Drama',2000,8.5,'Ridley Scott'),
('The Social Network','Drama',2010,7.8,'David Fincher'),
('Parasite','Thriller',2019,8.5,'Bong Joon-ho'),
('Whiplash','Drama',2014,8.5,'Damien Chazelle'),
('Coco','Animation',2017,8.4,'Lee Unkrich'),
('Dune','Sci-Fi',2021,8.0,'Denis Villeneuve');

-- Screenshots for Module 5:
-- 1) SHOW DATABASES;
-- 2) USE CSD430;
-- 3) DESCRIBE julio_movies_data;
-- 4) SELECT * FROM julio_movies_data;