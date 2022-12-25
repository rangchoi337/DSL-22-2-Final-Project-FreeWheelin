-- 고3 학생만 추리기 
DROP TABLE IF EXISTS highschool_senior;

CREATE TABLE highschool_senior(
	student_id VARCHAR(20),
	worksheet_problem_id INT,
	result VARCHAR(20),
	update_datetime DATETIME
	);


INSERT INTO highschool_senior
SELECT b.student_id, a.worksheet_problem_id, a.result, a.update_datetime
	   FROM student_worksheet_scoring a
	   INNER JOIN student_worksheet b ON a.student_worksheet_id = b.id
	   WHERE b.student_id IN (SELECT id FROM student
	   						  WHERE school_type = 3 AND grade = 3)
	   AND (a.result LIKE 'C%' OR a.result LIKE 'W%')
	   ;


-- 고3 학생 푼 문제 정보 합치기 
DROP TABLE IF EXISTS high_senior_scoring;

CREATE TABLE high_senior_scoring(
		student_id VARCHAR(20),
		problem_id INT,
		worksheet_problem_id INT,
		school INT,
		grade INT,
		curriculum_id INT,
		name VARCHAR(40),
		correct_rate FLOAT,
		level INT,
		type INT,
		result VARCHAR(20),
		update_datetime DATETIME
		);		

INSERT INTO high_senior_scoring	
	   SELECT e.student_id, d.problem_id, e.worksheet_problem_id, b.school, b.grade,
	   		  a.id, a.name, c.correct_rate, c.level, c.type,
	   		  e.result, e.update_datetime
	   FROM highschool_senior e 
	   INNER JOIN worksheet_problem d ON e.worksheet_problem_id = d.id
	   INNER JOIN problem c ON d.problem_id = c.id
	   INNER JOIN problem_concept b ON c.problem_concept_id = b.id
	   INNER JOIN problem_curriculum a ON b.problem_curriculum_id = a.id
	   ;
	  

SELECT COUNT(*) FROM high_senior_scoring;

-- 고3빼고 다 삭제 - 문제 기준 
DELETE FROM high_senior_scoring
WHERE school IN (1,2) AND grade IN (1,2,4);

-- 평균 정답률 테이블 생성 
DROP TABLE IF EXISTS avg_correct_rate;

CREATE TABLE avg_correct_rate(
		student_id VARCHAR(20),
		avg_cr INT,
		o_cr INT,
		x_cr INT
		);
		
INSERT INTO avg_correct_rate
	SELECT student_id, ROUND(AVG(correct_rate), 2) AS AVG_CR, 
	   ROUND(AVG(CASE WHEN result='CORRECT' THEN correct_rate END), 2) AS O_CR,
	   ROUND(AVG(CASE WHEN result='WRONG' THEN correct_rate END), 2) AS X_CR
	   FROM high_senior_scoring
	   GROUP BY student_id;
	  
SELECT * FROM avg_correct_rate;

-- 최종 테이블 생성 
DROP TABLE IF EXISTS high_senior_result;

CREATE TABLE high_senior_result(
		student_id VARCHAR(20),
		problem_id INT,
		curriculum_id INT,
		name VARCHAR(40),
		problem_cr FLOAT(4),
		result VARCHAR(20),
		level INT,
		type INT,
		avg_cr INT,
		o_cr INT,
		x_cr INT,
		update_datetime DATETIME
		);

INSERT INTO high_senior_result 	
	SELECT a.student_id, a.problem_id, a.curriculum_id, a.name, a.correct_rate, a.result,
	   a.level, a.type, b.avg_cr, b.o_cr, b.x_cr, a.update_datetime 
	   FROM high_senior_scoring a 
	   INNER JOIN avg_correct_rate b ON a.student_id = b.student_id;

-- 개별 학생 틀린 문제 평균 정답률 NULL값 삭제 	  
DELETE FROM high_senior_result
WHERE update_datetime IS




-- 문제 커리큘럼 id - 3420
UPDATE high_senior_result SET curriculum_id = curriculum_id - 3420;
-- 문제 정답률 표준화: 엑셀로 평균, 표준편차 계산 
UPDATE high_senior_result SET problem_cr = (problem_cr-67.57291377)/16.69334544 ;





