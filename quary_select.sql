/* selezione studenti nati nel 1990 */

SELECT * 
FROM `students`
WHERE `date_of_birth` >= "1990-01-01"
AND `date_of_birth` <= "1990-12-12";

/* seleziona tutti i cordi con cfu maggiore di 10 */

SELECT * 
FROM `courses`
WHERE `cfu` > 10

/* Selezione studenti che hanno più di 30anni*/
/*opzione 1*/
SELECT * 
FROM `students`
WHERE `date_of_birth` >= "1991-01-01";

/*opzione 2 (si autoaggiorna e mi mostra l'età)*/
SELECT * 
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;

/*opzione 3 (si autoaggiorna e mostra data ma non età)*/
SELECT * 
FROM `students`
WHERE DATE_SUB(CURDATE(), INTERVAL 30 YEAR);



/*Seleziona tutti i corsi del primo semestre del primo anno*/
/*opzione 1*/
SELECT * 
FROM `courses`
WHERE `period` = "I semestre"
    AND `year` = 1;

/*opzione 2*/
SELECT * 
FROM `courses`
WHERE `period` LIKE "I %"
    AND `year` = 1;

/*Seleziono tutti appelli esame dopo le 14 del 20-06-2020*/

SELECT * 
FROM `exams`
WHERE `hour` > "14:00:00"
    AND `date`= "2020-06-20";

/*Seleziona tutti i corsi di laurea magistrale*/

SELECT * 
FROM `degrees`
WHERE `level` = "magistrale";

/*numero Dipartimenti */

SELECT * COUNT(`id`) FROM `departments`;

/*Seleziono tutti i docenti senza numero telefonico*/

SELECT COUNT(*)
FROM `teachers`
WHERE `phone` IS NULL;


/*Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia*/
SELECT `students`.`id`,`students`.`name`,`students`.`surname`,`degrees`.name
FROM `students`
JOIN `degrees` ON `students`.`degree_id` = `degree_id`
WHERE `degrees`.`name` LIKE "%Corso di Laurea in Economia" ;



/*Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze*/
SELECT `degrees`.`id`,`degrees`.`name`,`degrees`.`level`,
		`departments`.`name`,`departments`.`address`
FROM `degrees`
JOIN `departments`ON `degrees`.`department_id` = `department_id`
WHERE `departments`.`name` LIKE "% Neuroscienze"

/*Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)*/
SELECT `teachers`.`name`,`teachers`.`surname`,`degrees`.`name`
FROM `teachers`
JOIN `course_teacher`
 ON `teachers`.`id` = `course_teacher`.`course_id`
JOIN `courses`
	ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
    
WHERE `teachers`.`name` = "Fulvio"
	AND `teachers`.`surname`= "Amato"

/*Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome*/


SELECT `students`.`name`,`students`.`surname`,
		`degrees`.`name`,`departments`.`name`
FROM `students`
JOIN `degrees`
	ON `students`.`degree_id`= `degrees`.`id`
JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`name`, `students`.`surname`;

/*Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti*/

SELECT `teachers`.`name`,`teachers`.`surname`,`degrees`.`name`
FROM `teachers`
JOIN `course_teacher`
 ON `teachers`.`id` = `course_teacher`.`course_id`
JOIN `courses`
	ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`



/*Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)*/
SELECT `teachers`.`name`,`teachers`.`surname`,`departments`.`name`
FROM `teachers`
JOIN `course_teacher`
 ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
	ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'
GROUP BY `teachers`.`id`


/*Contare quanti corsi di laurea ci sono per ogni dipartimento*/
SELECT COUNT(`degrees`.`address`),`departments`.`name`
FROM `degrees`
JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
GROUP BY `departments`.`id`

/*Calcolare la media dei voti di ogni appello d'esame*/
SELECT `exams`.`id`, AVG(`exam_student`.`vote`)
FROM `exam_student`
JOIN `exams` 
	ON `exam_student`.`exam_id`=`exams`.`id`
JOIN `courses`
	ON `exams`.`course_id`=`courses`.`id`
JOIN `degrees`
	ON `courses`.`degree_id`=`degrees`.`id`
GROUP BY `exams`.`id`