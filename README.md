# Análise de clientes AdventureWorks 2022
Utilizando o banco de dados AdventureWorks, empresa imaginária de fabricação e venda de bicicletas, iniciamos uma análise para entender a evolução dos clientes ao longo do tempo, principalmente entre 2011 e 2013. O objetivo inicial é fazer uma análise exploratória dos clientes que compraram os produtos da AdventureWorks, entendendo onde estão, quanto e o que compram, se houve evolução na base de novos clientes e onde está o maior impacto desta evolução.

Fazendo o download do arquivo AdventureWorksDW2022.bak e anexando-o no SQL Server, é possível executar cada consulta SQL utilizada nesta análise e obter os mesmos resultados apresentados.
<br><br>

## Análise exploratória de dados
<img align="right" width="500"  src="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/imagens/AdventureWorks%20-%20Clientes.png?raw=true">
Iniciamos o projeto entendendo cada objeto, tabela, campo, tipos de dados e relacionamentos do modelo de dados AdventureWorks. Após identificar a tabela de clientes e vendas, desenvolvemos os scripts em SQL para explorar os dados e extrair os primeiros insights durante a análise exploratória de dados. Como por exemplo: <br><br>
- Clientes distintos <br>
- Clientes por país/região <br>
- Produtos mais comprados por estes clientes <br>
- Média de vendas para cada cliente <br>
- E informações pertinentes, como ticket médio, mínimo e máximo.
<br><br>
<a href="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/AdventureWorks%20-%20Clientes.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.


<br><br>

## Análise de Novos Clientes
<img align="left" width="500"  src="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/imagens/AdventureWorks%20-%20Novos%20Clientes.png?raw=true">
Para identificar os novos clientes, primeiro foi necessário agrupar os clientes por ano e mês em uma CTE - Common Table Expression, porém é possível o mesmo resultado utilizando outras técnicas. Na CTE criada com o nome ClientesPrimeiraDataCompra, identificamos qual foi a primeira compra de cada, agrupando novos clientes por ano e mês.
Com os dados agrupados, utilizamos a função de janela LAG para encontrar novos clientes no mesmo mês do ano anterior, permitindo os seguintes cálculos: <br><br>
- Novos Clientes  <br>
- Novos Clientes Ano Anterior<br>
- Variação de novos clientes entre períodos <br>
<br>
<a href="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/AdventureWorks%20-%20Novos%20Clientes.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.
<br><br>
Analisando a variação de novos clientes entre períodos, é possível identificar em 2013, um crescimento mensal muito acima da variação de 2012, sendo necessário aprofundar a análise e identificar de onde está vindo este grande crescimento de novos clientes.

<br><br>
## Variação de novos clientes entre períodos
<img align="right" width="500" height="320" src="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/imagens/AdventureWorks%20-%20Novos%20Clientes%20Delta.png?raw=true">
Analisando a variação de novos clientes, quando comparados com o mesmo período/mês do ano anterior, decidimos agrupar esta variação por região/país para identificar se houve crescimento. 
Filtramos apenas o ano de 2013, pois foi o período com maiores taxas de crescimentos de novos clientes, o que nos permitiu concluir que: <br><br>
- Canadá teve o maior crescimento percentual entre todos os países - aproximadamente 623%
- Estados Unidos teve o maior crescimento cumulativo de clientes - aproximadamente 5050
- Apenas os Estados Unidos tiveram um crescimento maior que todos países da Europa juntos, sendo a América do Norte o principal mercado de atuação da empresa.
- Todos países europeus dobraram ou superaram sua base de novos clientes.
- Austrália, apesar de não ter um crescimento comparável com Europa e América do Norte, aumentou sua base de novoc clientes em quase 50%, sendo um ótimo resultado em 2013.

<br>
<a href="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/AdventureWorks%20-%20Novos%20Clientes%20Delta%202013.sql" target="_blank">Clique aqui</a> e acesse o script SQL no Github.

<br><br>

## Conclusão técnica


<br><br>

## Ferramentas e linguagens utilizadas
<div style="display: inline_block">
    <img align="center" alt="SQL" height="40" width="40" src="https://github.com/BruceFonseca/ferramentas/blob/main/logo.png?raw=true">
    <img align="center" alt="Power BI" height="40" width="40" src="https://github.com/BruceFonseca/ferramentas/blob/main/1200px-New_Power_BI_Logo.svg.png?raw=true">
</div>
