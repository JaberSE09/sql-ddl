DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE  soccer_league;

CREATE TABLE Team (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(100) UNIQUE
);

CREATE TABLE Player (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(100),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE Game (
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    match_date DATE,
    home_team_id INT,
    away_team_id INT,
    home_team_score INT,
    away_team_score INT,
    referee_id INT,
    FOREIGN KEY (home_team_id) REFERENCES Team(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Team(team_id)
);

CREATE TABLE Goal (
    goal_id INT PRIMARY KEY AUTO_INCREMENT,
    game_id INT,
    player_id INT,
    goal_time TIME,
    FOREIGN KEY (game_id) REFERENCES Game(game_id),
    FOREIGN KEY (player_id) REFERENCES Player(player_id)
);

CREATE TABLE Referee (
    referee_id INT PRIMARY KEY AUTO_INCREMENT,
    referee_name VARCHAR(100)
);

CREATE TABLE Match (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    FOREIGN KEY (home_team_id) REFERENCES Team(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Team(team_id)
);

CREATE TABLE Season (
    season_id INT PRIMARY KEY AUTO_INCREMENT,
    start_date DATE,
    end_date DATE
);
