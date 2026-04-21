<!-- ======================================================
     comment4tg.tpl - Комментарии в Telegram
     Версия: 2.0 (Полностью самодостаточная, без Bootstrap)
     ====================================================== -->

<div style="margin-top: 3rem; margin-bottom: 3rem;">
  <div style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border: 1px solid rgba(0, 0, 0, 0.05); border-radius: 1rem; box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); padding: 1.5rem;">
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
        <p style="margin-bottom: 1rem;"><span style="display: inline-block; background-color: rgba(0, 136, 204, 0.1); color: #0088cc; padding: 0.35rem 0.65rem; font-size: 0.75rem; font-weight: 700; border-radius: 0.25rem;">🔒 Важно</span> Теперь мы не собираем и не храним ваши персональные данные — даже если очень захотим.</p>
      </div>
      
      <!-- Альтернатива -->
      <div style="background-color: #fff; padding: 1.5rem; border-radius: 0.75rem; margin-bottom: 1.5rem; width: 100%; max-width: 500px;">
        <h5 style="font-weight: 600; margin-bottom: 1rem;">💡 Хотите обсудить материал?</h5>
        <p style="margin-bottom: 1rem;">Присоединяйтесь к нашему Telegram-каналу:</p>
        <a href="https://t.me/{comment4tg-channel}" style="display: inline-block; margin-bottom: 1rem; text-decoration: none;">
          <span style="display: inline-block; background-color: #0088cc; padding: 0.5rem 1rem; color: white; border-radius: 50rem;">
            https://t.me/{comment4tg-channel}
          </span>
        </a>
        <p style="font-size: 0.875rem; color: #6c757d; margin-bottom: 0;">Нажмите кнопку ниже — и вы сразу попадёте в чат с комментариями</p>
      </div>
      
      <!-- Кнопка или ссылка -->
      <div id="tg-comment-button">
        <button type="button" id="comment4tg-btn"
            data-comment4tg-title="{title}"
            data-comment4tg-link="{full-link}"
            data-news-id="{news-id}"
            style="display: inline-block; font-weight: 400; line-height: 1.5; color: #fff; text-align: center; text-decoration: none; vertical-align: middle; cursor: pointer; background-color: #0088cc; border: 1px solid transparent; padding: 0.5rem 1rem; font-size: 1rem; border-radius: 0.25rem; transition: all 0.3s ease;">
            Обсудить в Telegram
        </button>
      </div>
      
      <!-- Блок для отображения статистики -->
      <div id="tg-stats" style="margin-top: 15px; font-size: 0.9rem; color: #6c757d; text-align: center; min-height: 30px;">
        <span id="tg-comments-count"></span>
        <button id="tg-refresh-stats" style="background: none; border: none; color: #0088cc; cursor: pointer; margin-left: 8px; font-size: 0.85rem; display: none;" title="Обновить статистику">
          🔄
        </button>
      </div>
      
      <!-- Блок: Последние комментарии (как в Disqus) -->
      <div id="tg-last-comments" style="margin-top: 25px; width: 100%; max-width: 500px; text-align: left; display: none;">
        <div style="font-size: 0.85rem; font-weight: 600; color: #495057; border-bottom: 2px solid #0088cc; padding-bottom: 8px; margin-bottom: 15px;">
          📝 Последние комментарии
        </div>
        <div id="tg-comments-list" style="font-size: 0.85rem;">
          <div style="text-align: center; color: #999; padding: 20px;">Загрузка комментариев...</div>
        </div>
        <div style="text-align: center; margin-top: 12px;">
          <a id="tg-all-comments-link" href="https://t.me/{comment4tg-channel}" target="_blank" style="font-size: 0.75rem; color: #0088cc; text-decoration: none;">
            Все комментарии в Telegram →
          </a>
        </div>
      </div>
      
      <!-- Подпись с рандомным текстом -->
      <p id="random-phrase" style="font-size: 0.875rem; color: #6c757d; margin-top: 1rem; margin-bottom: 0;"></p>
      
    </div>
  </div>
</div>

