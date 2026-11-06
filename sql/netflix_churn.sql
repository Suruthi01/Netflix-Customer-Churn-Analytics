CREATE DATABASE reviews CHARACTER SET utf8mb4;
USE reviews;

CREATE TABLE products (
  product_id   VARCHAR(20) PRIMARY KEY,
  brand        VARCHAR(50),
  product_name VARCHAR(200),
  category     VARCHAR(50)
);

CREATE TABLE reviews (
  review_id    VARCHAR(30) PRIMARY KEY,
  product_id   VARCHAR(20),
  rating       TINYINT,
  review_text  TEXT,
  review_date  DATE,
  verified     BOOLEAN,
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE review_aspects (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  review_id VARCHAR(30),
  aspect    VARCHAR(30),
  sentiment VARCHAR(10),
  evidence  TEXT,
  FOREIGN KEY (review_id) REFERENCES reviews(review_id)
);

CREATE TABLE rag_eval_log (
  query_id      INT AUTO_INCREMENT PRIMARY KEY,
  question      TEXT,
  retrieved_ids TEXT,
  answer        TEXT,
  hit           BOOLEAN,
  faithful      BOOLEAN,
  latency_ms    INT
);