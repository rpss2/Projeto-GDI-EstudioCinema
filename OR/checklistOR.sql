CREATE OR REPLACE TYPE BODY tp_funcionario AS
FINAL MEMBER FUCNTION getCpf RETURN NUMBER IS
BEGIN
    RETURN cpf;
END;
MEMBER FUCNTION getSalario RETURN NUMBER IS
BEGIN
    RETURN salario;
END;
MEMBER PROCEDURE setSalario(s NUMBER) IS
BEGIN
    salario := s;
END;
MAP MEMBER FUCNTION cpfToInt RETURN INTEGER IS
    a INTEGER := cpf;
BEGIN
    RETURN a;
END;
ORDER MEMBER FUCNTION comparaSalario (X tp_funcionario) RETURN INTEGER IS
BEGIN
    IF SELF.salario < X.salario THEN
        RETURN -1;
    ELSEIF SELF.salario > X.salario THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
END;
/

CREATE OR REPLACE TYPE BODY tp_roteiro AS
CONSTRUCTOR FUCNTION tp_roteiro(c NUMBER, t VARCHAR3(50)) RETURN SELF AS RESULT AS
BEGIN
    SELF.codigo := c;
    SELF.titulo := t;
    RETURN;
END;
/

CREATE OR REPLACE TYPE BODY tp_funcionario IS
OVERRIDING MEMBER PROCEDURE comparaSalario IS
BEGIN
    IF SELF.salario < X.salario THEN
        RETURN -74;
    ELSEIF SELF.salario > X.salario THEN
        RETURN 74;
    ELSE
        RETURN 0;
    END IF;
END;
/

ALTER TYPE tp_funcionario ADD ATTRIBUTE(horasSemanais NUMBER) CASCADE;