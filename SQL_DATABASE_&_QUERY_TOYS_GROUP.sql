-- Creazione del Database
CREATE DATABASE ToysGroup;

-- Utilizzo il Database per poterlo popolare

USE ToysGroup;

-- Creo le tabelle (stando attento a crearle nell'ordine corretto)

CREATE TABLE STATE (
     STATE_ID INT AUTO_INCREMENT PRIMARY KEY
    ,STATE_NAME VARCHAR(200) NOT NULL
					);

CREATE TABLE REGION (
    REGION_ID INT AUTO_INCREMENT PRIMARY KEY
    ,REGION_NAME VARCHAR(200) NOT NULL
    ,STATE_ID INT NOT NULL
    ,FOREIGN KEY (STATE_ID) REFERENCES STATE(STATE_ID)
					);

CREATE TABLE CUSTOMER (
	 CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY
    ,FIRST_NAME VARCHAR(200) NOT NULL
    ,LAST_NAME VARCHAR(200) NOT NULL
    ,EMAIL VARCHAR(200) NOT NULL
    ,CITY VARCHAR(200) NOT NULL
    ,ADDRESS VARCHAR(200) NOT NULL
    ,REGION_ID INT NOT NULL
    ,FOREIGN KEY (REGION_ID) REFERENCES REGION(REGION_ID)
						);

CREATE TABLE PRODUCT_CATEGORY (
     CATEGORY_ID INT AUTO_INCREMENT PRIMARY KEY
    ,CATEGORY_NAME VARCHAR(200) NOT NULL
							  );

CREATE TABLE PRODUCT (
     PRODUCT_ID INT AUTO_INCREMENT PRIMARY KEY
    ,PRODUCT_NAME VARCHAR(200) NOT NULL
    ,PRODUCT_PRICE DECIMAL(10,2) NOT NULL
    ,PRODUCT_COST DECIMAL(10,2) NOT NULL
    ,CATEGORY_ID INT NOT NULL
    ,FOREIGN KEY (CATEGORY_ID) REFERENCES PRODUCT_CATEGORY(CATEGORY_ID)
					  );

CREATE TABLE SALES (
     SALES_ORDER_NUMBER INT NOT NULL
    ,SALES_ORDER_LINE_NUMBER INT NOT NULL
    ,ORDER_QUANTITY TINYINT NOT NULL
    ,ORDER_DATE DATE NOT NULL
    ,SHIP_DATE DATE
    ,PRODUCT_ID INT NOT NULL
    ,CUSTOMER_ID INT NOT NULL
    ,PRIMARY KEY (SALES_ORDER_NUMBER, SALES_ORDER_LINE_NUMBER)
    ,FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
    ,FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
					 );

-- Popolo le tabelle

INSERT INTO STATE (STATE_NAME) VALUES
 ('Italy')
,('Germany')
,('Switzerland')
,('France') 
,('Spain')
;

INSERT INTO REGION (REGION_NAME, STATE_ID) VALUES
 ('Lombardy', 1) 
,('Sicily', 1) 
,('Bavaria', 2)
,('Berlin', 2)
,('Zurich', 3) 
,('Geneva', 3) 
,('Île-de-France', 4)
,('Provence-Alpes-Côte d\'Azur', 4) 
,('Catalonia', 5) 
,('Madrid', 5)
,('Piedmont', 1) 
,('Sardinia', 1) 
,('Hamburg', 2) 
,('Hesse', 2) 
,('Basel', 3) 
,('Vaud', 3) 
,('Normandy', 4) 
,('Occitania', 4) 
,('Andalusia', 5) 
,('Valencia', 5)
;

INSERT INTO CUSTOMER (FIRST_NAME, LAST_NAME, EMAIL, CITY, ADDRESS, REGION_ID) VALUES
 ('John', 'Smith', 'john.smith@example.com', 'Milan', '123 Duomo St.', 1)
,('Jane', 'Doe', 'jane.doe@example.com', 'Palermo', '456 Normanni Ave.', 2)
,('Hans', 'Müller', 'hans.muller@example.de', 'Munich', '789 Marienplatz St.', 3)
,('Klara', 'Schmidt', 'klara.schmidt@example.de', 'Berlin', '101 Brandenburg St.', 4)
,('Paul', 'Dubois', 'paul.dubois@example.ch', 'Zurich', '102 Bahnhofstrasse', 5)
,('Sophie', 'Roux', 'sophie.roux@example.ch', 'Geneva', '201 Rhône St.', 6)
,('Lucas', 'Martin', 'lucas.martin@example.fr', 'Paris', '301 Champs-Élysées', 7)
,('Emma', 'Dupont', 'emma.dupont@example.fr', 'Nice', '401 Promenade des Anglais', 8)
,('Carlos', 'Garcia', 'carlos.garcia@example.es', 'Barcelona', '501 La Rambla St.', 9)
,('Maria', 'Lopez', 'maria.lopez@example.es', 'Madrid', '601 Gran Via St.', 10)
,('Marco', 'Rossi', 'marco.rossi@example.it', 'Turin', '701 Mole Antonelliana St.', 11)
,('Francesca', 'Bianchi', 'francesca.bianchi@example.it', 'Cagliari', '801 Poetto Ave.', 12)
,('Jürgen', 'Klein', 'jurgen.klein@example.de', 'Hamburg', '901 Alster St.', 13)
,('Anna', 'Fischer', 'anna.fischer@example.de', 'Frankfurt', '1001 Römer St.', 14)
,('Peter', 'Keller', 'peter.keller@example.ch', 'Basel', '1101 Rhine St.', 15)
,('Elena', 'Weber', 'elena.weber@example.ch', 'Lausanne', '1201 Olympic St.', 16)
,('Marie', 'Petit', 'marie.petit@example.fr', 'Rouen', '1301 Normandy St.', 17)
,('Claude', 'Girard', 'claude.girard@example.fr', 'Toulouse', '1401 Canal du Midi', 18)
,('Alejandro', 'Fernandez', 'alejandro.fernandez@example.es', 'Seville', '1501 Giralda St.', 19)
,('Laura', 'Gomez', 'laura.gomez@example.es', 'Valencia', '1601 City of Arts', 20)
;

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME) VALUES
 ('Action Figures') 
