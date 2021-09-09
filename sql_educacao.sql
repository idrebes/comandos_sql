/*
id = serial
nome = turma 1
idade_inicio = 0
idade_fim = 1
*/


CREATE TABLE niveis_ensino(
id_niveis_ensino SERIAL NOT NULL,
nome VARCHAR(20) NOT NULL,
idade_inicio CHAR(1) NOT NULL,
idade_fim CHAR(1) NOT NULL,
CONSTRAINT pk_niveis_ensino PRIMARY KEY (id_niveis_ensino)
);

INSERT INTO niveis_ensino VALUES(DEFAULT, 'Turma 1',0,1);
INSERT INTO niveis_ensino VALUES(DEFAULT, 'Turma 2',1,2);
INSERT INTO niveis_ensino VALUES(DEFAULT, 'Turma 3',2,3);
INSERT INTO niveis_ensino VALUES(DEFAULT, 'Turma 4',3,4);

SELECT * FROM turmas

DROP TABLE turmas

CREATE TABLE turmas(
id_turmas SERIAL NOT NULL,
id_niveis_ensino INTEGER NOT NULL,
id_escola INTEGER NOT NULL,
capacidade INTEGER NOT NULL,
CONSTRAINT pk_turmas PRIMARY KEY (id_turmas),
CONSTRAINT fk_id_niveis_ensino FOREIGN KEY (id_niveis_ensino) REFERENCES niveis_ensino,
CONSTRAINT fk_id_escola FOREIGN KEY (id_escola) REFERENCES turmas
);


INSERT INTO turmas VALUES(DEFAULT,1,10,1);
INSERT INTO turmas VALUES(DEFAULT,2,10,2);
INSERT INTO turmas VALUES(DEFAULT,3,10,6);
INSERT INTO turmas VALUES(DEFAULT,4,10,11);

INSERT INTO turmas VALUES(DEFAULT,1,9,0);
INSERT INTO turmas VALUES(DEFAULT,2,9,1);
INSERT INTO turmas VALUES(DEFAULT,3,9,5);
INSERT INTO turmas VALUES(DEFAULT,4,9,0);

INSERT INTO turmas VALUES(DEFAULT,1,8,3);
INSERT INTO turmas VALUES(DEFAULT,2,8,4);
INSERT INTO turmas VALUES(DEFAULT,3,8,0);
INSERT INTO turmas VALUES(DEFAULT,4,8,6);

INSERT INTO turmas VALUES(DEFAULT,1,7,1);
INSERT INTO turmas VALUES(DEFAULT,2,7,0);
INSERT INTO turmas VALUES(DEFAULT,3,7,6);
INSERT INTO turmas VALUES(DEFAULT,4,7,7);

INSERT INTO turmas VALUES(DEFAULT,1,6,5);
INSERT INTO turmas VALUES(DEFAULT,2,6,8);
INSERT INTO turmas VALUES(DEFAULT,3,6,8);
INSERT INTO turmas VALUES(DEFAULT,4,6,3);

INSERT INTO turmas VALUES(DEFAULT,1,5,3);
INSERT INTO turmas VALUES(DEFAULT,2,5,2);
INSERT INTO turmas VALUES(DEFAULT,3,5,4);
INSERT INTO turmas VALUES(DEFAULT,4,5,13);

INSERT INTO turmas VALUES(DEFAULT,1,4,2);
INSERT INTO turmas VALUES(DEFAULT,2,4,1);
INSERT INTO turmas VALUES(DEFAULT,3,4,0);
INSERT INTO turmas VALUES(DEFAULT,4,4,11);

INSERT INTO turmas VALUES(DEFAULT,1,3,10);
INSERT INTO turmas VALUES(DEFAULT,2,3,15);
INSERT INTO turmas VALUES(DEFAULT,3,3,11);
INSERT INTO turmas VALUES(DEFAULT,4,3,8);

INSERT INTO turmas VALUES(DEFAULT,1,2,7);
INSERT INTO turmas VALUES(DEFAULT,2,2,17);
INSERT INTO turmas VALUES(DEFAULT,3,2,5);
INSERT INTO turmas VALUES(DEFAULT,4,2,12);

INSERT INTO turmas VALUES(DEFAULT,1,1,3);
INSERT INTO turmas VALUES(DEFAULT,2,1,1);
INSERT INTO turmas VALUES(DEFAULT,3,1,2);
INSERT INTO turmas VALUES(DEFAULT,4,1,9);


drop table turmas

ALTER TABLE candidatos_escolas
ADD id_turma INTEGER;

SELECT * FROM candidatos_escolas

SELECT * FROM turmas

SELECT * FROM niveis_ensino

--LISTAR idade DO CANDIDATO
SELECT id, DATE_PART('year', age(data_nascimento)) as idade, 
data_nascimento 
FROM candidatos
ORDER BY DATE_PART('year', age(data_nascimento));

--LISTAR O NIVEL DE ENSINO DO CANDIDATO
SELECT c.id, c.data_nascimento, DATE_PART('year', age(data_nascimento)) as idade,
n.nome, n.idade_inicio, n.idade_fim
FROM candidatos c, niveis_ensino n
WHERE DATE_PART('year', age(data_nascimento)) >= idade_inicio 
AND DATE_PART('year', age(data_nascimento)) < idade_fim;
