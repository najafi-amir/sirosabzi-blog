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
            background: #fff;
            color: rgb(42, 30, 22);
            line-height: 1.6;
          }
          header {
            padding: 1.5rem 1.5rem 0;
            max-width: 768px;
            margin: 0 auto;
          }
          .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-bottom: 1.5rem;
          }
          .site-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: rgb(42, 30, 22);
            text-decoration: none;
          }
          .site-title:hover {
            text-decoration: underline;
            text-decoration-color: rgb(196, 98, 45);
            text-underline-offset: 3px;
            text-decoration-thickness: 2px;
          }
          .back-link {
            font-size: 0.875rem;
            color: rgb(154, 132, 120);
            text-decoration: none;
          }
          .back-link:hover {
            text-decoration: underline;
            text-decoration-color: rgb(196, 98, 45);
            text-underline-offset: 2px;
            text-decoration-thickness: 2px;
            color: rgb(42, 30, 22);
          }
          main {
            max-width: 768px;
            margin: 0 auto;
            padding: 0 1.5rem 2rem;
          }
          .intro {
            background: rgb(253, 250, 247);
            border: 1px solid rgb(240, 237, 232);
            border-radius: 0.375rem;
            padding: 1.25rem 1.5rem;
            margin-bottom: 2rem;
          }
          .intro h1 {
            font-size: 1.125rem;
            font-weight: 700;
            color: rgb(42, 30, 22);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
          }
          .rss-dot {
            display: inline-block;
            width: 0.5rem;
            height: 0.5rem;
            background: rgb(196, 98, 45);
            border-radius: 50%;
            flex-shrink: 0;
          }
          .intro p {
            font-size: 0.875rem;
            color: rgb(122, 92, 62);
            line-height: 1.7;
          }
          .intro a {
            color: rgb(196, 98, 45);
            text-decoration: underline;
            text-underline-offset: 2px;
            text-decoration-thickness: 1px;
          }
          .intro a:hover { text-decoration-thickness: 2px; }
          .feed-url {
            margin-top: 0.75rem;
            font-family: ui-monospace, SFMono-Regular, 'SF Mono', Menlo, monospace;
            font-size: 0.75rem;
            background: #fff;
            padding: 0.4rem 0.75rem;
            border-radius: 0.25rem;
            border: 1px solid rgb(240, 237, 232);
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
            font-size: 1.125rem;
            font-weight: 600;
            margin-bottom: 0.2rem;
            line-height: 1.4;
          }
          article h2 a {
            text-decoration: none;
            color: rgb(42, 30, 22);
          }
          article h2 a:hover {
            text-decoration: underline;
            text-decoration-color: rgb(196, 98, 45);
            text-underline-offset: 2px;
            text-decoration-thickness: 2px;
          }
          .meta {
            font-size: 0.75rem;
            color: rgb(154, 132, 120);
            margin-bottom: 0.4rem;
          }
          article p {
            font-size: 0.875rem;
            color: rgb(122, 92, 62);
            line-height: 1.7;
          }
          footer {
            max-width: 768px;
            margin: 0 auto;
            padding: 2rem 1.5rem;
            text-align: center;
            font-size: 0.75rem;
            color: rgb(154, 132, 120);
          }
          footer a { color: rgb(154, 132, 120); text-decoration: none; }
          footer a:hover {
            text-decoration: underline;
            text-decoration-color: rgb(196, 98, 45);
            text-underline-offset: 2px;
          }
          @media (max-width: 640px) {
            header, main { padding-left: 1rem; padding-right: 1rem; }
            .intro { padding: 1rem 1.25rem; }
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
              <span class="rss-dot"></span>
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
