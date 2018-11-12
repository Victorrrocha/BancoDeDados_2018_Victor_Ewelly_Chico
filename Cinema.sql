CREATE DATABASE CINEMA;
USE CINEMA;

CREATE TABLE cli_cadastrados(
	cli_id SERIAL PRIMARY KEY,
    cli_nome VARCHAR(50),
    cli_cpf VARCHAR(14),
    cli_data_nasc DATE,
    cli_telefone VARCHAR(10)
);

CREATE TABLE compra(
	cmp_id SERIAL PRIMARY KEY,
    cmp_valor FLOAT,
    cmp_datetime DATETIME, 
    cli_id BIGINT REFERENCES cli_cadastrados(cli_id), 
    cx_id BIGINT REFERENCES caixa(cx_id),
    ing_id BIGINT REFERENCES ingressos(ing_id)
);

