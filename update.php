<?php
//1. POSTデータ取得
$name   = $_POST['name'];
$email  = $_POST['email'];
$password_hash = $_POST['password_hash'];
$address   = $_POST['address'];
$balcony_orientation  = $_POST['balcony_orientation'];
$user_id = $_POST['user_id'];
$user_image = '';
if (isset($_FILES['user_image'])) {
    // アップロードする画像をリネームする準備
    $upload_file = $_FILES['user_image']['tmp_name'];
    $extension = pathinfo($_FILES['user_image']['name'], PATHINFO_EXTENSION);
    $new_name = uniqid() . '.' . $extension;

    // image_pathを確認
    $image_path = 'img/' . $new_name;

    // move_uploaded_file()で、一時的に保管されているファイルをimage_pathに移動させる。
    if (move_uploaded_file($upload_file, $image_path)) {
        $user_image = $image_path;
    } else {
        echo 'アップロードに失敗しました';
    }
}

// // デバッグ用: POSTデータを確認
// var_dump($_POST);
// echo '<pre>';
// var_dump($_FILES['user_image']);
// var_dump($upload_file);
// var_dump($extension);
// var_dump($new_name);
// var_dump($image_path);
// var_dump($user_image);
// var_dump($user_id);
// echo '</pre>';
// exit();



//2. DB接続します
require_once('funcs.php');
$pdo = db_conn();
// try {
//     $pdo = db_conn();
//     echo "DB接続に成功しました。";
// } catch (PDOException $e) {
//     echo "DB接続に失敗しました: " . $e->getMessage();
//     exit();
// }


//３．データ登録SQL作成
$stmt = $pdo->prepare('UPDATE users SET name=:name,email=:email,password_hash=:password_hash,address=:address,balcony_orientation=:balcony_orientation, user_image=:user_image WHERE id=:user_id;');
$stmt->bindValue(':name',   $name,   PDO::PARAM_STR);
$stmt->bindValue(':email',  $email,  PDO::PARAM_STR);
$stmt->bindValue(':password_hash',  $password_hash, PDO::PARAM_STR);
$stmt->bindValue(':address', $address, PDO::PARAM_STR);
$stmt->bindValue(':balcony_orientation', $balcony_orientation, PDO::PARAM_STR);
$stmt->bindValue(':user_id', $user_id, PDO::PARAM_INT);
$stmt->bindValue(':user_image', $user_image, PDO::PARAM_STR);
$status = $stmt->execute(); //実行

//４．データ登録処理後
if ($status === false) {
    sql_error($stmt);
} else {
    redirect('select.php');
}