<style>
  /* Анимация спиннера */
  @keyframes spin {
    to { transform: rotate(360deg); }
  }
  
  /* Стили для кнопки после замены */
  .btn-telegram {
    background-color: #0088cc;
    padding: 10px 20px;
    color: white;
    border: none;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-block;
    border-radius: 0.25rem;
  }
  
  .btn-telegram:hover {
    background-color: #0077b3;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 136, 204, 0.2);
    color: white;
  }
  
  /* Стили для загрузки кнопки */
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
  
  /* Стили для комментариев */
  .tg-comment-item {
    margin-bottom: 15px;
    padding: 10px 12px;
    background: #f8f9fa;
    border-radius: 12px;
    transition: background 0.2s ease;
  }
  
  .tg-comment-item:hover {
    background: #f1f3f5;
  }
  
  .tg-comment-header {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 6px;
  }
  
  .tg-comment-avatar {
    width: 28px;
    height: 28px;
    background: linear-gradient(135deg, #0088cc, #005f8a);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    font-weight: bold;
  }
  
  .tg-comment-username {
    font-weight: 600;
    font-size: 0.85rem;
    color: #333;
  }
  
  .tg-comment-date {
    font-size: 0.7rem;
    color: #999;
    margin-left: auto;
  }
  
  .tg-comment-text {
    font-size: 0.85rem;
    line-height: 1.4;
    color: #495057;
    word-break: break-word;
  }
  
  .tg-comment-text a {
    color: #0088cc;
    text-decoration: none;
  }
  
  .tg-comment-text a:hover {
    text-decoration: underline;
  }
  
  .tg-loading {
    text-align: center;
    color: #999;
    padding: 20px;
  }
</style>

<script>
// Глобальная переменная для хранения ID сообщения в канале
let currentTelegramMessageId = null;

// Функция обновления ссылки "Все комментарии"
function updateTelegramLink(telegramMessageId) {
    const allCommentsLink = document.getElementById('tg-all-comments-link');
    if (allCommentsLink && telegramMessageId) {
        const channel = '{comment4tg-channel}';
        allCommentsLink.href = `https://t.me/${channel}/${telegramMessageId}?comment=1`;
        allCommentsLink.target = '_blank';
    }
}

// Функция для загрузки последних комментариев
function loadLastComments(newsId, limit = 3) {
    const container = document.getElementById('tg-comments-list');
    const parentBlock = document.getElementById('tg-last-comments');
    
    if (!container) return;
    
    container.innerHTML = '<div class="tg-loading">⏳ Загрузка комментариев...</div>';
    
    fetch('/plugins/tcse/comment4tg/ajax/get_comments.php?news_id=' + newsId + '&limit=' + limit)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Сохраняем telegram_message_id для ссылки
                if (data.telegram_message_id) {
                    currentTelegramMessageId = data.telegram_message_id;
                    updateTelegramLink(currentTelegramMessageId);
                }
                
                if (data.comments && data.comments.length > 0) {
                    let html = '';
                    data.comments.forEach(comment => {
                        const avatar = comment.username ? comment.username.charAt(0).toUpperCase() : 'A';
                        const text = comment.text.substring(0, 200) + (comment.text.length > 200 ? '...' : '');
                        html += `
                            <div class="tg-comment-item">
                                <div class="tg-comment-header">
                                    <div class="tg-comment-avatar">${escapeHtml(avatar)}</div>
                                    <div class="tg-comment-username">${escapeHtml(comment.username || 'anonymous')}</div>
                                    <div class="tg-comment-date">${comment.date_formatted || ''}</div>
                                </div>
                                <div class="tg-comment-text">${formatTelegramText(escapeHtml(text))}</div>
                            </div>
                        `;
                    });
                    container.innerHTML = html;
                    if (parentBlock) parentBlock.style.display = 'block';
                } else {
                    container.innerHTML = '<div style="text-align: center; color: #999; padding: 20px;">💬 Пока нет комментариев. Будьте первым!</div>';
                    if (parentBlock) parentBlock.style.display = 'block';
                }
            }
        })
        .catch(error => {
            console.error('Error loading comments:', error);
            container.innerHTML = '<div style="text-align: center; color: #999; padding: 20px;">⚠️ Не удалось загрузить комментарии</div>';
        });
}

// Функция для загрузки статистики
function loadTelegramStats(newsId) {
    const countSpan = document.getElementById('tg-comments-count');
    const refreshBtn = document.getElementById('tg-refresh-stats');
    
    if (!countSpan) return;
    
    countSpan.innerHTML = '⏳ Загрузка...';
    
    fetch('/plugins/tcse/comment4tg/ajax/stats.php?news_id=' + newsId)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const count = data.comments_count;
                if (count === 0) {
                    countSpan.innerHTML = '💬 Пока нет комментариев в Telegram';
                } else if (count === 1) {
                    countSpan.innerHTML = '💬 1 комментарий в Telegram';
                } else if (count <= 4) {
                    countSpan.innerHTML = '💬 ' + count + ' комментария в Telegram';
                } else {
                    countSpan.innerHTML = '💬 ' + count + ' комментариев в Telegram';
                }
                if (refreshBtn) refreshBtn.style.display = 'inline-block';
                
                // Если есть комментарии, загружаем их
                if (count > 0) {
                    loadLastComments(newsId);
                }
            } else {
                countSpan.innerHTML = '💬 Статистика недоступна';
                if (refreshBtn) refreshBtn.style.display = 'inline-block';
            }
        })
        .catch(error => {
            console.error('Error loading stats:', error);
            countSpan.innerHTML = '💬 Не удалось загрузить статистику';
            if (refreshBtn) refreshBtn.style.display = 'inline-block';
        });
}

