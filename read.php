<?php
require_once 'db.php';
$db = new Database;
$conn = $db->getConnection();
$stmt = $conn->query('SELECT id FROM zakaz');
$stmt1 = $conn->query("
    SELECT product.id as 'product', zakaz.id as 'zakaz',
    product.name, zakaz_item.quantity, zakaz_item.rack
    FROM `zakaz_item`
    LEFT JOIN zakaz on zakaz.id = zakaz_id
    LEFT JOIN product on product_id = product.id
    ORDER BY zakaz_item.rack, zakaz.id;
    ");

function getHeader(object $stmt):string
{
    $res = "";
    while ($row = $stmt->fetch(PDO::FETCH_LAZY))
    {
        $res .= $row->id . ", ";
    };
    $res = substr($res, 0, -2);
    return $res;
}

function getRow(object $stmt):string
{
    $res = "";
    while ($row = $stmt->fetch(PDO::FETCH_LAZY))
    {
        $res .= "<tr><td>{$row->product}</td><td>{$row->zakaz}</td><td>{$row->name}</td><td>{$row->quantity}</td><td>{$row->rack}</td></tr>";
    };
    return $res;
}
