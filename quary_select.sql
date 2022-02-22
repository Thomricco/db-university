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

SELECT * 
FROM `students`
WHERE `date_of_birth` >= "1991-01-01";


/*Seleziona tutti i corsi del primo semestre del primo anno*/

SELECT * 
FROM `courses`
WHERE `period` = "I semestre"
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

SELECT * FROM `departments`;

/*Seleziono tutti i docenti senza numero telefonico*/

SELECT * 
FROM `teachers`
WHERE `phone` IS NULL;