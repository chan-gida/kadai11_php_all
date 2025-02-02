<?php
//ログインチェックの関数を呼び出す
session_start();
require_once('funcs.php');
loginCheck();

$user_id = $_GET['id'];
// var_dump($user_id); // デバッグ用: user_idを確認
$pdo = db_conn();

//２．データ登録SQL作成
$stmt = $pdo->prepare('SELECT * FROM users WHERE id=:id;');
$stmt->bindValue(':id', $user_id, PDO::PARAM_INT);
$status = $stmt->execute();

//３．データ表示
if ($status == false) {
    sql_error($stmt);
} else {
    $row = $stmt->fetch();
}
?>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>データ更新</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        div {
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>

<body>

    <!-- Head[Start] -->
    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header"><a class="navbar-brand" href="select.php">データ一覧</a></div>
            </div>
        </nav>
    </header>
    <!-- Head[End] -->

    <!-- Main[Start] -->
    <form method="POST" action="update.php" enctype="multipart/form-data">
        <div class="jumbotron">
            <fieldset>
                <legend>ユーザー情報更新</legend>
                <label>名前:<input type="text" name="name" value="<?= $row['name'] ?>"></label><br>
                <label>Email:<input type="text" name="email" value="<?= $row['email'] ?>"></label><br>
                <label>PassWord:<input type="text" name="password_hash" value="<?= $row['password_hash'] ?>"></label><br>
                <label>住所:<input type="text" name="address" value="<?= $row['address'] ?>"></label><br>
                <label>家の向き:<select name="balcony_orientation">
                        <option value="">選択してください</option>
                        <option value="N" <?= $row['balcony_orientation'] == 'N' ? 'selected' : '' ?>>北</option>
                        <option value="S" <?= $row['balcony_orientation'] == 'S' ? 'selected' : '' ?>>南</option>
                        <option value="E" <?= $row['balcony_orientation'] == 'E' ? 'selected' : '' ?>>東</option>
                        <option value="W" <?= $row['balcony_orientation'] == 'W' ? 'selected' : '' ?>>西</option><br>
                    </select></label><br>
                <label for="user_image">画像:<input type="file" id="user_image" name="user_image"></label><br>
                <input type="submit" value="送信">
                <input type="hidden" name="user_id" value="<?= $user_id ?>">
            </fieldset>
        </div>
    </form>
    <!-- Main[End] -->

</body>

</html>