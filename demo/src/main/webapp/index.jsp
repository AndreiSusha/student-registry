<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Student Registry</title>
    <style>
      :root {
        /* Palette — yellow lead, green accent */
        --bg: #fbf6e9;
        --bg-grad-1: #fdf4d8;
        --bg-grad-2: #f3f8e4;
        --surface: #ffffff;
        --surface-muted: #fcf7e8;
        --border: #ece3cb;
        --border-strong: #d9cca5;
        --ink: #2a2719;
        --ink-soft: #6c6750;
        --ink-faint: #9a937a;

        /* Yellow — the lead */
        --yellow: #f5c518;
        --yellow-deep: #e0ad00;
        --yellow-soft: #fdf1c2;
        --yellow-ink: #6b5400;

        /* Green — the accent */
        --green: #2f9e5e;
        --green-deep: #237a48;
        --green-soft: #ddf2e4;
        --green-ink: #1c6038;

        --danger: #cc4436;
        --danger-soft: #fae6e3;

        /* Signature gradient */
        --brand-grad: linear-gradient(
          135deg,
          #f5c518 0%,
          #8ed04a 55%,
          #2f9e5e 100%
        );

        --shadow:
          0 1px 2px rgba(42, 39, 25, 0.04), 0 8px 24px rgba(42, 39, 25, 0.07);
        --radius: 14px;
        --radius-sm: 9px;
        --font:
          'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
          Helvetica, Arial, sans-serif;
      }

      * {
        box-sizing: border-box;
      }

      html,
      body {
        margin: 0;
        padding: 0;
      }

      body {
        font-family: var(--font);
        color: var(--ink);
        background:
          radial-gradient(
            1100px 560px at 85% -12%,
            var(--bg-grad-1),
            transparent
          ),
          radial-gradient(900px 520px at 5% 0%, var(--bg-grad-2), transparent),
          var(--bg);
        min-height: 100vh;
        -webkit-font-smoothing: antialiased;
        text-rendering: optimizeLegibility;
        padding: 48px 20px 80px;
      }

      .shell {
        max-width: 680px;
        margin: 0 auto;
      }

      /* Header */
      .masthead {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        gap: 16px;
        margin-bottom: 28px;
      }

      .masthead h1 {
        font-size: 27px;
        font-weight: 700;
        letter-spacing: -0.02em;
        margin: 0;
        line-height: 1.1;
      }

      /* Signature: gradient underline accent on the title */
      .masthead h1::after {
        content: '';
        display: block;
        width: 64px;
        height: 5px;
        margin-top: 10px;
        border-radius: 999px;
        background: var(--brand-grad);
      }

      .masthead .eyebrow {
        display: inline-block;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.09em;
        text-transform: uppercase;
        color: var(--yellow-ink);
        background: var(--yellow-soft);
        border: 1px solid var(--yellow);
        padding: 3px 9px;
        border-radius: 999px;
        margin-bottom: 11px;
      }

      .count-pill {
        font-size: 13px;
        font-weight: 600;
        color: var(--ink-soft);
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: 999px;
        padding: 6px 13px;
        white-space: nowrap;
        box-shadow: var(--shadow);
      }

      .count-pill b {
        color: var(--green-ink);
      }

      /* Card */
      .card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius);
        box-shadow: var(--shadow);
        overflow: hidden;
        position: relative;
      }

      .card + .card {
        margin-top: 20px;
      }

      /* Form card carries a thin gradient cap */
      .form-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: var(--brand-grad);
      }

      /* Form */
      .form {
        padding: 24px 22px 22px;
      }

      .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr auto;
        gap: 12px;
        align-items: end;
      }

      .field {
        display: flex;
        flex-direction: column;
        gap: 6px;
        min-width: 0;
      }

      .field label {
        font-size: 12px;
        font-weight: 600;
        color: var(--ink-soft);
        letter-spacing: 0.01em;
      }

      .field input {
        font-family: inherit;
        font-size: 15px;
        color: var(--ink);
        background: var(--surface-muted);
        border: 1px solid var(--border);
        border-radius: var(--radius-sm);
        padding: 11px 13px;
        outline: none;
        transition:
          border-color 0.15s ease,
          box-shadow 0.15s ease,
          background 0.15s ease;
        width: 100%;
      }

      .field input::placeholder {
        color: var(--ink-faint);
      }

      .field input:hover {
        border-color: var(--border-strong);
      }

      .field input:focus {
        background: var(--surface);
        border-color: var(--green);
        box-shadow: 0 0 0 3px var(--green-soft);
      }

      .btn {
        font-family: inherit;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        border: 1px solid transparent;
        border-radius: var(--radius-sm);
        padding: 11px 20px;
        transition:
          background 0.15s ease,
          transform 0.05s ease,
          box-shadow 0.15s ease;
        white-space: nowrap;
      }

      .btn:active {
        transform: translateY(1px);
      }

      .btn-primary {
        background: var(--green);
        color: #fff;
        box-shadow: 0 1px 2px rgba(35, 122, 72, 0.3);
      }

      .btn-primary:hover {
        background: var(--green-deep);
      }

      .btn-primary:focus-visible {
        outline: none;
        box-shadow: 0 0 0 3px var(--green-soft);
      }

      .btn-primary:disabled {
        background: var(--border-strong);
        cursor: not-allowed;
        box-shadow: none;
      }

      /* List */
      .list-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 16px 22px;
        border-bottom: 1px solid var(--border);
        background: var(--surface-muted);
      }

      .list-head h2 {
        font-size: 13px;
        font-weight: 600;
        letter-spacing: 0.06em;
        text-transform: uppercase;
        color: var(--ink-soft);
        margin: 0;
      }

      ul.roster {
        list-style: none;
        margin: 0;
        padding: 0;
      }

      .row {
        display: flex;
        align-items: center;
        gap: 16px;
        padding: 15px 22px;
        border-bottom: 1px solid var(--border);
        transition: background 0.12s ease;
        animation: rise 0.28s ease both;
      }

      .row:last-child {
        border-bottom: none;
      }

      .row:hover {
        background: var(--surface-muted);
      }

      .avatar {
        flex: 0 0 auto;
        width: 38px;
        height: 38px;
        border-radius: 50%;
        display: grid;
        place-items: center;
        font-size: 14px;
        font-weight: 700;
        color: var(--green-ink);
        background: var(--green-soft);
        border: 1px solid #c4e6d0;
        letter-spacing: 0.02em;
      }

      .row-body {
        flex: 1 1 auto;
        min-width: 0;
      }

      .row-name {
        font-size: 15px;
        font-weight: 600;
        color: var(--ink);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }

      .row-address {
        font-size: 13px;
        color: var(--ink-soft);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        margin-top: 2px;
      }

      .row-address.empty {
        color: var(--ink-faint);
        font-style: italic;
      }

      .btn-del {
        flex: 0 0 auto;
        font-family: inherit;
        font-size: 13px;
        font-weight: 600;
        color: var(--ink-soft);
        background: transparent;
        border: 1px solid var(--border);
        border-radius: var(--radius-sm);
        padding: 7px 13px;
        cursor: pointer;
        transition: all 0.15s ease;
        opacity: 0.7;
      }

      .row:hover .btn-del {
        opacity: 1;
      }

      .btn-del:hover {
        color: var(--danger);
        background: var(--danger-soft);
        border-color: var(--danger-soft);
      }

      .btn-del:focus-visible {
        outline: none;
        opacity: 1;
        box-shadow: 0 0 0 3px var(--danger-soft);
      }

      /* States */
      .state {
        padding: 48px 22px;
        text-align: center;
        color: var(--ink-soft);
      }

      .state .glyph {
        width: 46px;
        height: 46px;
        margin: 0 auto 14px;
        border-radius: 12px;
        display: grid;
        place-items: center;
        color: var(--green-ink);
        background: var(--green-soft);
        border: 1px solid #c4e6d0;
      }

      .state .title {
        font-size: 15px;
        font-weight: 600;
        color: var(--ink);
        margin-bottom: 4px;
      }

      .state .sub {
        font-size: 13.5px;
        color: var(--ink-soft);
      }

      .state.error .glyph {
        color: var(--danger);
        background: var(--danger-soft);
        border-color: var(--danger-soft);
      }

      .state.error .title {
        color: var(--danger);
      }

      .footnote {
        text-align: center;
        font-size: 12.5px;
        color: var(--ink-faint);
        margin-top: 24px;
      }

      @keyframes rise {
        from {
          opacity: 0;
          transform: translateY(6px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      @media (prefers-reduced-motion: reduce) {
        .row {
          animation: none;
        }
        * {
          transition: none !important;
        }
      }

      @media (max-width: 560px) {
        body {
          padding: 32px 14px 60px;
        }
        .form-grid {
          grid-template-columns: 1fr;
        }
        .btn-primary {
          width: 100%;
        }
        .masthead {
          flex-direction: column;
          align-items: flex-start;
          gap: 10px;
        }
      }
    </style>
  </head>
  <body>
    <main class="shell">
      <header class="masthead">
        <div>
          <span class="eyebrow">Directory</span>
          <h1>Student Registry</h1>
        </div>
        <span class="count-pill" id="count">&hellip;</span>
      </header>

      <!-- Add form -->
      <section class="card form-card">
        <div class="form">
          <div class="form-grid">
            <div class="field">
              <label for="name">Name</label>
              <input
                type="text"
                id="name"
                placeholder="Name Surname"
                autocomplete="off"
              />
            </div>
            <div class="field">
              <label for="address">Address</label>
              <input
                type="text"
                id="address"
                placeholder="City, Country"
                autocomplete="off"
              />
            </div>
            <button class="btn btn-primary" id="addBtn" onclick="add()">
              Add student
            </button>
          </div>
        </div>
      </section>

      <!-- Roster -->
      <section class="card">
        <div class="list-head">
          <h2>Enrolled</h2>
        </div>
        <ul class="roster" id="list"></ul>
        <div id="placeholder"></div>
      </section>

      <p class="footnote">Student Registry. Jakarta EE + MySQL</p>
    </main>

    <script>
      const API = 'rest/students';
      const listEl = document.getElementById('list');
      const placeholderEl = document.getElementById('placeholder');
      const countEl = document.getElementById('count');
      const nameEl = document.getElementById('name');
      const addressEl = document.getElementById('address');
      const addBtn = document.getElementById('addBtn');

      // Escape user-provided text before inserting into the DOM.
      function esc(value) {
        return String(value ?? '').replace(
          /[&<>"']/g,
          (c) =>
            ({
              '&': '&amp;',
              '<': '&lt;',
              '>': '&gt;',
              '"': '&quot;',
              "'": '&#39;',
            })[c],
        );
      }

      function initials(name) {
        const parts = String(name || '')
          .trim()
          .split(/\s+/);
        if (!parts[0]) return '?';
        const first = parts[0][0] || '';
        const last = parts.length > 1 ? parts[parts.length - 1][0] : '';
        return (first + last).toUpperCase();
      }

      function setCount(n) {
        countEl.innerHTML =
          '<b>' + n + '</b> ' + (n === 1 ? 'student' : 'students');
      }

      function showState(kind, title, sub) {
        listEl.innerHTML = '';
        const emptyIcon =
          '<svg width="22" height="22" viewBox="0 0 24 24" fill="none" ' +
          'stroke="currentColor" stroke-width="1.7" stroke-linecap="round" ' +
          'stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>' +
          '<circle cx="9" cy="7" r="4"/><line x1="19" y1="8" x2="19" y2="14"/>' +
          '<line x1="22" y1="11" x2="16" y2="11"/></svg>';
        const errorIcon =
          '<svg width="22" height="22" viewBox="0 0 24 24" fill="none" ' +
          'stroke="currentColor" stroke-width="1.7" stroke-linecap="round" ' +
          'stroke-linejoin="round"><circle cx="12" cy="12" r="10"/>' +
          '<line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>';
        const glyph = kind === 'error' ? errorIcon : emptyIcon;
        placeholderEl.innerHTML =
          '<div class="state ' +
          (kind === 'error' ? 'error' : '') +
          '">' +
          '<div class="glyph">' +
          glyph +
          '</div>' +
          '<div class="title">' +
          esc(title) +
          '</div>' +
          '<div class="sub">' +
          esc(sub) +
          '</div>' +
          '</div>';
      }

      function render(data) {
        placeholderEl.innerHTML = '';
        setCount(data.length);

        if (data.length === 0) {
          showState(
            'empty',
            'No students yet',
            'Add the first one using the form above.',
          );
          return;
        }

        listEl.innerHTML = data
          .map((s) => {
            const hasAddress = s.address && String(s.address).trim();
            return (
              '<li class="row">' +
              '<span class="avatar">' +
              esc(initials(s.name)) +
              '</span>' +
              '<div class="row-body">' +
              '<div class="row-name">' +
              esc(s.name) +
              '</div>' +
              '<div class="row-address' +
              (hasAddress ? '' : ' empty') +
              '">' +
              (hasAddress ? esc(s.address) : 'No address on file') +
              '</div>' +
              '</div>' +
              '<button class="btn-del" onclick="del(' +
              Number(s.id) +
              ')">Delete</button>' +
              '</li>'
            );
          })
          .join('');
      }

      async function load() {
        try {
          const res = await fetch(API + '/getall');
          if (!res.ok) throw new Error('HTTP ' + res.status);
          const data = await res.json();
          render(data);
        } catch (err) {
          setCount(0);
          showState(
            'error',
            'Could not load students',
            'The service did not respond. Check that the backend is running.',
          );
        }
      }

      async function add() {
        const name = nameEl.value.trim();
        const address = addressEl.value.trim();
        if (!name) {
          nameEl.focus();
          return;
        }

        addBtn.disabled = true;
        try {
          const res = await fetch(API + '/add', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body:
              'name=' +
              encodeURIComponent(name) +
              '&address=' +
              encodeURIComponent(address),
          });
          if (!res.ok) throw new Error('HTTP ' + res.status);
          nameEl.value = '';
          addressEl.value = '';
          await load();
          nameEl.focus();
        } catch (err) {
          showState(
            'error',
            'Could not add student',
            'The request failed. Please try again.',
          );
        } finally {
          addBtn.disabled = false;
        }
      }

      async function del(id) {
        try {
          const res = await fetch(API + '/delete/' + id, { method: 'POST' });
          if (!res.ok) throw new Error('HTTP ' + res.status);
          await load();
        } catch (err) {
          showState(
            'error',
            'Could not delete student',
            'The request failed. Please try again.',
          );
        }
      }

      // Submit on Enter from either field.
      [nameEl, addressEl].forEach((el) =>
        el.addEventListener('keydown', (e) => {
          if (e.key === 'Enter') add();
        }),
      );

      load();
    </script>
  </body>
</html>
