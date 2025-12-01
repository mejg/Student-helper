<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
</head>
<body>
<h2>Login</h2>
<!-- para enviar você coloca dentro de form e um destino para ele-->
<form action="/login_post" method="post"><!-- action="arquivo.php" method="get" -->
    <label for="campo_email">email:</label>
    <input id="campo_email" type="email" name="email" placeholder="Digite sua email" required>
    <br><br>

    <label for="campo_senha">Senha:</label>
    <input id="campo_senha" type="password" name="senha" placeholder="Digite sua senha" required>
    <br><br>

    </select><br>
    <input type="submit" value="login">
    <br><br>
    <!--required= deixa o campo obrigatório para envio-->
</form>

</body>
</html>