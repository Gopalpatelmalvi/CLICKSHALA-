<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>एडमिन पैनल | क्लिक शाला Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Noto+Sans+Devanagari:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://www.gstatic.com/firebasejs/9.22.0/firebase-app-compat.js">
    </script>
    <script src="https://www.gstatic.com/firebasejs/9.22.0/firebase-database-compat.js">
    </script>
    <style>
        :root {
            --bg: #f1f5f9;
            --white: #fff;
            --navy: #0f172a;
            --orange: #ea580c;
            --green: #15803d;
            --red: #dc2626;
            --yellow: #ca8a04;
            --blue: #2563eb;
            --gray-50: #f8fafc;
            --gray-100: #f1f5f9;
            --gray-200: #e2e8f0;
            --gray-300: #cbd5e1;
            --gray-400: #94a3b8;
            --gray-500: #64748b;
            --gray-600: #475569;
            --gray-700: #334155;
            --gray-800: #1e293b;
            --gray-900: #0f172a;
            --radius: 10px;
            --radius-lg: 16px;
            --shadow: 0 1px 3px rgba(0, 0, 0, 0.06);
            --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.08);
            --shadow-lg: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
            background: var(--bg);
            color: var(--gray-800);
            min-height: 100vh;
        }
        .hindi {
            font-family: 'Noto Sans Devanagari', 'Inter', sans-serif;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(8px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes spin {
            to {
                transform: rotate(360deg);
            }
        }
        @keyframes shimmer {
            0% {
                background-position: -200px 0;
            }
            100% {
                background-position: 200px 0;
            }
        }
        @keyframes pulse {
            0%,
            100% {
                opacity: 1;
            }
            50% {
                opacity: 0.4;
            }
        }

        .header {
            background: var(--navy);
            color: #fff;
            padding: 12px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 10px;
            position: sticky;
            top: 0;
            z-index: 50;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        .header-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 800;
            font-size: 18px;
        }
        .header-brand span {
            color: var(--orange);
        }
        .header-badge {
            background: var(--orange);
            padding: 4px 12px;
            border-radius: 14px;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1px;
        }
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 12px;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
            white-space: nowrap;
            text-decoration: none;
        }
        .btn-white {
            background: #fff;
            color: var(--navy);
        }
        .btn-white:hover {
            background: #e2e8f0;
        }
        .btn-orange {
            background: var(--orange);
            color: #fff;
        }
        .btn-orange:hover {
            background: #c2410c;
        }
        .btn-outline {
            background: transparent;
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        .btn-outline:hover {
            background: rgba(255, 255, 255, 0.1);
        }
        .btn-sm {
            padding: 5px 10px;
            font-size: 10px;
            border-radius: 6px;
        }

        .main-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 16px;
        }

        .stats-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 12px;
            margin-bottom: 16px;
        }
        @media (max-width: 768px) {
            .stats-row {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 400px) {
            .stats-row {
                grid-template-columns: 1fr;
            }
        }
        .stat-card {
            background: var(--white);
            border-radius: var(--radius-lg);
            padding: 16px;
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            gap: 12px;
            cursor: pointer;
            transition: all 0.2s;
        }
        .stat-card:hover {
            box-shadow: var(--shadow-md);
            transform: translateY(-2px);
        }
        .stat-icon-box {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            flex-shrink: 0;
            font-weight: 700;
        }
        .stat-num {
            font-size: 26px;
            font-weight: 900;
            color: var(--gray-900);
            line-height: 1;
        }
        .stat-label {
            font-size: 10px;
            color: var(--gray-500);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .controls {
            background: var(--white);
            border-radius: var(--radius-lg);
            padding: 12px 16px;
            box-shadow: var(--shadow);
            margin-bottom: 14px;
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            align-items: center;
        }
        .search-input {
            flex: 1;
            min-width: 180px;
            padding: 8px 14px;
            border: 2px solid var(--gray-200);
            border-radius: 20px;
            font-size: 12px;
            font-family: inherit;
            transition: all 0.2s;
            background: var(--gray-50);
        }
        .search-input:focus {
            outline: none;
            border-color: var(--orange);
            background: #fff;
        }
        .filter-select {
            padding: 8px 12px;
            border: 2px solid var(--gray-200);
            border-radius: 20px;
            font-size: 12px;
            font-family: inherit;
            cursor: pointer;
            background: #fff;
        }
        .filter-select:focus {
            outline: none;
            border-color: var(--orange);
        }

        .table-wrap {
            background: var(--white);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow);
            overflow: hidden;
        }
        .scroll-x {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1100px;
        }
        thead {
            background: var(--gray-50);
            border-bottom: 2px solid var(--gray-200);
        }
        th {
            padding: 10px 8px;
            text-align: left;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: var(--gray-500);
            font-weight: 700;
            white-space: nowrap;
        }
        td {
            padding: 8px;
            font-size: 11px;
            border-bottom: 1px solid var(--gray-100);
            vertical-align: middle;
        }
        tbody tr:hover {
            background: var(--gray-50);
        }
        tbody tr {
            animation: fadeIn 0.3s ease;
        }
        .csm-id {
            font-weight: 700;
            color: var(--orange);
            white-space: nowrap;
        }
        .school-name {
            font-weight: 600;
            color: var(--gray-900);
            max-width: 160px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            display: block;
        }
        .status-dot {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 9px;
            font-weight: 700;
            white-space: nowrap;
        }
        .dot-pending {
            background: #fef9c3;
            color: #854d0e;
        }
        .dot-approved {
            background: #dcfce7;
            color: #14532d;
        }
        .dot-closed {
            background: #fee2e2;
            color: #991b1b;
        }
        .dot-reviewed {
            background: #dbeafe;
            color: #1e40af;
        }
        .action-group {
            display: flex;
            gap: 3px;
            flex-wrap: wrap;
        }

        .modal-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 100;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            padding: 16px;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.2s;
            overflow-y: auto;
        }
        .modal-overlay.show {
            opacity: 1;
            pointer-events: all;
        }
        .modal {
            background: #fff;
            border-radius: var(--radius-lg);
            width: 100%;
            max-width: 800px;
            margin: auto;
            box-shadow: var(--shadow-lg);
            animation: fadeIn 0.3s ease;
            max-height: 90vh;
            display: flex;
            flex-direction: column;
        }
        .modal-head {
            padding: 14px 18px;
            border-bottom: 1px solid var(--gray-200);
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-shrink: 0;
        }
        .modal-head h3 {
            font-size: 15px;
            color: var(--gray-900);
        }
        .modal-close {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: none;
            background: var(--gray-100);
            cursor: pointer;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
        }
        .modal-close:hover {
            background: var(--gray-200);
        }
        .modal-body {
            padding: 16px 18px;
            overflow-y: auto;
            flex: 1;
        }
        .modal-foot {
            padding: 12px 18px;
            border-top: 1px solid var(--gray-200);
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            flex-shrink: 0;
        }
        .detail-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px;
        }
        @media (max-width: 500px) {
            .detail-grid {
                grid-template-columns: 1fr;
            }
        }
        .detail-item {
            background: var(--gray-50);
            padding: 8px 12px;
            border-radius: 8px;
        }
        .detail-item label {
            font-size: 9px;
            color: var(--gray-500);
            text-transform: uppercase;
            letter-spacing: 0.3px;
            display: block;
            margin-bottom: 2px;
            font-weight: 600;
        }
        .detail-item span {
            font-size: 12px;
            color: var(--gray-800);
            font-weight: 500;
        }
        .detail-full {
            grid-column: 1/-1;
        }

        .img-section {
            margin-top: 16px;
        }
        .img-section h4 {
            font-size: 13px;
            color: var(--gray-700);
            margin-bottom: 10px;
            font-weight: 600;
        }
        .img-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
            gap: 10px;
        }
        .img-card {
            background: var(--gray-50);
            border-radius: 10px;
            overflow: hidden;
            border: 2px solid var(--gray-200);
            cursor: pointer;
            transition: all 0.2s;
        }
        .img-card:hover {
            border-color: var(--orange);
            box-shadow: var(--shadow-md);
        }
        .img-card-inner {
            width: 100%;
            height: 110px;
            background: linear-gradient(135deg, #f1f5f9, #e2e8f0, #f1f5f9);
            background-size: 400px 100%;
            animation: shimmer 2s infinite;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        .img-card-inner.loaded {
            animation: none;
            background: var(--gray-100);
        }
        .img-card-inner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: none;
        }
        .img-card-inner.loaded img {
            display: block;
        }
        .img-card-inner .no-img-text {
            font-size: 11px;
            color: var(--gray-500);
            font-weight: 500;
            text-align: center;
            padding: 8px;
        }
        .img-card-inner.loaded .no-img-text {
            display: none;
        }
        .img-card-label {
            font-size: 9px;
            padding: 5px 8px;
            text-align: center;
            color: var(--gray-600);
            background: #fff;
            font-weight: 500;
        }

        .img-full-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.92);
            z-index: 200;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.2s;
        }
        .img-full-overlay.show {
            opacity: 1;
            pointer-events: all;
        }
        .img-full-overlay img {
            max-width: 95vw;
            max-height: 90vh;
            border-radius: 8px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
        }
        .img-full-close {
            position: absolute;
            top: 16px;
            right: 20px;
            color: #fff;
            font-size: 28px;
            cursor: pointer;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
            z-index: 5;
        }
        .img-full-close:hover {
            background: rgba(255, 255, 255, 0.25);
        }

        .toast {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: var(--gray-900);
            color: #fff;
            padding: 10px 18px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
            z-index: 300;
            opacity: 0;
            transform: translateY(10px);
            transition: all 0.3s;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            max-width: 350px;
        }
        .toast.show {
            opacity: 1;
            transform: translateY(0);
        }
        .toast.ok {
            border-left: 3px solid var(--green);
        }
        .toast.err {
            border-left: 3px solid var(--red);
        }

        .spinner {
            display: inline-block;
            width: 16px;
            height: 16px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-top-color: var(--orange);
            border-radius: 50%;
            animation: spin 0.6s linear infinite;
            vertical-align: middle;
        }
        .empty-msg {
            text-align: center;
            padding: 40px 20px;
            color: var(--gray-400);
        }
        .live-dot {
            width: 8px;
            height: 8px;
            background: var(--green);
            border-radius: 50%;
            animation: pulse 2s infinite;
            display: inline-block;
            margin-right: 4px;
        }
    </style>
