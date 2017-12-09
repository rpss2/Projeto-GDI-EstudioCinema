INSERT INTO tb_roteiro VALUES(tp_roteiro(1, 'A volta dos que não foram'));
INSERT INTO tb_roteiro VALUES(tp_roteiro(2, 'As tranças do rei careca'));
INSERT INTO tb_roteiro VALUES(tp_roteiro(3, 'Meu tio é filho único'));
INSERT INTO tb_roteiro VALUES(tp_roteiro(4, 'Poeira em alto mar'));
INSERT INTO tb_roteiro VALUES(tp_roteiro(5, 'Incendio na caixa dágua'));
INSERT INTO tb_roteiro VALUES(tp_roteiro(6, 'Visões belas, relatos de um cego'));
INSERT INTO tb_roteiro VALUES(tp_roteiro(7, 'A perigosa mordida do cachorro sem dentes'));
INSERT INTO tb_roteiro VALUES(tp_roteiro(8, 'A dança do créu dos vampiros'));
INSERT INTO tb_roteiro VALUES(tp_roteiro(9, 'O cachorro de três patas, foi fazer xixi e capotou'));
INSERT INTO tb_roteiro VALUES(tp_roteiro(10, 'Em terra de saci todo chute é voadora'));

INSERT INTO tb_diretor VALUES(tp_diretor('111.111.111-11', 'Zezinho', to_date('01/01/2000', 'DD/MM/YYYY'), '', 11000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '100', array_tp_telefone(tp_telefone('+5581999990287'), tp_telefone('+5581999450015'), tp_telefone('+5581999450016')), 8, array_supervionados((SELECT REF(D) FROM tb_diretor D WHERE cpf='444.444.444-44'))));
INSERT INTO tb_diretor VALUES(tp_diretor('222.222.222-22', 'Zeca tatu', to_date('01/01/2000', 'DD/MM/YYYY'), '', 12000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '110', array_tp_telefone(tp_telefone('+5581999990287'), tp_telefone('+5581999450015'), tp_telefone('+5581999450016')), 8, array_supervionados((SELECT REF(D) FROM tb_diretor D WHERE cpf='111.111.111-11'))));
INSERT INTO tb_diretor VALUES(tp_diretor('333.333.333-33', 'Tonhao', to_date('01/01/2000', 'DD/MM/YYYY'), '', 13000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '120', array_tp_telefone(tp_telefone('+5581999990287'), tp_telefone('+5581999450015'), tp_telefone('+5581999450016')), 8, null));
INSERT INTO tb_diretor VALUES(tp_diretor('444.444.444-44', 'Eneas', to_date('01/01/2000', 'DD/MM/YYYY'), '', 14000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '130', array_tp_telefone(tp_telefone('+5581999990287'), tp_telefone('+5581999450015'), tp_telefone('+5581999450016')), 8, array_supervionados((SELECT REF(D) FROM tb_diretor D WHERE cpf='333.333.333-33'))));

INSERT INTO tb_ator VALUES(tp_ator('555.555.555-55', 'Folg', to_date('01/01/2000', 'DD/MM/YYYY'), '', 3000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '150', array_tp_telefone(tp_telefone('+5581999990280'), tp_telefone('+5581999450010'), tp_telefone('+5581999450010')), 5));
INSERT INTO tb_ator VALUES(tp_ator('666.666.666-66', 'Preg', to_date('01/01/2000', 'DD/MM/YYYY'), '', 4000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '200', array_tp_telefone(tp_telefone('+5581999990280'), tp_telefone('+5581999450010'), tp_telefone('+5581999450010')), 6));
INSERT INTO tb_ator VALUES(tp_ator('777.777.777-77', 'Rugero', to_date('01/01/2000', 'DD/MM/YYYY'), '', 5000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '210', array_tp_telefone(tp_telefone('+5581999990280'), tp_telefone('+5581999450010'), tp_telefone('+5581999450010')), 7));
INSERT INTO tb_ator VALUES(tp_ator('888.888.888-88', 'Rubero', to_date('01/01/2000', 'DD/MM/YYYY'), '', 6000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '220', array_tp_telefone(tp_telefone('+5581999990280'), tp_telefone('+5581999450010'), tp_telefone('+5581999450010')), 8));

