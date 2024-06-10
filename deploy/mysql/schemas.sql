USE test;

CREATE TABLE IF NOT EXISTS test.user (
  id VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
  email VARCHAR(32) NOT NULL,
  password VARCHAR(20) NOT NULL,
  first_name VARCHAR(16) NOT NULL,
  last_name VARCHAR(16) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS test.genre (
  name VARCHAR(32) PRIMARY KEY NOT NULL
);

CREATE TABLE IF NOT EXISTS test.video (
  id VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
  title VARCHAR(30) NOT NULL,
  summary TEXT,
  genre VARCHAR(32),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (genre) REFERENCES test.genre(name)
);

CREATE TABLE IF NOT EXISTS test.review (
  video_id VARCHAR(36) NOT NULL,
  user_id VARCHAR(36) NOT NULL,
  rate FLOAT NOT NULL,
  content TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (video_id, user_id),
  FOREIGN KEY (video_id) REFERENCES test.video(id),
  FOREIGN KEY (user_id) REFERENCES test.user(id)
);

CREATE TABLE IF NOT EXISTS test.preference (
  user_id VARCHAR(36) NOT NULL,
  video_id VARCHAR(36) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (video_id, user_id),
  FOREIGN KEY(user_id) REFERENCES test.user(id),
  FOREIGN KEY(video_id) REFERENCES test.video(id)
);
