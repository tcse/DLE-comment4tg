<div class="my-5">
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
            data-comment4tg-link="{full-link}"
            data-news-id="{news-id}">
            Обсудить в Telegram
        </button>
      </div>
      
      <!-- Блок для отображения статистики -->
      <div id="tg-stats" style="margin-top: 15px; font-size: 0.9em; color: #6c757d; text-align: center; min-height: 30px;">
        <span id="tg-comments-count"></span>
        <button id="tg-refresh-stats" style="background: none; border: none; color: #0088cc; cursor: pointer; margin-left: 8px; font-size: 0.85em; display: none;" title="Обновить статистику">
          🔄
        </button>
      </div>
      
      <!-- НОВЫЙ БЛОК: Последние комментарии (как в Disqus) -->
      <div id="tg-last-comments" style="margin-top: 25px; width: 100%; max-width: 500px; text-align: left; display: none;">
        <div style="font-size: 0.85em; font-weight: 600; color: #495057; border-bottom: 2px solid #0088cc; padding-bottom: 8px; margin-bottom: 15px;">
          📝 Последние комментарии
        </div>
        <div id="tg-comments-list" style="font-size: 0.85em;">
          <div style="text-align: center; color: #999; padding: 20px;">Загрузка комментариев...</div>
        </div>
        <div style="text-align: center; margin-top: 12px;">
          <a href="https://t.me/{comment4tg-channel}" target="_blank" style="font-size: 0.75em; color: #0088cc; text-decoration: none;">
            Все комментарии в Telegram →
          </a>
        </div>
      </div>
      
      <!-- Подпись с рандомным текстом -->
      <p class="small text-muted mt-3 mb-0" id="random-phrase"></p>
    </div>
  </div>
</div>

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
  
  .btn-telegram:active {
    transform: translateY(0);
  }
  
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
  
  #tg-refresh-stats:hover {
    opacity: 0.7;
  }
  
  #tg-refresh-stats:disabled {
    opacity: 0.5;
    cursor: wait;
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
    font-size: 0.85em;
    color: #333;
  }
  
  .tg-comment-date {
    font-size: 0.7em;
    color: #999;
    margin-left: auto;
  }
  
  .tg-comment-text {
    font-size: 0.85em;
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
// Функция для загрузки последних комментариев
function loadLastComments(newsId, limit = 3) {
    const container = document.getElementById('tg-comments-list');
    const parentBlock = document.getElementById('tg-last-comments');
    
    if (!container) return;
    
    container.innerHTML = '<div class="tg-loading">⏳ Загрузка комментариев...</div>';
    
    fetch('/plugins/tcse/comment4tg/ajax/get_comments.php?news_id=' + newsId + '&limit=' + limit)
        .then(response => response.json())
        .then(data => {
            if (data.success && data.comments && data.comments.length > 0) {
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
