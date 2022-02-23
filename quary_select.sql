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