--A diferen�a entre o  RANK e o DENSE_RANK � que o segundo n�o salta valores ap�s classifica��es repetidas.
--usando ROW_NUMBER
--NTILE DIVIDE EM GRUPOS OS RESULTADO NESSE EXEMPO DIVIDE EM 4 GRUPOS
SELECT ROW_NUMBER() OVER (ORDER BY a.SALARY DESC) Sequencia,
        a.FIRST_NAME, 
        a.SALARY,
        NTILE(4) OVER (ORDER BY a.SALARY DESC) Faixa
FROM    hr.employees a
ORDER  BY a.SALARY DESC;

-- usando RANK()

select RANK() OVER(ORDER BY a.SALARY desc) classificacao,
       a.FIRST_NAME,
       a.SALARY
       from hr.employees a
order by a.FIRST_NAME ASC;

-- usando RANK() SE ELE ENPATA EXEMPLO NA SEGUNDA POSI��O ENT�O SE A 2 E A 3 POSI��O EST�O OCUPADAS ELE N�O VAI MOSTRAR
-- ATERCEIRA POSI��O
-- eDENSE_RANK() A OS DOIS EMPATADOS NA SEGUNDA POSI��O E LOGO EM SEGUIDA A TERCEIRA OP��O(N�O SALTA POSI��ES)
select RANK() OVER(ORDER BY a.SALARY desc) classif_geral,
       DENSE_RANK() OVER(ORDER BY a.SALARY desc) classif_densa,
       a.FIRST_NAME,
       a.SALARY,
       a.JOB_ID 
    from hr.employees a
order by a.salary desc;

--
select RANK() OVER(ORDER BY a.SALARY desc) classif_geral1,
       RANK() OVER(partition by  a.JOB_ID  ORDER BY a.SALARY desc) classif_geral2,
       a.FIRST_NAME,
       a.SALARY,
       a.JOB_ID 
    from hr.employees a
order by a.salary desc;

--
select RANK() OVER(ORDER BY a.SALARY desc) classif_geral,
       RANK() OVER(partition by  a.JOB_ID  ORDER BY a.SALARY desc) classif_densa,
       a.FIRST_NAME,
       a.SALARY,
       a.JOB_ID 
    from hr.employees a
order by a.salary desc;


--usando NTILE

SELECT   a.job_title,
         a.MAX_SALARY, NTILE(5) OVER (ORDER BY a.MAX_SALARY DESC) Faixa
FROM    hr.JOBS a
ORDER  BY a.MAX_SALARY DESC;


--usando NTILE

SELECT   a.FIRST_NAME, 
         a.SALARY, NTILE(4) OVER (ORDER BY a.SALARY DESC) Faixa
FROM    hr.employees a
ORDER  BY a.SALARY DESC;




