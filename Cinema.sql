USE cinema;

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

CREATE TABLE caixa(
    cx_id SERIAL PRIMARY KEY,
    set_id INT,
    cx_tipo VARCHAR(10),
    cx_datetime DATETIME
    -- set_id BIGINT REFERENCES setor(set_id)
);

CREATE TABLE salas(
	sal_id INT PRIMARY KEY,
    set_id INT,
    sal_num_pol INT
);

CREATE TABLE poltronas(
	pol_id VARCHAR(2),
    pol_status BOOLEAN,
    sal_id INT REFERENCES salas(sal_id)
);

CREATE TABLE ingresso(
	ing_id SERIAL PRIMARY KEY, 
    ses_id BIGINT REFERENCES sessao(ses_id), 
    cmp_id BIGINT REFERENCES compra(cmp_id)
);

CREATE TABLE funcionarios(
	fun_id SERIAL PRIMARY KEY,
    fun_nome VARCHAR(50),
    fun_cargo VARCHAR(50),
    fun_data_nasc DATE,
    fun_telefone VARCHAR(10), -- NORMALIZA,
    fun_endereco VARCHAR(100)
);

CREATE TABLE funci_horario(
	hor_datetime DATETIME, 
    fun_id BIGINT REFERENCES funcionarios(fun_id), 
    set_id INT
);

CREATE TABLE filme(
	fil_id SERIAL PRIMARY KEY,
    fil_nome VARCHAR(70),
    fil_formato VARCHAR(2),
    fil_duração TIME,
    fil_data_in DATE, 
    fil_data_out DATE, 
    fil_gênero VARCHAR(10),
    fil_idioma VARCHAR(20), 
    fil_nacionalidade VARCHAR(10)
);

CREATE TABLE Sessão(
	ses_id SERIAL,
    ses_datetime DATETIME, 
    fil_id BIGINT REFERENCES filme(fil_id),
    sal_id INT REFERENCES salas(sal_id)
);
