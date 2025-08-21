<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>감정별 노래 추천 게시판</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6;
            color: #1f2937;
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen p-4 sm:p-8 flex items-center justify-center">

    <div class="bg-white rounded-2xl shadow-xl w-full max-w-4xl transition-all duration-300 transform scale-100 hover:scale-[1.01]">

        <!-- 배너가 주황색 그라데이션으로 변경되었습니다 -->
        <div class="bg-gradient-to-r from-orange-400 to-amber-500 text-white rounded-t-2xl shadow-lg p-8 sm:p-12 text-center">
            <h1 class="text-4xl sm:text-5xl font-bold mb-2">감정별 노래 추천 게시판</h1>
            <p class="text-lg sm:text-xl font-light">오늘의 감정에 맞는 노래를 공유하고, 다른 사람들의 추천을 확인해 보세요.</p>
        </div>

        <div class="p-6 sm:p-10">
            <!-- 게시물 작성 섹션 -->
            <section class="mb-8 p-6 bg-gray-50 rounded-xl">
                <h2 class="text-2xl font-semibold text-gray-800 mb-4">새 게시물 작성</h2>
                <form id="post-form" class="space-y-4">
                    <div>
                        <label for="emotion-select" class="block text-sm font-medium text-gray-700">오늘의 감정</label>
                        <select id="emotion-select" name="emotion" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-colors">
                            <option value="happy">행복 😃</option>
                            <option value="angry">화남 😡</option>
                            <option value="sad">슬픔 😢</option>
                            <option value="calm">평온 😌</option>
                        </select>
                    </div>
                    <div>
                        <label for="post-title" class="block text-sm font-medium text-gray-700">제목</label>
                        <input type="text" id="post-title" name="title" placeholder="게시물 제목을 입력하세요" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-colors">
                    </div>
                    <div>
                        <label for="post-content" class="block text-sm font-medium text-gray-700">내용</label>
                        <textarea id="post-content" name="content" rows="4" placeholder="추천하는 노래와 그 이유를 작성해 주세요." class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 transition-colors"></textarea>
                    </div>
                    <!-- 게시물 올리기 버튼이 주황색으로 변경되었습니다 -->
                    <button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-orange-500 hover:bg-orange-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-400 transition-colors">
                        게시물 올리기
                    </button>
                </form>
            </section>

            <!-- 게시물 목록 섹션 -->
            <section>
                <h2 class="text-2xl font-semibold text-gray-800 mb-4">전체 게시물</h2>
                <div id="post-list" class="space-y-6">
                    <!-- 게시물 예시 (JavaScript로 동적으로 추가될 예정) -->
                    <div class="post-card p-6 bg-white rounded-xl shadow-md border border-gray-200 transition-all duration-300 transform hover:scale-[1.01] hover:shadow-lg">
                        <div class="flex items-center justify-between mb-2">
                            <span class="emotion-tag bg-yellow-100 text-yellow-800 text-xs font-semibold px-2 py-1 rounded-full">행복 😃</span>
                            <span class="text-sm text-gray-500">2024년 8월 21일</span>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-900 mb-1">'밝은' 노래 추천해요!</h3>
                        <p class="text-gray-700 text-sm mb-4">기분이 좋아서 신나는 팝송을 듣고 싶을 때 딱이에요. 가사를 몰라도 멜로디만으로 행복해지는 느낌입니다.</p>
                        <!-- 수정 및 삭제 버튼이 클릭은 되지만 동작은 하지 않도록 수정되었습니다 -->
                        <div class="flex justify-end space-x-2 mt-4">
                            <button onclick="event.preventDefault()" class="bg-blue-500 text-white rounded-md px-2 py-1 text-xs hover:bg-blue-600 transition-colors">수정</button>
                            <button onclick="event.preventDefault()" class="bg-red-500 text-white rounded-md px-2 py-1 text-xs hover:bg-red-600 transition-colors">삭제</button>
                        </div>
                    </div>
                    
                    <div class="post-card p-6 bg-white rounded-xl shadow-md border border-gray-200 transition-all duration-300 transform hover:scale-[1.01] hover:shadow-lg">
                        <div class="flex items-center justify-between mb-2">
                            <span class="emotion-tag bg-red-100 text-red-800 text-xs font-semibold px-2 py-1 rounded-full">화남 😡</span>
                            <span class="text-sm text-gray-500">2024년 8월 20일</span>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-900 mb-1">스트레스 해소용 락 음악</h3>
                        <p class="text-gray-700 text-sm mb-4">스트레스 받을 때 들으면 속이 뻥 뚫리는 기분입니다. 속 시원하게 소리 지르는 보컬이 인상적이에요.</p>
                         <!-- 수정 및 삭제 버튼이 클릭은 되지만 동작은 하지 않도록 수정되었습니다 -->
                        <div class="flex justify-end space-x-2 mt-4">
                            <button onclick="event.preventDefault()" class="bg-blue-500 text-white rounded-md px-2 py-1 text-xs hover:bg-blue-600 transition-colors">수정</button>
                            <button onclick="event.preventDefault()" class="bg-red-500 text-white rounded-md px-2 py-1 text-xs hover:bg-red-600 transition-colors">삭제</button>
                        </div>
                    </div>

                    <div class="post-card p-6 bg-white rounded-xl shadow-md border border-gray-200 transition-all duration-300 transform hover:scale-[1.01] hover:shadow-lg">
                        <div class="flex items-center justify-between mb-2">
                            <span class="emotion-tag bg-blue-100 text-blue-800 text-xs font-semibold px-2 py-1 rounded-full">슬픔 😢</span>
                            <span class="text-sm text-gray-500">2024년 8월 19일</span>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-900 mb-1">비 오는 날 듣는 감성 발라드</h3>
                        <p class="text-gray-700 text-sm mb-4">마음이 울적할 때 듣기 좋은 발라드예요. 슬픔을 그대로 표현해주는 가사가 마음에 와닿습니다.</p>
                         <!-- 수정 및 삭제 버튼이 클릭은 되지만 동작은 하지 않도록 수정되었습니다 -->
                        <div class="flex justify-end space-x-2 mt-4">
                            <button onclick="event.preventDefault()" class="bg-blue-500 text-white rounded-md px-2 py-1 text-xs hover:bg-blue-600 transition-colors">수정</button>
                            <button onclick="event.preventDefault()" class="bg-red-500 text-white rounded-md px-2 py-1 text-xs hover:bg-red-600 transition-colors">삭제</button>
                        </div>
                    </div>

                    <div class="post-card p-6 bg-white rounded-xl shadow-md border border-gray-200 transition-all duration-300 transform hover:scale-[1.01] hover:shadow-lg">
                        <div class="flex items-center justify-between mb-2">
                            <span class="emotion-tag bg-green-100 text-green-800 text-xs font-semibold px-2 py-1 rounded-full">평온 😌</span>
                            <span class="text-sm text-gray-500">2024년 8월 18일</span>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-900 mb-1">휴식할 때 듣기 좋은 잔잔한 피아노곡</h3>
                        <p class="text-gray-700 text-sm mb-4">복잡한 생각 없이 마음을 비우고 싶을 때 들으면 편안해지는 곡이에요. 듣고 있으면 스트레스가 사라지는 것 같아요.</p>
                         <!-- 수정 및 삭제 버튼이 클릭은 되지만 동작은 하지 않도록 수정되었습니다 -->
                        <div class="flex justify-end space-x-2 mt-4">
                            <button onclick="event.preventDefault()" class="bg-blue-500 text-white rounded-md px-2 py-1 text-xs hover:bg-blue-600 transition-colors">수정</button>
                            <button onclick="event.preventDefault()" class="bg-red-500 text-white rounded-md px-2 py-1 text-xs hover:bg-red-600 transition-colors">삭제</button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

</body>
</html>
