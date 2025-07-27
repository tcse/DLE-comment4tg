<?php
/**
 * ======================================================
 * Comment for Telegram - by TCSE-cms.com & DeepSeek.com
 * v0.1 (MVP версия)
 * ======================================================
 * 
 * Плагин интеграции комментариев сайта на CMS DataLife Engine
 * с мессенджером Telegram, позволяющий:
 * 
 * ✅ Отправлять публикации сайта в Telegram-канал по клику на кнопку.
 * ✅ Автоматически создавать тему обсуждения в Telegram.
 * ✅ Связывать комментарии в Telegram с конкретной новостью на сайте.
 * ✅ Показывать ссылку на комментарии в Telegram, если они уже созданы.
 *
 * Удобно для:
 * - Замены стандартной системы комментариев DLE.
 * - Активного взаимодействия с аудиторией через Telegram.
 * - Вовлечения подписчиков в обсуждение публикаций.
 *
 * ------------------------------------------------------
 * Автор: Vitaly V Chuyakov (TCSE Web Studio)
 * Дата: 2025-07-19
 * Сайт: https://tcse-cms.com/ 
 * Telegram канал: https://t.me/tcsecms 
 * Версия: v0.1 (MVP)
 * Требуется DLE: 13.x и выше
 * ------------------------------------------------------
 * 
 * Лицензия: Copyright (c) 2025 Vitaly V Chuyakov
 * Этот код защищен авторскими правами.
 * Использование или модификация разрешены только в рамках
 * соглашения с правообладателем.
 * 
 * Файл: /engine/ajax/telegram_comment.php
 * 
 * Описание работы:
 * 
 * 1. При клике на кнопку "Комментировать в Telegram" на странице статьи:
 *    - Отправляется AJAX-запрос к этому файлу.
 *    - Проверяется, было ли уже создано обсуждение для этой статьи.
 * 
 * 2. Если обсуждения ещё нет:
 *    - Сообщение с заголовком и ссылкой на статью отправляется в Telegram-канал.
 *    - Telegram возвращает `message_id` созданного сообщения.
 *    - `message_id` сохраняется в базе данных DLE.
 * 
 * 3. Если обсуждение уже создано:
 *    - Клиенту возвращается существующий `message_id`.
 *    - На странице отображается прямая ссылка на обсуждение в Telegram.
 * 
 * 4. Поддерживает работу через:
 *    - Telegram-каналы.
 *    - Telegram-группы с включенной функцией комментариев.
 * 
 * 5. Для настройки используйте:
 *    - Конфигурационный файл `/engine/data/comment4tg.php`
 *    - Где укажите токен Telegram-бота и идентификатор канала.
 * 
 * Требования:
 * - Telegram-бот (создаётся через @BotFather)
 * - Бот должен быть администратором канала
 * - Включён JavaScript на стороне клиента
 * - Настроенная таблица в БД: `{prefix}_comments_telegram`
 * 
 * ======================================================
 */

// Возвращаем JSON
header('Content-Type: application/json');

// Проверяем, что скрипт запущен в контексте DLE (необязательно, если standalone, но полезно)
if (!defined('DATALIFEENGINE')) {
// Пример инициализации DLE (если вызывается не из DLE, раскомментируйте и настройте путь)
 define('DATALIFEENGINE', true);
 define('ROOT_DIR', $_SERVER['DOCUMENT_ROOT']);
 define('ENGINE_DIR', ROOT_DIR . '/engine');
 require_once ENGINE_DIR . '/classes/mysql.php';
 require_once ENGINE_DIR . '/data/dbconfig.php';
 require_once ENGINE_DIR . '/modules/functions.php';
}

// Подключаем стандартный объект базы данных DLE
global $db;

// Подключаем конфиг плагина из DLE
include_once($_SERVER['DOCUMENT_ROOT'] . '/engine/data/comment4tg.php');
$token   = $comment4tgConfig['comment4tg_TOKEN'];
$channel = $comment4tgConfig['comment4tg_CHANNEL'];

$news_id = intval($_POST['news_id']);
$title   = htmlspecialchars($_POST['title']);
$link    = $_POST['link'];

// Без отдельного подключения, всё работает через $db
// Используйте PREFIX для корректного префикса таблиц

$table = PREFIX . "_comments_telegram";

// Проверяем, уже есть ли запись
$result = $db->super_query("SELECT telegram_message_id FROM {$table} WHERE news_id='{$news_id}'");

if ($result && !empty($result['telegram_message_id'])) {
    // Уже есть message_id
    echo json_encode(['message_id' => $result['telegram_message_id']]);
    exit;
}

// Отправляем новость в Telegram
$message = "<b>$title</b>\n\n$link";
$url = "https://api.telegram.org/bot$token/sendMessage?chat_id=$channel&text=" . urlencode($message) . "&parse_mode=html";

$response = json_decode(file_get_contents($url), true);

if ($response['ok']) {
    $message_id = intval($response['result']['message_id']);
    // Сохраняем в БД через стандартный объект DLE
    $db->query("INSERT INTO {$table} (news_id, telegram_message_id) VALUES ('{$news_id}', '{$message_id}')");

    echo json_encode(['message_id' => $message_id]);
} else {
    echo json_encode(['error' => 'Telegram error', 'details' => $response]);
}
?>
