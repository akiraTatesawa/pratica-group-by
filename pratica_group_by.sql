-- Questão 1:
SELECT
	COUNT("endDate") AS "currentExperiences"
FROM
	experiences;

-- Questão 2:
SELECT
	"userId" AS id,
	COUNT(educations) AS educations
FROM
	educations
GROUP BY
	"userId";

-- Questão 3:
SELECT
	users.name AS writer,
	COUNT(testimonials) AS "testimonialCount"
FROM
	testimonials
	JOIN
		users
		ON testimonials."writerId" = users.id
WHERE
	testimonials."writerId" = 435
GROUP BY
	writer;

-- Questão 4:
SELECT
	MAX(jobs.salary) AS "maximumSalary",
	roles.name AS role
FROM
	jobs
	JOIN
		roles
		ON jobs."roleId" = roles.id
WHERE
	active = true
GROUP BY
	role
ORDER BY
	"maximumSalary" ASC;

-- Bônus:
SELECT
	s.name AS school,
	c.name AS course,
	COUNT(educations) AS "studentsCount",
	educations.status AS role
FROM
	educations
	JOIN
		schools AS s
		ON educations."schoolId" = s.id
	JOIN
		courses AS c
		ON educations."courseId" = c.id
WHERE
	educations.status = 'ongoing'
	OR educations.status = 'finished'
GROUP BY
	school, course, role
ORDER BY
	"studentsCount" DESC
LIMIT 3;