// Функция для синхронизации счётчика
function syncTelegramCount(newsId) {
    const refreshBtn = document.getElementById('tg-refresh-stats');
    const originalText = refreshBtn.innerHTML;
    
    refreshBtn.disabled = true;
    refreshBtn.innerHTML = '⏳';
    
    fetch('/plugins/tcse/comment4tg/ajax/sync_count.php?news_id=' + newsId)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const count = data.comments_count;
                const countSpan = document.getElementById('tg-comments-count');
                if (count === 0) {
                    countSpan.innerHTML = '💬 Пока нет комментариев в Telegram';
                } else if (count === 1) {
                    countSpan.innerHTML = '💬 1 комментарий в Telegram';
                } else if (count <= 4) {
                    countSpan.innerHTML = '💬 ' + count + ' комментария в Telegram';
                } else {
                    countSpan.innerHTML = '💬 ' + count + ' комментариев в Telegram';
                }
                // Обновляем список комментариев
                if (count > 0) {
                    loadLastComments(newsId);
                } else {
                    const parentBlock = document.getElementById('tg-last-comments');
                    if (parentBlock) parentBlock.style.display = 'none';
                }
            } else {
                alert('Не удалось обновить статистику: ' + (data.error || 'Unknown error'));
            }
        })
        .catch(error => {
            console.error('Error syncing count:', error);
            alert('Ошибка соединения при обновлении статистики');
        })
        .finally(() => {
            refreshBtn.disabled = false;
            refreshBtn.innerHTML = '🔄';
        });
}

// Вспомогательные функции
function escapeHtml(text) {
    if (!text) return '';
    return text
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#39;');
}

function formatTelegramText(text) {
    if (!text) return '';
    // Преобразуем ссылки
    return text.replace(/(https?:\/\/[^\s]+)/g, '<a href="$1" target="_blank" rel="nofollow">$1</a>');
}

// Основной код при загрузке страницы
document.addEventListener('DOMContentLoaded', function() {
    const btn = document.getElementById('comment4tg-btn');
    const newsId = btn ? btn.getAttribute('data-news-id') : null;
    
    if (newsId && newsId !== '0') {
        loadTelegramStats(newsId);
        
        const refreshBtn = document.getElementById('tg-refresh-stats');
        if (refreshBtn) {
            refreshBtn.addEventListener('click', function(e) {
                e.preventDefault();
                syncTelegramCount(newsId);
            });
        }
    }
    
    // Обработчик основной кнопки
    if (btn) {
        btn.addEventListener('click', function () {
            const title = btn.getAttribute('data-comment4tg-title');
            const link = btn.getAttribute('data-comment4tg-link');
            const currentNewsId = btn.getAttribute('data-news-id');
            
            if (btn.disabled) return;
            
            const originalText = btn.innerHTML;
            btn.disabled = true;
            btn.classList.add('loading');
            btn.innerHTML = '<span class="spinner"></span> Отправка...';
            
            fetch('/plugins/tcse/comment4tg/telegram_comment.php', {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: `news_id=${currentNewsId}&title=${encodeURIComponent(title)}&link=${encodeURIComponent(link)}`
            })
            .then(response => response.json())
            .then(data => {
                if (data.message_id) {
                    const tgLink = `https://t.me/{comment4tg-channel}/${data.message_id}?comment=1`;
                    document.getElementById('tg-comment-button').innerHTML = 
                        `<a class="btn-telegram" href="${tgLink}" target="_blank">✅ Комментарии в Telegram</a>`;
                    const statsBlock = document.getElementById('tg-stats');
                    if (statsBlock) statsBlock.style.display = 'none';
                } else {
                    btn.disabled = false;
                    btn.classList.remove('loading');
                    btn.innerHTML = originalText;
                    alert('Ошибка: ' + (data.error || 'Неизвестная ошибка'));
                }
            })
            .catch(error => {
                btn.disabled = false;
                btn.classList.remove('loading');
                btn.innerHTML = originalText;
                alert('Ошибка соединения. Пожалуйста, попробуйте позже.');
                console.error('Ошибка:', error);
            });
        });
    }
});
</script>

<!-- Рандомные фразы -->
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
      "🤖 Наши модераторы теперь алгоритмы (но мы их тоже отключили)"
    ];
    
    const randomPhraseElement = document.getElementById('random-phrase');
    if (randomPhraseElement) {
      const randomIndex = Math.floor(Math.random() * phrases.length);
      randomPhraseElement.textContent = phrases[randomIndex];
    }
  });
</script>