,('Board Games') 
,('Dolls & Stuffed Animals')
,('Puzzles') 
,('Outdoor Toys')
;

INSERT INTO PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_COST, CATEGORY_ID) VALUES
 ('Superhero Action Figure', 15.99, 7.50, 1)  
,('Dinosaur Action Figure', 19.99, 10.00, 1) 
,('Police Action Figure Set', 24.99, 12.00, 1)
,('Monopoly Classic', 29.99, 15.00, 2)        
,('Scrabble', 19.99, 8.50, 2)              
,('Jenga', 12.99, 6.00, 2)                     
,('Barbie Doll', 21.99, 10.00, 3)              
,('Baby Doll with Accessories', 25.99, 13.00, 3) 
,('Plush Teddy Bear', 14.99, 7.50, 3)          
,('1000-Piece Jigsaw Puzzle', 10.99, 4.50, 4)  
,('3D Puzzle Set', 15.99, 7.00, 4)            
,('Wooden Puzzle for Kids', 9.99, 3.50, 4)    
,('Inflatable Pool Toy', 19.99, 8.00, 5)     
,('Frisbee Set', 9.99, 4.00, 5)                
,('Scooter for Kids', 49.99, 25.00, 5)        
,('Bouncy Ball', 12.99, 6.00, 5)               
,('Toy Airplane', 17.99, 8.00, 5)              
,('Toy Robot', 29.99, 15.00, 1)                
,('Toy Soldier Set', 18.99, 9.00, 1)
;

INSERT INTO SALES (SALES_ORDER_NUMBER, SALES_ORDER_LINE_NUMBER, ORDER_QUANTITY, ORDER_DATE, SHIP_DATE, PRODUCT_ID, CUSTOMER_ID) VALUES
 (1001, 1, 2, '2024-11-01', '2024-11-05', 1, 1)