INSERT INTO tb_duble VALUES(tp_duble('100.100.100-10', 'Pip', to_date('01/01/2000', 'DD/MM/YYYY'), '', 3000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '120', array_tp_telefone(tp_telefone('+5581999990281'), tp_telefone('+5581999450011'), tp_telefone('+5581999450011')), '0'));
INSERT INTO tb_duble VALUES(tp_duble('200.1200.200-20', 'Bimba', to_date('01/01/2000', 'DD/MM/YYYY'), '', 3000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '120', array_tp_telefone(tp_telefone('+5581999990281'), tp_telefone('+5581999450011'), tp_telefone('+5581999450011')), '0'));

INSERT INTO tb_roteirista VALUES(tp_roteirista('110.100.200-30', 'Danielzinho', to_date('01/01/2000', 'DD/MM/YYYY'), '', 3000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '110', array_tp_telefone(tp_telefone('+5581999990282'), tp_telefone('+5581999450012'), tp_telefone('+5581999450012')), 'Drama', listaRoteiro((SELECT REF(R) FROM tb_roteiro R WHERE codigo=1))));
INSERT INTO tb_roteirista VALUES(tp_roteirista('980.500.100-00', 'Mané', to_date('01/01/2000', 'DD/MM/YYYY'), '', 3000.00, '54545-420', 'Rua Mario Domingues', 'Recife', '110', array_tp_telefone(tp_telefone('+5581999990282'), tp_telefone('+5581999450012'), tp_telefone('+5581999450012')), 'Ação', listaRoteiro((SELECT REF(R) FROM tb_roteiro R WHERE codigo=3))));

INSERT INTO tb_set VALUES(tp_set(1, '0', '55345-000', 120, 'Rua do mau cheiro', 'Iati'));
INSERT INTO tb_set VALUES(tp_set(2, '0', '57324-000', 120, 'Rua do sol', 'Recife'));

INSERT INTO tb_filme VALUES(tp_filme(1, 'A volta dos que não foram', 2010, 'Suspense', '14', 8, 100000.00, (SELECT REF(R) FROM tb_roteiro R WHERE codigo=1)));
INSERT INTO tb_filme VALUES(tp_filme(2, 'Meu tio é filho único', 2010, 'Suspense', '14', 8, 100000.00, (SELECT REF(R) FROM tb_roteiro R WHERE codigo=3)));

INSERT INTO tb_sala VALUES(tp_sala(1, '0'));
INSERT INTO tb_sala VALUES(tp_sala(2, '0'));
INSERT INTO tb_sala VALUES(tp_sala(3, '0'));
INSERT INTO tb_sala VALUES(tp_sala(4, '0'));
INSERT INTO tb_sala VALUES(tp_sala(5, '0'));

INSERT INTO tb_cinema VALUES(tp_cinema(1, 'Cinema São Luís', '51011-030', 79, 'Rua da Aurora', 'Recife', listaSalas((SELECT REF(S) FROM tb_sala S WHERE numero=2), (SELECT REF(S) FROM tb_sala S WHERE numero=4), (SELECT REF(S) FROM tb_sala S WHERE numero=5))));

INSERT INTO tb_exibicao VALUES(tp_exibicao((SELECT REF(F) FROM tb_filme F WHERE codigo=1), (SELECT REF(S) FROM tb_sala S WHERE numero=2), (SELECT REF(C) FROM tb_cinema C WHERE codigo=1), to_date('08/12/2017', 'DD/MM/YYYY'), 150000, 20));

INSERT INTO tb_direcao VALUES(tp_direcao((SELECT REF(D) FROM tb_diretor D WHERE cpf='444.444.444-44'), (SELECT REF(S) FROM tb_set S WHERE codigo=1), (SELECT REF(F) FROM tb_filme F WHERE codigo=1)));
INSERT INTO tb_direcao VALUES(tp_direcao((SELECT REF(D) FROM tb_diretor D WHERE cpf='111.111.111-11'), (SELECT REF(S) FROM tb_set S WHERE codigo=2), (SELECT REF(F) FROM tb_filme F WHERE codigo=2)));

INSERT INTO tb_atuacao VALUES(tp_atuacao((SELECT REF(A) FROM tb_ator A WHERE cpf='555.555.555-55'), (SELECT REF(F) FROM tb_filme F WHERE codigo=1), (SELECT REF(D) FROM tb_duble D WHERE cpf='100.100.100-10')));

--SELECT

SELECT VALUE(F) VALUE_FILME FROM tb_filme F;

SELECT F.titulo as FILME, DEREF(F.codigo_roteiro) as ROTEIRO FROM tb_filme F;

SELECT * FROM tb_ator;

SELECT * FROM tb_diretor;
SELECT * FROM tb_roteirista;