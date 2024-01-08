CREATE DATABASE chess_tournament;
USE chess_tournament;

-- Table: players
CREATE TABLE players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    rating INT,
    birth_date DATE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: tournaments
CREATE TABLE tournaments (
    tournament_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    start_date DATETIME,
    end_date DATETIME,
    location VARCHAR(255),
    description TEXT,
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES players(player_id)
);

-- Table: games
CREATE TABLE games (
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    tournament_id INT,
    round_number INT,
    start_time DATETIME,
    end_time DATETIME,
    result ENUM('win_player1', 'win_player2', 'draw') NOT NULL,
    pgn TEXT,
    recorded_by INT,
    FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id),
    FOREIGN KEY (recorded_by) REFERENCES players(player_id)
);

-- Table: participants
CREATE TABLE participants (
    participant_id INT PRIMARY KEY AUTO_INCREMENT,
    tournament_id INT,
    player_id INT,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);
