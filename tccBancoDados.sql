CREATE database SGC;
use SGC;

CREATE USER 'michael'@'%' IDENTIFIED BY 'kelly253';
GRANT ALL ON *.* TO 'michael'@'%' WITH GRANT OPTION;

drop DATABASE SGC;
SELECT * FROM SGC;
show tables from SGC;
/* tipo de conta admin ou funcionario */

CREATE TABLE tb_usuario (
	id int not null auto_increment primary key,
	nome varchar(100),
    tipo_conta varchar ( 15), 
	rg varchar (20),
	cpf varchar (20),
	email varchar(200),
	cargo varchar(50),
	celular varchar(30),
	usuario_login varchar(40) unique,
	senha_login varchar(40) 
);


CREATE TABLE tb_produtos (
	id int not null auto_increment primary key,
	nome VARCHAR (30) unique,
    preco decimal (10,2) not null,
	qtd_estoque int,
	descricao varchar(100)
	
);
drop table tb_vendas;
describe tb_vendas;
describe tb_itensvendas;
describe tb_produtos;
/*
preciso criar  atabela pois a deletei
*/
CREATE TABLE tb_vendas (
  id int auto_increment primary key,
  nome_usuario varchar(30),
  data_venda date,
  hora_venda time, 
  total_venda decimal (10,2),
  observacoes text,
  tipo_pagamento varchar (20)
  
   /*FOREIGN KEY (usuario_id) REFERENCES tb_usuarios(id)  esta er a chave estrangeria*/
);


CREATE TABLE tb_itensvendas (
  id int auto_increment primary key,
  venda_id int,
  produto_id int,
  qtd int,
  subtotal decimal (10,2),

  FOREIGN KEY (venda_id) REFERENCES tb_vendas(id),
  FOREIGN KEY (produto_id) REFERENCES tb_produtos(id)
);

insert into tb_usuario (nome, tipo_conta , rg, cpf ,email , cargo, celular, usuario_login, senha_login)
values('Michael Diogo Fagundes','admin','MG20129975','11948106671','michaeldiogo17@outlook.com','Engenheiro de software','999782517','michael253','kelly253');

insert into tb_usuario (nome, tipo_conta , rg, cpf ,email , cargo, celular, usuario_login, senha_login)
values('Kelly Crystine','funcionario','MG123456','12312312345','kellyAssis@outlook.com','Caixa','998263371','kelly253','michael253');

SELECT * FROM SGC.tb_usuario;
select * from tb_produtos;