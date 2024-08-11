# Desafio de Projeto DIO - Construindo seu Primeiro Projeto Lógico de Banco de Dados (ECOMMERCE)

## Descrição do Projeto

Este projeto foi desenvolvido como parte do Bootcamp Database Experience na plataforma [Digital Innovation One (DIO)](https://www.dio.me/). O desafio proposto foi replicar e refinar a modelagem de um banco de dados lógico para um cenário de e-commerce, aplicando boas práticas de design e garantindo a integridade e consistência dos dados.

## Objetivo

O objetivo principal deste projeto foi criar um modelo lógico de banco de dados capaz de suportar as operações essenciais de um sistema de e-commerce, como o gerenciamento de produtos, fornecedores, clientes, pedidos, pagamentos e entregas. O foco foi garantir que o esquema de banco de dados atenda às necessidades do negócio, seguindo as regras de mapeamento de entidades e relacionamentos, bem como as constraints de chaves primárias e estrangeiras.

## Estrutura do Projeto

### Modelo Lógico do Banco de Dados

O modelo foi construído levando em consideração os seguintes requisitos:

- **Cliente PJ e PF**: Uma conta pode representar tanto uma pessoa física (PF) quanto uma pessoa jurídica (PJ), mas nunca ambas ao mesmo tempo. Isso foi implementado por meio de uma estrutura que diferencia claramente esses dois tipos de clientes.

- **Pagamento**: Um pedido pode ser associado a várias formas de pagamento. O modelo foi projetado para permitir múltiplas entradas de pagamento para um único pedido, oferecendo flexibilidade no processo de transação.

- **Entrega**: O processo de entrega é detalhado com informações sobre o status da entrega e o código de rastreamento, garantindo que os pedidos possam ser monitorados de forma eficiente até o destino final.

### Componentes Principais

1. **Produto**: Armazena informações sobre os produtos disponíveis para venda, incluindo categoria, descrição, valor e código do produto.

2. **Fornecedor**: Contém dados dos fornecedores, como razão social, CNPJ e outras informações relevantes para a gestão de produtos no estoque.

3. **Cliente**: Registra informações sobre os clientes, diferenciando entre pessoas físicas e jurídicas.

4. **Pedido**: Mantém registros dos pedidos feitos pelos clientes, incluindo status, descrição do produto e a conta associada.

5. **Pagamento**: Relaciona os diferentes métodos de pagamento utilizados em cada pedido, permitindo a associação de múltiplas formas de pagamento a um único pedido.

6. **Entrega**: Acompanha o processo de entrega dos pedidos, com detalhes sobre o status da entrega e o código de rastreamento.

7. **Estoque**: Gere o controle do estoque, vinculando os produtos aos seus respectivos locais de armazenamento.

8. **Relacionamentos**: Todos os relacionamentos entre as entidades foram cuidadosamente mapeados, garantindo a integridade referencial do banco de dados.

### Script SQL

Um script SQL foi desenvolvido para criar o esquema do banco de dados, incluindo a definição de tabelas, chaves primárias, estrangeiras e constraints. O script também inclui comandos para a persistência de dados, permitindo a realização de testes com base nos cenários propostos.

### Queries SQL

Foram elaboradas queries SQL para realizar operações complexas no banco de dados, incluindo:

- **Recuperações Simples** com SELECT Statement
- **Filtros** com WHERE Statement
- **Geração de Atributos Derivados**
- **Ordenação de Dados** com ORDER BY
- **Filtragem de Grupos** com HAVING Statement
- **Junções entre Tabelas** para fornecer uma perspectiva mais completa dos dados

### Repositório no GitHub

Todo o projeto, incluindo o modelo lógico, o script SQL e as queries, foi adicionado a este repositório para avaliação. No README, estão disponíveis a descrição completa do projeto, instruções para rodar o script, e exemplos das queries utilizadas.

## Conclusão

Este projeto demonstra a capacidade de modelar um banco de dados lógico robusto e funcional para um sistema de e-commerce, atendendo às necessidades do negócio e às boas práticas de design de bancos de dados.