,(1001, 2, 1, '2024-11-01', '2024-11-05', 2, 1)
,(1002, 1, 3, '2024-11-02', '2024-11-06', 3, 2)
,(1003, 1, 1, '2024-11-03', '2024-11-07', 4, 3)
,(1004, 1, 1, '2024-11-04', '2024-11-08', 5, 4)
,(1005, 1, 2, '2024-11-05', '2024-11-09', 6, 5)
,(1006, 1, 1, '2024-11-06', '2024-11-10', 7, 6)
,(1007, 1, 2, '2024-11-07', '2024-11-11', 8, 7)
,(1008, 1, 1, '2024-11-08', '2024-11-12', 9, 8)
,(1009, 1, 3, '2024-11-09', '2024-11-13', 10, 9)
,(1010, 1, 1, '2024-11-10', '2024-11-14', 11, 10)
,(1011, 1, 1, '2024-11-11', '2024-11-15', 12, 11)
,(1012, 1, 2, '2024-11-12', '2024-11-16', 13, 12)
,(1013, 1, 3, '2024-11-13', '2024-11-17', 14, 13)
,(1014, 1, 2, '2024-11-14', '2024-11-18', 15, 14) 
,(1015, 1, 1, '2024-11-15', '2024-11-19', 16, 15)
,(1016, 1, 3, '2024-11-16', '2024-11-20', 17, 16)
,(1017, 1, 1, '2024-11-17', '2024-11-21', 18, 17)
,(1018, 1, 2, '2024-11-18', '2024-11-22', 19, 18)
;

-- creo una view per avere la tabella sales con il campo calcolato ''SALES_AMOUNT''

CREATE VIEW VW_SALES_WITH_AMOUNT AS (
SELECT 
     S.SALES_ORDER_NUMBER
    ,S.SALES_ORDER_LINE_NUMBER
    ,S.ORDER_QUANTITY
    ,S.ORDER_DATE
    ,S.SHIP_DATE
    ,(S.ORDER_QUANTITY * P.PRODUCT_PRICE) AS SALES_AMOUNT
    ,S.PRODUCT_ID
    ,S.CUSTOMER_ID
FROM 
	SALES S
JOIN 
	PRODUCT P
ON 
	S.PRODUCT_ID = P.PRODUCT_ID
								    );
 
 
 
 -- Dopo la creazione e l’inserimento dei dati nelle tabelle, esegui e riporta delle query utili a:


-- 1. Verificare che i campi definiti come PK siano univoci.  

-- utilizzo 2 metodi diversi: 

-- tabella state

-- conto il numero di STATE ID che si ripetono più di 1 volta, se il risultato è vuoto significa che non ci sono STATE ID che si ripetono più di 1 volta
-- ( questo metodo penso sia il migliore perchè oltre a dirti se hai dei duplicati ti dice anche dove, cosi in caso di errore puoi subito identificare dove andarlo a risolvere)

SELECT 
	 STATE_ID
	,COUNT(*) AS COUNT
FROM 
	STATE
GROUP BY 
	STATE_ID
HAVING 
	COUNT(*) > 1;
    
-- oppure

-- conto senza duplicati lo STATE ID e poi lo conto con duplicati, se i due conteggi sono uguali significa che non ho duplicati

SELECT 
	 COUNT(DISTINCT STATE_ID) AS single_count
    ,COUNT(*) AS total_count
FROM 
	STATE;

-- applico i due metodi differenti a tutte le tabella mancanti

-- tabella region

SELECT 
	 REGION_ID
	,COUNT(*) AS COUNT
FROM 
	REGION
GROUP BY 
	REGION_ID
HAVING 
	COUNT(*) > 1;
    
-- oppure	

SELECT 
	 COUNT(DISTINCT REGION_ID) AS single_count
    ,COUNT(*) AS total_count
FROM 
	REGION;

-- tabella customer

SELECT 
	 CUSTOMER_ID
	,COUNT(*) AS COUNT
FROM 
	CUSTOMER
GROUP BY 
	CUSTOMER_ID
HAVING 
	COUNT(*) > 1;
    
-- oppure	

SELECT 
	 COUNT(DISTINCT CUSTOMER_ID) AS single_count
	,COUNT(*) AS total_count
FROM 
	CUSTOMER;

-- tabella product_category

SELECT 
	 CATEGORY_ID
	,COUNT(*) AS COUNT
