-- Q1
CREATE TABLE departments (
department_id INT unsigned AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT  CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Q2
ALTER TABLE people ADD department_id INT unsigned AFTER email;

-- Q3
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
VALUES
('今井輝希', 'Imai@gizumo.jp', 11, 23, 1),
('長谷川泰治', 'Hasegawa@gizumo.jp', 11, 31, 1),
('高宮百花', 'Tkamiya@gizumo.jp', 11, 48, 2),
('清元千聖', 'Kiyomoto@gizumo.jp', 12, 27, 2),
('弘瀬みほ', 'Hirose@gizumo.jp', 12, 33, 2),
('矢田信夫', 'Yata@gizumo.jp', 12, 45, 1),
('櫻井淳', 'Sakurai@gizumo.jp', 12, 25, 1),
('石田昌樹', 'Isida@gizumo.jp', 13, 35, 1),
('池田もえ','Ikeda@gizumo.jp', 14, 43, 2),
('有森みちる', 'Arimori@gizumo.jp', 15, 29, 2);

INSERT INTO reports (person_id, content)
VALUES
(7, 'ああああああああああ'),
(8, 'いいいいいいいいいい'),
(9, 'うううううううううう'),
(10, 'ええええええええええ'),
(11, 'おおおおおおおおおお'),
(12, 'かかかかかかかかかか'),
(13, 'きききききききききき'),
(14, 'くくくくくくくくくく'),
(15, 'けけけけけけけけけけ'),
(16, 'ここここここここここ');
-- Q4

SELECT * FROM people WHERE department_id IS NULL;

UPDATE people SET department_id = 11 WHERE department_id IS NULL;

-- Q5
SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6

SELECTを使って指定したnameとemailとageのカラムをpeopleのテーブルから
WHEREでdepartment_idに１が入っているデータを作った時間の昇順で取得する。

-- Q７


SELECT name FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2 OR age BETWEEN 40 AND 49 AND gender = 1;

SELECT name FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2;
SELECT name FROM people WHERE age BETWEEN 40 AND 49 AND gender = 1;

-- Q8

SELECT * FROM people WHERE department_id = 11 ORDER BY age ASC;

-- Q9

SELECT AVG(age) AS average_age FROM people WHERE department_id = 11 AND gender = 1 GROUP BY gender;

-- 10

SELECT people.name, departments.name, reports.content FROM people INNER JOIN departments ON people.department_id = departments.department_id INNER JOIN reports ON  people.person_id = reports.person_id;

SELECT p.name, d.name, r.content FROM people p JOIN departments  d USING (department_id) JOIN reports r USING (person_id);

-- Q11

SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id) WHERE r.content IS NULL;