<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BeautyRatingPlatform.Default" %>

<!doctype html>
<html lang="fa" dir="rtl">
<head>
    <html xmlns="http://www.w3.org/1999/xhtml"> <head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>مشاور زیبایی بینی | Rhinoplasty Coach</title>
  <meta name="description" content="مشاوره تخصصی زیبایی بینی، آنالیز چهره و همراهی قبل و بعد از عمل با کیفیت بسیار بالا." />

  <!-- فونت فارسی (در صورت نیاز می‌توانید آفلاین جایگزین کنید) -->
  <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@300;400;600;800&display=swap" rel="stylesheet">

  <style>
    /* --- پایه --- */
    :root{
      --bg1:#0f172a; /* slate-900 */
      --bg2:#1e293b; /* slate-800 */
      --acc1:#38bdf8; /* sky-400 */
      --acc2:#a78bfa; /* violet-400 */
      --acc3:#f472b6; /* pink-400 */
      --glass-bg: rgba(255,255,255,.08);
      --glass-brd: rgba(255,255,255,.18);
      --radius: 22px;
      --shadow: 0 10px 30px rgba(0,0,0,.25);
      --maxw: 1200px;
    }
    *{box-sizing:border-box}
    html{scroll-behavior:smooth}
    body{
      margin:0; color:#f8fafc; background: radial-gradient(1200px 800px at 10% 10%, #0b1224 0%, var(--bg1) 35%, var(--bg2) 100%) fixed;
      font-family: 'Vazirmatn', system-ui, -apple-system, Segoe UI, Roboto, sans-serif;
      line-height:1.8; overflow-x:hidden;
    }

    /* پس‌زمینه‌های نوری شناور */
    .orbs{position:fixed; inset:0; z-index:-2; filter: blur(80px);}
    .orb{position:absolute; width:520px; height:520px; border-radius:9999px; opacity:.65; mix-blend-mode:screen;}
    .o1{background:radial-gradient(circle at 30% 30%, var(--acc1), transparent 60%); left:-120px; top:-120px; animation:float 16s ease-in-out infinite;}
    .o2{background:radial-gradient(circle at 70% 50%, var(--acc2), transparent 60%); right:-140px; top:20vh; animation:float 18s ease-in-out -4s infinite;}
    .o3{background:radial-gradient(circle at 40% 60%, var(--acc3), transparent 60%); left:20vw; bottom:-160px; animation:float 20s ease-in-out -8s infinite;}
    @keyframes float{ 0%,100%{transform:translateY(0)} 50%{transform:translateY(-30px)} }

    /* نوار ناوبری شیشه‌ای */
    header{
      position:sticky; top:0; z-index:50; backdrop-filter: blur(14px) saturate(150%);
      background: linear-gradient(to right, rgba(15,23,42,.55), rgba(30,41,59,.35));
      border-bottom:1px solid rgba(255,255,255,.08);
    }
    .nav{max-width:var(--maxw); margin:auto; display:flex; align-items:center; justify-content:space-between; padding:14px 20px;}
    .brand{display:flex; gap:10px; align-items:center; text-decoration:none; color:#e2e8f0; font-weight:800; letter-spacing:.2px}
    .logo{width:36px; height:36px; display:grid; place-items:center; border-radius:14px; background:linear-gradient(135deg, var(--acc1), var(--acc3)); box-shadow: var(--shadow);}
    nav a{color:#cbd5e1; text-decoration:none; margin-inline:10px; padding:10px 14px; border-radius:14px;}
    nav a:hover{background: rgba(255,255,255,.06); color:#fff}
    .cta-sm{display:none}

    /* قهرمان (هیرو) */
    .wrap{max-width:var(--maxw); margin:auto; padding: 48px 20px}
    .hero{display:grid; grid-template-columns:1.3fr 1fr; gap:32px; align-items:center;}
    .glass{
      background: var(--glass-bg);
      border:1px solid var(--glass-brd);
      border-radius: var(--radius);
      backdrop-filter: blur(16px) saturate(160%);
      -webkit-backdrop-filter: blur(16px) saturate(160%);
      box-shadow: var(--shadow);
    }
    .hero .card{padding:34px}
    .kicker{display:inline-block; padding:6px 12px; border-radius:999px; border:1px solid rgba(255,255,255,.15); background:rgba(255,255,255,.05); font-size:12px; letter-spacing:.5px; margin-bottom:14px}
    h1{margin:0 0 10px; font-size:42px; line-height:1.25}
    .sub{color:#cbd5e1; font-size:16px}

    .btns{display:flex; flex-wrap:wrap; gap:12px; margin-top:22px}
    .btn{
      display:inline-flex; align-items:center; gap:10px; padding:12px 18px; border-radius:16px; text-decoration:none; color:#0b1224; font-weight:700; background:linear-gradient(135deg, #fff, #e2e8f0); border:1px solid rgba(255,255,255,.5);
    }
    .btn.ghost{background:rgba(255,255,255,.08); color:#f8fafc; border:1px solid rgba(255,255,255,.2)}
    .btn:hover{transform:translateY(-2px); transition:.2s}

    .hero-visual{position:relative; min-height:360px}
    .hero-visual .ellipse{position:absolute; inset:0; border-radius:28px; border:1px solid var(--glass-brd); background: radial-gradient(120% 120% at 20% 0%, rgba(255,255,255,.18), rgba(255,255,255,.06));}
    .badge{position:absolute; left:-10px; bottom:-10px; padding:10px 14px; border-radius:16px; font-weight:700; background:linear-gradient(135deg, var(--acc1), var(--acc2));}

    /* شبکه کارت‌ها */
    .grid{display:grid; grid-template-columns:repeat(3,1fr); gap:18px}
    .card{padding:22px}
    .card h3{margin:10px 0 8px}
    .muted{color:#cbd5e1}
    .icon{width:38px; height:38px; display:grid; place-items:center; border-radius:12px; background:linear-gradient(135deg, rgba(56,189,248,.25), rgba(167,139,250,.25)); border:1px solid var(--glass-brd)}

    /* گالری قبل/بعد */
    .gallery{display:grid; grid-template-columns:repeat(3,1fr); gap:14px}
    figure{margin:0}
    .ba{position:relative; border-radius:18px; overflow:hidden; border:1px solid var(--glass-brd);}
    .ba img{width:100%; height:260px; object-fit:cover; display:block; filter:saturate(105%)}
    .tag{position:absolute; top:10px; right:10px; background:rgba(0,0,0,.45); padding:6px 10px; border-radius:999px; font-size:12px}

    /* نظرات */
    .quotes{display:grid; grid-template-columns:repeat(3,1fr); gap:18px}
    blockquote{margin:0; font-size:15px}

    /* سوالات متداول با details/summary */
    details{border-radius:16px; border:1px solid var(--glass-brd); background:rgba(255,255,255,.05); padding:14px 16px}
    details + details{margin-top:10px}
    summary{cursor:pointer; font-weight:700}

    /* فرم تماس */
    form{display:grid; grid-template-columns:1fr 1fr; gap:12px}
    label{font-size:14px; color:#e2e8f0}
    input, textarea{
      width:100%; padding:12px 14px; border-radius:14px; border:1px solid var(--glass-brd);
      background:rgba(255,255,255,.06); color:#fff; outline:none;
    }
    textarea{min-height:120px; grid-column:1/-1; resize:vertical}
    .form-actions{grid-column:1/-1; display:flex; gap:10px; justify-content:flex-start}

    /* فوتر */
    footer{margin-top:40px; padding:26px 20px; border-top:1px solid rgba(255,255,255,.08); color:#cbd5e1; text-align:center}

    /* ریسپانسیو */
    @media (max-width: 1024px){
      .hero{grid-template-columns:1fr}
      .gallery{grid-template-columns:repeat(2,1fr)}
      .quotes{grid-template-columns:repeat(2,1fr)}
      .grid{grid-template-columns:repeat(2,1fr)}
    }
    @media (max-width: 640px){
      .nav nav{display:none}
      .cta-sm{display:inline-flex}
      .gallery, .quotes, .grid{grid-template-columns:1fr}
      h1{font-size:32px}
      .hero-visual{min-height:260px}
      form{grid-template-columns:1fr}
    }
  </style>
</head>
<body>
  <!-- پس‌زمینه‌های نوری نرم -->
  <div class="orbs" aria-hidden="true">
    <div class="orb o1"></div>
    <div class="orb o2"></div>
    <div class="orb o3"></div>
  </div>

  <!-- ناوبری -->
  <header>
    <div class="nav">
      <a class="brand" href="#home" aria-label="خانه">
        <span class="logo" aria-hidden="true">
          <!-- بینی مینی‌مال با SVG -->
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
            <path d="M12 2c2 3 3 5 3 8 0 2 1 3 2 5 1 2 0 5-5 5s-6-3-5-5c1-2 2-3 2-5 0-3 1-5 3-8Z" stroke="white" stroke-width="1.4"/>
          </svg>
        </span>
        <span>مشاور زیبایی بینی</span>
      </a>
      <nav>
        <a href="#services">خدمات</a>
        <a href="#gallery">قبل و بعد</a>
        <a href="#faq">سؤالات متداول</a>
        <a href="#contact" class="btn ghost">رزرو مشاوره</a>
      </nav>
      <a href="#contact" class="btn cta-sm">رزرو سریع</a>
    </div>
  </header>

  <!-- هیرو -->
  <main id="home" class="wrap">
    <section class="hero">
      <div class="card glass">
        <span class="kicker">Consult & Care • Premium</span>
        <h1>مشاوره تخصصی زیبایی بینی با نگاه طبیعی</h1>
        <p class="sub">آنالیز چهره، شبیه‌سازی بدون جراحی، برنامه‌ریزی شخصی‌سازی‌شده پیش از عمل و همراهی کامل در دوران نقاهت. همه در یک تجربه لوکس و شفاف با تم شیشه‌ای.</p>
        <div class="btns">
          <a class="btn" href="#contact">رزرو مشاوره رایگان</a>
          <a class="btn ghost" href="#services">مشاهده خدمات</a>
        </div>
      </div>
      <div class="hero-visual glass">
        <div class="ellipse"></div>
        <div class="badge">+1200 مورد موفق</div>
      </div>
    </section>

    <!-- امتیازها/هایلایت -->
    <section class="wrap" style="padding-top:28px">
      <div class="grid">
        <div class="card glass">
          <div class="icon" aria-hidden="true">💠</div>
          <h3>آنالیز اختصاصی بینی</h3>
          <p class="muted">بررسی ساختار بینی و تناسبات چهره با رویکرد حفظ هارمونی طبیعی.</p>
        </div>
        <div class="card glass">
          <div class="icon" aria-hidden="true">🧭</div>
          <h3>نقشه راه شخصی</h3>
          <p class="muted">از انتخاب جراح تا آماده‌سازی قبل از عمل و مراقبت‌های بعد از آن.</p>
        </div>
        <div class="card glass">
          <div class="icon" aria-hidden="true">🔒</div>
          <h3>حریم خصوصی و اطمینان</h3>
          <p class="muted">جلسات محرمانه، اطلاعات شفاف و پشتیبانی واقعی.</p>
        </div>
      </div>
    </section>

    <!-- خدمات -->
    <section id="services" class="wrap">
      <h2 style="margin-bottom:12px">خدمات ویژه</h2>
      <p class="muted" style="margin-top:0">بسته‌های متنوع برای نیازهای متفاوت – از مشاوره اولیه تا همراهی VIP.</p>
      <div class="grid">
        <article class="card glass">
          <h3>مشاوره پایه</h3>
          <p class="muted">ارزیابی اولیه، پاسخ به پرسش‌ها و ارائه مسیر پیشنهادی.</p>
          <ul style="margin:0 0 8px 18px">
            <li>بررسی فرم فعلی بینی</li>
            <li>پیشنهادهای غیرجراحی</li>
            <li>پرسش و پاسخ</li>
          </ul>
          <a class="btn ghost" href="#contact">درخواست</a>
        </article>
        <article class="card glass">
          <h3>آنالیز پیشرفته + شبیه‌سازی</h3>
          <p class="muted">آنالیز کامل چهره و نمایش نتایج احتمالی با حفظ حالت طبیعی.</p>
          <ul style="margin:0 0 8px 18px">
            <li>اندازه‌گیری نسبت‌های صورت</li>
            <li>شبیه‌سازی سه‌بعدی ساده</li>
            <li>پلن مراقبتی شخصی</li>
          </ul>
          <a class="btn ghost" href="#contact">رزرو</a>
        </article>
        <article class="card glass">
          <h3>همراهی VIP</h3>
          <p class="muted">کاورِ کامل از انتخاب جراح تا فالوآپ‌های پس از عمل.</p>
          <ul style="margin:0 0 8px 18px">
            <li>هماهنگی زمان‌ها</li>
            <li>چک‌لیست‌های پیش و پس از عمل</li>
            <li>پشتیبانی 24/7</li>
          </ul>
          <a class="btn" href="#contact">شروع همکاری</a>
        </article>
      </div>
    </section>

    <!-- گالری قبل و بعد -->
    <section id="gallery" class="wrap">
      <h2 style="margin-bottom:12px">نمونه‌های قبل و بعد</h2>
      <p class="muted">برای حفظ حریم خصوصی، تصاویر به‌صورت نمایشی هستند. تصاویر واقعی را می‌توانید در جلسه مشاهده کنید.</p>
      <div class="gallery">
        <figure class="ba glass">
          <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1200&auto=format&fit=crop" alt="نمونه قبل و بعد - نمای روبرو" loading="lazy">
          <figcaption class="tag">روبرو</figcaption>
        </figure>
        <figure class="ba glass">
          <img src="https://images.unsplash.com/photo-1544005314-4d9f9a9d0e4b?q=80&w=1200&auto=format&fit=crop" alt="نمونه قبل و بعد - نمای نیم‌رخ" loading="lazy">
          <figcaption class="tag">نیم‌رخ</figcaption>
        </figure>
        <figure class="ba glass">
          <img src="https://images.unsplash.com/photo-1521119989659-a83eee488004?q=80&w=1200&auto=format&fit=crop" alt="نمونه قبل و بعد - نمای سه‌رخ" loading="lazy">
          <figcaption class="tag">سه‌رخ</figcaption>
        </figure>
      </div>
    </section>

    <!-- نظرات کاربران -->
    <section class="wrap">
      <h2 style="margin-bottom:12px">تجربه مراجعین</h2>
      <div class="quotes">
        <article class="card glass">
          <blockquote>با راهنمایی دقیق، توانستم جراح مناسب پیدا کنم و نتیجه‌ام بسیار طبیعی شد.</blockquote>
          <p class="muted" style="margin:8px 0 0">– ن. الف</p>
        </article>
        <article class="card glass">
          <blockquote>چک‌لیست‌های قبل و بعد از عمل خیلی کمک کرد؛ استرسم کم شد.</blockquote>
          <p class="muted" style="margin:8px 0 0">– س. ک</p>
        </article>
        <article class="card glass">
          <blockquote>شبیه‌سازی تقریبی خیلی واقعی بود و تصمیم‌گیری را راحت کرد.</blockquote>
          <p class="muted" style="margin:8px 0 0">– م. د</p>
        </article>
      </div>
    </section>

    <!-- سوالات متداول -->
    <section id="faq" class="wrap">
      <h2 style="margin-bottom:12px">سؤالات متداول</h2>
      <div class="card glass">
        <details>
          <summary>آیا همه به عمل نیاز دارند؟</summary>
          <p class="muted">خیر. در بسیاری از موارد با اصلاحات سبک، آموزش میمیک و روش‌های غیرجراحی می‌توان نتیجه مطلوب گرفت.</p>
        </details>
        <details>
          <summary>شبیه‌سازی قطعی است؟</summary>
          <p class="muted">شبیه‌سازی صرفاً کمک تصمیم‌گیری است و نتیجه قطعی جراحی را ضمانت نمی‌کند؛ اما دید واقع‌بینانه‌تری می‌دهد.</p>
        </details>
        <details>
          <summary>چطور جراح مناسب انتخاب کنم؟</summary>
          <p class="muted">بر اساس آناتومی شما، سبک مورد علاقه، نمونه‌کار، امتیاز مراجعین و جلسات مشاوره مقایسه‌ای پیشنهاد می‌شود.</p>
        </details>
      </div>
    </section>

    <!-- تماس -->
    <section id="contact" class="wrap">
      <h2 style="margin-bottom:12px">در تماس باشید</h2>
      <div class="card glass">
        <form onsubmit="event.preventDefault(); alert('درخواست شما ثبت شد. به‌زودی با شما تماس می‌گیریم.');">
          <div>
            <label for="name">نام و نام خانوادگی</label>
            <input id="name" type="text" placeholder="مثال: نگار رضایی" required>
          </div>
          <div>
            <label for="phone">شماره تماس / واتساپ</label>
            <input id="phone" type="tel" placeholder="0912..." required>
          </div>
          <div>
            <label for="service">نوع خدمت موردنیاز</label>
            <input id="service" type="text" placeholder="مشاوره، شبیه‌سازی، VIP ...">
          </div>
          <div>
            <label for="date">بازه زمانی ترجیحی</label>
            <input id="date" type="text" placeholder="این هفته / هفته آینده">
          </div>
          <div style="grid-column:1 / -1">
            <label for="msg">توضیحات</label>
            <textarea id="msg" placeholder="مختصر درباره هدف و دغدغه‌های خود بنویسید..."></textarea>
          </div>
          <div class="form-actions">
            <button class="btn" type="submit">ارسال درخواست</button>
            <a class="btn ghost" href="tel:+989000000000">تماس مستقیم</a>
          </div>
        </form>
      </div>
      <p class="muted" style="margin-top:10px; font-size:13px">با ارسال فرم، موافقت می‌کنید که جهت هماهنگی با شما تماس گرفته شود. اطلاعات شما محرمانه است.</p>
    </section>
  </main>

  <footer>
    © <span id="y"></span> مشاور زیبایی بینی • همه حقوق محفوظ است
  </footer>

  <script>
      // سال جاری در فوتر
      document.getElementById('y').textContent = new Date().getFullYear();
  </script>
</body>
</html>