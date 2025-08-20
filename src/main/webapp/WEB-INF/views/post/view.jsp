<!DOCTYPE html>

<html lang="ko">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Music is My Life 🎶</title>

    <style>

        /* 기본 스타일 */

        body {

            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

            background-color: #f0f2f5;

            color: #333;

            line-height: 1.6;

            margin: 0;

            padding: 0;

        }



        /* 헤더 스타일 */

        header {

            background-color: #ff9800;

            color: #fff;

            padding: 20px 0;

            text-align: center;

            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

        }



        header h1 {

            margin: 0;

            font-size: 2.5rem;

        }



        /* 게시판 컨테이너 */

        .board-container {

            max-width: 900px;

            margin: 30px auto;

            padding: 20px;

            background-color: #fff;

            border-radius: 12px;

            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);

        }

        

        /* 게시물 목록 스타일 */

        .post-list {

            margin-top: 20px;

        }

        

        .post-list h2 {

            font-size: 1.8rem;

            color: #ff9800;

            border-bottom: 2px solid #ddd;

            padding-bottom: 10px;

            margin-bottom: 20px;

        }



        /* 각 게시물 (카드) 스타일 */

        .post-card {

            display: block;

            background-color: #fafafa;

            border: 1px solid #e0e0e0;

            border-radius: 8px;

            padding: 20px;

            margin-bottom: 15px;

            transition: transform 0.2s, box-shadow 0.2s;

            text-decoration: none;

            color: inherit;

        }



        .post-card:hover {

            transform: translateY(-5px);

            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);

        }



        .post-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 10px;

        }



        .post-title {

            font-size: 1.2rem;

            font-weight: bold;

            color: #333;

            margin: 0;

        }

        

        /* 감정 태그 스타일 */

        .emotion-tag {

            padding: 4px 8px;

            border-radius: 4px;

            font-size: 0.8rem;

            font-weight: bold;

            color: #fff;

        }



        .emotion-tag.happy { background-color: #ffc107; }

        .emotion-tag.sad { background-color: #64b5f6; }

        .emotion-tag.angry { background-color: #e57373; }

        .emotion-tag.calm { background-color: #81c784; }



        .post-meta {

            font-size: 0.9rem;

            color: #888;

        }

        

        .post-meta span:not(:last-child) {

            margin-right: 15px;

        }

        

        .post-content {

            margin: 10px 0 0;

            color: #555;

            white-space: nowrap;

            overflow: hidden;

            text-overflow: ellipsis;

        }

        

        .post-card-content {

            display: block;

            text-decoration: none;

            color: inherit;

        }



        .post-card-content:hover {

            color: inherit;

        }



        /* 수정/삭제 버튼 컨테이너 */

        .post-actions {

            text-align: right;

            margin-top: 10px;

        }

        

        .post-actions .edit-button,

        .post-actions .delete-button {

            padding: 5px 10px;

            border: none;

            border-radius: 5px;

            cursor: pointer;

            font-size: 0.9rem;

        }



        .post-actions .edit-button {

            background-color: #ff9800;

            color: white;

        }



        .post-actions .delete-button {

            background-color: #f44336;

            color: white;

        }



        /* 글쓰기 버튼 */

        .write-button-container {

            text-align: right;

            margin-top: 20px;

        }



        .write-button {

            background-color: #ff9800;

            color: white;

            padding: 10px 20px;

            border: none;

            border-radius: 5px;

            font-size: 1rem;

            cursor: pointer;

            transition: background-color 0.3s;

        }



        .write-button:hover {

            background-color: #f57c00;

        }



        /* 글쓰기 폼 스타일 */

        .write-form-container {

            display: none;

            margin-top: 20px;

            padding: 20px;

            border: 1px solid #ddd;

            border-radius: 8px;

            background-color: #f9f9f9;

        }

        

        .write-form-container h2 {

            margin-top: 0;

            color: #ff9800;

        }

        

        .write-form-container input,

        .write-form-container select,

        .write-form-container textarea {

            width: 100%;

            padding: 10px;

            margin-bottom: 15px;

            border: 1px solid #ccc;

            border-radius: 5px;

            box-sizing: border-box;

        }

        

        .write-form-buttons {

            text-align: right;

        }

        

        .write-form-buttons button {

            padding: 10px 20px;

            border: none;

            border-radius: 5px;

            font-size: 1rem;

            cursor: pointer;

        }

        

        .write-form-buttons .submit-button {

            background-color: #ff9800;

            color: #fff;

        }

        

        .write-form-buttons .cancel-button {

            background-color: #f44336;

            color: #fff;

        }

    </style>

</head>

<body>



    <header>

        <h1>Music is My Life 🎶</h1>

        <p>Community</p>

        <p>오늘의 기분을 음악으로 표현해 보세요!</p>

    </header>



    <div class="board-container">

        <div class="write-button-container">

            <button id="show-form-button" class="write-button">글쓰기</button>

        </div>



        <div id="write-form" class="write-form-container">

            <h2>새 게시글 작성</h2>

            <form id="post-form">

                <div>

                    <label for="post-title">제목:</label>

                    <input type="text" id="post-title" required>

                </div>

                <div>

                    <label for="post-author">작성자:</label>

                    <input type="text" id="post-author" required>

                </div>

                <div>

                    <label for="post-emotion">감정:</label>

                    <select id="post-emotion" required>

                        <option value="happy">행복</option>

                        <option value="sad">슬픔</option>

                        <option value="angry">화남</option>

                        <option value="calm">평온</option>

                    </select>

                </div>

                <div>

                    <label for="post-link">유튜브 링크:</label>

                    <input type="url" id="post-link" required>

                </div>

                <div>

                    <label for="post-content">내용:</label>

                    <textarea id="post-content" rows="4" required></textarea>

                </div>

                <div class="write-form-buttons">

                    <button type="submit" class="submit-button">작성 완료</button>

                    <button type="button" id="cancel-button" class="cancel-button">취소</button>

                </div>

            </form>

        </div>



        <div class="post-list">

            <h2>전체 게시글</h2>

            

            <div class="post-card" data-post-id="1">

                <a href="https://www.youtube.com/watch?v=gdZLi9oWNZg" class="post-card-content" target="_blank">

                    <div class="post-header">

                        <h3 class="post-title">Dynamite - 방탄소년단</h3>

                        <span class="emotion-tag happy">행복</span>

                    </div>

                    <div class="post-meta">

                        <span>작성자: 김행복</span>

                        <span>2025.08.20</span>

                        <span>조회수: 1254</span>

                    </div>

                    <p class="post-content">경쾌하고 신나는 리듬으로 듣기만 해도 기분이 좋아지는 곡입니다. 춤추고 싶어지는 에너지를 느껴보세요!</p>

                </a>

                <div class="post-actions">

                    <button class="edit-button">수정</button>

                    <button class="delete-button">삭제</button>

                </div>

            </div>

            

            <div class="post-card" data-post-id="2">

                <a href="https://www.youtube.com/watch?v=FjI1T5B3f2c" class="post-card-content" target="_blank">

                    <div class="post-header">

                        <h3 class="post-title">어떻게 이별까지 사랑하겠어, 널 사랑하는 거지 - AKMU</h3>

                        <span class="emotion-tag sad">슬픔</span>

                    </div>

                    <div class="post-meta">

                        <span>작성자: 박슬픔</span>

                        <span>2025.08.19</span>

                        <span>조회수: 980</span>

                    </div>

                    <p class="post-content">이별의 슬픔과 그리움을 담담하게 풀어내는 가사가 인상적입니다. 감정을 차분히 정리하고 싶을 때 추천해요.</p>

                </a>

                <div class="post-actions">

                    <button class="edit-button">수정</button>

                    <button class="delete-button">삭제</button>

                </div>

            </div>



            <div class="post-card" data-post-id="3">

                <a href="https://www.youtube.com/watch?v=IHNzOHi8sJs" class="post-card-content" target="_blank">

                    <div class="post-header">

                        <h3 class="post-title">뚜두뚜두 (DDU-DU DDU-DU) - BLACKPINK</h3>

                        <span class="emotion-tag angry">화남</span>

                    </div>

                    <div class="post-meta">

                        <span>작성자: 이분노</span>

                        <span>2025.08.18</span>

                        <span>조회수: 1532</span>

                    </div>

                    <p class="post-content">강렬한 비트와 파워풀한 랩, 보컬이 돋보이는 곡입니다. 스트레스를 날려버릴 만큼 에너지가 넘쳐요.</p>

                </a>

                <div class="post-actions">

                    <button class="edit-button">수정</button>

                    <button class="delete-button">삭제</button>

                </div>

            </div>

            

            <div class="post-card" data-post-id="4">

                <a href="https://www.youtube.com/watch?v=0k2YfR8Q18s" class="post-card-content" target="_blank">

                    <div class="post-header">

                        <h3 class="post-title">밤편지 - 아이유</h3>

                        <span class="emotion-tag calm">평온</span>

                    </div>

                    <div class="post-meta">

                        <span>작성자: 최평화</span>

                        <span>2025.08.17</span>

                        <span>조회수: 1105</span>

                    </div>

                    <p class="post-content">잔잔한 기타 선율과 아이유의 따뜻한 목소리가 어우러져 마음을 편안하게 해줍니다. 잠들기 전이나 조용히 생각하고 싶을 때 들어보세요.</p>

                </a>

                <div class="post-actions">

                    <button class="edit-button">수정</button>

                    <button class="delete-button">삭제</button>

                </div>

            </div>

        </div>

    </div>



    <script>

        document.addEventListener('DOMContentLoaded', () => {

            const showFormButton = document.getElementById('show-form-button');

            const writeForm = document.getElementById('write-form');

            const postForm = document.getElementById('post-form');

            const cancelButton = document.getElementById('cancel-button');

            const postList = document.querySelector('.post-list');

            const formTitle = writeForm.querySelector('h2');

            const submitButton = writeForm.querySelector('.submit-button');



            let editingPost = null;



            // '글쓰기' 버튼 클릭 시 폼 보이기

            showFormButton.addEventListener('click', () => {

                writeForm.style.display = 'block';

                showFormButton.style.display = 'none';

                formTitle.textContent = '새 게시글 작성';

                submitButton.textContent = '작성 완료';

                postForm.reset();

                editingPost = null;

            });



            // '취소' 버튼 클릭 시 폼 숨기기

            cancelButton.addEventListener('click', () => {

                writeForm.style.display = 'none';

                showFormButton.style.display = 'block';

                postForm.reset();

            });

            

            // 게시글 목록에 이벤트 리스너 위임

            postList.addEventListener('click', (event) => {

                const target = event.target;

                const postCard = target.closest('.post-card');



                if (!postCard) return;



                // '수정' 버튼 클릭 시

                if (target.classList.contains('edit-button')) {

                    event.preventDefault(); // 링크 이동 방지

                    

                    // 기존 정보 가져와서 폼에 채우기

                    const title = postCard.querySelector('.post-title').textContent;

                    const author = postCard.querySelector('.post-meta span:nth-child(1)').textContent.replace('작성자: ', '');

                    const emotion = postCard.querySelector('.emotion-tag').classList[1];

                    const link = postCard.querySelector('.post-card-content').href;

                    const content = postCard.querySelector('.post-content').textContent;



                    document.getElementById('post-title').value = title;

                    document.getElementById('post-author').value = author;

                    document.getElementById('post-emotion').value = emotion;

                    document.getElementById('post-link').value = link;

                    document.getElementById('post-content').value = content;

                    

                    // 폼을 수정 모드로 변경

                    writeForm.style.display = 'block';

                    showFormButton.style.display = 'none';

                    formTitle.textContent = '게시글 수정';

                    submitButton.textContent = '수정 완료';

                    editingPost = postCard;



                // '삭제' 버튼 클릭 시

                } else if (target.classList.contains('delete-button')) {

                    event.preventDefault(); // 링크 이동 방지

                    if (confirm('정말로 이 게시글을 삭제하시겠습니까?')) {

                        postCard.remove();

                    }

                }

            });



            // '작성 완료' 또는 '수정 완료' 버튼 클릭 시

            postForm.addEventListener('submit', (event) => {

                event.preventDefault();



                const title = document.getElementById('post-title').value;

                const author = document.getElementById('post-author').value;

                const emotion = document.getElementById('post-emotion').value;

                const link = document.getElementById('post-link').value;

                const content = document.getElementById('post-content').value;

                

                const emotionText = {

                    happy: '행복',

                    sad: '슬픔',

                    angry: '화남',

                    calm: '평온'

                }[emotion];



                // 수정 모드일 때

                if (editingPost) {

                    editingPost.querySelector('.post-card-content').href = link;

                    editingPost.querySelector('.post-title').textContent = title;

                    editingPost.querySelector('.post-meta span:nth-child(1)').textContent = `작성자: ${author}`;

                    const emotionTag = editingPost.querySelector('.emotion-tag');

                    emotionTag.textContent = emotionText;

                    emotionTag.className = `emotion-tag ${emotion}`;

                    editingPost.querySelector('.post-content').textContent = content;



                // 새 게시글 작성 모드일 때

                } else {

                    const newPostCard = document.createElement('div');

                    newPostCard.className = 'post-card';



                    const currentDate = new Date().toLocaleDateString('ko-KR', { year: 'numeric', month: 'numeric', day: 'numeric' });



                    newPostCard.innerHTML = `

                        <a href="${link}" class="post-card-content" target="_blank">

                            <div class="post-header">

                                <h3 class="post-title">${title}</h3>

                                <span class="emotion-tag ${emotion}">${emotionText}</span>

                            </div>

                            <div class="post-meta">

                                <span>작성자: ${author}</span>

                                <span>${currentDate}</span>

                                <span>조회수: 0</span>

                            </div>

                            <p class="post-content">${content}</p>

                        </a>

                        <div class="post-actions">

                            <button class="edit-button">수정</button>

                            <button class="delete-button">삭제</button>

                        </div>

                    `;

                    

                    postList.insertBefore(newPostCard, postList.querySelector('.post-card'));

                }



                // 폼 숨기고, 버튼 다시 보이기

                writeForm.style.display = 'none';

                showFormButton.style.display = 'block';

                postForm.reset();

                editingPost = null;

            });

        });

    </script>



</body>

</html>

