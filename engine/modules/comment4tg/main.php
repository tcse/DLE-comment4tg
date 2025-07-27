<?php
if (!defined('DATALIFEENGINE') || !defined('LOGGED_IN')) {
    die('Hacking attempt!');
}
include_once (DLEPlugins::Check(ENGINE_DIR . '/data/comment4tg.php'));


?>

<div class="panel panel-default">
    <div class="panel-heading">
        Настройки плагина comment4tg
    </div>
    <div class="panel-body">
        <form action="" method="post" class="systemsettings">
            <h4>Пересылка сообщений от Telegram бота на email</h4>
            <div class="row">
                <div class="col-xs-12 col-md-7">
                    <h5>Bot Token</h5>
                    <div class="text-muted text-size-small hidden-xs">
                        <p>Необходим для работы с Telegram</p>
                        <p>Создайте нового бота у <a href="https://t.me/BotFather" target="_blank">@BotFather</a> или получите у него же токен для ранее созданных ботов.</p>
                    </div>
                </div>
                <div class="col-xs-12 col-md-5">
                    <input dir="auto" type="text" class="form-control" name="botToken" value="<?php echo $comment4tgConfig['comment4tg_TOKEN']; ?>">
                </div>

                <div class="col-xs-12 col-md-7">
                    <h5>Admin Channel</h5>
                    <div class="text-muted text-size-small hidden-xs">
                        <p>Имя канала в который будет публиковать Telegram бот, этот параметр позволяет боту принимать сообщения от вас и пересылать их в указанный канал</p>
                        <p>Бот должен быть адмиистратором канала, чтобы уметь создавать сообщения для комментированиями пользователями ваших новостей.</p>
                    </div>
                </div>
                <div class="col-xs-12 col-md-5">
                    <input dir="auto" type="text" class="form-control" name="adminChannel" value="<?php echo $comment4tgConfig['comment4tg_CHANNEL']; ?>">
                </div>

            </div>
            <div style="margin:30px 0;">
                <button type="submit" class="btn bg-teal btn-raised position-left legitRipple"><i class="fa fa-floppy-o position-left"></i>Сохранить</button>
            </div>
        </form>
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        Установка плагина
    </div>
    <div class="panel-body">
        <h4>1.</h4>
        <p>
            В файл шаблона публикации целиком <strong>fullstory.tpl</strong> в удобном месте подключите файл с кнопкой комментариев<br>
            <code>{include file="custom/comments/comment4tg.tpl"}</code>
        </p>
        <h4>2.</h4>
        <p>
            Редактирование текстов происходит в файле шаблона <strong>custom/comments/comment4tg.tpl</strong>.
        </p>

        <h4>Плагин интеграции комментариев сайта на CMS DataLife Engine с мессенджером Telegram, позволяющий:</h4>
        <p>
            ✅ Отправлять публикации сайта в Telegram-канал по клику на кнопку.<br>
            ✅ Автоматически создавать тему обсуждения в Telegram.<br>
            ✅ Связывать комментарии в Telegram с конкретной новостью на сайте.<br>
            ✅ Показывать ссылку на комментарии в Telegram, если они уже созданы.
        </p>
    </div>
</div>

<!-- <div class="panel panel-default">
    <div class="panel-heading">
        Веб-хук и управление ботом
    </div>
    <div class="panel-body">
        <?php
        $token = $comment4tgConfig['comment4tg_TOKEN'] ?: 'YOUR_BOT_TOKEN_HERE';
        $webhook_url = "https://"  . $_SERVER['HTTP_HOST'] . "/plugins/tcse/comment4tg/bot.php";
        ?>
        <p>
            <strong>API:</strong> https://api.telegram.org/bot<?php echo $comment4tgConfig['comment4tg_TOKEN']; ?>/getUpdates <br>
            <a href="https://api.telegram.org/bot<?php echo $comment4tgConfig['comment4tg_TOKEN']; ?>/getUpdates" class="btn btn-primary" target="_blank">Открыть</a>
        </p>
        <p>
            <strong>Информация о боте:</strong><br>
            <code>https://api.telegram.org/bot<?php echo $comment4tgConfig['comment4tg_TOKEN']; ?>/getMe</code>
            <a href="https://api.telegram.org/bot<?php echo $comment4tgConfig['comment4tg_TOKEN']; ?>/getMe" class="btn btn-warning" target="_blank">Запросить</a>
        </p>
        <p>
            <strong>Установить веб-хук:</strong><br>
            <code>https://api.telegram.org/bot<?php echo $comment4tgConfig['comment4tg_TOKEN']; ?>/setWebhook?url=<?=$webhook_url?></code>
            <a href="https://api.telegram.org/bot<?php echo $comment4tgConfig['comment4tg_TOKEN']; ?>/setWebhook?url=<?=$webhook_url?>" class="btn btn-info" target="_blank">Установить</a>
        </p>
        <p>
            <strong>Удалить веб-хук:</strong><br>
            <code>https://api.telegram.org/bot<?php echo $comment4tgConfig['comment4tg_TOKEN']; ?>/deleteWebhook</code>
            <a href="https://api.telegram.org/bot<?php echo $comment4tgConfig['comment4tg_TOKEN']; ?>/deleteWebhook" class="btn btn-danger" target="_blank">Удалить</a>
        </p>
        


    </div>
</div> -->