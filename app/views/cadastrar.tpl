<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>cadastro</title>
</head>
<body>
<h2>Casdastro</h2>
<form action="/cadastrar_post" method="post"><!-- action="arquivo.php" method="get" -->
    <label for="campo_nome">Nome:</label>
    <input id="campo_nome" type="text" name="nome" placeholder="digite seu nome" required>

    <br><br>
    <label for="campo_senha">Senha:</label>
    <input id="campo_senha" type="password" name="senha" placeholder="Digite sua senha" required>
    <br><br>

    <label for="campo_email">email:</label>
    <input id="campo_email" type="email" name="email" placeholder="Digite sua email" required>
    <br><br>

    <h3>Tipo:</h3>
    <select name="tipo" required>
        <option selected value="" disabled >selecione um tipo</option>
        <option value="cliente">cliente</option>
        <option value="prestador">prestador</option>
    </select><br><br><br>
    <input type="submit" value="Cadastrar">
    <br><br>
</form>

</body>
</html>