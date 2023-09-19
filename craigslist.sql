CREATE TABLE regions(
    region_id SERIAL PRIMARY KEY,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE users(
    user.id SERIAL PRIMARY KEY,
    username VARCHAR(16) NOT NULL,
    email VARCHAR(100) NOT NULL,
    pref_region_id INT REFERENCES regions(region_id)
);

CREATE TABLE posts(
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(24) NOT NULL,
    body_text TEXT,
    user_id INT REFERENCES users(user_id),
    posted_near VARCHAR(50) NOT NULL,
    region_id INT REFERENCES regions(region.id),
    post_date TIMESTAMP DEFAULT NOW()
);

CREATE TABLE categories(
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE post_categories(
    post_id INT REFERENCES posts(post_id),
    category_id INT REFERENCES categories(category_id),
    PRIMARY KEY (post_id, category_id)
);