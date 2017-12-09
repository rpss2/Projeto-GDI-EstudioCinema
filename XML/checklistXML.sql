CREATE TABLE funcionario(
    id NUMBER(5) NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    descricao SYS.XMLTYPE,
    CONSTRAINT pk_func PRIMARY KEY (id)
);

INSERT INTO funcionario(id, nome, descricao) VALUES(1, 'Zeca', sys.XMLTYPE.createXML(<Perfil num="001"><formacao>Ensino Medio</formacao> <salario>2000</salario></Perfil>));
INSERT INTO funcionario(id, nome, descricao) VALUES(2, 'Zezinho', sys.XMLTYPE.createXML(<Perfil num="002"><formacao>Ensino Medio</formacao> <salario>2500</salario></Perfil>));
INSERT INTO funcionario(id, nome, descricao) VALUES(3, 'Danielzinho', sys.XMLTYPE.createXML(<Perfil num="003"><formacao>Ensino Fundamental</formacao> <salario>1000</salario></Perfil>));
INSERT INTO funcionario(id, nome, descricao) VALUES(4, 'Mane', sys.XMLTYPE.createXML(<Perfil num="004"><formacao>Ensino Superior</formacao> <salario>4000</salario></Perfil>));
INSERT INTO funcionario(id, nome, descricao) VALUES(5, 'Enea', sys.XMLTYPE.createXML(<Perfil num="005"><formacao>Mestrado</formacao> <salario>7000</salario></Perfil>));

SELECT F.descricao.extract('/Perfil/salario/text()').getStringVal() "salario" FROM funcionario F;

UPDATE funcionario SET descricao = Sys.XMLTYPE.createXML(<Perfil num="004"><formacao>Ensino Superior</formacao> <salario>4500</salario></Perfil>) WHERE id = 2;

DELETE FROM funcionario f WHERE f.descricao.extract('//formacao/text()').getStringVal() = 'Ensino Fundamental';

SELECT SYS_XMLGEN(descricao) as XML FROM funcionario;

-- Uso do DBMS_XMLGEN
set serveroutput on;
declare
ctx dbms_xmlgen.ctxhandle;
result clob;
begin

ctx := dbms_xmlgen.newContext('select * from funcionario');

DBMS_XMLGEN.setRowsetTag(ctx, 'EstudioCinema');
DBMS_XMLGEN.setRowTag(ctx,'funcionario');

result := dbms_xmlgen.getXML(ctx);

dbms_output.put_line(result);

dbms_xmlgen.closeContext(ctx);
end;
/