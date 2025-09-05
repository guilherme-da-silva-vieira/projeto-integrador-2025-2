# Verbetepédia
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
| mensagem		        | texto		    | sim		    | "OI"	  	                    |
| dataCriacao		    | data/hora	    | sim           | 2025-08-20 14:35		        |
| dataAtualizacao	    | data/hora	    | sim		    | 2025-09-20 14:50              |
