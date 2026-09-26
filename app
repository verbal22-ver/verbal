<!DOCTYPE html>
<html lang="en" class="dark h-full">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>verbal-ai Intelligence Platform</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- Google Fonts: Inter & JetBrains Mono -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">

    <!-- Marked.js for Markdown -->
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>

    <!-- KaTeX for Math formatting -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.css">
    <script src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/katex.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/katex@0.16.8/dist/contrib/auto-render.min.js"></script>

    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    colors: {
                        gpt: {
                            sidebar: '#171717',
                            main: '#212121',
                            card: '#2f2f2f',
                            hover: '#2a2a2a',
                            border: 'rgba(255, 255, 255, 0.12)',
                            input: '#2f2f2f',
                            accent: '#10a37f',
                            accentHover: '#1a7f64',
                        }
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                        mono: ['JetBrains Mono', 'monospace'],
                    }
                }
            }
        }
    </script>

    <style>
        body {
            background-color: #212121;
            color: #ececec;
            font-family: 'Inter', sans-serif;
            -webkit-font-smoothing: antialiased;
        }

        ::-webkit-scrollbar {
            width: 6px;
            height: 6px;
        }
        ::-webkit-scrollbar-track {
            background: transparent;
        }
        ::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 9999px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: rgba(255, 255, 255, 0.25);
        }

        /* Markdown prose overrides */
        .prose pre {
            background-color: #0d0d0d !important;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 0.75rem;
            padding: 1rem;
            overflow-x: auto;
            position: relative;
            margin-top: 0.75rem;
            margin-bottom: 0.75rem;
        }

        .prose code {
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.85rem;
            color: #e3e3e3;
        }

        .prose p {
            margin-bottom: 0.75rem;
            line-height: 1.7;
        }

        .prose ul {
            list-style-type: disc;
            padding-left: 1.25rem;
            margin-bottom: 0.75rem;
        }

        .prose ol {
            list-style-type: decimal;
            padding-left: 1.25rem;
            margin-bottom: 0.75rem;
        }

        .prose blockquote {
            border-left: 3px solid #10a37f;
            padding-left: 1rem;
            color: #b4b4b4;
            font-style: italic;
            margin: 0.75rem 0;
        }

        .prose table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
            border-radius: 0.5rem;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .prose th {
            background-color: rgba(255, 255, 255, 0.08);
            color: #ffffff;
            font-weight: 600;
            text-align: left;
            padding: 0.65rem 0.9rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .prose td {
            padding: 0.65rem 0.9rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            background-color: rgba(0, 0, 0, 0.2);
        }

        .katex-display {
            overflow-x: auto;
            overflow-y: hidden;
            padding: 0.5rem 0;
            margin: 0.5rem 0;
        }

        @keyframes pulse-dots {
            0%, 100% { opacity: 0.3; transform: scale(0.9); }
            50% { opacity: 1; transform: scale(1.1); }
        }
        .pulse-dot {
            animation: pulse-dots 1.4s infinite ease-in-out;
        }
    </style>
</head>
<body class="h-full flex overflow-hidden antialiased">

    <!-- Left Navigation Sidebar -->
    <aside id="sidebar" class="w-64 bg-gpt-sidebar flex flex-col justify-between transition-all duration-300 shrink-0 border-r border-white/5 z-30 fixed md:relative h-full -translate-x-full md:translate-x-0">
        
        <!-- Sidebar Header & New Chat -->
        <div class="p-3 space-y-2">
            <div class="flex items-center justify-between px-2 py-1">
                <div class="flex items-center space-x-2">
                    <div class="w-7 h-7 rounded-full bg-gpt-accent flex items-center justify-center text-white font-bold text-xs shadow-md">
                        <i class="fa-solid fa-sparkles text-xs"></i>
                    </div>
                    <span class="font-semibold text-sm text-white tracking-wide">verbal-ai</span>
                </div>
                <button id="close-sidebar-btn" class="md:hidden text-gray-400 hover:text-white p-1 rounded-lg">
                    <i class="fa-solid fa-xmark text-base"></i>
                </button>
            </div>

            <!-- New Session Button -->
            <button id="new-chat-btn" class="w-full bg-white/5 hover:bg-white/10 text-white font-medium py-2.5 px-3 rounded-xl transition duration-200 flex items-center justify-between border border-white/10 group shadow-sm">
                <div class="flex items-center space-x-2.5">
                    <i class="fa-regular fa-pen-to-square text-sm text-gray-300 group-hover:text-white"></i>
                    <span class="text-xs">New chat</span>
                </div>
                <i class="fa-solid fa-plus text-xs text-gray-400"></i>
            </button>

            <!-- Search Filter -->
            <div class="relative pt-1">
                <i class="fa-solid fa-magnifying-glass absolute left-3 top-3.5 text-xs text-gray-400"></i>
                <input id="session-search" type="text" placeholder="Search chats..." class="w-full bg-black/20 border border-white/10 text-xs rounded-xl pl-8 pr-3 py-2 text-gray-200 placeholder-gray-500 focus:outline-none focus:border-white/30 transition">
            </div>
        </div>

        <!-- Chat History List -->
        <div class="flex-1 overflow-y-auto px-3 py-1 space-y-1" id="session-list">
            <!-- Dynamic sessions inserted here -->
        </div>

        <!-- Sidebar Footer & Account Options -->
        <div class="p-3 border-t border-white/10 space-y-1">
            <button id="api-key-btn" class="w-full text-xs text-gray-300 hover:text-white hover:bg-white/5 py-2 px-3 rounded-xl transition flex items-center space-x-2.5">
                <i class="fa-solid fa-key text-amber-400 text-xs"></i>
                <span>Gemini API Key</span>
            </button>

            <button id="clear-all-btn" class="w-full text-xs text-gray-300 hover:text-red-400 hover:bg-white/5 py-2 px-3 rounded-xl transition flex items-center space-x-2.5">
                <i class="fa-regular fa-trash-can text-xs"></i>
                <span>Clear Chat History</span>
            </button>

            <!-- User Avatar & Director Attribution -->
            <div class="pt-2 mt-2 border-t border-white/5 flex items-center justify-between px-2 text-xs text-gray-400">
                <div class="flex items-center space-x-2">
                    <div class="w-6 h-6 rounded-full bg-gradient-to-tr from-emerald-500 via-teal-500 to-indigo-500 flex items-center justify-center text-[10px] text-white font-bold">
                        VR
                    </div>
                    <div class="flex flex-col">
                        <span class="truncate max-w-[110px] text-gray-200 text-[11px] font-medium">Director VED RAVAL</span>
                        <span class="text-[9px] text-gray-500">verbal-ai Lead</span>
                    </div>
                </div>
                <span class="text-[10px] bg-gpt-accent/20 text-gpt-accent px-2 py-0.5 rounded-full border border-gpt-accent/30 font-medium">PRO</span>
            </div>
        </div>
    </aside>

    <!-- Sidebar overlay for mobile view -->
    <div id="sidebar-overlay" class="fixed inset-0 bg-black/70 backdrop-blur-sm z-20 hidden md:hidden"></div>

    <!-- Main Workspace -->
    <main class="flex-1 flex flex-col h-full bg-gpt-main relative overflow-hidden">
        
        <!-- Top Sticky Header -->
        <header class="h-14 px-4 flex items-center justify-between border-b border-white/5 z-10 bg-gpt-main/80 backdrop-blur-md">
            <div class="flex items-center space-x-3">
                <button id="open-sidebar-btn" class="md:hidden text-gray-400 hover:text-white p-2 rounded-lg hover:bg-white/5 transition">
                    <i class="fa-solid fa-bars text-base"></i>
                </button>

                <!-- Model Switcher Dropdown -->
                <div class="relative" id="engine-dropdown-container">
                    <button id="engine-dropdown-btn" class="flex items-center space-x-2 px-3 py-1.5 rounded-xl hover:bg-white/5 transition border border-transparent hover:border-white/10 text-white font-medium text-sm">
                        <span id="active-engine-name" class="font-semibold tracking-tight text-gray-100">verbal-ai 3.0 (Grounded)</span>
                        <i class="fa-solid fa-chevron-down text-xs text-gray-400"></i>
                    </button>

                    <!-- Dropdown Popover -->
                    <div id="engine-dropdown-menu" class="hidden absolute top-full left-0 mt-2 w-64 bg-[#2a2a2a] border border-white/10 rounded-2xl shadow-2xl p-1.5 z-50 space-y-1">
                        <button data-engine="google" class="engine-option w-full text-left p-2.5 rounded-xl hover:bg-white/10 transition flex items-start space-x-3 active bg-white/10">
                            <i class="fa-brands fa-google text-emerald-400 text-sm mt-0.5"></i>
                            <div>
                                <div class="text-xs font-semibold text-white">verbal-ai Grounded</div>
                                <div class="text-[10px] text-gray-400">Live web research & grounded factual synthesis</div>
                            </div>
                        </button>

                        <button data-engine="wiki" class="engine-option w-full text-left p-2.5 rounded-xl hover:bg-white/10 transition flex items-start space-x-3">
                            <i class="fa-brands fa-wikipedia-w text-blue-400 text-sm mt-0.5"></i>
                            <div>
                                <div class="text-xs font-semibold text-white">Wikipedia Live</div>
                                <div class="text-[10px] text-gray-400">Real-time encyclopedia context</div>
                            </div>
                        </button>

                        <button data-engine="synthesis" class="engine-option w-full text-left p-2.5 rounded-xl hover:bg-white/10 transition flex items-start space-x-3">
                            <i class="fa-solid fa-layer-group text-amber-400 text-sm mt-0.5"></i>
                            <div>
                                <div class="text-xs font-semibold text-white">Multi-Engine Synthesis</div>
                                <div class="text-[10px] text-gray-400">Cross-source reasoning pipeline</div>
                            </div>
                        </button>

                        <button data-engine="direct" class="engine-option w-full text-left p-2.5 rounded-xl hover:bg-white/10 transition flex items-start space-x-3">
                            <i class="fa-solid fa-bolt text-indigo-400 text-sm mt-0.5"></i>
                            <div>
                                <div class="text-xs font-semibold text-white">Direct Logic</div>
                                <div class="text-[10px] text-gray-400">Fast reasoning without web search</div>
                            </div>
                        </button>

                        <button data-engine="image" class="engine-option w-full text-left p-2.5 rounded-xl hover:bg-white/10 transition flex items-start space-x-3">
                            <i class="fa-solid fa-wand-magic-sparkles text-purple-400 text-sm mt-0.5"></i>
                            <div>
                                <div class="text-xs font-semibold text-white">AI Image Generator</div>
                                <div class="text-[10px] text-gray-400">Create images with verbal-ai Vision</div>
                            </div>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Top Header Actions -->
            <div class="flex items-center space-x-2">
                <button id="export-chat-btn" title="Export Chat" class="p-2 rounded-xl text-gray-400 hover:text-white hover:bg-white/5 transition text-xs flex items-center space-x-1.5 border border-white/5">
                    <i class="fa-solid fa-arrow-up-from-bracket"></i>
                    <span class="hidden sm:inline">Export</span>
                </button>
            </div>
        </header>

        <!-- Chat Container -->
        <div id="chat-container" class="flex-1 overflow-y-auto px-4 py-6 md:px-0">
            
            <!-- ChatGPT Style Welcome View -->
            <div id="welcome-view" class="max-w-2xl mx-auto my-auto py-12 text-center space-y-8 flex flex-col items-center justify-center min-h-[75vh]">
                <div class="w-14 h-14 rounded-full bg-white/5 border border-white/10 flex items-center justify-center text-white text-2xl shadow-xl">
                    <i class="fa-solid fa-sparkles text-gpt-accent"></i>
                </div>

                <h2 class="text-2xl md:text-3xl font-semibold text-white tracking-tight">
                    What can I help with today?
                </h2>

                <!-- Suggestion Cards -->
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-3 w-full text-left max-w-2xl">
                    <button class="suggestion-card bg-gpt-card hover:bg-gpt-hover border border-white/5 p-4 rounded-2xl transition duration-200 group flex flex-col justify-between space-y-2">
                        <span class="text-xs text-gray-200 font-medium group-hover:text-white">What is the weather in Ahmedabad today?</span>
                        <span class="text-[11px] text-emerald-400 font-medium">Live Weather Search</span>
                    </button>

                    <button class="suggestion-card bg-gpt-card hover:bg-gpt-hover border border-white/5 p-4 rounded-2xl transition duration-200 group flex flex-col justify-between space-y-2">
                        <span class="text-xs text-gray-200 font-medium group-hover:text-white">What is the current population of India?</span>
                        <span class="text-[11px] text-gray-400">Grounded Search</span>
                    </button>

                    <button class="suggestion-card bg-gpt-card hover:bg-gpt-hover border border-white/5 p-4 rounded-2xl transition duration-200 group flex flex-col justify-between space-y-2">
                        <span class="text-xs text-gray-200 font-medium group-hover:text-white">Explain photosynthesis in detail.</span>
                        <span class="text-[11px] text-indigo-400 font-medium">Direct Concept Logic</span>
                    </button>

                    <button class="suggestion-card bg-gpt-card hover:bg-gpt-hover border border-white/5 p-4 rounded-2xl transition duration-200 group flex flex-col justify-between space-y-2" data-engine-select="image">
                        <span class="text-xs text-gray-200 font-medium group-hover:text-white">A futuristic cyberpunk skyline under neon rain at night.</span>
                        <span class="text-[11px] text-purple-400 font-medium">AI Image Gen</span>
                    </button>
                </div>
            </div>

            <!-- Messages Stream -->
            <div id="messages-list" class="max-w-3xl mx-auto space-y-6 w-full pb-8"></div>

            <!-- Loading Spinner Indicator -->
            <div id="loading-indicator" class="max-w-3xl mx-auto hidden pt-2">
                <div class="flex items-start space-x-3">
                    <div class="w-8 h-8 rounded-full bg-gpt-accent/20 border border-gpt-accent/30 flex items-center justify-center shrink-0">
                        <i class="fa-solid fa-sparkles text-gpt-accent text-xs"></i>
                    </div>
                    <div class="flex items-center space-x-1.5 py-2">
                        <div class="w-2 h-2 rounded-full bg-gray-400 pulse-dot"></div>
                        <div class="w-2 h-2 rounded-full bg-gray-400 pulse-dot" style="animation-delay: 0.2s"></div>
                        <div class="w-2 h-2 rounded-full bg-gray-400 pulse-dot" style="animation-delay: 0.4s"></div>
                        <span id="loading-engine-text" class="text-xs text-gray-500 ml-2">verbal-ai searching & analyzing...</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Floating Docked Input Area -->
        <footer class="p-4 md:px-0 bg-gradient-to-t from-gpt-main via-gpt-main to-transparent">
            <div class="max-w-3xl mx-auto space-y-2">
                <form id="chat-form" class="relative bg-gpt-input border border-white/10 rounded-3xl shadow-2xl focus-within:border-white/20 transition duration-200">
                    <textarea 
                        id="user-input" 
                        rows="1" 
                        placeholder="Message verbal-ai..." 
                        class="w-full bg-transparent text-gray-100 placeholder-gray-500 px-5 py-4 pr-16 resize-none outline-none max-h-48 text-sm md:text-base leading-relaxed"
                    ></textarea>

                    <div class="absolute right-3 bottom-2.5 flex items-center space-x-1.5">
                        <button 
                            type="button"
                            id="mic-btn"
                            title="Voice input"
                            class="w-8 h-8 rounded-full hover:bg-white/10 text-gray-400 hover:text-white flex items-center justify-center transition"
                        >
                            <i class="fa-solid fa-microphone text-xs"></i>
                        </button>
                        
                        <button 
                            type="submit" 
                            id="send-btn" 
                            disabled
                            class="w-8 h-8 rounded-full bg-white disabled:bg-white/20 text-black disabled:text-gray-500 flex items-center justify-center transition duration-200 active:scale-95 shadow"
                        >
                            <i class="fa-solid fa-arrow-up text-xs font-bold"></i>
                        </button>
                    </div>
                </form>

                <!-- Footer Disclaimer -->
                <p class="text-[11px] text-gray-500 text-center font-normal">
                    verbal-ai directed by Director VED RAVAL. Grounded search powered by multi-source synthesis.
                </p>
            </div>
        </footer>
    </main>

    <!-- Modal Dialogs -->
    <div id="custom-modal" class="fixed inset-0 bg-black/75 backdrop-blur-sm z-50 flex items-center justify-center p-4 hidden">
        <div class="bg-[#2a2a2a] w-full max-w-sm rounded-2xl p-6 border border-white/10 space-y-4 shadow-2xl">
            <div class="flex items-center space-x-3">
                <div id="modal-icon-bg" class="w-10 h-10 rounded-xl bg-red-500/20 text-red-400 flex items-center justify-center shrink-0">
                    <i id="modal-icon" class="fa-solid fa-triangle-exclamation text-lg"></i>
                </div>
                <div>
                    <h3 id="modal-title" class="font-bold text-white text-sm">Confirmation</h3>
                    <p id="modal-subtitle" class="text-xs text-gray-400">Are you sure?</p>
                </div>
            </div>
            <p id="modal-message" class="text-xs text-gray-300 leading-relaxed">Action details will appear here.</p>
            <div class="flex items-center justify-end space-x-2 pt-2 border-t border-white/10">
                <button id="modal-cancel-btn" class="px-3.5 py-2 rounded-xl text-xs font-medium text-gray-300 hover:bg-white/10 transition">Cancel</button>
                <button id="modal-confirm-btn" class="px-4 py-2 rounded-xl text-xs font-medium bg-red-600 hover:bg-red-500 text-white transition">Confirm</button>
            </div>
        </div>
    </div>

    <!-- API Key Configuration Modal -->
    <div id="api-key-modal" class="fixed inset-0 bg-black/75 backdrop-blur-sm z-50 flex items-center justify-center p-4 hidden">
        <div class="bg-[#2a2a2a] w-full max-w-md rounded-2xl p-6 border border-white/10 space-y-4 shadow-2xl">
            <div class="flex items-center justify-between">
                <div class="flex items-center space-x-2.5">
                    <div class="w-8 h-8 rounded-full bg-gpt-accent/20 text-gpt-accent flex items-center justify-center">
                        <i class="fa-solid fa-key text-xs"></i>
                    </div>
                    <div>
                        <h3 class="font-bold text-white text-sm">Gemini API Settings</h3>
                        <p class="text-xs text-gray-400">Optional Direct Reasoning Key</p>
                    </div>
                </div>
                <button id="close-api-key-modal" class="text-gray-400 hover:text-white p-1">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            
            <div class="space-y-2">
                <label class="text-xs font-medium text-gray-300">Google Gemini API Key</label>
                <input id="api-key-input" type="password" placeholder="AIzaSy..." class="w-full bg-black/30 border border-white/10 text-xs rounded-xl px-3.5 py-2.5 text-gray-200 placeholder-gray-500 focus:outline-none focus:border-white/30">
                <p class="text-[11px] text-gray-400">If no API key is provided, verbal-ai operates automatically with live multi-source web synthesis.</p>
            </div>

            <div class="flex items-center justify-end space-x-2 pt-2 border-t border-white/10">
                <button id="clear-api-key-btn" class="px-3.5 py-2 rounded-xl text-xs font-medium text-red-400 hover:bg-white/5 transition">Clear Key</button>
                <button id="save-api-key-btn" class="px-4 py-2 rounded-xl text-xs font-medium bg-gpt-accent hover:bg-gpt-accentHover text-white transition">Save Settings</button>
            </div>
        </div>
    </div>

    <script>
        let userApiKey = localStorage.getItem('verbal_ai_api_key') || '';
        let sessions = JSON.parse(localStorage.getItem('verbal_ai_sessions_v4')) || [];
        let currentSessionId = localStorage.getItem('verbal_ai_current_session_v4') || null;
        let activeEngine = 'google'; // 'google', 'wiki', 'synthesis', 'direct', 'image'
        let modalCallback = null;

        // DOM Cache
        const sidebar = document.getElementById('sidebar');
        const sidebarOverlay = document.getElementById('sidebar-overlay');
        const openSidebarBtn = document.getElementById('open-sidebar-btn');
        const closeSidebarBtn = document.getElementById('close-sidebar-btn');
        const newChatBtn = document.getElementById('new-chat-btn');
        const clearAllBtn = document.getElementById('clear-all-btn');
        const sessionList = document.getElementById('session-list');
        const sessionSearch = document.getElementById('session-search');
        const chatContainer = document.getElementById('chat-container');
        const welcomeView = document.getElementById('welcome-view');
        const messagesList = document.getElementById('messages-list');
        const loadingIndicator = document.getElementById('loading-indicator');
        const loadingEngineText = document.getElementById('loading-engine-text');
        const chatForm = document.getElementById('chat-form');
        const userInput = document.getElementById('user-input');
        const sendBtn = document.getElementById('send-btn');
        const micBtn = document.getElementById('mic-btn');
        const exportChatBtn = document.getElementById('export-chat-btn');
        
        // Engine Dropdown
        const engineDropdownBtn = document.getElementById('engine-dropdown-btn');
        const engineDropdownMenu = document.getElementById('engine-dropdown-menu');
        const activeEngineName = document.getElementById('active-engine-name');

        // Modal Elements
        const customModal = document.getElementById('custom-modal');
        const modalTitle = document.getElementById('modal-title');
        const modalSubtitle = document.getElementById('modal-subtitle');
        const modalMessage = document.getElementById('modal-message');
        const modalCancelBtn = document.getElementById('modal-cancel-btn');
        const modalConfirmBtn = document.getElementById('modal-confirm-btn');

        // API Key Modal Elements
        const apiKeyBtn = document.getElementById('api-key-btn');
        const apiKeyModal = document.getElementById('api-key-modal');
        const apiKeyInput = document.getElementById('api-key-input');
        const closeApiKeyModal = document.getElementById('close-api-key-modal');
        const saveApiKeyBtn = document.getElementById('save-api-key-btn');
        const clearApiKeyBtn = document.getElementById('clear-api-key-btn');

        marked.setOptions({ gfm: true, breaks: true, headerIds: false, mangle: false });

        window.addEventListener('DOMContentLoaded', () => {
            if (sessions.length === 0) {
                createNewSession();
            } else if (!currentSessionId || !sessions.find(s => s.id === currentSessionId)) {
                currentSessionId = sessions[0].id;
            }
            renderSessionList();
            loadCurrentSession();
            setupEventListeners();
        });

        function setupEventListeners() {
            engineDropdownBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                engineDropdownMenu.classList.toggle('hidden');
            });

            document.addEventListener('click', () => engineDropdownMenu.classList.add('hidden'));

            document.querySelectorAll('.engine-option').forEach(option => {
                option.addEventListener('click', () => {
                    const selectedEngine = option.dataset.engine;
                    activeEngine = selectedEngine;

                    const labelMap = {
                        'google': 'verbal-ai 3.0 (Grounded)',
                        'wiki': 'verbal-ai (Wikipedia Live)',
                        'synthesis': 'verbal-ai (Multi-Engine)',
                        'direct': 'verbal-ai (Direct Logic)',
                        'image': 'verbal-ai (AI Image Gen)'
                    };
                    activeEngineName.innerText = labelMap[selectedEngine] || 'verbal-ai 3.0';

                    document.querySelectorAll('.engine-option').forEach(o => o.classList.remove('active', 'bg-white/10'));
                    option.classList.add('active', 'bg-white/10');
                    engineDropdownMenu.classList.add('hidden');
                });
            });

            apiKeyBtn.addEventListener('click', () => {
                apiKeyInput.value = localStorage.getItem('verbal_ai_api_key') || '';
                apiKeyModal.classList.remove('hidden');
            });

            closeApiKeyModal.addEventListener('click', () => apiKeyModal.classList.add('hidden'));

            saveApiKeyBtn.addEventListener('click', () => {
                const key = apiKeyInput.value.trim();
                if (key) {
                    localStorage.setItem('verbal_ai_api_key', key);
                    userApiKey = key;
                } else {
                    localStorage.removeItem('verbal_ai_api_key');
                    userApiKey = '';
                }
                apiKeyModal.classList.add('hidden');
            });

            clearApiKeyBtn.addEventListener('click', () => {
                localStorage.removeItem('verbal_ai_api_key');
                userApiKey = '';
                apiKeyInput.value = '';
                apiKeyModal.classList.add('hidden');
            });

            openSidebarBtn.addEventListener('click', () => {
                sidebar.classList.remove('-translate-x-full');
                sidebarOverlay.classList.remove('hidden');
            });

            closeSidebarBtn.addEventListener('click', hideSidebar);
            sidebarOverlay.addEventListener('click', hideSidebar);

            newChatBtn.addEventListener('click', () => {
                createNewSession();
                hideSidebar();
            });

            clearAllBtn.addEventListener('click', () => {
                showCustomModal('Clear History', 'Permanent Action', 'Are you sure you want to clear all chat sessions?', () => {
                    sessions = [];
                    localStorage.removeItem('verbal_ai_sessions_v4');
                    localStorage.removeItem('verbal_ai_current_session_v4');
                    createNewSession();
                });
            });

            sessionSearch.addEventListener('input', (e) => renderSessionList(e.target.value.toLowerCase().trim()));

            userInput.addEventListener('input', () => {
                userInput.style.height = 'auto';
                userInput.style.height = Math.min(userInput.scrollHeight, 192) + 'px';
                sendBtn.disabled = userInput.value.trim() === '';
            });

            userInput.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' && !e.shiftKey) {
                    e.preventDefault();
                    if (userInput.value.trim() !== '') chatForm.dispatchEvent(new Event('submit'));
                }
            });

            chatForm.addEventListener('submit', (e) => {
                e.preventDefault();
                const text = userInput.value.trim();
                if (!text) return;
                handleUserMessage(text);
                userInput.value = '';
                userInput.style.height = 'auto';
                sendBtn.disabled = true;
            });

            document.querySelectorAll('.suggestion-card').forEach(card => {
                card.addEventListener('click', () => {
                    const targetEngine = card.getAttribute('data-engine-select');
                    if (targetEngine) {
                        const opt = document.querySelector(`.engine-option[data-engine="${targetEngine}"]`);
                        if (opt) opt.click();
                    }
                    const sampleText = card.querySelector('span').innerText;
                    userInput.value = sampleText;
                    userInput.dispatchEvent(new Event('input'));
                    chatForm.dispatchEvent(new Event('submit'
