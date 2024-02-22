/* SINTAXE
	
    DELIMITER $$
    CREATE FUNCTION nome_funcao(param1 tipo1, param2 tipo2...)
	RETURNS tipo DETERMINISTIC
    BEGIN
		instrucoes1;
        instrucoes2;
        instrucoes3;
        RETURN expressao
    END $$
    
    DELIMITER ;
*/


-- ----------------------------------------------------------------------------------------------------------------

-- EX1: Hello usuário
DELIMITER $$
CREATE FUNCTION fn_boas_vindas(nome VARCHAR(30))
RETURNS VARCHAR(30) DETERMINISTIC # QUAL TIPO DE DADO SERÁ RETORNADO
BEGIN
	RETURN CONCAT('Ola ', nome, ', seja bem-vindo!');
END $$
DELIMITER ;

-- Chamando a função
SELECT fn_boas_vindas('Murilo')

-- ----------------------------------------------------------------------------------------------------------------

-- EX2: Crie uma função chamada fn_faturamento, que receba como parâmetros de entrada
-- o preco (DECIMAL) e a quantidade (INT), e retorne o faturamento da venda, 
-- representado pela multiplicação entre preço e quantidade

DELIMITER $$
CREATE FUNCTION fn_faturamento(preco DECIMAL(10, 2), qtd INT)
RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
	RETURN preco * qtd;
END $$
DELIMITER ;

-- Chamando a função
SELECT fn_faturamento(10.99, 100)

-- ----------------------------------------------------------------------------------------------------------------

-- EX3: Crie uma função que substitua de um texto os caracteres com acentos para caracteres sem acentos
-- Exemplo: 'á', por 'a', 'à' por 'a', e assim sucessivamente)

DELIMITER $$
CREATE FUNCTION fn_substituir_caracteres(texto VARCHAR(100))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	SET 
		texto = REPLACE(texto, 'é', 'e'),
        texto = REPLACE(texto, 'ç', 'c'),
        texto = REPLACE(texto, 'à', 'a'),
        texto = REPLACE(texto, 'ç', 'c'),
        texto = REPLACE(texto, 'á', 'a');
	RETURN texto;
END $$
DELIMITER ;

SELECT fn_substituir_caracteres('O café à tarde é a minha paixão, pois me faz sentir renovado e feliz')

-- ----------------------------------------------------------------------------------------------------------------

-- Crie uma função que calcule a área de um círculo com base no raio fornecido.
DELIMITER $$
CREATE FUNCTION fn_area_circulo(raio DECIMAL(5, 2))
RETURNS DECIMAL(5, 2) DETERMINISTIC
BEGIN
	RETURN POWER(raio, 2) * PI();
END $$
DELIMITER ;

SELECT fn_area_circulo(5)

-- ----------------------------------------------------------------------------------------------------------------

-- Desenvolva uma função que verifique se um número é par ou ímpar e retorne uma mensagem apropriada.
DELIMITER $$
CREATE FUNCTION fn_par_impar(num TINYINT)
RETURNS VARCHAR(5) DETERMINISTIC
BEGIN
    IF num % 2 = 0 THEN
		RETURN 'PAR';
	ELSE 
		RETURN 'IMPAR';
	END IF;
END $$
DELIMITER ;

DROP FUNCTION fn_par_impar;
SELECT fn_par_impar(3)

-- ----------------------------------------------------------------------------------------------------------------


/*






Crie uma função que receba uma data de nascimento e retorne a idade da pessoa.

Escreva uma função que receba um número inteiro e retorne sua representação por extenso em português.

Desenvolva uma função que calcule o valor total de uma compra, considerando o preço unitário e a quantidade de itens.

Crie uma função que receba uma string e retorne a mesma string invertida.

Escreva uma função que verifique se uma string é um palíndromo.

Desenvolva uma função que receba dois números e retorne o máximo entre eles.

*/





