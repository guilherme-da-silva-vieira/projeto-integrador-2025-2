import express from 'express';

const app = express();

app.get("/", (req,res) =>
    {
        res.send("Olá mundo!!!");
    }
);

app.listen(3000, () =>
    console.log('Servidor sendo executado em http://localhost:3000')
);