</head>
<body>

    <header class="header">
        <div style="display:flex;align-items:center;gap:10px;flex-wrap:wrap;">
            <span class="header-brand">Click<span>Shala</span></span>
            <span class="header-badge">ADMIN PANEL</span>
            <span class="live-dot"></span>
        </div>
        <div style="display:flex;align-items:center;gap:10px;flex-wrap:wrap;">
            <span style="font-size:10px;opacity:0.7;" id="liveClock"></span>
            <span style="font-size:10px;opacity:0.7;">| Total: <strong id="totalCount">0</strong></span>
            <button class="btn btn-outline btn-sm" onclick="loadAll()">Refresh</button>
            <a href="index.html" class="btn btn-white btn-sm">← Website</a>
        </div>
    </header>

    <div class="main-container">
        <div class="stats-row">
            <div class="stat-card" onclick="setFilter('all')">
                <div class="stat-icon-box" style="background:#fff7ed;color:#ea580c;">T</div>
                <div><div class="stat-num" id="sTotal">0</div><div class="stat-label">Total</div></div>
            </div>
            <div class="stat-card" onclick="setFilter('pending')">
                <div class="stat-icon-box" style="background:#fef9c3;color:#854d0e;">P</div>
                <div><div class="stat-num" id="sPending">0</div><div class="stat-label">Pending</div></div>
            </div>
            <div class="stat-card" onclick="setFilter('approved')">
                <div class="stat-icon-box" style="background:#dcfce7;color:#14532d;">A</div>
                <div><div class="stat-num" id="sApproved">0</div><div class="stat-label">Approved</div></div>
            </div>
            <div class="stat-card" onclick="setFilter('closed')">
                <div class="stat-icon-box" style="background:#fee2e2;color:#991b1b;">C</div>
                <div><div class="stat-num" id="sClosed">0</div><div class="stat-label">Closed</div></div>
            </div>
        </div>

        <div class="controls">
            <input type="text" class="search-input hindi" placeholder="Search: School, District, CSM ID, Principal, Phone..." id="searchInput" oninput="applyFilters()">
            <select class="filter-select" id="statusFilter" onchange="applyFilters()">
                <option value="all">All Status</option>
                <option value="pending">Pending</option>
                <option value="reviewed">Reviewed</option>
                <option value="approved">Approved</option>
                <option value="closed">Closed</option>
            </select>
            <span style="font-size:10px;color:var(--gray-500);">Showing: <strong id="showingCount">0</strong></span>
        </div>

        <div class="table-wrap">
            <div class="scroll-x">
                <table>
                    <thead>
                        <tr>
                            <th>CSM ID</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>School</th>
                            <th>District</th>
                            <th>Principal</th>
                            <th>Phone</th>
                            <th>Lab</th>
                            <th>Library</th>
                            <th>Smart</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <tr><td colspan="12" class="empty-msg"><span class="spinner"></span> Loading applications...</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal-overlay" id="detailModal">
        <div class="modal">
            <div class="modal-head">
                <h3 id="modalTitle">Application Details</h3>
                <button class="modal-close" onclick="closeModal('detailModal')">✕</button>
            </div>
            <div class="modal-body" id="modalBody"></div>
            <div class="modal-foot" id="modalFoot"></div>
        </div>
    </div>

    <div class="img-full-overlay" id="imgFullOverlay">
        <span class="img-full-close" onclick="document.getElementById('imgFullOverlay').classList.remove('show')">✕</span>
        <img id="imgFullSrc" src="" alt="Full Image">
    </div>

    <div class="toast" id="toast"></div>

    <script>
        const firebaseConfig = {
            apiKey: "AIzaSyDNiigKF-lZ5mHJZ6BXT6uU8gvgJ4TN3vc",
            authDomain: "local-book-of-india.firebaseapp.com",
            databaseURL: "https://local-book-of-india-default-rtdb.firebaseio.com",
            projectId: "local-book-of-india",
            storageBucket: "local-book-of-india.firebasestorage.app",
            messagingSenderId: "369669712580",
            appId: "1:369669712580:web:8328ff715b1560dad5b791"
        };
        firebase.initializeApp(firebaseConfig);
        const db = firebase.database();
        let allData = [];
        let filteredData = [];

        function loadAll() {
            document.getElementById('tableBody').innerHTML =
                '<tr><td colspan="12" class="empty-msg"><span class="spinner"></span> Loading...</td></tr>';
            db.ref('registrations').once('value').then(snap => {
                allData = [];
                if (snap.exists()) {
                    snap.forEach(child => {
                        const d = child.val();
                        d._key = child.key;
                        d._status = d.status || 'pending';
                        allData.push(d);
                    });
                    allData.sort((a, b) => (b.submittedAt || '').localeCompare(a.submittedAt || ''));
                }
                filteredData = [...allData];
                renderTable();
                updateStats();
            }).catch(err => {
                document.getElementById('tableBody').innerHTML =
                    '<tr><td colspan="12" class="empty-msg">Error: ' + err.message +
                    '<br><small>Check Firebase Database Rules</small></td></tr>';
            });
        }

        function updateStats() {
            document.getElementById('sTotal').textContent = allData.length;
            document.getElementById('sPending').textContent = allData.filter(a => a._status === 'pending').length;
            document.getElementById('sApproved').textContent = allData.filter(a => a._status === 'approved').length;
            document.getElementById('sClosed').textContent = allData.filter(a => a._status === 'closed').length;
            document.getElementById('totalCount').textContent = allData.length;
            document.getElementById('showingCount').textContent = filteredData.length;
        }

        function applyFilters() {
            const s = document.getElementById('searchInput').value.toLowerCase().trim();
            const st = document.getElementById('statusFilter').value;
            filteredData = allData.filter(app => {
                const ms = !s || (app.schoolName || '').toLowerCase().includes(s) || (app.district || '')
                    .toLowerCase().includes(s) || (app.csmId || '').toLowerCase().includes(s) || (app
                        .principalName || '').toLowerCase().includes(s) || (app.phone || '').includes(s);
                return ms && (st === 'all' || app._status === st);
            });
            renderTable();
            updateStats();
        }

        function setFilter(status) {
            document.getElementById('statusFilter').value = status;
            applyFilters();
        }

        function renderTable() {
            const tbody = document.getElementById('tableBody');
            if (filteredData.length === 0) {
                tbody.innerHTML = '<tr><td colspan="12" class="empty-msg">No applications found</td></tr>';
                return;
            }
            const sm = { pending: 'Pending', reviewed: 'Reviewed', approved: 'Approved', closed: 'Closed' };
            tbody.innerHTML = filteredData.map(app => {
                const dt = app.submittedAt ? new Date(app.submittedAt) : null;
                const ds = dt ? dt.toLocaleDateString('en-IN', { day: '2-digit', month: 'short', year: 'numeric' }) :
                    '-';
                const ts = dt ? dt.toLocaleTimeString('en-IN', { hour: '2-digit', minute: '2-digit' }) : '-';
                const sts = app._status;
                return `<tr>
                    <td><span class="csm-id">${app.csmId||'-'}</span></td>
                    <td>${ds}</td><td>${ts}</td>
                    <td><span class="school-name" title="${app.schoolName||''}">${app.schoolName||'-'}</span></td>
                    <td>${app.district||'-'}</td><td>${app.principalName||'-'}</td>
                    <td><a href="tel:${app.phone||''}" style="color:#2563eb;">${app.phone||'-'}</a></td>
                    <td>${app.computerLab||'-'}</td><td>${app.library||'-'}</td><td>${app.smartClass||'-'}</td>
                    <td><span class="status-dot dot-${sts}">${sm[sts]||sts}</span></td>
                    <td><div class="action-group">
                        <button class="btn btn-sm" style="background:#dbeafe;color:#1e40af;" onclick="viewDetail('${app._key}')">View</button>
                        ${sts==='pending'?`<button class="btn btn-sm" style="background:#dcfce7;color:#14532d;" onclick="changeStatus('${app._key}','approved')">Approve</button>`:''}
                        ${sts==='approved'?`<button class="btn btn-sm" style="background:#fee2e2;color:#991b1b;" onclick="changeStatus('${app._key}','closed')">Close</button>`:''}
                        ${sts==='closed'?`<button class="btn btn-sm" style="background:#fef9c3;color:#854d0e;" onclick="changeStatus('${app._key}','pending')">Reopen</button>`:''}
                        <button class="btn btn-sm" style="background:#fee2e2;color:#991b1b;" onclick="deleteEntry('${app._key}')">Delete</button>
                    </div></td></tr>`;
            }).join('');
        }

        function changeStatus(key, newStatus) {
            db.ref('registrations/' + key + '/status').set(newStatus).then(() => {
                const app = allData.find(a => a._key === key);
                if (app) app._status = newStatus;
                const fa = filteredData.find(a => a._key === key);
                if (fa) fa._status = newStatus;
                renderTable();
                updateStats();
                toastMsg('Status updated: ' + newStatus, 'ok');
            }).catch(err => toastMsg('Error: ' + err.message, 'err'));
        }

        function deleteEntry(key) {
            if (!confirm('Permanently delete? This cannot be undone.')) return;
            db.ref('registrations/' + key).remove().then(() => {
                allData = allData.filter(a => a._key !== key);
                filteredData = filteredData.filter(a => a._key !== key);
                renderTable();
                updateStats();
                closeModal('detailModal');
                toastMsg('Deleted', 'ok');
            }).catch(err => toastMsg('Error: ' + err.message, 'err'));
        }

        function viewDetail(key) {
            const app = allData.find(a => a._key === key);
            if (!app) return;
            const dt = app.submittedAt ? new Date(app.submittedAt) : null;
            const ds = dt ? dt.toLocaleString('en-IN', { day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit',
                minute: '2-digit' }) : 'N/A';
            const sts = app._status;
            const sm = { pending: 'Pending', reviewed: 'Reviewed', approved: 'Approved', closed: 'Closed' };
            document.getElementById('modalTitle').textContent = app.schoolName || 'Details';
            document.getElementById('modalBody').innerHTML = `
                <p style="margin-bottom:10px;"><span class="status-dot dot-${sts}">${sm[sts]||sts}</span> <strong style="margin-left:8px;">CSM: ${app.csmId||'N/A'}</strong> <span style="font-size:10px;color:var(--gray-500);margin-left:8px;">${ds}</span></p>
                <div class="detail-grid">
                    <div class="detail-item detail-full"><label>School Name</label><span>${app.schoolName||'-'}</span></div>
                    <div class="detail-item"><label>Established</label><span>${app.estYear||'-'}</span></div>
                    <div class="detail-item"><label>Shala Darpan</label><span>${app.shalaDarpanCode||'-'}</span></div>
                    <div class="detail-item"><label>UDISE+ ID</label><span>${app.udiseId||'-'}</span></div>
                    <div class="detail-item detail-full"><label>Address</label><span>${app.address||'-'}</span></div>
                    <div class="detail-item"><label>District</label><span>${app.district||'-'}</span></div>
                    <div class="detail-item"><label>PIN</label><span>${app.pinCode||'-'}</span></div>
                    <div class="detail-item"><label>Email</label><span>${app.email||'-'}</span></div>
                    <div class="detail-item"><label>Phone</label><span><a href="tel:${app.phone||''}">${app.phone||'-'}</a></span></div>
                    <div class="detail-item detail-full"><label>Principal</label><span>${app.principalName||'-'}</span></div>
                    <div class="detail-item"><label>Computer Lab</label><span>${app.computerLab||'-'}</span></div>
                    <div class="detail-item"><label>Library</label><span>${app.library||'-'}</span></div>
                    <div class="detail-item"><label>Smart Class</label><span>${app.smartClass||'-'}</span></div>
                    <div class="detail-item detail-full"><label>Past Results</label><span>${app.pastResults||'-'}</span></div>
                    <div class="detail-item detail-full"><label>Google Account</label><span>${app.userEmail||'-'} (${app.userName||'-'})</span></div>
                </div>
                <div class="img-section"><h4>School Photographs</h4><div class="img-grid" id="imgGrid">${
                    [{ref:'photo1',label:'Main Building/Gate'},{ref:'photo2',label:'Computer Lab'},{ref:'photo3',label:'Smart Class/Library'},{ref:'photo4',label:'Playground/Assembly'},{ref:'photo5',label:'Special Activity'},{ref:'principalPhoto',label:'Principal Photo'}]
                    .map(p => `<div class="img-card" onclick="viewFull('${key}','${p.ref}')"><div class="img-card-inner" id="ic_${p.ref}"><img id="img_${p.ref}" src="" onload="onImgLoad('${p.ref}')" onerror="onImgErr('${p.ref}')"><div class="no-img-text" id="nt_${p.ref}">Loading...</div></div><div class="img-card-label">${p.label}</div></div>`).join('')
                }</div></div>`;
            document.getElementById('modalFoot').innerHTML = `
                ${sts==='pending'?`<button class="btn btn-orange btn-sm" onclick="changeStatus('${key}','approved');closeModal('detailModal');">Approve</button>`:''}
                ${sts==='approved'?`<button class="btn btn-sm" style="background:#ca8a04;color:#fff;" onclick="changeStatus('${key}','closed');closeModal('detailModal');">Close</button>`:''}
                ${sts==='closed'?`<button class="btn btn-orange btn-sm" onclick="changeStatus('${key}','pending');closeModal('detailModal');">Reopen</button>`:''}
                <button class="btn btn-sm" style="background:#fee2e2;color:#991b1b;" onclick="if(confirm('Delete?')){deleteEntry('${key}');closeModal('detailModal');}">Delete</button>
                <button class="btn btn-sm" style="background:#e2e8f0;color:#475569;" onclick="closeModal('detailModal')">Close</button>`;
            openModal('detailModal');
            ['photo1','photo2','photo3','photo4','photo5','principalPhoto'].forEach(ref => {
                if (app.images && app.images[ref]) {
                    const img = document.getElementById('img_' + ref);
                    if (img) img.src = app.images[ref];
                } else { onImgErr(ref); }
            });
        }

        function onImgLoad(ref) { document.getElementById('ic_' + ref)?.classList.add('loaded'); const nt = document.getElementById(
                'nt_' + ref); if (nt) nt.style.display = 'none'; }

        function onImgErr(ref) { document.getElementById('ic_' + ref)?.classList.remove('loaded'); const nt = document.getElementById(
                'nt_' + ref); if (nt) nt.textContent = 'No Image'; }

        function viewFull(key, ref) {
            const app = allData.find(a => a._key === key);
            if (app?.images?.[ref]) { document.getElementById('imgFullSrc').src = app.images[ref];
                document.getElementById('imgFullOverlay').classList.add('show'); } else { toastMsg(
                'Image not available', 'err'); }
        }

        document.getElementById('imgFullOverlay').addEventListener('click', function(e) { if (e.target === this || e.target
                .classList.contains('img-full-close')) this.classList.remove('show'); });

        function openModal(id) { document.getElementById(id).classList.add('show');
            document.body.style.overflow = 'hidden'; }

        function closeModal(id) { document.getElementById(id).classList.remove('show');
            document.body.style.overflow = ''; }
        document.getElementById('detailModal').addEventListener('click', function(e) { if (e.target === this) closeModal(
                'detailModal'); });

        function toastMsg(msg, type) {
            const t = document.getElementById('toast');
            t.textContent = msg;
            t.className = 'toast ' + type + ' show';
            clearTimeout(t._tid);
            t._tid = setTimeout(() => t.classList.remove('show'), 3000);
        }

        function updateClock() { document.getElementById('liveClock').textContent = new Date().toLocaleTimeString('en-IN',
            { hour: '2-digit', minute: '2-digit', second: '2-digit' }); }
        setInterval(updateClock, 1000);
        updateClock();
        loadAll();
        setInterval(loadAll, 60000);
        console.log('✅ Click Shala Admin Panel Ready');
    </script>
</body>
</html>
