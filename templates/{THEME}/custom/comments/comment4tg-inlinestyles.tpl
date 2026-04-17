<div style="padding-right: 12px; padding-left: 12px; margin-right: auto; margin-left: auto; max-width: 1320px; margin-top: 3rem; margin-bottom: 3rem;">
  <div style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border: 1px solid rgba(0, 0, 0, 0.05); padding: 1.5rem; border-radius: 1.5rem; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075);">
    <div style="display: flex; flex-direction: column; align-items: center; text-align: center;">
      <!-- Иконка -->
      <div style="background-color: rgba(0, 136, 204, 0.1); padding: 1.5rem; border-radius: 50%; margin-bottom: 1.5rem; transition: transform 0.3s ease;">
        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="#0088cc" viewBox="0 0 24 24">
          <path d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2zm0 18c-4.411 0-8-3.589-8-8s3.589-8 8-8 8 3.589 8 8-3.589 8-8 8z"/>
          <path d="M8 9h8v2H8zm0 4h5v2H8z"/>
        </svg>
      </div>
      
      <!-- Заголовок -->
      <h2 style="font-weight: 700; margin-bottom: 1rem;">💬 Комментарии</h2>
      
      <!-- Основной текст -->
      <div style="color: #6c757d; margin-bottom: 1.5rem; max-width: 600px;">
        <p style="margin-bottom: 1rem;">В связи с новыми требованиями законодательства РФ (ФЗ-152, ФЗ «О рекламе») и ужесточением контроля со стороны РКН, мы <strong>отключили систему комментариев</strong> на сайте.</p>
        
        <p style="margin-bottom: 1rem;"><span style="display: inline-block; background-color: rgba(0, 136, 204, 0.1); color: #0088cc; padding: 0.35em 0.65em; font-size: 0.75em; font-weight: 700; line-height: 1; text-align: center; white-space: nowrap; border-radius: 0.25rem;">🔒 Важно</span> Теперь мы не собираем и не храним ваши персональные данные — даже если очень захотим.</p>
      </div>
      
      <!-- Альтернатива -->
      <div style="background-color: #fff; padding: 1.5rem; border-radius: 0.75rem; margin-bottom: 1.5rem; width: 100%; max-width: 500px;">
        <h5 style="font-weight: 600; margin-bottom: 1rem;">💡 Хотите обсудить материал?</h5>
        <p style="margin-bottom: 1rem;">Присоединяйтесь к нашему Telegram-каналу:</p>
        <a href="https://t.me/{comment4tg-channel}" style="display: inline-block; margin-bottom: 1rem; text-decoration: none;">
          <span style="display: inline-block; background-color: #0088cc; padding: 0.5rem 1rem; color: white; border-radius: 50rem;">
            <i class="bi bi-telegram me-2"></i>https://t.me/{comment4tg-channel}
          </span>
        </a>
        <p style="font-size: 0.875em; color: #6c757d; margin-bottom: 0;">Нажмите кнопку ниже — и вы сразу попадёте в чат с комментариями</p>
      </div>
      
      <!-- Кнопка или ссылка -->
      <div id="tg-comment-button">
        <button type="button" style="display: inline-block; font-weight: 400; line-height: 1.5; color: #fff; text-align: center; text-decoration: none; vertical-align: middle; cursor: pointer; user-select: none; background-color: #0088cc; border: 1px solid transparent; padding: 0.375rem 0.75rem; font-size: 1rem; border-radius: 0.25rem; transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;" id="comment4tg-btn"
          data-comment4tg-title="{title}"
          data-comment4tg-link="{full-link}">
          Обсудить в Telegram
        </button>
      </div>
      
      <!-- Подпись с рандомным текстом -->
      <p style="font-size: 0.875em; color: #6c757d; margin-top: 1rem; margin-bottom: 0;" id="random-phrase"></p>
    </div>
  </div>
</div>

<style>
  /* Анимация спиннера */
  @keyframes spin {
    to { transform: rotate(360deg); }
  }
</style>

