# Verbetepédia
- Projeto do Guilherme no semestre 2025.2
- Enciclopédia Virtual

## Problema
- Implementação de um sistema de uma enciclopédia virtual onde é possível visualizar verbetes e se houver algum usuário cadastrado pode fazer alterações e criar verbetes

## Tabelas
### Arquivos
|Campo              | Tipo          | Obrigatório | Exemplo         |
|-------------------|---------------|-------------|-----------------|
| id                | número        | sim         | 2               |
| Usuário_id        | número(fk)    | sim         | 5               | 
| nome              | texto         | sim         | "index.html"    |
| tipo              | numérico      | sim         | 3               |
| caminho           | varchar(255)  | sim         | /img/icone.png  |
| dataCriação       | TIMESTEMP     | sim         | 2025-08-29      |