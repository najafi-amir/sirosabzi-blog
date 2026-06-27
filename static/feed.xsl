<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="/rss/channel/title"/> — RSS Feed</title>
        <style>
          * { margin: 0; padding: 0; box-sizing: border-box; }
          body {
            font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: rgb(253, 250, 247);
            color: rgb(42, 30, 22);
            line-height: 1.6;
          }
          header {
            background: rgb(253, 250, 247);
            border-bottom: 1px solid rgb(232, 221, 210);
            padding: 1rem 1.5rem;
          }
          .header-inner {
            max-width: 768px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
          }
          .site-title {
            font-size: 1.25rem;
            font-weight: 800;
            color: rgb(42, 30, 22);
            text-decoration: none;
          }
          .site-title:hover { color: rgb(196, 98, 45); }
          .back-link {
            font-size: 0.875rem;
            color: rgb(122, 92, 62);
            text-decoration: none;
          }
          .back-link:hover { text-decoration: underline; color: rgb(196, 98, 45); }
          main {
            max-width: 768px;
            margin: 2rem auto;
            padding: 0 1.5rem;
          }
          .intro {
            background: rgb(255, 255, 255);
            border: 1px solid rgb(232, 221, 210);
            border-radius: 0.5rem;
            padding: 1.5rem;
            margin-bottom: 2rem;
          }
          .intro h1 {
            font-size: 1.5rem;
            font-weight: 800;
            color: rgb(42, 30, 22);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
          }
          .rss-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 1.5rem;
            height: 1.5rem;
            background: rgb(196, 98, 45);
            border-radius: 0.25rem;
            flex-shrink: 0;
          }
          .rss-icon svg { width: 0.875rem; height: 0.875rem; fill: white; }
          .intro p { font-size: 0.875rem; color: rgb(122, 92, 62); line-height: 1.7; }
          .intro a { color: rgb(196, 98, 45); text-decoration: underline; text-underline-offset: 2px; }
          .intro a:hover { color: rgb(176, 80, 32); }
          .feed-url {
            margin-top: 0.75rem;
            font-family: ui-monospace, SFMono-Regular, 'SF Mono', Menlo, monospace;
            font-size: 0.8rem;
            background: rgb(253, 250, 247);
            padding: 0.5rem 0.75rem;
            border-radius: 0.375rem;
            border: 1px solid rgb(232, 221, 210);
            display: inline-block;
            color: rgb(97, 75, 55);
            word-break: break-all;
          }
          article {
            padding: 1.25rem 0;
            border-bottom: 1px solid rgb(240, 237, 232);
          }
          article:last-child { border-bottom: none; }
          article h2 {
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
            line-height: 1.4;
          }
          article h2 a {
            text-decoration: none;
            color: rgb(42, 30, 22);
          }
          article h2 a:hover {
            color: rgb(196, 98, 45);
            text-decoration: underline;
            text-underline-offset: 2px;
          }
          .meta {
            font-size: 0.75rem;
            color: rgb(154, 132, 120);
            margin-bottom: 0.5rem;
          }
          article p {
            font-size: 0.875rem;
            color: rgb(122, 92, 62);
            line-height: 1.7;
          }
          footer {
            max-width: 768px;
            margin: 3rem auto 0;
            padding: 1.5rem;
            text-align: center;
            font-size: 0.8rem;
            color: rgb(154, 132, 120);
            border-top: 1px solid rgb(240, 237, 232);
          }
          footer a { color: rgb(196, 98, 45); text-decoration: none; }
          footer a:hover { text-decoration: underline; }
          @media (max-width: 640px) {
            main { padding: 0 1rem; }
            .intro { padding: 1.25rem; }
          }
        </style>
      </head>
      <body>
        <header>
          <div class="header-inner">
            <a href="/" class="site-title"><xsl:value-of select="/rss/channel/title"/></a>
            <a href="/" class="back-link">&#8592; Back to site</a>
          </div>
        </header>
        <main>
          <div class="intro">
            <h1>
              <span class="rss-icon"><svg viewBox="0 0 24 24"><path d="M6.18 15.64a2.18 2.18 0 0 1 2.18 2.18C8.36 19.01 7.38 20 6.18 20C4.98 20 4 19.01 4 17.82a2.18 2.18 0 0 1 2.18-2.18M4 4.44A15.56 15.56 0 0 1 19.56 20h-2.83A12.73 12.73 0 0 0 4 7.27V4.44m0 5.66a9.9 9.9 0 0 1 9.9 9.9h-2.83A7.07 7.07 0 0 0 4 12.93V10.1z"/></svg></span>
              RSS Feed
            </h1>
            <p>Subscribe to <strong><xsl:value-of select="/rss/channel/title"/></strong> by copying the URL below into your feed reader.</p>
            <p class="feed-url"><xsl:value-of select="/rss/channel/atom:link/@href"/></p>
          </div>
          <xsl:for-each select="/rss/channel/item">
            <article>
              <h2><a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a></h2>
              <p class="meta"><xsl:value-of select="pubDate"/></p>
              <p><xsl:value-of select="description"/></p>
            </article>
          </xsl:for-each>
        </main>
        <footer>
          <p>&#169; 2026 <a href="/"><xsl:value-of select="/rss/channel/title"/></a> &#183; Content licensed under <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/">CC BY-NC-ND 4.0</a></p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
