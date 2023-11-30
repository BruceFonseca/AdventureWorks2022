# Análise de clientes AdventureWorks 2022
Utilizando o banco de dados AdventureWorks, empresa imaginária de fabricação e venda de bicicletas, iniciamos uma análise para entender a evolução dos clientes ao longo do tempo, principalmente entre 2011 e 2013. O objetivo inicial é fazer uma análise exploratória dos clientes que compraram os produtos da AdventureWorks, entendendo onde estão, quanto e o que compram, se ouve evolução na base de novos clientes e onde está o maior impacto desta evolução.

<br><br>
## Estatística descritiva
<img align="right" width="500"  src="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/imagens/AdventureWorks%20-%20Clientes.png?raw=true">
Projeto de dashboard devolvido com Power BI para identificar os principais fatores que impactam as vendas da empresa Contoso, permitindo análises dinâmicas e de fácil compartilhamento com os responsáveis pela tomada de decisão.
Principais problemas relatados pelo requisitante: 
- Dificuldade de exportar os dados do sistema atual e manipular as informações em planilhas, macros e tabelas dinâmicas.
- Segmentar dados  por filiais, categorias, produtos e períodos de tempo de uma forma simples, dinâmica e fácil de compartilhar.
- Medir a performance comparando períodos de tempo (YoY, YTD, MoM, MTD).
<br>
<a href="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/AdventureWorks%20-%20Clientes.sql" target="_blank">Clique aqui</a> e acesse o arquivo no Github.


<br><br>

## Análise de Novos Clientes
<img align="left" width="500"  src="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/imagens/AdventureWorks%20-%20Novos%20Clientes.png?raw=true">
Após conversa com a equipe glogal de tecnogia da informação do cliente, fomos informados de um existente data warehouse, contendo todas informações necessárias. Evitando assim a necessidade de importar dados de outras fontes como planilhas, arquivos de textos ou raspagem de dados em sistemas web.

Após conversa com a equipe glogal de tecnogia da informação do cliente, fomos informados de um existente data warehouse, contendo todas informações necessárias. Evitando assim a necessidade de importar dados de outras fontes como planilhas, arquivos de textos ou raspagem de dados em sistemas web.
<br>
<a href="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/AdventureWorks%20-%20Novos%20Clientes.sql" target="_blank">Clique aqui</a> e acesse o arquivo no Github.


<br><br>
## Novos clientes YoY
<img align="right" width="500" height="320" src="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/imagens/AdventureWorks%20-%20Novos%20Clientes%20Delta.png?raw=true">
Identificado a necessidade do cliente, as regras de negócio e a aplicação das mesmas no modelo de dados, iniciamos o desenvolvimento.
Principais medidas desenvolvidas;
 - Custos, Receitas, Lucro, Entregas
 -  Medidas de inteligência temporal para comparação de performance e resultados entre períodos distintos ou cumulativos.
Para organizar as medidas, criamos uma tabela contendo todas as medidas, sempre seguindo a padronização dos nomes.
<br>
<a href="https://github.com/BruceFonseca/AdventureWorks2022/blob/main/AdventureWorks%20-%20Novos%20Clientes%20Delta%202013.sql" target="_blank">Clique aqui</a> e acesse o arquivo no Github.


<br><br>

## Ferramentas e linguagens utilizadas
<div style="display: inline_block">
    <img align="center" alt="SQL" height="40" width="40" src="https://github.com/BruceFonseca/ferramentas/blob/main/logo.png?raw=true">
    <img align="center" alt="Power BI" height="40" width="40" src="https://github.com/BruceFonseca/ferramentas/blob/main/1200px-New_Power_BI_Logo.svg.png?raw=true">
</div>
