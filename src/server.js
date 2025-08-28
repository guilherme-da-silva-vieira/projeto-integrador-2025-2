import express from 'express';

const app = express();

app.get("/", (req,res) =>
    {
        res.send("Olá mundo!!!");
    }
);

app.get("/html",(req,res) => {
    res.send("<h1>Teste HTML</h1>");
}

);

app.listen(3000, () =>
    console.log('Servidor sendo executado em http://localhost:3000')
);

