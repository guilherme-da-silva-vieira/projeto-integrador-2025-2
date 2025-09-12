# PAPOTALK
- Projeto do Guilherme no semestre 2025.2
- Chat(Bate papo)

## Problema
- Uma pessoa precisa conversar com a outra
## Tabelas
### Mensagens
| Campo			        | Tipo		    | Obrigatório 	| Exemplo 			            |
|-----------------------|---------------|---------------|-------------------------------|
| id			        | inteiro(pk)	| sim		    | 1	  			                |
| usuarios_id		    | inteiro(fk)	| sim		    | 5	  			                |  
| destinatario_id	    | inteiro(fk)	| sim		    | 32	  			            |
| mensagem		        | texto		    | sim		    | "Oi"	  	                    |
| dataCriacao		    | data/hora	    | sim           | 2025-08-20 14:35		        |
| dataAtualizacao	    | data/hora	    | sim		    | 2025-09-20 14:50              |

### Usuarios
| Campo           | Tipo                          | Obrigatório | Exemplo            |
|-----------------|-------------------------------|-------------|--------------------|
| id              | número                        | sim (único) | 1                  |
| nome            | texto                         | sim         | "Ana Souza"        |
| email           | texto                         | sim (único) | "ana@exemplo.com"  |
| senha_hash      | texto                         | sim         | "$2a$10$..."       |
| papel           | número (0=admin, 1=usuário)   | sim         | 0                  |
| dataCriacao     | data/hora                     | sim         | 2025-08-20 14:30   |
| dataAtualizacao | data/hora                     | sim         | 2025-08-20 15:10   |