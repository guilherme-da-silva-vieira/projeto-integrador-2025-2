DROP TABLE IF EXISTS Usuarios;
DROP TABLE IF EXISTS Mensagens;

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    
    -- 0 = Administrador, 1 = Usuário Padrão
    papel SMALLINT NOT NULL CHECK (papel IN (0, 1)),
    
    dataCriacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    dataAtualizacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE Mensagens (
    id SERIAL PRIMARY KEY,
    usuarios_id INTEGER NOT NULL,
    destinatario_id INTEGER NOT NULL,
    mensagem TEXT NOT NULL,
    dataCriacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    dataAtualizacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),

    -- Define a relação de chave estrangeira com a tabela de usuários
    CONSTRAINT fk_usuario
        FOREIGN KEY(usuarios_id)
        REFERENCES usuarios(id),

    CONSTRAINT fk_destinatario
        FOREIGN KEY(destinatario_id)
        REFERENCES usuarios(id)
);