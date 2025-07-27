<?php
if (!defined('DATALIFEENGINE') || !defined('LOGGED_IN')) {
    die('Hacking attempt!');
}

define('MODULE_DIR', ENGINE_DIR . '/modules/comment4tg');

// Обработка формы
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $botToken = trim($_POST['botToken']);
    $adminChannel = trim($_POST['adminChannel']);

    // Содержимое нового файла конфига
    $configContent = "<?php\n";
    $configContent .= "/**\n";
    $configContent .= " * Конфиг модуля comment4tg\n";
    $configContent .= " * @var array\n";
    $configContent .= " */\n";
    $configContent .= "\$comment4tgConfig = [\n";
    $configContent .= "    'comment4tg_TOKEN' => '" . addslashes($botToken) . "',\n";
    $configContent .= "    'comment4tg_CHANNEL' => '" . addslashes($adminChannel) . "',\n";
    $configContent .= "];\n";

    // Путь к файлу конфига
    $configFile = ENGINE_DIR . '/data/comment4tg.php';

    // Записываем новый конфиг
    if (file_put_contents($configFile, $configContent)) {
        echo '<div class="alert alert-success">Настройки успешно сохранены.</div>';
    } else {
        echo '<div class="alert alert-danger">Ошибка при записи конфига. Проверьте права доступа к файлу.</div>';
    }
}

echoheader('comment4tg', 'comment4tg - Комментарии публикация DLE в Telegram');
include MODULE_DIR . '/main.php';
echofooter();