<script>
document.getElementById('comment4tg-btn').addEventListener('click', function () {
    const btn = this;
    const title = btn.getAttribute('data-comment4tg-title');
    const link = btn.getAttribute('data-comment4tg-link');
    const newsId = {news-id}; // Переменная DLE
    
    // Проверяем, не заблокирована ли уже кнопка
    if (btn.disabled) return;
    
    // Сохраняем исходный текст и стили
    const originalText = btn.innerHTML;
    const originalStyle = btn.style.cssText;
    
    // Блокируем кнопку и меняем внешний вид
    btn.disabled = true;
    btn.style.opacity = '0.7';
    btn.style.cursor = 'wait';
    
    // Добавляем спиннер и меняем текст
    btn.innerHTML = '<span style="display: inline-block; width: 16px; height: 16px; border: 2px solid rgba(255,255,255,0.3); border-top-color: #fff; border-radius: 50%; animation: spin 0.6s linear infinite; margin-right: 8px; vertical-align: middle;"></span> Отправка...';
    
    // Отправляем запрос
    fetch('/engine/ajax/telegram_comment.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `news_id=${newsId}&title=${encodeURIComponent(title)}&link=${encodeURIComponent(link)}`
    })
    .then(response => response.json())
    .then(data => {
        if (data.message_id) {
            const tgLink = `https://t.me/{comment4tg-channel}/${data.message_id}?comment=1`;
            document.getElementById('tg-comment-button').innerHTML =
                `<a style="background-color: #0088cc; padding: 10px 20px; color: white; border: none; transition: all 0.3s ease; display: inline-block; text-decoration: none; border-radius: 0.25rem;" href="${tgLink}" target="_blank">✅ Комментарии в Telegram</a>`;
        } else {
            // Восстанавливаем кнопку при ошибке
            btn.disabled = false;
            btn.style.cssText = originalStyle;
            btn.innerHTML = originalText;
            alert('Ошибка: ' + (data.error || 'Неизвестная ошибка'));
        }
    })
    .catch(error => {
        // Восстанавливаем кнопку при сетевой ошибке
        btn.disabled = false;
        btn.style.cssText = originalStyle;
        btn.innerHTML = originalText;
        alert('Ошибка соединения. Пожалуйста, попробуйте позже.');
        console.error('Ошибка:', error);
    });
});
</script>

<!-- JavaScript для рандомной фразы -->
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const phrases = [
      "🚀 Добро пожаловать в дивный новый мир!",
      "🌐 Приятного общения в условиях цифровой гигиены!",
      "🔄 Комментарии эволюционировали — теперь они в Telegram!",
      "🗣️ Свобода слова осталась, но переместилась в мессенджеры.",
      "📲 Обсуждайте безопасно в Telegram!",
      "🔐 Ваши комментарии теперь под тройной защитой... от вас же самих!",
      "💬 Чат в Telegram — как комментарии, но с энд-ту-энд шифрованием",
      "🌍 В этом году комментарии мигрировали на юг — в Telegram",
      "📜 Мы выполнили 152-ФЗ так, что даже комментарии удивились",
      "🤖 Наши модераторы теперь алгоритмы (но мы их тоже отключили)",
      "🚫 Комментарии временно недоступны... навсегда",
      "💻 Цифровая экономика: сначала исчезли наличные, теперь — комментарии",
      "🛡️ Мы так защитили ваши данные, что даже вы к ним не достучитесь",
      "📅 2024: год, когда комментарии стали элитным клубом Telegram",
      "🔮 Мы предсказали будущее — оно без комментариев на сайте",
      "🇷🇺 Патриотично — обсуждать в Telegram (по версии РКН)",
      "💼 Новый бизнес-модель: сначала отключаем комментарии, потом продаём VPN",
      "📉 Курс рубля упал, а требования к комментариям — выросли",
      "🏛️ Госдума рекомендует: дышите глубже и комментируйте в Telegram",
      "🛑 Стоп-лист: вода, огонь, комментарии на сайтах",
      "📜 Конституция гарантирует право на... ой, нет, это было в прошлой редакции",
      "⚖️ Весы Фемиды: с одной стороны — ФЗ-152, с другой — ваше мнение",
      "🕵️‍♂️ Ваши комментарии теперь охраняются так же, как гостайна",
      "🌐 Интернет сузился до размеров мессенджера (но это не точно)",
      "🗳️ Выбор есть: молчать в комментариях или говорить в Telegram",
      "⚡ Быстрее, выше, сильнее... и без комментариев на сайте!",
      "🧩 Потерянный кусочек интернета найден в Telegram",
      "🎭 Театр комментариев закрылся на цифровой ремонт",
      "📡 Сигнал комментариев теперь ловят только в мессенджерах",
      "🔄 Обновление системы: комментарии заменены на эмодзи в Telegram"
    ];
    
    const randomPhraseElement = document.getElementById('random-phrase');
    const randomIndex = Math.floor(Math.random() * phrases.length);
    randomPhraseElement.textContent = phrases[randomIndex];
  });
</script>
