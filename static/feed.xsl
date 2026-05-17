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
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600&amp;family=Inter:wght@400;500&amp;display=swap" rel="stylesheet"/>
        <style>
          * { margin: 0; padding: 0; box-sizing: border-box; }
          body { font-family: 'Inter', sans-serif; background: #fff; color: #1a1a1a; }
          header { background: #C9B49A; padding: 1.25rem 2rem; border-bottom: 1px solid #B8A088; }
          .header-inner { max-width: 860px; margin: 0 auto; display: flex; align-items: center; justify-content: space-between; }
          .site-title { font-family: 'Playfair Display', Georgia, serif; font-size: 26px; color: #3D2B1F; text-decoration: none; }
          main { max-width: 860px; margin: 3rem auto; padding: 0 1.5rem; }
          .intro { background: #FDFAF7; border: 1px solid #E8DDD2; border-radius: 8px; padding: 1.25rem 1.5rem; margin-bottom: 2.5rem; }
          .intro h1 { font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 600; margin-bottom: 0.5rem; }
          .intro p { font-size: 14px; color: #666; line-height: 1.6; }
          .intro a { color: #C4622D; }
          .rss-icon { display: inline-block; width: 14px; height: 14px; background: #C4622D; border-radius: 3px; margin-right: 6px; vertical-align: middle; position: relative; top: -1px; }
          article { padding: 1.75rem 0; border-bottom: 1px solid #F0EDE8; }
          article:last-child { border-bottom: none; }
          article h2 { font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 600; margin-bottom: 0.4rem; }
          article h2 a { text-decoration: none; color: #1a1a1a; }
          article h2 a:hover { color: #C4622D; }
          .meta { font-size: 12px; color: #aaa; margin-bottom: 0.6rem; letter-spacing: 0.03em; }
          article p { font-size: 15px; color: #666; line-height: 1.65; }
          footer { background: #C9B49A; padding: 1.5rem 2rem; margin-top: 5rem; text-align: center; font-size: 13px; color: #1a1a1a; border-top: 1px solid #B8A088; }
        </style>
      </head>
      <body>
        <header>
          <div class="header-inner">
            <a href="/" class="site-title">SIR و SABZI</a>
            <a href="/" style="font-size:12px; color:#1a1a1a; text-decoration:none; letter-spacing:0.08em; text-transform:uppercase; font-weight:500;">← Back to site</a>
          </div>
        </header>
        <main>
          <div class="intro">
            <h1>RSS Feed</h1>
            <p>This is the RSS feed for <strong><xsl:value-of select="/rss/channel/title"/></strong>. Subscribe by copying the URL into your feed reader — <a href="https://feedly.com" target="_blank">Feedly</a>, NetNewsWire, Reeder, or any other RSS app.</p>
            <p style="margin-top:0.5rem; font-family: monospace; font-size: 13px; background: #fff; padding: 0.4rem 0.75rem; border-radius: 4px; border: 1px solid #E8DDD2; display: inline-block;"><xsl:value-of select="/rss/channel/atom:link/@href"/></p>
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
          <p>&#169; <xsl:value-of select="/rss/channel/title"/></p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