FROM 
	PRODUCT_CATEGORY
GROUP BY 
	CATEGORY_ID
HAVING 
	COUNT(*) > 1;
    
-- oppure

SELECT 
	 COUNT(DISTINCT CATEGORY_ID) AS single_count
    ,COUNT(*) AS total_count
FROM 
	PRODUCT_CATEGORY;

-- tabella product

SELECT 
	 PRODUCT_ID
    ,COUNT(*) AS COUNT
FROM 
	PRODUCT
GROUP BY 
	PRODUCT_ID
HAVING 
	COUNT(*) > 1;

-- oppure

SELECT 
	 COUNT(DISTINCT PRODUCT_ID) AS single_count
	,COUNT(*) AS total_count
FROM 
	PRODUCT;

-- tabella sales

SELECT 
     SALES_ORDER_NUMBER
    ,SALES_ORDER_LINE_NUMBER
    ,COUNT(*) AS COUNT
FROM
    SALES
GROUP BY 
	 SALES_ORDER_NUMBER 
    ,SALES_ORDER_LINE_NUMBER
HAVING 
	COUNT(*) > 1;
    
-- oppure

SELECT 
	 COUNT(DISTINCT SALES_ORDER_NUMBER, SALES_ORDER_LINE_NUMBER) AS single_count
	,COUNT(*) AS total_count
FROM 
	SALES;
    
-- conclusione :  i campi definiti come PK sono univoci


-- 2. Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.

-- sfruttando le tabelle SALES e PRODUCT:

SELECT
	 YEAR(S.ORDER_DATE) AS YEAR
    ,P.PRODUCT_NAME
    ,SUM(S.ORDER_QUANTITY*PRODUCT_PRICE) AS TOTAL_SALES
FROM
	sales AS S
LEFT JOIN
	product AS P
ON
	S.PRODUCT_ID = P.PRODUCT_ID
GROUP BY
	S.PRODUCT_ID
    ,YEAR
;

-- oppure

-- sfruttando la view vw_sales_with_amount:  
-- (dovrei fare join con product per ricavarne anche il product_name)

SELECT
	 PRODUCT_ID
    ,YEAR(ORDER_DATE) AS YEAR
    ,SUM(SALES_AMOUNT) AS TOTAL_SALES
FROM
	vw_sales_with_amount
GROUP BY
	PRODUCT_ID
    ,YEAR
;


-- 3. Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente

SELECT
	 S.STATE_NAME
    ,YEAR(SA.ORDER_DATE) AS YEAR
    ,SUM(SA.ORDER_QUANTITY*P.PRODUCT_PRICE) AS TOTAL_SALES
FROM
	state AS S
JOIN
	region AS R
ON
	R.STATE_ID = S.STATE_ID
JOIN
	customer AS C
ON
	R.REGION_ID = C.REGION_ID
JOIN
	sales AS SA
ON
	C.CUSTOMER_ID = SA.CUSTOMER_ID
JOIN
	product AS P
ON
	SA.PRODUCT_ID = P.PRODUCT_ID
GROUP BY
	 S.STATE_ID
    ,YEAR
ORDER BY
	 YEAR(SA.ORDER_DATE)
    ,SUM(SA.ORDER_QUANTITY*P.PRODUCT_PRICE) DESC
;

-- oppure

-- sfruttando la view vw_sales_with_amount: 
-- (mi fa risparmiare 1 passaggio)

SELECT
	 S.STATE_NAME
    ,YEAR(VWS.ORDER_DATE) AS YEAR
    ,SUM(VWS.SALES_AMOUNT) AS TOTAL_SALES
FROM
	state AS S
JOIN
	region AS R
ON
	R.STATE_ID = S.STATE_ID
JOIN
	customer AS C
ON
	R.REGION_ID = C.REGION_ID
JOIN
	vw_sales_with_amount AS VWS
ON
	C.CUSTOMER_ID = VWS.CUSTOMER_ID
GROUP BY
	 S.STATE_ID
    ,YEAR
ORDER BY
	 YEAR(VWS.ORDER_DATE)
    ,SUM(VWS.SALES_AMOUNT) DESC
