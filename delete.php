<?php
//セッションスタート・ログインチェック
session_start();
require_once('funcs.php');
loginCheck();

//1,2 ID取得・DB接続
$name = $_GET['name'];
$pdo = db_conn();

//３．データ登録SQL作成
$stmt = $pdo->prepare('DELETE FROM user WHERE name = :name;');
$stmt->bindValue(':name', $name, PDO::PARAM_INT);  //Integer（数値の場合 PDO::PARAM_INT)
$status = $stmt->execute(); //実行

//４．データ登録処理後
if ($status === false) {
    sql_error($stmt);
} else {
    redirect('select.php');
}
