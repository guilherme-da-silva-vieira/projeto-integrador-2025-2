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

### SQL

```sql
-- ========= REMOÇÃO DAS TABELAS (SE EXISTIREM) =========
-- Remove as tabelas na ordem inversa de dependência para evitar erros.
DROP TABLE IF EXISTS Mensagens;
DROP TABLE IF EXISTS Usuarios;


-- ========= CRIAÇÃO DAS TABELAS =========

-- Tabela de Usuários
-- Armazena as informações de cada usuário do sistema.
CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha_hash TEXT NOT NULL,
    papel SMALLINT NOT NULL, -- 0 para admin, 1 para usuário padrão
    dataCriacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    dataAtualizacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

-- Tabela de Mensagens
-- Armazena as mensagens trocadas entre os usuários.
CREATE TABLE Mensagens (
    id SERIAL PRIMARY KEY,
    usuarios_id INTEGER NOT NULL,
    destinatario_id INTEGER NOT NULL,
    mensagem TEXT NOT NULL,
    dataCriacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    dataAtualizacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),

    -- Define a relação de chave estrangeira com a tabela de usuários
    CONSTRAINT fk_remetente
        FOREIGN KEY(usuarios_id)
        REFERENCES Usuarios(id),

    CONSTRAINT fk_destinatario
        FOREIGN KEY(destinatario_id)
        REFERENCES Usuarios(id)
);


-- ========= INSERÇÃO DE DADOS (POPULANDO O BANCO) =========

-- Inserindo dados na tabela: Usuarios
-- Nota: Os hashes de senha são apenas exemplos ilustrativos.
INSERT INTO Usuarios (nome, email, senha_hash, papel) VALUES
('Ana Souza', 'ana.souza@exemplo.com', '$2b$12$EfgHIjKlMnOpQrStUvWxYz.A1b2c3d4e5f6g7h8i9j0k', 0), -- Admin (ID: 1)
('Carlos Lima', 'carlos.lima@exemplo.com', '$2b$12$LmnopqRsTuVwXyZaBcDeFg.H1i2j3k4l5m6n7o8p9q0r', 1), -- Usuário (ID: 2)
('Beatriz Costa', 'bia.costa@exemplo.com', '$2b$12$GhIjKlMnOwQrStUvWxYz.A1b2c3d4e5f6g7h8i9j0k', 1),  -- Usuário (ID: 3)
('Ricardo Mendes', 'ricardo.mendes@exemplo.com', '$2b$12$AbcdeFgHiJkLmNoPqRsTu.V1w2x3y4z5a6b7c8d9e0f', 1),-- Usuário (ID: 4)
('Fernanda Moreira', 'fernanda.m@exemplo.com', '$2b$12$QrStUvWxYzAbcdeFgHiJk.L1m2n3o4p5q6r7s8t9u0v', 1); -- Usuário (ID: 5)


-- Inserindo dados na tabela: Mensagens
-- Simula uma troca de mensagens entre os usuários criados acima.
INSERT INTO Mensagens (usuarios_id, destinatario_id, mensagem) VALUES
(2, 3, 'Olá Beatriz, tudo bem? Podemos marcar nossa reunião para amanhã?'), -- Carlos para Beatriz
(3, 2, 'Oi, Carlos! Tudo bem por aqui. Amanhã está ótimo para mim. Qual horário?'), -- Beatriz para Carlos
(4, 5, 'Fernanda, você conseguiu ver o relatório que enviei mais cedo?'), -- Ricardo para Fernanda
(5, 4, 'Oi Ricardo, vi sim! Já estou analisando e te dou um retorno até o fim da tarde.'), -- Fernanda para Ricardo
(2, 4, 'Ricardo, bom dia. Poderia me dar um feedback sobre a proposta de projeto, por favor?'), -- Carlos para Ricardo
(3, 5, 'Amiga, vamos almoçar juntas hoje?'), -- Beatriz para Fernanda
(5, 3, 'Vamos sim! Me encontra no restaurante às 12:30.'); -- Fernanda para Beatriz

