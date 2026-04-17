<div class="container my-5">
  <div class="comment-block bg-light p-4 p-md-5 rounded-4 shadow-sm">
    <div class="d-flex flex-column align-items-center text-center">
      <!-- Иконка -->
      <div class="comment-icon bg-primary bg-opacity-10 p-4 rounded-circle mb-4">
        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="#0088cc" viewBox="0 0 24 24">
          <path d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2zm0 18c-4.411 0-8-3.589-8-8s3.589-8 8-8 8 3.589 8 8-3.589 8-8 8z"/>
          <path d="M8 9h8v2H8zm0 4h5v2H8z"/>
        </svg>
      </div>
      
      <!-- Заголовок -->
      <h2 class="fw-bold mb-3">💬 Комментарии</h2>
      
      <!-- Основной текст -->
      <div class="text-muted mb-4" style="max-width: 600px;">
        <p class="mb-3">В связи с новыми требованиями законодательства РФ (ФЗ-152, ФЗ «О рекламе») и ужесточением контроля со стороны РКН, мы <strong>отключили систему комментариев</strong> на сайте.</p>
        
        <p class="mb-3"><span class="badge bg-primary bg-opacity-10 text-primary">🔒 Важно</span> Теперь мы не собираем и не храним ваши персональные данные — даже если очень захотим.</p>
      </div>
      
      <!-- Альтернатива -->
      <div class="bg-white p-4 rounded-3 mb-4 w-100" style="max-width: 500px;">
        <h5 class="fw-semibold mb-3">💡 Хотите обсудить материал?</h5>
        <p class="mb-3">Присоединяйтесь к нашему Telegram-каналу:</p>
        <a href="https://t.me/{comment4tg-channel}" class="d-inline-block mb-3 text-decoration-none">
          <span class="badge bg-primary px-3 py-2 rounded-pill">
            <i class="bi bi-telegram me-2"></i>https://t.me/{comment4tg-channel}
          </span>
        </a>
        <p class="small text-muted mb-0">Нажмите кнопку ниже — и вы сразу попадёте в чат с комментариями</p>
      </div>
      
      <!-- Кнопка или ссылка -->
        <div id="tg-comment-button">
            <button type="button" class="btn btn-primary" id="comment4tg-btn"
                data-comment4tg-title="{title}"
                data-comment4tg-link="{full-link}">
                Обсудить в Telegram
            </button>
        </div>
      
      <!-- Подпись с рандомным текстом -->
      <p class="small text-muted mt-3 mb-0" id="random-phrase"></p>
    </div>
  </div>
</div>

<!-- CSS для кнопки Telegram -->
<style>
  .comment-block {
    background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
    border: 1px solid rgba(0, 0, 0, 0.05);
  }
  
  .comment-icon {
    transition: transform 0.3s ease;
  }
  
  .comment-icon:hover {
    transform: scale(1.1);
  }
  
  .btn-telegram {
    background-color: #0088cc;
    padding: 10px 20px;
    color: white;
    border: none;
    transition: all 0.3s ease;
  }
  
  .btn-telegram:hover {
    background-color: #0077b3;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 136, 204, 0.2);
  }
  
  .btn-telegram:active {
    transform: translateY(0);
  }
  
  /* Стили для индикации загрузки */
  #comment4tg-btn.loading {
    opacity: 0.7;
    cursor: wait;
    pointer-events: none;
  }
  
  .spinner {
    display: inline-block;
    width: 18px;
    height: 18px;
    border: 2px solid rgba(255, 255, 255, 0.3);
    border-top-color: #fff;
    border-radius: 50%;
    animation: spin 0.6s linear infinite;
    margin-right: 8px;
    vertical-align: middle;
  }
  
  @keyframes spin {
    to { transform: rotate(360deg); }
  }
  
  #comment4tg-btn:disabled {
    opacity: 0.7;
    cursor: not-allowed;
  }
</style>

<script>
document.getElementById('comment4tg-btn').addEventListener('click', function () {
    const btn = this;
    const title = btn.getAttribute('data-comment4tg-title');
    const link = btn.getAttribute('data-comment4tg-link');
    const newsId = {news-id}; // Переменная DLE
    
    // Проверяем, не заблокирована ли уже кнопка (чтобы избежать повторных кликов)
    if (btn.disabled) return;
    
    // Сохраняем исходный текст кнопки
    const originalText = btn.innerHTML;
    
    // Блокируем кнопку и показываем индикацию загрузки
    btn.disabled = true;
    btn.classList.add('loading');
    btn.innerHTML = '<span class="spinner"></span> Отправка...';
    
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
            // Успех: заменяем кнопку на ссылку
            document.getElementById('tg-comment-button').innerHTML =
                `<a class="btn-telegram" href="${tgLink}" target="_blank">✅ Комментарии в Telegram</a>`;
        } else {
            // Ошибка: восстанавливаем кнопку
            btn.disabled = false;
            btn.classList.remove('loading');
            btn.innerHTML = originalText;
            alert('Ошибка: ' + (data.error || 'Неизвестная ошибка'));
        }
    })
    .catch(error => {
        // Сетевая ошибка: восстанавливаем кнопку
        btn.disabled = false;
        btn.classList.remove('loading');
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
