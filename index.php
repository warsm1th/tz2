<?php
require_once 'read.php';
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="src/css/style.css">
</head>
<body>
    <div class="container">
        <div class="content">
            <table>
                <caption><b>Страница сборки заказов <?php echo getHeader($stmt); ?></b></caption>
                <thead>
                    <tr>
                        <th>ID Товара</th> <th>Заказ</th> <th>Товар</th> <th>Количество</th> <th>Стеллаж</th>
                    </tr>
                </thead>
                <tbody>
                    <?php echo getRow($stmt1); ?>
                </tbody>
            </table>
        </div>
    </div> 
</body>
</html>