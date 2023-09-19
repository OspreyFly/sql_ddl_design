CREATE TABLE teams(
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(50) NOT NULL
);

CREATE TABLE goals(
    goal_id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players(player_id),
    match_id INT REFERENCES matches(match_id),
    goal_time INT
);

CREATE TABLE players(
    player_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    team_id INT REFERENCES teams(team_id)
);

CREATE TABLE referees(
    ref_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE matches(
    match_id SERIAL PRIMARY KEY,
    team_1_id INT REFERENCES teams(team_id),
    team_2_id INT REFERENCES teams(team_id),
    victor_id INT REFERENCES teams(team_id),
    match_date DATE NOT NULL,
    ref_id INT REFERENCES referees(ref_id)
);

CREATE TABLE seasons(
    season_id SERIAL PRIMARY KEY,
    begin_date DATE NOT NULL,
    end_date DATE NOT NULL,
    season_name VARCHAR(50)
);

CREATE TABLE standings (
    standing_id SERIAL PRIMARY KEY,
    team_id INT REFERENCES teams(team_id),
    season_id INT REFERENCES seasons(season_id),
    points INT,
    position INT
);
