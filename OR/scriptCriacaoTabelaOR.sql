DROP TYPE tp_telefone FORCE;
DROP TYPE tp_roteiro FORCE;
DROP TYPE array_tp_telefone FORCE;
DROP TYPE tp_funcionario FORCE;
DROP TYPE array_supervisionados FORCE;
DROP TYPE tp_diretor FORCE;
DROP TYPE tp_ator FORCE;
DROP TYPE tp_duble FORCE;
DROP TYPE listaRoteiro FORCE;
DROP TYPE tp_roteirista FORCE;
DROP TYPE tp_set FORCE;
DROP TYPE tp_filme FORCE;
DROP TYPE tp_sala FORCE;
DROP TYPE listaSalas FORCE;
DROP TYPE tp_cinema FORCE;
DROP TYPE tp_exibicao FORCE;
DROP TYPE tp_direcao FORCE;
DROP TYPE tp_atuacao FORCE;

CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    numero VARCHAR2(14)
);
/
CREATE OR REPLACE TYPE tp_roteiro AS OBJECT(
    codigo NUMBER,
    titulo VARCHAR2(50),
    CONSTRUCTOR FUNCTION tp_roteiro(c NUMBER, t VARCHAR2(50)) RETURN SELF AS RESULT
);
/
CREATE OR REPLACE TYPE array_tp_telefone AS VARRAY(5) OF tp_telefone;
/
CREATE OR REPLACE TYPE tp_funcionario AS OBJECT(
    cpf VARCHAR2(14),
    nome VARCHAR2(50),
    data_nascimento DATE,
    premiacoes VARCHAR2(20),
    salario NUMBER(6,2),
    cep VARCHAR2(9),
    rua VARCHAR2(50),
    cidade VARCHAR2(50),
    numero VARCHAR2(5),
    Telefones array_tp_telefone,
    FINAL MEMBER FUNCTION getCpf RETURN VARCHAR2,
    MEMBER FUNCTION getSalario RETURN NUMBER,
    MEMBER PROCEDURE setSalario(s NUMBER),
    MAP MEMBER FUNCTION cpfToInt RETURN INTEGER,
    ORDER MEMBER FUNCTION comparaSalario (X tp_funcionario) RETURN INTEGER
); NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE array_supervisionados AS TABLE OF tp_funcionario;
/
CREATE OR REPLACE TYPE tp_diretor UNDER tp_funcionario(
    nota_critica NUMBER,
    supervisionados array_supervisionados
)
NESTED TABLE supervisionados STORE AS tb_supervisionados;
/
CREATE OR REPLACE TYPE tp_ator UNDER tp_funcionario(
    cad_atores NUMBER
);
/
CREATE OR REPLACE TYPE tp_duble UNDER tp_funcionario(
    incapacitado CHAR
);
/
CREATE OR REPLACE TYPE listaRoteiro AS TABLE OF tp_roteiro;
/
CREATE OR REPLACE TYPE tp_roteirista UNDER tp_funcionario(
    genero VARCHAR2(100),
    roteiros listaRoteiro
)
NESTED TABLE roteiros STORE AS tb_lista_roteiros;
/
CREATE OR REPLACE TYPE tp_set AS OBJECT(
    codigo NUMBER,
    ocupado CHAR,
    cep VARCHAR2(9),
    numero_endereco NUMBER,
    rua VARCHAR2(50),
    cidade VARCHAR2(50)
);
/
CREATE OR REPLACE TYPE tp_filme AS OBJECT(
    codigo NUMBER,
    titulo VARCHAR2(100),
    ano_producao NUMBER,
    genero VARCHAR2(30),
    classificacao_indicativa VARCHAR2(10),
    nota_critica NUMBER,
    orcamento NUMBER(20, 2),
    codigo_roteiro REF tp_roteiro
);
/
CREATE OR REPLACE TYPE tp_sala AS OBJECT(
    numero NUMBER,
    ocupado CHAR
);
/
CREATE OR REPLACE TYPE listaSalas AS TABLE OF tp_sala;
/
CREATE OR REPLACE TYPE tp_cinema AS OBJECT(
    codigo NUMBER,
    nome VARCHAR2(100),
    cep VARCHAR2(9),
    numero_endereco NUMBER,
    rua VARCHAR2(50),
    cidade VARCHAR2(50)
    salas listaSalas
);
/
CREATE OR REPLACE TYPE tp_exibicao AS OBJECT(
    filme REF tp_filme,
    sala REF tp_sala,
    cinema REF tp_cinema,
    data DATE,
    ingressos_vendidos NUMBER,
    preco_ingresso NUMBER(4,2)
);
/
CREATE OR REPLACE TYPE tp_direcao AS OBJECT(
    cpf_diretor REF tp_diretor,
    codigo_set REF tp_set,
    codigo_filme REF tp_filme
);
/
CREATE OR REPLACE TYPE tp_atuacao AS OBJECT(
    cpf_ator REF tp_ator,
    codigo_filme REF tp_filme,
    codigo_duble REF tp_duble
);

--tabelas

DROP TABLE tb_ator CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_atuacao CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_cinema CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_direcao CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_diretor CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_duble CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_exibicao CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_filme CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_roteirista CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_roteiro CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_sala CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_set CASCADE CONSTRAINTS PURGE;

CREATE TABLE tb_roteiro OF tp_roteiro(
    codigo PRIMARY KEY,
    titulo NOT NULL
);

CREATE TABLE tb_diretor OF tp_diretor(
    cpf PRIMARY KEY
);

CREATE TABLE tb_ator OF tp_ator(
    cpf PRIMARY KEY,
    cad_atores NOT NULL
);

CREATE TABLE tb_duble OF tp_duble(
    cpf PRIMARY KEY,
    incapacitado NOT NULL
);

CREATE TABLE tb_roteirista OF tp_roteirista(
    cpf PRIMARY KEY,
    genero NOT NULL
);

CREATE TABLE tb_set OF tp_set(
    codigo PRIMARY key,
    ocupado NOT NULL
);

CREATE TABLE tb_filme OF tp_filme(
    codigo PRIMARY KEY,
    codigo_roteiro WITH ROWID REFERENCES tb_roteiro
    titulo NOT NULL
);

CREATE TABLE tb_direcao OF tp_direcao(
    cpf_diretor SCOPE IS tb_diretor,
    codigo_set WITH ROWID REFERENCES tb_set,
    codigo_filme WITH ROWID REFERENCES tb_filme
);

CREATE TABLE tb_atuacao OF tp_atuacao(
    cpf_ator SCOPE IS tb_ator,
    codigo_filme WITH ROWID REFERENCES tb_flime,
    codigo_duble SCOPE IS tb_duble
);

CREATE TABLE tb_sala OF tp_sala(
    numero PRIMARY KEY,
    ocupado NOT NULL
);

CREATE TABLE tb_cinema OF tp_cinema(
    codigo PRIMARY KEY,
);

CREATE TABLE tb_exibicao OF tp_exibicao(
    filme WITH ROWID REFERENCES tb_filme,
    sala WITH ROWID REFERENCES tb_sala,
    cinema WITH ROWID REFERENCES tb_cinema,
    data NOT NUll,
    ingressos_vendidos NOT NULL,
    preco_ingresso NOT NULL
);