;


-- 4. Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato? 

/*calcolo il profitto togliendo il costo di produzione al prezzo prodotto
(se non lo facessi e usassi solo il valore di prezzo prodotto potrei pensare che una categoria sia quella che vende di più quando in realtà togliendo la spesa di produzione scoprire che è quella che vende di meno)
metto LIMIT 1 alla fine della QUERY cosi che il risultato mi dia solamente la categoria che ha generato più guadagno
specifico un ordine decrescente cosi che il 1 record sia quello con il valore di profit più alto*/

SELECT
	 C.CATEGORY_NAME
    ,SUM((PRODUCT_PRICE-P.PRODUCT_COST)*S.ORDER_QUANTITY) AS Profit
FROM
	product_category AS C
JOIN
	product AS P
ON
	P.CATEGORY_ID = C.CATEGORY_ID
JOIN
	sales AS S
ON
	P.PRODUCT_ID = S.PRODUCT_ID
GROUP BY
	C.CATEGORY_NAME
ORDER BY
	Profit DESC
LIMIT
	1
;


-- conclusione: la categoria di articoli maggiormente richiesta dal mercato è Outdoor Toys 


-- 5. Rispondere alla seguente domanda: quali sono, se ci sono, i prodotti invenduti? Proponi due approcci risolutivi differenti. 

-- metodo 1:
/*seleziono i product name dalla tabella product ma con la condizione di farmi vedere solo quei prodotti che non sono nella tabella sales
tradotto in '' fammi vedere solo i prodotti che non sono stati venduti''*/

SELECT
	PRODUCT_NAME
FROM
	product
WHERE
	PRODUCT_ID NOT IN(
						SELECT DISTINCT
							PRODUCT_ID
						FROM
							sales
					 );

-- oppure

-- metodo 2:
/* Seleziono i PRODUCT_NAME dalla tabella product e faccio una LEFT JOIN con sales tramite PRODUCT_ID.
Questo mi restituisce tutti i prodotti da product e solo i prodotti venduti da sales. 
I prodotti non venduti avranno NULL nelle colonne di sales, quindi con WHERE S.PRODUCT_ID IS NULL seleziono solo i prodotti che non sono stati venduti. */

SELECT
    P.PRODUCT_NAME
FROM
    product AS P
LEFT JOIN
    sales AS S
ON
    P.PRODUCT_ID = S.PRODUCT_ID
WHERE
    S.PRODUCT_ID IS NULL;

-- conclusione: non ci sono prodotti invenduti


-- 6. Esporre l’elenco dei prodotti con la rispettiva ultima data di vendita (la data di vendita più recente).



-- se questo e-commerce registra la vendita nel momento in cui viene effettuato l ordine, la query corretta sarebbe la seguente:
-- seleziono il nome prodotto e utilizzo MAX per ricavare la data più recente

SELECT
     P.PRODUCT_NAME
    ,MAX(S.ORDER_DATE) AS LAST_SALE_DATE
FROM
    product AS P
JOIN
    sales AS S 
ON 
	P.PRODUCT_ID = S.PRODUCT_ID
GROUP BY
    P.PRODUCT_NAME;
    
/*ma se invece la vendita fosse registrata nel momento in cui viene effettuato l'ordine e confermata nel momento della spedizione, la query corretta sarebbe la seguente:
seleziono il nome prodotto e utilizzo MAX per ricavare la data più recente, ma la combino con COALESCE cosi che avrò la data più recente della spedizione e in caso di mancata spedizione
avrò la data piu recente di ordine*/
	
SELECT
     P.PRODUCT_NAME
    ,MAX(COALESCE(S.SHIP_DATE,S.ORDER_DATE)) AS LAST_SALE_DATE
FROM
    product AS P
JOIN
    sales AS S 
ON 
	P.PRODUCT_ID = S.PRODUCT_ID
GROUP BY
    P.PRODUCT_NAME;



-- verificato che la compilazione del database funzioni in modo corretto, verificato inoltre che tutte le query si eseguano correttamente.
-- se qualcosa non dovesse eseguirsi ti sarei grato se me lo comunicassi cosi da capirne la motivazione, grazie.


