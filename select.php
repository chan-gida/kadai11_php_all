<?php
// 0. SESSION開始 
session_start();

//１．関数群の読み込み
require_once('funcs.php');


//２．データ登録SQL作成
$pdo = db_conn();
// $stmt = $pdo->prepare('SELECT * FROM users');
$stmt = $pdo->prepare(
    '
SELECT 
    generation.id as id,
    generation.user_id as user_id,
    generation.timestamp as timestamp,
    users.user_image as user_image, 
    users.name as name,
    generation.generated_power as generated_power,
    equipment.solar_capacity as solar_capacity
FROM generation
JOIN users ON generation.user_id = users.id
JOIN equipment ON generation.equipment_id = equipment.id'
);
$status = $stmt->execute();

//３．データ表示
$view = '';
if ($status == false) {
    sql_error($stmt);
} else {
    while ($r = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $view .= '<p>';
        $view .= '<a href="detail.php?id=' . h($r["user_id"]) . '">';
        $view .= h($r['id']) . " " . h($r['timestamp'])  . " " . '<img src = "' . $r['user_image'] . '">' . " " .  h($r['name']) . " / " . h($r['generated_power']) . "kWh (発電量) / " . h($r['solar_capacity']) . "kW (出力)";
        $view .= '</a>';
        $view .= "　";
        $view .= '</p>';
    }
}
?>


<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>データ表示</title>
    <link rel="stylesheet" href="css/range.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        div {
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>

<body id="main">
    <!-- Head[Start] -->
    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.php">データ登録</a>
                </div>
            </div>
        </nav>
    </header>
    <!-- Head[End] -->

    <!-- Main[Start] -->
    <div>
        <div class="container jumbotron"><?= $view ?></div>
    </div>
    <!-- Main[End] -->

</body>

</html>