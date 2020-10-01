# Lista de Exercícios - Gatilhos e Sequências

Link para a definição de Sequência:

[Sequence Overview](https://mariadb.com/kb/en/library/sequence-overview/)

Material para Upgrade do MariaDB para a versão 10.3:

[Upgrade MariaDB](https://mariadb.com/kb/en/library/upgrading-from-mariadb-102-to-mariadb-103/)

**01.** Escreva os seguintes comandos relacionados com *Sequences* no MariaDB 10.3.
```
CREATE SEQUENCE s START WITH 100 INCREMENT BY 10;
CREATE SEQUENCE s2 START WITH -100 INCREMENT BY -10;
CREATE SEQUENCE s3 START WITH -100 INCREMENT
MINVALUE=-100 MAXVALUE=1000;
```
**Execute:**
```
SELECT NEXTVAL(s);
SELECT NEXTVAL(s);
SELECT NEXTVAL(s);
```
Teste também para s2 e s3;

**02.** Crie e teste o seguinte esquema relacional:
```
create sequence s1;
create table t1 (
a int default (next value for s1),
b int,
primary key (a)
);
insert into t1 (b) values (5), (7);
insert into t1 (b) values (8);
select * from t1;
```
**03.** Estude os comandos:
```
CREATE SEQUENCE, ALTER SEQUENCE, DROP SEQUENCE,
NEXT VALUE FOR
PREVIOUS VALUE FOR
SETVAL(). Set next value for the sequence.
AUTO INCREMENT
```
Considere o banco de dados abaixo para responder as questões 1 a 6:

obs: **primary key**, *foreign key*.

cliente (**codigo**, nome, endereco)

piloto (**codigo**, nome, num_voos)

voo (**codigo**, tipo, *piloto*, num_passageiros, distancia)

milhas (**cliente**, quantidade)

cliente_voo (**cliente**, **voo**, classe)

**04.** Crie um gatilho que ao se adicionar um novo cliente, seja criado para ele um cartão de milhagem com 0 milhas.

**05.** Crie um gatilho que ao se adicionar um voo, seja adicionado +1 voo para o piloto daquele voo.

**06.** Crie um gatilho que some milhas ao cartão de milhagem sempre que um cliente é adicionado a um voo. (Considere que é adicionado 1 milha no cartão para cada 10 milhas de distância percorrida em um voo).
```
create trigger add_milhas after
insert cliente_voo
as
UPDATE milhas SET quantidade = quantidade +
(SELECT distancia FROM voo, cliente_voo
WHERE new.voo = voo.codigo
) / 10
WHERE cliente = new.cliente;
```
**07.** Crie um gatilho que adicione mais um passageiro a um voo sempre que um cliente entre em um voo. (Dica: lembre da relação cliente_voo).
```
create trigger add_milhas after
insert cliente_voo
as
UPDATE voo SET num_passageiros = num_passageiros + 1;
```
**08.** Crie um gatilho que delete todos os clientes de um voo sempre que aquele voo for deletado e mais um gatilho para deletar o piloto. (Para efeito de informação, considere que o avião caiu).

**09.** Cadastre um cartão de milhagem para um cliente qualquer e logo após crie um gatilho que cadastre um cartão de milhagem para aquele cliente quando suas informações forem atualizadas. Veja e explique o que acontece quando esse procedimento for realizado.

Utilize PostgreSQL para as questões 10 a 14 (testem no MariaDB 10.3).

**10.** Crie uma sequência que inicia em 1 e pode ir até 1000.

**11.** Verifique qual o próximo valor da sequência criada na questão 10.

**12.** Crie uma tabela chamada cliente que contenha um código. O código do cliente deve ser igual ao próximo valor da sequência criada na questão 10.

**13.** Crie e exiba o próximo valor de uma sequência chamada 100_em_diante que inicie no valor 100 e não tenha limite máximo definido.

**14.** Altere a sequência criada na questão 10 adicionando valor máximo 200.
