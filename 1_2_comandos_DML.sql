-- Resposta do Comando SQL item a)
-- Inserção de um Estado
-- A tabela MC_ESTADO só tem as colunas SG_ESTADO e NM_ESTADO
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO)
VALUES ('SP', 'São Paulo');

-- Inserção de uma Cidade
-- A tabela MC_CIDADE utiliza IDENTITY para a chave primária
INSERT INTO MC_CIDADE (SG_ESTADO, NM_CIDADE, NR_DDD)
VALUES ('SP', 'Campinas', 19);

-- Inserção de um Bairro
-- A tabela MC_BAIRRO utiliza IDENTITY para a chave primária
INSERT INTO MC_BAIRRO (CD_CIDADE, NM_BAIRRO)
VALUES (1, 'Centro'); -- Supondo que a CD_CIDADE de Campinas seja 1

-- Inserção de um Logradouro
-- A tabela MC_LOGRADOURO utiliza IDENTITY para a chave primária
INSERT INTO MC_LOGRADOURO (CD_BAIRRO, NM_LOGRADOURO, NR_CEP)
VALUES (1, 'Rua General Osório', 13010070); -- Supondo que o CD_BAIRRO seja 1

-- Inserção de um Cliente (genérico)
-- A tabela MC_CLIENTE utiliza IDENTITY para a chave primária
INSERT INTO MC_CLIENTE (NM_CLIENTE, QT_ESTRELAS, VL_MEDIO_COMPRA, ST_CLIENTE, DS_EMAIL, NR_TELEFONE, NM_LOGIN, DS_SENHA)
VALUES ('Maria Silva', 4, 150.75, 'A', 'maria.silva@email.com', '19987654321', 'mariasilva', 'senha123');

-- Inserção de um Cliente Pessoa Física
-- A tabela MC_CLI_FISICA recebe o NR_CLIENTE do cliente genérico
INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, NR_CPF)
VALUES (1, TO_DATE('15/05/1990', 'DD/MM/YYYY'), 'F', 'Feminino', '111.222.333-44');

-- Inserção de um Cliente (genérico)
INSERT INTO MC_CLIENTE (NM_CLIENTE, QT_ESTRELAS, VL_MEDIO_COMPRA, ST_CLIENTE, DS_EMAIL, NR_TELEFONE, NM_LOGIN, DS_SENHA)
VALUES ('Tecno Soluções Ltda', 5, 2500.00, 'A', 'contato@tecnosolucoes.com.br', '1132109876', 'tecnosolucoes', 'senha456');

-- Inserção de um Cliente Pessoa Jurídica
INSERT INTO MC_CLI_JURIDICA (NR_CLIENTE, DT_FUNDACAO, NR_CNPJ)
VALUES (2, TO_DATE('10/01/2015', 'DD/MM/YYYY'), '00.111.222/0001-33');

-- Resposta do Comando SQL item b)
-- Tentativa de inserção de um cliente com login duplicado
INSERT INTO MC_CLIENTE (NM_CLIENTE, ST_CLIENTE, DS_EMAIL, NM_LOGIN, DS_SENHA)
VALUES ('João Almeida', 'A', 'joao.almeida@email.com', 'joaoalmeida', 'senha789');

-- Resposta do Comando SQL item c)
UPDATE MC_FUNCIONARIO
SET DS_CARGO = 'Analista de Sistemas Sênior',
    VL_SALARIO = VL_SALARIO * 1.12
WHERE CD_FUNCIONARIO = 1;

-- Resposta do Comando SQL item c)
UPDATE MC_FUNCIONARIO
SET DS_CARGO = 'Analista de Sistemas Sênior',
    VL_SALARIO = VL_SALARIO * 1.12
WHERE CD_FUNCIONARIO = 1;

-- Resposta do Comando SQL item e)
-- Tentativa de exclusão de um estado que possui cidade associada
DELETE FROM MC_ESTADO WHERE SG_ESTADO = 'SP';

-- Resposta do Comando SQL item f)
-- Tentativa de atualização do status de um produto
UPDATE MC_PRODUTO SET ST_PRODUTO = 'X' WHERE CD_PRODUTO = 1;

-- Resposta do Comando SQL item g)
COMMIT;

-- Comando SQL item a)
SELECT
    C.CD_CATEGORIA AS "Código da Categoria",
    C.DS_CATEGORIA AS "Descrição da Categoria",
    P.CD_PRODUTO AS "Código do Produto",
    P.DS_PRODUTO AS "Descrição do Produto",
    P.VL_UNITARIO AS "Valor Unitário",
    P.TP_EMBALAGEM AS "Tipo de Embalagem",
    P.VL_PERC_LUCRO AS "Percentual de Lucro"
FROM
    MC_CATEGORIA_PROD C
LEFT JOIN
    MC_PRODUTO P ON C.CD_CATEGORIA = P.CD_CATEGORIA
ORDER BY
    C.DS_CATEGORIA ASC,
    P.DS_PRODUTO ASC;
    
    -- Comando SQL item b)
SELECT
    C.NR_CLIENTE AS "Código do Cliente",
    C.NM_CLIENTE AS "Nome do Cliente",
    C.DS_EMAIL AS "E-mail",
    C.NR_TELEFONE AS "Telefone",
    C.NM_LOGIN AS "Login",
    TO_CHAR(CF.DT_NASCIMENTO, 'DD-MM-YYYY') AS "Data de Nascimento",
    TO_CHAR(CF.DT_NASCIMENTO, 'Day') AS "Dia da Semana de Nascimento",
    TRUNC(MONTHS_BETWEEN(SYSDATE, CF.DT_NASCIMENTO) / 12) AS "Anos de Vida",
    CF.FL_SEXO_BIOLOGICO AS "Sexo Biológico",
    CF.NR_CPF AS "CPF"
FROM
    MC_CLIENTE C
INNER JOIN
    MC_CLI_FISICA CF ON C.NR_CLIENTE = CF.NR_CLIENTE;
    
    -- Comando SQL item c)
SELECT
    V.CD_PRODUTO AS "Código do Produto",
    P.DS_PRODUTO AS "Nome do Produto",
    V.DT_VISUALIZACAO AS "Data de Visualização",
    V.NR_HORA_VISUALIZACAO AS "Hora de Visualização"
FROM
    MC_SGV_VISUALIZACAO_VIDEO V
INNER JOIN
    MC_PRODUTO P ON V.CD_PRODUTO = P.CD_PRODUTO
ORDER BY
    V.DT_VISUALIZACAO DESC, V.NR_HORA_VISUALIZACAO DESC;
