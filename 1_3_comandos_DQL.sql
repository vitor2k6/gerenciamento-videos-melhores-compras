
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
