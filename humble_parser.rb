#!/usr/bin/ruby

require 'nokogiri'
require 'net/https'

class String

    def prefix(symbol='+', wrapper=["[","]"], space_char=" ", rep=1)

        return (wrapper[0] + symbol + wrapper[1]) + (space_char * rep) + self

    end

end

=begin

Extract the post-rendered html code by
1. visiting the web page
2. viewing element
3. editing the root html element
4. copying and pasting the source below the _END_ keyword

Sample Link: https://dl.humble.com/battlestargalacticaandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&ttl=1502225343&t=a0ef6e28c8c7323ffe5547971fe698aa

=end

puts
print "Parsing DATA...".prefix
# create a Nokogiri document from the DATA io object
noko = Nokogiri::XML(DATA)
puts "done!"

puts "Downloading files...".prefix
puts
# query the document for all links and iterate over each one
noko.xpath('//a').each do |ele|

  # extract the value of the href attribute
  href = ele.attributes["href"]

  # determine if it's a download link
  if href.respond_to?(:content) and href.content =~ /dl\.humble/

    # convert the content to a URI object
    uri = URI(href.content)

    # extract the filename from the path
    filename = uri.path.gsub('/','')

    puts "\t#{filename}"

    # download the file
    response = Net::HTTP.get_response(uri)

    # write the file to disk
    File::open('downloaded_files/'+filename, 'wb') {|outfile| outfile.write(response.body)}

  end

end

puts
puts "All files downloaded!".prefix
puts "exiting..."
puts

__END__

<html lang="en" class=""><head><script src="https://apis.google.com/_/scs/apps-static/_/js/k=oz.gapi.en.xh47SggJVmI.O/m=auth/exm=follow,plusone/rt=j/sv=1/d=1/ed=1/am=AQ/rs=AGLTcCNnAKKXzFeIiJTiMA4Bq29frxjzuA/cb=gapi.loaded_1" async=""></script><script src="https://apis.google.com/_/scs/apps-static/_/js/k=oz.gapi.en.xh47SggJVmI.O/m=follow,plusone/rt=j/sv=1/d=1/ed=1/am=AQ/rs=AGLTcCNnAKKXzFeIiJTiMA4Bq29frxjzuA/cb=gapi.loaded_0" async=""></script><script type="text/javascript" async="" src="https://www.gstatic.com/recaptcha/api2/r20170731114946/recaptcha__en.js"></script><script type="text/javascript" async="" src="https://cdn.siftscience.com/s.js"></script>
  <title>
  
    Humble Book Bundle: Fandom &amp; Philosophy presented by Wiley-Blackwell (pay what you want and help charity)
  
</title>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="application-name" content="Humble Bundle">
  <meta name="msapplication-TileColor" content="rgb(218,222,230)">
  <meta name="msapplication-TileImage" content="https://humblebundle-a.akamaihd.net/static/hashed/49bccd0f2050e5fcfc3c442b269d4ff47b038ed9.png">
  <meta name="medium" content="news">
  <meta name="theme-color" content="rgb(73,79,92)">
  <meta property="og:site_name" content="Humble Bundle">
  <meta property="og:type" content="website">
  <meta property="fb:app_id" content="101146256651042">
  <meta property="fb:profile_id" content="162315830478396"><meta name="robots" content="noindex, nofollow">
  
  <meta name="og:image:width" contents="1200">
  <meta name="og:image:height" contents="630">
  <meta itemprop="image" content="https://humblebundle.imgix.net/misc/files/hashed/2dbb3b5b7e47cd319a3fe8914961fe0d57a87581.png?auto=format&amp;lossless=1&amp;ixlib=python-0.2.0&amp;s=cadb1b1270b6085744cc0c37b37ebd18">
  <meta name="title" content="Humble Book Bundle: Fandom &amp; Philosophy presented by Wiley-Blackwell">
  <meta name="description" content="Pay what you want for deliciously nerdy ebooks and support charity!">
  <meta property="og:url" content="https://www.humblebundle.com/books/fandom-philosophy-books">
  <meta property="og:title" content="Humble Book Bundle: Fandom &amp; Philosophy presented by Wiley-Blackwell">
  <meta property="og:description" content="Pay what you want for deliciously nerdy ebooks and support charity!">
  <meta property="og:image" content="https://humblebundle.imgix.net/misc/files/hashed/2dbb3b5b7e47cd319a3fe8914961fe0d57a87581.png?auto=format&amp;lossless=1&amp;ixlib=python-0.2.0&amp;s=cadb1b1270b6085744cc0c37b37ebd18">
  <link rel="image_src" href="https://humblebundle.imgix.net/misc/files/hashed/2dbb3b5b7e47cd319a3fe8914961fe0d57a87581.png?auto=format&amp;lossless=1&amp;ixlib=python-0.2.0&amp;s=cadb1b1270b6085744cc0c37b37ebd18">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:site" content="@humble">
  <meta name="twitter:title" content="Humble Book Bundle: Fandom &amp; Philosophy presented by Wiley-Blackwell">
  <meta name="twitter:description" content="Pay what you want for deliciously nerdy ebooks and support charity!">
  <meta name="twitter:image" content="https://humblebundle.imgix.net/misc/files/hashed/62fc84d7d53f95774dfd62c46a586f546ef64318.png?auto=format&amp;lossless=1&amp;ixlib=python-0.2.0&amp;s=9871033765244209fa0de634ae6bb2d5">
  <meta name="twitter:url" content="https://www.humblebundle.com/books/fandom-philosophy-books">

  <link rel="apple-touch-icon" sizes="144x144" href="https://humblebundle-a.akamaihd.net/static/hashed/03df0490a53d595fd930f9fff52038366d60a05d.png">
  <link rel="icon" type="image/png" sizes="16x16" href="https://humblebundle-a.akamaihd.net/static/hashed/4c8bbc6fc7b2b8a9fa21e895afe1157188e28bfb.png">
  <link rel="icon" type="image/png" sizes="32x32" href="https://humblebundle-a.akamaihd.net/static/hashed/46cf2ed85a0641bfdc052121786440c70da77d75.png">
  <link rel="shortcut icon" href="https://humblebundle-a.akamaihd.net/static/hashed/47e474eed38083df699b7dfd8d29d575e3398f1e.ico">
  <link rel="search" type="application/opensearchdescription+xml" title="Humble Bundle Search" href="https://humblebundle-a.akamaihd.net/static/hashed/6606d9a78e51b66308bfa309bcba0b60395dd5e5.xml">
  <link rel="alternate" type="application/rss+xml" title="Humble Mumble" href="http://blog.humblebundle.com/rss">

  <style>
    
    .button { border: none; border-radius: 3px; color: white !important; cursor: pointer; display: inline-block; font-size: 14px; line-height: 26px; margin: 0; padding: 0px 10px; text-decoration: none; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2); transition: box-shadow 0.2s ease, background 0.2s ease; }
.button.light-background { box-shadow: 0px 1px 0px 0px rgba(0, 0, 0, 0.1), inset 0px 0px 0px 1px rgba(0, 0, 0, 0.2), inset 0px 2px 0px 0px rgba(255, 255, 255, 0.2); }
.button.dark-background { box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.2), 0px 1px 2px 0px rgba(0, 0, 0, 0.2), inset 0px 1px 0px 0px rgba(255, 255, 255, 0.2); }
.button:focus { outline: none; }
.button:active { box-shadow: inset 0px 1px 2px 0px rgba(0, 0, 0, 0.2), inset 0px 0px 0px 1px rgba(0, 0, 0, 0.2); }
.button.large { box-sizing: border-box; line-height: 46px; font-size: 18px; padding: 0 20px; margin-top: 1px; }
.button.blue { background-image: linear-gradient(-180deg, #4dc4ff 0%, #17a1e6 100%); }
.button.blue:hover { background-image: linear-gradient(-180deg, #80d4ff 0%, #19b2ff 100%); }
.button.blue:active { background: #148fcc; }
.button.red { background-image: linear-gradient(-180deg, #ff5244 0%, #e62217 100%); }
.button.red:hover { background-image: linear-gradient(-180deg, #ff8280 0%, #ff0b0e 100%); }
.button.red:active { background: #148fcc; }
.button.green { background-color: #97b147; background-image: linear-gradient(-180deg, #97b147 0%, #7e992e 100%); }
.button.green:hover { background-image: linear-gradient(-180deg, #adcc52 0%, #93b336 100%); }
.button.green:active { background: #7e992e; }
.button.gray { background-color: #bbb; background-image: linear-gradient(-180deg, #bbb 0%, #aaa 100%); }
.button.gray:hover { background-image: linear-gradient(-180deg, #bbb 0%, #aaa 100%); }
.button.gray:active { background: #999; }
.button.disabled { opacity: 0.5; cursor: default; pointer-events: none; }

.plain-oval, .gray-oval, .round-active-button { padding: 5px 10px; border: 1px solid #898e97; border-radius: 18px; background: white; color: black; font-weight: bold; text-align: center; font-size: 14px; display: inline-block; }
.plain-oval:focus, .gray-oval:focus, .round-active-button:focus { outline: none; }

.gray-oval, .round-active-button { background-color: #a1a7b2; color: white; text-shadow: 1px 1px #898e97; }

.round-active-button { cursor: pointer; background: linear-gradient(-180deg, #97b147 0%, #7e992e 100%); text-decoration: none; color: white !important; }
.round-active-button:hover, .round-active-button:focus { filter: brightness(1.1); }

.fixed-width-button { width: 100px; }

.flat-button { border: 1px solid rgba(0, 0, 0, 0.25); border-radius: 5px; display: inline-block; background-color: transparent; color: white; padding: 0.5em 1em; font-weight: bold; text-align: center; text-decoration: none; transition: background-color 0.1s ease-in-out; }
.flat-button.disabled { opacity: 0.5; cursor: default; pointer-events: none; }
.flat-button.large-button { font-size: 1.15em; }
.flat-button.larger-button { font-size: 1.25em; padding: 0.85em 1.75em; }
.flat-button.green { background-color: #97b147; }
.flat-button.green:hover { background-color: #acc368; }
.flat-button.blue { background-color: #17a1e5; }
.flat-button.blue:hover { background-color: #43b4ec; }
.flat-button.red { background-color: #cb272c; }
.flat-button.red:hover { background-color: #dc494d; }
.flat-button.gray { background-color: #757b86; }
.flat-button.gray:hover { background-color: #90959e; }

.subtab-button { border-radius: 3px; font-family: "Helvetica Neue",Helvetica,Arial,sans-serif; font-weight: bold; font-size: 14px; line-height: 17px; padding: 14px; text-decoration: none; text-shadow: 0px 1px 0px rgba(0, 0, 0, 0.2); }
.subtab-button.grey { box-shadow: inset 0px 2px 0px 0px rgba(255, 255, 255, 0.2), inset 0px -2px 0px 0px rgba(0, 0, 0, 0.5); background-image: linear-gradient(-180deg, #A1A7B2 0%, #7B818C 100%); color: #FFFFFF; }
.subtab-button.orange { box-shadow: inset 0px -2px 0px 0px rgba(255, 255, 255, 0.2), inset 0px 2px 0px 0px rgba(0, 0, 0, 0.2); background-image: linear-gradient(0deg, #FFAF61 0%, #EF9741 100%); color: #FFF3DD; }
.subtab-button:hover, .subtab-button:focus { filter: brightness(1.1); }

.simple-payment-button { outline: none; background: none; border-radius: 3px; border: none; box-shadow: inset 0px 0px 0px 1px #3b3e48; color: #494f5c; cursor: pointer; display: inline-block; line-height: 18px; padding: 10px 15px; text-decoration: none; margin-right: 10px; transition: all, 0.1s; background: #e4e7ed; }
.simple-payment-button:focus { outline: none; }
.simple-payment-button:hover, .simple-payment-button:active { background: #f3f5f7; }

.payment-button { outline: none; background: none; border-radius: 3px; border: none; box-shadow: inset 0px 0px 0px 1px #3b3e48; color: #494f5c; cursor: pointer; display: inline-block; line-height: 18px; padding: 10px 15px; text-decoration: none; margin-right: 10px; transition: all, 0.1s; }
.payment-button:focus { outline: none; }
.payment-button:hover { box-shadow: 0px 1px 0px 0px rgba(0, 0, 0, 0.1), inset 0px 0px 0px 1px rgba(0, 0, 0, 0.2), inset 0px 2px 0px 0px rgba(255, 255, 255, 0.2); }
.payment-button:active { box-shadow: inset 0px 1px 2px 0px rgba(0, 0, 0, 0.2), inset 0px 0px 0px 1px rgba(0, 0, 0, 0.2); }
.payment-button i { vertical-align: middle; }

.stripe-payment-button { background-image: linear-gradient(#4dc4ff, #17a1e6); color: white; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2); box-shadow: 0px 1px 0px 0px rgba(0, 0, 0, 0.1), inset 0px 0px 0px 1px rgba(0, 0, 0, 0.2), inset 0px 2px 0px 0px rgba(255, 255, 255, 0.2); }
.stripe-payment-button:hover { background-image: linear-gradient(#80d4ff, #19b2ff); }
.stripe-payment-button:active { background: #148fcc; }
.stripe-payment-button .hb-stripe { font-size: 18px; margin-right: 4px; }

.paypal-payment-button { background-image: linear-gradient(#ffebc1, #ffaa02); box-shadow: 0px 1px 0px 0px rgba(0, 0, 0, 0.1), inset 0px 0px 0px 1px #c68200, inset 0px 2px 0px 0px rgba(255, 255, 255, 0.6); padding-right: 10px; }
.paypal-payment-button:hover { background-image: linear-gradient(#fff4db, #ffbc36); }
.paypal-payment-button:active { background: #e69a02; }
.paypal-payment-button img { vertical-align: middle; }

.amazon-payment-button { background-image: linear-gradient(#ffe8ab, #f5c747); box-shadow: 0px 1px 0px 0px rgba(0, 0, 0, 0.1), inset 0px 0px 0px 1px #b38b22, inset 0px 2px 0px 0px rgba(255, 255, 255, 0.6); }
.amazon-payment-button:hover { background-image: linear-gradient(#ffeebf, #ffd359); }
.amazon-payment-button:active { background: #d9b03f; }
.amazon-payment-button .hb-amazon { font-size: 18px; margin-right: 4px; }

.bbm-modal { background: #3B3E48; color: white; font-size: 14px; font-weight: normal; box-shadow: 0 0 6px rgba(0, 0, 0, 0.6), 0 1px 2px rgba(0, 0, 0, 0.9); }

.bbm-wrapper { background: rgba(0, 0, 0, 0.1); position: absolute; }

/* Modal positioning */
.bbm-wrapper { box-sizing: border-box; left: 0; top: 0; width: 100%; height: 100%; z-index: 100; padding: 0 10px 0 10px; text-align: left; overflow: auto; }

.bbm-wrapper * { box-sizing: border-box; }

.bbm-modal { border-radius: 3px; margin: auto; margin-bottom: 40px; width: auto; max-width: 550px; }

.bbm-views { width: 100%; box-sizing: border-box; }

.generic-bbm-views { width: 100%; }

/* BLOCKS */
.bbm-modal__topbar, .bbm-modal__bottombar { padding: 0 30px; }

.bbm-modal__topbar { border-bottom: 1px solid rgba(0, 0, 0, 0.1); border-radius: 3px 3px 0 0; padding: 10px 30px; background: #272C33; font-weight: bold; font-size: 16px; margin-bottom: 30px; }
.bbm-modal__topbar i { margin-right: 10px; }
.bbm-modal__topbar > ul { list-style: none; text-align: center; padding: 0; margin: 0; }

.bbm-modal__tab { display: inline-block; padding: 15px 10px; }
.bbm-modal__tab a { font-size: 16px; font-weight: bold; color: #999999; }
.bbm-modal__tab a:hover, .bbm-modal__tab a.active { color: #222222; }

.bbm-modal__title { padding: 20px 30px; margin: 0; line-height: 1em; color: #312d3a; }

.bbm-modal__section { padding: 0 30px; font-size: 14px; font-weight: normal; line-height: 26px; color: white; }
.bbm-modal__section p:last-child { padding: 0; margin-bottom: 0; }
.bbm-modal__section a { color: white; }
.bbm-modal__section h3 { margin: 0; font-size: 20px; line-height: 1em; }

.bbm-modal__bottombar { border-top: 1px solid rgba(0, 0, 0, 0.1); padding: 18px; text-align: right; margin-top: 30px; }

/* MODULES */
.bbm-group { content: ""; display: table; clear: both; }

.bbm-button { display: inline-block; color: rgba(49, 45, 58, 0.8); text-decoration: none; font-size: 14px; font-weight: 500; position: relative; line-height: 1em; padding: 10px 14px; border-radius: 3px; background: #fcfcfc; background-image: -o-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); background-image: -moz-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); background-image: -webkit-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); background-image: -ms-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); background-image: linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); -moz-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1), inset 0 0 0 1px rgba(0, 0, 0, 0.2); -webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1), inset 0 0 0 1px rgba(0, 0, 0, 0.2); box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1), inset 0 0 0 1px rgba(0, 0, 0, 0.2); }
.bbm-button.inactive { opacity: 0.5; pointer-events: none; }
.bbm-button:active { background-image: -o-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); background-image: -moz-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); background-image: -webkit-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); background-image: -ms-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); background-image: linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); -moz-box-shadow: inset 0 1px 2px 0 rgba(0, 0, 0, 0.5), inset 0 0 0 1px rgba(0, 0, 0, 0.2); -webkit-box-shadow: inset 0 1px 2px 0 rgba(0, 0, 0, 0.5), inset 0 0 0 1px rgba(0, 0, 0, 0.2); box-shadow: inset 0 1px 2px 0 rgba(0, 0, 0, 0.5), inset 0 0 0 1px rgba(0, 0, 0, 0.2); }

/* ANIMATIONS */
/* Open modal */
@-webkit-keyframes bbm-open { 0% { -webkit-transform: matrix(0.99126, 0, 0, 0.99126, 0, 43.8813); opacity: 0.1259; }
  4% { -webkit-transform: matrix(0.99295, 0, 0, 0.99295, 0, 45.06809); opacity: 0.29544; }
  8% { -webkit-transform: matrix(0.99467, 0, 0, 0.99467, 0, 46.26922); opacity: 0.46703; }
  12% { -webkit-transform: matrix(0.99619, 0, 0, 0.99619, 0, 47.33355); opacity: 0.61908; }
  16% { -webkit-transform: matrix(0.99743, 0, 0, 0.99743, 0, 48.19991); opacity: 0.74284; }
  20% { -webkit-transform: matrix(0.99837, 0, 0, 0.99837, 0, 48.86067); opacity: 0.83724; }
  24% { -webkit-transform: matrix(0.99905, 0, 0, 0.99905, 0, 49.33658); opacity: 0.90523; }
  28% { -webkit-transform: matrix(0.99952, 0, 0, 0.99952, 0, 49.66049); opacity: 0.9515; }
  32% { -webkit-transform: matrix(0.99981, 0, 0, 0.99981, 0, 49.8675); opacity: 0.98107; }
  36% { -webkit-transform: matrix(0.99999, 0, 0, 0.99999, 0, 49.98966); opacity: 0.99852; }
  40% { -webkit-transform: matrix(1.00008, 0, 0, 1.00008, 0, 50.05361); opacity: 1.00766; }
  44% { -webkit-transform: matrix(1.00011, 0, 0, 1.00011, 0, 50.08); opacity: 1.01143; }
  48% { -webkit-transform: matrix(1.00012, 0, 0, 1.00012, 0, 50.08394); opacity: 1.01199; }
  52% { -webkit-transform: matrix(1.00011, 0, 0, 1.00011, 0, 50.07589); opacity: 1.01084; }
  56% { -webkit-transform: matrix(1.00009, 0, 0, 1.00009, 0, 50.06265); opacity: 1.00895; }
  60% { -webkit-transform: matrix(1.00007, 0, 0, 1.00007, 0, 50.04833); opacity: 1.0069; }
  64% { -webkit-transform: matrix(1.00005, 0, 0, 1.00005, 0, 50.03518); opacity: 1.00503; }
  68% { -webkit-transform: matrix(1.00004, 0, 0, 1.00004, 0, 50.02421); opacity: 1.00346; }
  72% { -webkit-transform: matrix(1.00002, 0, 0, 1.00002, 0, 50.01567); opacity: 1.00224; }
  76% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00941); opacity: 1.00134; }
  80% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00506); opacity: 1.00072; }
  84% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.00223); opacity: 1.00032; }
  88% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.0005); opacity: 1.00007; }
  92% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99956); opacity: 0.99994; }
  96% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99913); opacity: 0.99988; }
  100% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50); opacity: 1; } }
.bbm-modal--open { -webkit-animation-duration: 0.3s; -webkit-animation-name: bbm-open; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

/* Open a stacked modal */
@-webkit-keyframes bbm-stacked { 0% { -webkit-transform: matrix(0.99874, 0, 0, 0.99874, 0, 49.1187); opacity: 0.93705; }
  4% { -webkit-transform: matrix(0.99705, 0, 0, 0.99705, 0, 47.93192); opacity: 0.85228; }
  8% { -webkit-transform: matrix(0.99533, 0, 0, 0.99533, 0, 46.73078); opacity: 0.76648; }
  12% { -webkit-transform: matrix(0.99381, 0, 0, 0.99381, 0, 45.66645); opacity: 0.69046; }
  16% { -webkit-transform: matrix(0.99257, 0, 0, 0.99257, 0, 44.80009); opacity: 0.62858; }
  20% { -webkit-transform: matrix(0.99163, 0, 0, 0.99163, 0, 44.13933); opacity: 0.58138; }
  24% { -webkit-transform: matrix(0.99095, 0, 0, 0.99095, 0, 43.66342); opacity: 0.54739; }
  28% { -webkit-transform: matrix(0.99049, 0, 0, 0.99049, 0, 43.33951); opacity: 0.52425; }
  32% { -webkit-transform: matrix(0.99019, 0, 0, 0.99019, 0, 43.1325); opacity: 0.50946; }
  36% { -webkit-transform: matrix(0.99002, 0, 0, 0.99002, 0, 43.01034); opacity: 0.50074; }
  40% { -webkit-transform: matrix(0.98992, 0, 0, 0.98992, 0, 42.94639); opacity: 0.49617; }
  44% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92001); opacity: 0.49429; }
  48% { -webkit-transform: matrix(0.98988, 0, 0, 0.98988, 0, 42.91606); opacity: 0.494; }
  52% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92411); opacity: 0.49458; }
  56% { -webkit-transform: matrix(0.98991, 0, 0, 0.98991, 0, 42.93736); opacity: 0.49553; }
  60% { -webkit-transform: matrix(0.98993, 0, 0, 0.98993, 0, 42.95167); opacity: 0.49655; }
  64% { -webkit-transform: matrix(0.98995, 0, 0, 0.98995, 0, 42.96482); opacity: 0.49749; }
  68% { -webkit-transform: matrix(0.98997, 0, 0, 0.98997, 0, 42.97579); opacity: 0.49827; }
  72% { -webkit-transform: matrix(0.98998, 0, 0, 0.98998, 0, 42.98433); opacity: 0.49888; }
  76% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99059); opacity: 0.49933; }
  80% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99494); opacity: 0.49964; }
  84% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.99777); opacity: 0.49984; }
  88% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.9995); opacity: 0.49996; }
  92% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00044); opacity: 0.50003; }
  96% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00088); opacity: 0.50006; }
  100% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43); opacity: 0.5; } }
.bbm-modal--stacked { -webkit-animation-duration: 0.43333s; -webkit-animation-name: bbm-stacked; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

/* destroy a stacked modal */
@-webkit-keyframes bbm-stacked-reverse { 0% { -webkit-transform: matrix(0.99123, 0, 0, 0.99123, 0, 43.86266); opacity: 0.56162; }
  4% { -webkit-transform: matrix(0.99293, 0, 0, 0.99293, 0, 45.05306); opacity: 0.64665; }
  8% { -webkit-transform: matrix(0.99465, 0, 0, 0.99465, 0, 46.25785); opacity: 0.7327; }
  12% { -webkit-transform: matrix(0.99618, 0, 0, 0.99618, 0, 47.32543); opacity: 0.80896; }
  16% { -webkit-transform: matrix(0.99742, 0, 0, 0.99742, 0, 48.19443); opacity: 0.87103; }
  20% { -webkit-transform: matrix(0.99837, 0, 0, 0.99837, 0, 48.8572); opacity: 0.91837; }
  24% { -webkit-transform: matrix(0.99905, 0, 0, 0.99905, 0, 49.33456); opacity: 0.95247; }
  28% { -webkit-transform: matrix(0.99951, 0, 0, 0.99951, 0, 49.65946); opacity: 0.97568; }
  32% { -webkit-transform: matrix(0.99981, 0, 0, 0.99981, 0, 49.8671); opacity: 0.99051; }
  36% { -webkit-transform: matrix(0.99999, 0, 0, 0.99999, 0, 49.98963); opacity: 0.99926; }
  40% { -webkit-transform: matrix(1.00008, 0, 0, 1.00008, 0, 50.05377); opacity: 1.00384; }
  44% { -webkit-transform: matrix(1.00012, 0, 0, 1.00012, 0, 50.08024); opacity: 1.00573; }
  48% { -webkit-transform: matrix(1.00012, 0, 0, 1.00012, 0, 50.08419); opacity: 1.00601; }
  52% { -webkit-transform: matrix(1.00011, 0, 0, 1.00011, 0, 50.07612); opacity: 1.00544; }
  56% { -webkit-transform: matrix(1.00009, 0, 0, 1.00009, 0, 50.06284); opacity: 1.00449; }
  60% { -webkit-transform: matrix(1.00007, 0, 0, 1.00007, 0, 50.04848); opacity: 1.00346; }
  64% { -webkit-transform: matrix(1.00005, 0, 0, 1.00005, 0, 50.03529); opacity: 1.00252; }
  68% { -webkit-transform: matrix(1.00004, 0, 0, 1.00004, 0, 50.02428); opacity: 1.00173; }
  72% { -webkit-transform: matrix(1.00002, 0, 0, 1.00002, 0, 50.01572); opacity: 1.00112; }
  76% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00944); opacity: 1.00067; }
  80% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00508); opacity: 1.00036; }
  84% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.00223); opacity: 1.00016; }
  88% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.0005); opacity: 1.00004; }
  92% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99956); opacity: 0.99997; }
  96% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99912); opacity: 0.99994; }
  100% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50); opacity: 1; } }
.bbm-modal--stacked-reverse { -webkit-animation-duration: 0.43333s; -webkit-animation-name: bbm-stacked-reverse; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

/* destroy a modal */
@-webkit-keyframes bbm-destroy { 0% { -webkit-transform: matrix(0.99874, 0, 0, 0.99874, 0, 49.1187); opacity: 0.8741; }
  4% { -webkit-transform: matrix(0.99705, 0, 0, 0.99705, 0, 47.93192); opacity: 0.70456; }
  8% { -webkit-transform: matrix(0.99533, 0, 0, 0.99533, 0, 46.73078); opacity: 0.53297; }
  12% { -webkit-transform: matrix(0.99381, 0, 0, 0.99381, 0, 45.66645); opacity: 0.38092; }
  16% { -webkit-transform: matrix(0.99257, 0, 0, 0.99257, 0, 44.80009); opacity: 0.25716; }
  20% { -webkit-transform: matrix(0.99163, 0, 0, 0.99163, 0, 44.13933); opacity: 0.16276; }
  24% { -webkit-transform: matrix(0.99095, 0, 0, 0.99095, 0, 43.66342); opacity: 0.09477; }
  28% { -webkit-transform: matrix(0.99049, 0, 0, 0.99049, 0, 43.33951); opacity: 0.0485; }
  32% { -webkit-transform: matrix(0.99019, 0, 0, 0.99019, 0, 43.1325); opacity: 0.01893; }
  36% { -webkit-transform: matrix(0.99002, 0, 0, 0.99002, 0, 43.01034); opacity: 0.00148; }
  40% { -webkit-transform: matrix(0.98992, 0, 0, 0.98992, 0, 42.94639); opacity: -0.00766; }
  44% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92001); opacity: -0.01143; }
  48% { -webkit-transform: matrix(0.98988, 0, 0, 0.98988, 0, 42.91606); opacity: -0.01199; }
  52% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92411); opacity: -0.01084; }
  56% { -webkit-transform: matrix(0.98991, 0, 0, 0.98991, 0, 42.93736); opacity: -0.00895; }
  60% { -webkit-transform: matrix(0.98993, 0, 0, 0.98993, 0, 42.95167); opacity: -0.0069; }
  64% { -webkit-transform: matrix(0.98995, 0, 0, 0.98995, 0, 42.96482); opacity: -0.00503; }
  68% { -webkit-transform: matrix(0.98997, 0, 0, 0.98997, 0, 42.97579); opacity: -0.00346; }
  72% { -webkit-transform: matrix(0.98998, 0, 0, 0.98998, 0, 42.98433); opacity: -0.00224; }
  76% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99059); opacity: -0.00134; }
  80% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99494); opacity: -0.00072; }
  84% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.99777); opacity: -0.00032; }
  88% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.9995); opacity: -7e -5; }
  92% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00044); opacity: 6.0 e-05; }
  96% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00088); opacity: 0.00012; }
  100% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43); opacity: 0; } }
.bbm-modal--destroy { -webkit-animation-duration: 0.43333s; -webkit-animation-name: bbm-destroy; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

.curtain { display: none; opacity: 0.75; position: absolute; background: black; top: 0; bottom: 0; left: 0; right: 0; z-index: 10; }
.curtain .dialogs { height: 0; padding-bottom: 56.25%; width: auto; margin: auto; }
.curtain .dialogs.spinner, .curtain .dialogs.spinner img { width: 48px; display: none; }
.curtain div.loading-bindle { display: block; width: 32; height: 26px; zoom: 3; margin: 0 auto 10px auto; background-position: -480px 0; }
.curtain div.loading-bindle.f10 { background-position: -480px 0; }
.curtain div.loading-bindle.f11 { background-position: -512px 0; }
.curtain div.loading-bindle.f12 { background-position: -544px 0; }
.curtain div.loading-bindle.f13 { background-position: -576px 0; }
.curtain div.loading-bindle.f14 { background-position: -608px 0; }
.curtain div.loading-bindle.f15 { background-position: -640px 0; }
.curtain div.loading-bindle.f16 { background-position: -672px 0; }
.curtain div.loading-bindle.f17 { background-position: -704px 0; }
.curtain div.loading-bindle.f18 { background-position: -736px 0; }
.curtain div.loading-bindle.f19 { background-position: -768px 0; }
.curtain div.loading-bindle.f20 { background-position: -800px 0; }
.curtain div.loading-bindle.f21 { background-position: -832px 0; }
.curtain div.loading-bindle.f22 { background-position: -864px 0; }
.curtain div.loading-bindle.f23 { background-position: -896px 0; }
.curtain div.loading-bindle.f24 { background-position: -928px 0; }
.curtain div.loading-bindle.f25 { background-position: 0px 0; }
.curtain div.loading-bindle.f26 { background-position: -32px 0; }
.curtain div.loading-bindle.f27 { background-position: -64px 0; }
.curtain div.loading-bindle.f28 { background-position: -96px 0; }
.curtain div.loading-bindle.f29 { background-position: -128px 0; }
.curtain div.loading-bindle.f30 { background-position: -160px 0; }
.curtain div.loading-bindle.f31 { background-position: -192px 0; }
.curtain div.loading-bindle.f32 { background-position: -224px 0; }
.curtain div.loading-bindle.f33 { background-position: -256px 0; }
.curtain div.loading-bindle.f34 { background-position: -288px 0; }
.curtain div.loading-bindle.f35 { background-position: -320px 0; }
.curtain div.loading-bindle.f36 { background-position: -352px 0; }
.curtain div.loading-bindle.f37 { background-position: -384px 0; }
.curtain div.loading-bindle.f38 { background-position: -416px 0; }
.curtain div.loading-bindle.f39 { background-position: -448px 0; }
.curtain div.loading-bindle.f40 { background-position: -480px 0; }

.cover { position: absolute; top: 0; bottom: 0; left: 0; right: 0; margin: auto; text-align: center; color: #fff; }
.cover.start, .cover.load { cursor: pointer; font-size: 256px; display: none; }
.cover.show { display: inline-block; }

.progress { display: none; width: 80%; height: 260px; margin: auto; text-align: center; }
.progress .progress-bar { background: #202226; border: 1px solid #323641; height: 16px; overflow: hidden; border-radius: 3px; position: relative; padding: 4px; width: 100%; }
.progress .progress-bar .progress-done { background-image: linear-gradient(to right, #C82931 11%, #A9171C 100%); border: 1px solid #282C34; height: 14px; border-radius: 3px; float: left; }
.progress .status, .progress .unsupported { line-height: 20px; color: #FFF; margin-top: 10px; width: 100%; display: block; }
.progress .demo-message { color: #FFF; }

.modal-holder label { display: block; }
.modal-holder .controls { line-height: 40px; margin-top: 10px; }
.modal-holder .controls .button { display: inline-block; }
.modal-holder .button { margin: 5px; padding: 5px 20px; }
.modal-holder .button.green, .modal-holder .button.red, .modal-holder .button.gray { color: white !important; border-radius: 3px; border: 0px solid rgba(0, 0, 0, 0.2); box-shadow: 0px 1px 1px 0px rgba(0, 0, 0, 0.2), inset 0px 1px 0px 0px rgba(255, 255, 255, 0.2); }
.modal-holder .button.green { background: #97B147; }
.modal-holder .button.red { background: #E62217; }
.modal-holder .button.gray { background: #A1A7B2; }

div.loading-bindle { display: block; width: 32; height: 26px; zoom: 3; margin: 0 auto 10px auto; background-position: -480px 0; }
div.loading-bindle.f10 { background-position: -480px 0; }
div.loading-bindle.f11 { background-position: -512px 0; }
div.loading-bindle.f12 { background-position: -544px 0; }
div.loading-bindle.f13 { background-position: -576px 0; }
div.loading-bindle.f14 { background-position: -608px 0; }
div.loading-bindle.f15 { background-position: -640px 0; }
div.loading-bindle.f16 { background-position: -672px 0; }
div.loading-bindle.f17 { background-position: -704px 0; }
div.loading-bindle.f18 { background-position: -736px 0; }
div.loading-bindle.f19 { background-position: -768px 0; }
div.loading-bindle.f20 { background-position: -800px 0; }
div.loading-bindle.f21 { background-position: -832px 0; }
div.loading-bindle.f22 { background-position: -864px 0; }
div.loading-bindle.f23 { background-position: -896px 0; }
div.loading-bindle.f24 { background-position: -928px 0; }
div.loading-bindle.f25 { background-position: 0px 0; }
div.loading-bindle.f26 { background-position: -32px 0; }
div.loading-bindle.f27 { background-position: -64px 0; }
div.loading-bindle.f28 { background-position: -96px 0; }
div.loading-bindle.f29 { background-position: -128px 0; }
div.loading-bindle.f30 { background-position: -160px 0; }
div.loading-bindle.f31 { background-position: -192px 0; }
div.loading-bindle.f32 { background-position: -224px 0; }
div.loading-bindle.f33 { background-position: -256px 0; }
div.loading-bindle.f34 { background-position: -288px 0; }
div.loading-bindle.f35 { background-position: -320px 0; }
div.loading-bindle.f36 { background-position: -352px 0; }
div.loading-bindle.f37 { background-position: -384px 0; }
div.loading-bindle.f38 { background-position: -416px 0; }
div.loading-bindle.f39 { background-position: -448px 0; }
div.loading-bindle.f40 { background-position: -480px 0; }

.modal-gallery-wrapper { overflow: auto; margin: auto; height: 300px; width: 450px; background: #3b3e48; padding: 10px; }
.modal-gallery-wrapper a { text-decoration: none; display: inline-block; color: white; }
.modal-gallery-wrapper .grid-item { display: inline-block; position: relative; background: black; width: 200px; height: 150px; margin: 2px; }
.modal-gallery-wrapper .grid-item .content { position: absolute; top: 0; bottom: 0; left: 0; right: 0; margin: auto; width: 100%; max-height: 100%; }
.modal-gallery-wrapper .grid-item.take-screenshot:hover { background: #ccc; color: black; cursor: pointer; }
.modal-gallery-wrapper .grid-item.take-screenshot .content { top: 43%; text-align: center; }
.modal-gallery-wrapper .grid-item.pending-image-spinner img { margin: auto; position: absolute; top: 0; right: 0; bottom: 0; left: 0; }
.modal-gallery-wrapper .grid-item .hover-wrapper { position: absolute; margin: auto; top: 0; bottom: 0; left: 0; right: 0; background: rgba(0, 0, 0, 0.5); font-size: 18px; text-align: center; display: none; }
.modal-gallery-wrapper .grid-item .hover-wrapper .shares { position: absolute; top: 40%; left: 0; right: 0; margin: auto; cursor: pointer; }
.modal-gallery-wrapper .grid-item .hover-wrapper .shares .hb-twitter:hover { color: #55acee; }
.modal-gallery-wrapper .grid-item .hover-wrapper .shares .hb-facebook:hover { color: #3b5998; }
.modal-gallery-wrapper .grid-item .hover-wrapper .delete-screenshot { position: absolute; bottom: 5px; right: 5px; cursor: pointer; }
.modal-gallery-wrapper .grid-item:hover .hover-wrapper { display: block; }

.sharing-modal-body { font-size: 16px; }
.sharing-modal-body input[type=text] { padding: 10px; border: none; border-radius: 3px; width: 100%; }

.asm-frame { overflow: hidden; display: block; }
.asm-frame iframe { display: block; }

.asm-switcher { position: relative; border-radius: 3px; white-space: nowrap; padding: 0; margin: 0; text-align: left; }
.asm-switcher .iframe-holder { position: relative; height: 0; width: 100%; padding-bottom: 56.25%; }
.asm-switcher .curtain, .asm-switcher .dialogs { position: absolute; top: 0; left: 0; right: 0; bottom: 0; }
.asm-switcher .curtain { opacity: 1; }
.asm-switcher h1 { margin-bottom: 10px; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-weight: 200; font-size: 20px; color: #4A4C45; line-height: 24px; }
.asm-switcher .toggle-collapsable { position: absolute; cursor: pointer; right: 5px; top: 5px; display: none; }
.asm-switcher .toggle-collapsable.visible { display: block; }
.asm-switcher .collapsable { overflow: hidden; max-height: 0; transition: .5s max-height; -webkit-transition: .5s max-height; -moz-transition: .5s max-height; -o-transition: .5s max-height; }
.asm-switcher .collapsable.open { max-height: 3000px; }
.asm-switcher div.game-button-panel { height: auto; }
.asm-switcher div.game-button-panel div.game-list { padding: 0; margin: 15px -5px 0 -5px; display: flex; flex-direction: row; flex-wrap: wrap; width: auto; }
.asm-switcher div.game-button-panel div.game-list div.game-button { flex-grow: 0; cursor: pointer; text-decoration: none; padding: 0; border-radius: 3px; background: #A1A7B2; margin: 5px; width: 172px; -moz-box-shadow: inset 0px 0px 0px 1px rgba(0, 0, 0, 0.15); box-shadow: inset 0px 0px 0px 1px rgba(0, 0, 0, 0.15); }
.asm-switcher div.game-button-panel div.game-list div.game-button p { overflow: hidden; text-overflow: ellipsis; font-family: Helvetica; font-weight: bold; font-size: 14px; color: #FFFFFF; line-height: 17px; text-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2); padding: 12px 16px 7px 16px; margin: 0; }
.asm-switcher div.game-button-panel div.game-list div.game-button.selected { background: #4D5462; position: relative; }
.asm-switcher div.game-button-panel div.game-list div.game-button .progress-bar { width: 100%; background: #3B3E48; height: 5px; overflow: hidden; border-radius: 10px; visibility: hidden; position: relative; z-index: 100; }
.asm-switcher div.game-button-panel div.game-list div.game-button .progress-bar .progress-done { background-image: linear-gradient(to right, #C82931 11%, #A9171C 100%); border: 1px solid #202226; height: 3px; border-radius: 6px; float: left; }
.asm-switcher .player-panel { height: auto; position: relative; white-space: normal; background: black; }
.asm-switcher .player-panel:after { content: ''; height: 42px; display: block; }
.asm-switcher .rec-firefox-update { text-align: center; margin: 10px; }
.asm-switcher .do-popout, .asm-switcher .do-confirm-close { position: absolute; cursor: pointer; color: #555; }
.asm-switcher .do-popout { right: 0; top: 0; display: inline-block; }
.asm-switcher .do-confirm-close { font-size: 24px; right: 20px; top: 20px; display: none; }
.asm-switcher.popout { margin: auto; position: relative; background: #fff; padding: 30px 50px 30px 40px; z-index: 9999; }
.asm-switcher.popout .toggle-collapsable { display: none; }
.asm-switcher.popout .do-confirm-close { display: inline-block; }
.asm-switcher.popout .do-popout { display: none; }

.asm-switcher-embed { margin-bottom: 30px; }
.asm-switcher-embed .asm-switcher.frame-only { border: 0; padding: 0; }

.asm-user-page { background: #eee; border: 1px solid #ccc; border-radius: 3px; padding: 20px; margin-bottom: 30px; display: none; }
.asm-user-page .toggle-collapsable { right: -13px; top: -13px; }
.asm-user-page .collapsable { max-height: 0; }

.asm-download-page { background: #fff; border-radius: 3px; border: 1px solid #ccc; padding: 20px; display: none; }
.asm-download-page h1 { margin-top: 0; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-weight: bold; }
.asm-download-page .toggle-collapsable { display: none; }
.asm-download-page .toggle-collapsable.visible { display: none; }
.asm-download-page .collapsable { height: auto; max-height: 3000px; }

#asm-grayout { position: fixed; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0, 0, 0, 0.5); display: none; }

body { overflow-x: auto !important; }
/* Coupons */
.library-coupon { width: 285px; margin-left: 5px; margin-right: 5px; margin-bottom: 20px; display: inline-block; border: 1px solid #E9E9E9; text-decoration: none; vertical-align: top; }

.library-coupon-image { width: 100%; }

.library-coupon-description { text-align: center; background: white; padding: 10px; }

.library-coupon-human-name { font-size: 16px; font-weight: bold; }

.library-coupon-expiration { color: red; font-size: 12px; width: 100%; margin-top: 3px; }

.library-coupon-terms-and-conditions { margin-top: 3px; }

.admin-tiny-link i { position: relative; }

#hibtext { margin-top: 0 !important; color: #cc0000; font-size: 20px !important; font-weight: bold; padding-top: 4px; line-height: 24px; }

.center-wrapper { float: left; width: 100%; position: relative; }

.center { overflow: visible; clear: left; float: left; position: relative; left: 50%; }

/* spiel */
#spiel { text-shadow: 0 1px 0 rgba(255, 255, 255, 0.75); line-height: 21px; font-size: 14px; }

#spiel a { color: #5D801A; }

#main { font-size: 12px; margin: 0 auto; text-shadow: none; width: 831px; }

.whitebox-redux { background: white; box-sizing: border-box; padding: 20px 0; border: 1px solid #c7cbd4; border-radius: 5px; box-shadow: 0 1px 1px 0px #c7cbd4; position: relative; color: #4a4c45; width: 762px; margin: 7px auto 13px auto; }

/* inner boxes */
.whitebox { position: relative; color: #4a4c45; font-weight: bold; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5); width: 762px; margin: 7px auto 13px auto; }

.whitetop { position: absolute; top: 0; width: 762px; height: 20px; background: url("//humblebundle-a.akamaihd.net/static/hashed/112ab639e90490bc2dcee89740036e6ff20838f8.png") 0 0 no-repeat; }

.whitemid { position: absolute; top: 20px; width: 762px; bottom: 20px; background: url("//humblebundle-a.akamaihd.net/static/hashed/835bbcaad6a563ba85fa91773af142691ff5f6e0.png"); }

.whitebottom { position: absolute; bottom: 0; width: 762px; height: 20px; background: url("//humblebundle-a.akamaihd.net/static/hashed/112ab639e90490bc2dcee89740036e6ff20838f8.png") bottom no-repeat; }

.whitecontent { position: relative; padding: 20px; /* if you change this, remember to change the keytabs top margin by the same amount */ }

.whitecontent .hr { background: #e6e6e6; }

.whitecontent.nopadding { padding-left: 0; padding-right: 0; }

#dlplatform, #dltype, div.custominstructions { margin: 0 20px; }

#dltype.only-one-button { display: none; }

.whitecontent.nopadding .row { margin: 0 12px; }

.expandorder { display: block; height: 44px; text-align: center; color: #5d801a; font-size: 16px; }

.redeemsmallheading { width: 480px; margin: 0 auto; padding-bottom: 12px; text-align: center; font-size: 90%; font-weight: normal; }

.keyredeemer { float: left; margin-right: 10px; margin-bottom: 16px; height: 28px; width: 111px; cursor: pointer; }

.redeeminstructions { text-align: center; padding-bottom: 30px; }

.onliveusukradio { padding-left: 127px; }

.steam-profile { position: relative; top: -15px; right: -6px; text-align: right; }

.steam-profile .account-text { display: inline-block; }

.steam-profile .indicator { float: right; left: -40px; background: url("//humblebundle-a.akamaihd.net/static/hashed/e73d51c16b07d083026843ceda9c22056b9d04a2.gif") no-repeat; }

.steam-profile .profile-pic { width: 32px; height: 32px; display: inline-block; vertical-align: bottom; margin-left: 10px; }

.genericbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/aafd697db4950b99bc95a0ef740f10d7301eb437.png") no-repeat; }

.activated .genericbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/7f9102778b07eec38f1ba5911c95c24d3aa98318.png") no-repeat; }

.steambutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/4679a3c4d14fbda0fe37478d446d001fad44e3c1.png") no-repeat; }

.activated .steambutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/7d32b8cb2ed51ab18ec0e5a40208afd4a41c988c.png") no-repeat; }

.uplaybutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/4b3fd1c208843f91a063bec2349b526202a4fe6e.png") no-repeat; }

.activated .uplaybutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/4ca5ac1bf3373babd5a508d6556f5f7fd6ad4b38.png") no-repeat; }

.originbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/e76fbc1ccb8733279587f6038056cd3fdc0271a9.png") no-repeat; }

.activated .originbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/3ff62f831583f243b65f8954c08f40702eed5912.png") no-repeat; }

.ouyabutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/e8916956991bdd418ccdb45e6dead81cae599a34.png") no-repeat; }

.activated .ouyabutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/cb5ea8b036c49c5f6466d97c37703016668df034.png") no-repeat; }

.desurabutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/97b4d580682444ec310e39480957a39d84a50106.png") no-repeat; }

.activated .desurabutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/72c7a91a612ceee5ceda77133c9d79bf66b8dec3.png") no-repeat; }

.onlivebutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/e7426f51dea62e220deeb988794cb32e15c265ae.png") no-repeat; }

.activated .onlivebutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/8c812b14676720a1c5541e5ff0084336f8ca952b.png") no-repeat; }

.multiplayerbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/6f98857f10330e006847a2571bd2fcdd972da502.png") no-repeat; }

.activated .multiplayerbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/20048fabc7a0a68316b0315f584c58ad95b17055.png") no-repeat; }

.squareenix_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/ac97edf1d373f749576bab85be377698494478d9.png") no-repeat; }

.activated .squareenix_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/3af19fcba4ca44990c78e1aebee17bbadd21afe7.png") no-repeat; }

.bethesda_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/61a2c4c13f0b95b11aec7784356d325f1ad76223.png") no-repeat; }

.activated .bethesda_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/80a34f59a907904dcb29c5e434affb9f88ee6fc6.png") no-repeat; }

.telltalegames_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/c3c956701f7cbf7842d1fef8d713f829042dbfb4.png") no-repeat; }

.activated .telltalegames_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/cfe22581a0a30154a85744ae2f58671af6b731b6.png") no-repeat; }

.nintendo_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/32be74acd8de11c5a9a240c5ce3c00d0287b83a3.png") no-repeat; }

.activated .nintendo_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/2a16694e165dc6e39f3e89f6eba6d1451d278f6a.png") no-repeat; }

.soldout { visibility: hidden; }

#papers-content a { color: #360; }

.keyfield { width: 342px; padding: 0 4px; white-space: nowrap; height: 28px; color: #808080; text-align: center; line-height: 28px; font-size: 12px; float: left; background: url("//humblebundle-a.akamaihd.net/static/hashed/9e9017643ddecc7f2d3cd0032c577b88d96ce5e0.png") no-repeat; }

.keyfield-content { overflow-x: auto; width: 340px; }

.redeemholder { margin: 0 auto; width: 503px; }

.giftbutton { padding-left: 6px; padding-top: 5px; float: left; cursor: pointer; }

.redeemheading { text-align: center; font-size: 16px; padding-bottom: 18px; padding-top: 6px; width: 70%; margin: 0 auto; }

.indicator { height: 16px; position: relative; top: 2px; width: 16px; }

#steaminfo { background: url("//humblebundle-a.akamaihd.net/static/hashed/cceac795b8e3fb4e5ad5582e6bd7ac85ccda5839.png") no-repeat; height: 28px; width: 30px; position: absolute; top: 12px; left: 12px; display: block; }

#inst a { color: #5d801a; }

#inst { text-align: center; }

.displaying .infotext { display: block; }

.infotext { background: black; color: #fff; font-size: 12px; font-weight: normal; padding: 12px; text-shadow: none; width: 300px; display: none; position: absolute; top: 23px; line-height: 18px; right: -63px; }

.infotitle { text-decoration: underline; }

#moreinfolink { cursor: pointer; color: white; right: -107px; position: absolute; font-weight: bold; text-shadow: 0 1px 3px rgba(0, 0, 0, 0.75); font-size: 14px; top: -1px; z-index: 30; }

.key-expander .shrinkwrapper { display: none; }

.key-expander.kexpanded .shrinkwrapper { display: block; }

.shrinkwrapper { height: 23px; overflow: hidden; }

.shrinkwrapper.expanded { height: auto; }

.expandkeys { display: block; overflow: hidden; height: 22px; text-align: center; color: #5d801a !important; font-size: 16px; }

#normal { width: 100%; margin-top: -7px; font-size: 12px; line-height: 12px; }

#addorder.small { cursor: pointer; }

#addorder .whitecontent { box-sizing: content-box; height: 22px; overflow: hidden; }

#orderwrapper { bottom: -8px; left: 20px; overflow: hidden; position: absolute; right: 20px; top: 20px; }

#expandorder { display: block; height: 44px; text-align: center; color: #5d801a; font-size: 16px; }

a.slide-down-trigger { display: block; text-align: center; color: #5d801a; font-size: 16px; }

.slide-down { padding-top: 20px; }

.flexbtn .label { visibility: hidden; }

.flexbtn { font-weight: bold; height: 28px; line-height: 28px; position: relative; margin-right: 12px; padding-left: 33px; float: left; margin-left: 8px; }

.flexbtn .right { position: absolute; right: -12px; top: 0; bottom: 0; width: 12px; }

.flexbtn.active .right { background-position: right; }

.flexbtn .a { position: absolute; top: 0; left: 0; right: -12px; bottom: 0; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5); color: #4a4c45 !important; text-decoration: none; padding-left: 33px; }

.streaming-video-player { margin: 25px; position: relative; top: 10px; text-align: center; }

.selected-video-quality { background-color: #CACED8; cursor: pointer; }

.video-quality-selector { border: 1px solid #BFC3CC; border-radius: 3px; cursor: pointer; display: inline-block; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-weight: bold; padding: 5px; text-align: center; vertical-align: middle; width: 70px; }

.flexbtn.active .a { text-shadow: 0 1px 0 white; }

.flexbtn.noicon, .flexbtn.noicon a { padding-left: 6px; }

.icon { position: absolute; }

.mac .icon { left: 10px; top: 4px; height: 18px; width: 14px; background: url("//humblebundle-a.akamaihd.net/static/hashed/a010a63e8e934c3b8652c314f22422fd78375f87.png") no-repeat; }

.windows .icon { left: 10px; top: 6px; height: 17px; width: 19px; background: url("//humblebundle-a.akamaihd.net/static/hashed/0caa53023b380142150807b45ed4e63b440db7a7.png") no-repeat; }

.windows .a, .windows.flexbtn { padding-left: 38px; }

.linux .icon { left: 10px; top: 6px; height: 17px; width: 14px; background: url("//humblebundle-a.akamaihd.net/static/hashed/6fdf9bdbf6874ddad9011dd07252cdc2e42e88be.png") no-repeat; }

.android .icon { left: 8px; top: 5px; height: 19px; width: 15px; background: url("//humblebundle-a.akamaihd.net/static/hashed/12ad16b0169963dd8374c09a36d83b9628301797.png") no-repeat; }

.audio .icon { left: 10px; top: 5px; height: 17px; width: 14px; background: url("//humblebundle-a.akamaihd.net/static/hashed/31ca574c537461526fe5e3882e1799d93fd3442a.png") no-repeat; }

.audio .a, .audio.flexbtn { padding-left: 38px; }

.ebook .icon { left: 10px; top: 5px; height: 17px; width: 14px; background: url("//humblebundle-a.akamaihd.net/static/hashed/2f8c311b2ad54c0996b6f2231ce69b52f9ef7b42.png") no-repeat; }

.comedy .icon { left: 10px; top: 5px; height: 17px; width: 14px; background: url("//humblebundle-a.akamaihd.net/static/hashed/0ebb919bcdef9c3b5c7fb1dc19a416f8bfddfc1f.png") no-repeat; }

.video .icon { left: 10px; top: 10px; height: 17px; width: 14px; background: url("//humblebundle-a.akamaihd.net/static/hashed/ac23ed56c286d1d8e284d7b0aa3046c8e20f00f1.png") no-repeat; }

.vertical-rule { border-left: 1px solid black; width: 1px; height: 30px; margin-left: 15px; float: left; }

.bittorrent .icon { left: 10px; top: 6px; height: 17px; width: 16px; background: url("//humblebundle-a.akamaihd.net/static/hashed/e17a19111dffdd17728c4f754dc5bb0e9dad2746.png") no-repeat; }

.bittorrent .a, .flexbtn.bittorrent { padding-left: 35px; }

.direct .icon { left: 10px; top: 6px; height: 17px; width: 16px; background: url("//humblebundle-a.akamaihd.net/static/hashed/19b899d281c429dfab8e55f4d81c5202cc5cb26d.png") no-repeat; }

.direct .a, .direct.flexbtn { padding-left: 35px; }

.hr { height: 1px; margin: 12px 0; background: #ccc; }

.download.hr { clear: both; }

.textlabel { float: left; height: 28px; line-height: 28px; width: 160px; text-align: right; }

.dlplatform-list { overflow: auto; }

.title a { text-decoration: none; font-weight: bold; }

.subtitle { color: #4a4c45; font-weight: normal; font-size: 12px; line-height: normal; }

.subtitle a { text-decoration: none; font-weight: normal; color: #4a4c45 !important; }

.row { position: relative; }

.stepoption { padding: 7px 0 7px 42px; font-weight: normal; position: relative; }

/* key page */
.downloads { display: none; float: right; width: 400px; }

.downloads.show { display: block; }

.downloads .flexbtn { margin-left: 0; min-width: 120px; text-align: center; }

.downloads, .newbuilds, .custominstructions { display: none; }

.small .flexbtn { margin-left: 0; min-width: 69px; text-align: center; }

.small .dldetails { width: 79px; }

.download { float: right; }
.download:not(:last-child) { margin-left: 14px; }

.dldetails { clear: both; width: 130px; padding: 0 4px; }

.dlsize { text-align: center; padding-top: 8px; font-size: 12px; font-weight: bold; }

.dlsize.showmd5 { padding-top: 2px; }

.dldate, .newdate { font-size: 11px; font-weight: normal; }

.newdate { color: #c00; }

.row.arc64 .arc32 { display: none; }

.row.arc64 .arc64 { display: block; }

.row .arc64 { display: none; }

.arc-toggle { white-space: nowrap; float: right; }

.newbuilds div { text-align: center; margin: 14px 0 16px 0; }

.newbuilds { display: none; }

.newbuilds.show { display: block; text-align: center; }

.showmd5, .showdate { font-size: 11px; font-weight: normal; }

.showmd5 .mbs, .showmd5 .dldate, .showmd5 .newdate, .showmd5 .datebr { display: none; }

.showdate .mbs, .showdate .dlmd5, .showdate .newdate, .showdate .datebr { display: none; }

#steam { height: 20px; padding-left: 0; margin: 12px 0; width: 120px; background: url("//humblebundle-a.akamaihd.net/static/hashed/8daad48c8018906de902cfe0dbbd59d75f462ca3.png") no-repeat; font-size: 10px; font-weight: normal; }

#desura { height: 25px; width: 98px; background: url("//humblebundle-a.akamaihd.net/static/hashed/dc5ab80a0b9ceb87eb3e713ed68a3dc5c72d08c9.png") no-repeat; }

#onlive { height: 24px; width: 118px; position: absolute; top: 27px; left: 120px; background: url("//humblebundle-a.akamaihd.net/static/hashed/fd3afea08ca2008119469cbf053f5eccb374602c.png") no-repeat; }

.clear { clear: both; height: 0; }

#settings div { padding: 6px; line-height: 1.4em; }

#deletekeypage { position: absolute; right: 16px; bottom: 26px; color: red; font-size: 10px; }

#deletebuttons { text-align: center; padding-top: 4px; }

#deletekeyconfirm { width: 280px; position: absolute; bottom: -10px; right: -40px; background: white; border-radius: 5px; padding: 6px; border: black solid 1px; z-index: 200; display: none; }

/* page content */
.errormsg { display: none; position: relative; text-shadow: none; }

#temail { width: 200px; }

#quickiefix { padding-bottom: 19px; }

#leaderboardstep { display: none; }

/* order form */
#needhelp { color: #999; text-decoration: none; font-style: italic; }

.placeholder { color: silver; line-height: 25px; padding-left: 5px; position: absolute; }

#tamount { width: 70px; }

#customAmountHolder { display: inline-block; }

#customAmount { height: 18px; width: 70px; }

#payment-amount { padding-left: 42px; margin-left: -42px; }

/* Icons */
.icn { display: inline-block; position: relative; height: 70px; width: 70px; padding-right: 5px; top: 5px; float: left; }

.icn a img { border: none; }

/* Android instructions */
div.custominstructions { padding: 0 20px 20px 20px; }

.instructionsteps h3 { font-size: 18px; }

.instructionsteps a, .instructionsteps a:visited { color: #5D801A; }

.instructionsteps img { float: right; display: block; margin-right: -15px; margin-top: -8px; }

.instructionsteps p { font-weight: normal; font-size: 14px; line-height: 24px; margin: 1em 0; }

.instructionsteps p.introsteps { margin-top: 0; }

.instructionsteps .stepholder p { width: 400px; }

.instructionsteps .stepholder { font-size: 14px; margin: 20px 0; }

.instructionsteps .stepholder:last-child { margin-bottom: 0; }

.instructionsteps .steptext { font-weight: bold; padding: 10px 0 10px 55px; }

#show_android_binaries .expandkeys { font-weight: bold; margin-top: 20px; }

.clearfix { clear: both; }

p.mobile-link { font-size: 18px; }

.mobile-link a { letter-spacing: 1px; text-decoration: none; font-weight: bold; }

.mobile-link a:hover { text-decoration: underline; }

#send-email-message { font-weight: normal; font-size: 12px; padding: 0 15px 0 20px; color: #888; }

#send-email-form label { padding-bottom: 10px; }

#email-truncated { width: 200px; }

.download-popup { display: none; background: #eee; border-radius: 3px; position: fixed; top: 30%; left: 50%; margin-left: -255px; width: 450px; z-index: 9999; padding: 20px 30px 30px 30px; font-weight: normal; }

.download-popup h2 { font-size: 25px; }

.download-popup p.warning-text { color: red; }

.download-popup p.warning-text a { color: #4a4c45; }

.buttonHolder { padding-top: 20px; float: right; }

.addAndroidPlatform { padding: 30px 0; }

.addAndroidPlatform h2 { padding-bottom: 20px; }

.custom-download-text { width: 400px; position: absolute; right: 10px; top: 10px; text-align: right; }

.custom-download-text a { color: #360; }

.loading { margin: auto; width: 200px; text-align: center; }

#download-page-outer-progress { background-color: #eee; border-radius: 12px; box-shadow: inset 0 2px 0 rgba(0, 0, 0, 0.2), inset 0 0 0 1px rgba(255, 255, 255, 0.2); margin: 0 auto; overflow: hidden; width: 50%; }

#download-page-inner-progress { background-image: linear-gradient(to bottom, #97b147 11%, #7e992e 100%); border-radius: 12px; box-shadow: inset 0 2px 0 rgba(255, 255, 255, 0.2), inset 0 0 0 1px rgba(0, 0, 0, 0.2); height: 24px; width: 0%; /* Adjust with JavaScript */ }

#download-page-progress-text { text-align: center; }

.arc64 { display: none; }

.whitebox .loading { padding: 50px; width: 300px; }

.whitebox .downloads { padding-right: 30px; }

.whitebox .platform-chooser { padding-top: 30px; }

.whitebox .row { padding-left: 15px; }

.gameinfo { float: left; width: 200px; margin-top: 10px; }

h1 { margin-top: 30px; }

.row { display: none; overflow: hidden; transition: all 0.5s ease; }

.row.show { border-bottom: 1px solid #ddd; min-height: 80px; display: block; }

.row .downloads .download-buttons .download, .row .downloads .arc-toggle { display: none; }

.row .downloads .download-buttons .download.show, .row .downloads .arc-toggle.show { display: block; }

.row .download-buttons, .row .arc-toggle { margin-top: 10px; }

.row.show:last-child { border-bottom: none; }

/* Steam Key Table */
table.unredeemed-keys-table { width: 100%; border: 1px solid #CCCCCC; }

table.unredeemed-keys-table th { background-image: linear-gradient(-179deg, #F4F4F4 0%, #E9E9E9 100%); border: 1px solid #CCCCCC; font-family: "HelveticaNeue-Medium", Helvetica, Arial, "Lucida Grande", sans-serif; font-size: 14px; color: #555555; line-height: 17px; padding: 20px; text-align: left; }

table.unredeemed-keys-table tr { font-family: "HelveticaNeue-Light", Helvetica, Arial, "Lucida Grande", sans-serif; font-size: 14px; color: #555555; line-height: 17px; background: #FFFFFF; }

table.unredeemed-keys-table td { border: 1px solid #E9E9E9; padding: 10px 20px; max-width: 400px; }

table.unredeemed-keys-table tr:nth-child(even) { background: #FAFAFA; border: 1px solid #E9E9E9; }

table.unredeemed-keys-table i { font-size: 120%; }

.whitebox-redux.credit button { margin-left: 1em; }
#sms-form { width: 345px; padding: 10px; border: 1px solid #ddd; border-radius: 5px; background: #eee; }
#sms-form::after { clear: both; content: ""; display: table; }
#sms-form .country-code-field { width: 45px; float: left; }
#sms-form .country-code-label { width: 40px; padding-left: 22px; }
#sms-form .form-label { display: block; float: left; margin-bottom: 5px; color: #888; font-size: 12px; font-weight: normal; }
#sms-form .phone-number-field { width: 140px; float: left; margin-left: 10px; }
#sms-form .phone-number-label { width: 150px; padding-left: 15px; }
#sms-form .plus-sign { clear: left; float: left; display: block; width: 10px; margin-right: 10px; padding-top: 7px; color: #888; }
#sms-form .send-sms-button { float: left; }
#sms-form .sms-disclaimer { clear: left; margin: 0 0 0 20px; padding-top: 5px; color: #aaa; font-size: 10px; font-weight: normal; }
#sms-form .sms-message { display: none; margin: 10px 0 0; padding: 0 15px 0 20px; color: #888; font-weight: normal; font-size: 12px; }
#sms-form .validate-code-link { cursor: pointer; margin: 0; padding: 0 15px 0 20px; color: #aaa; font-size: 10px; font-weight: normal; }
.disabled.gray-button { background: #e4e4e4; cursor: default; }

.generic-popup { font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 16px; }

.generic-popup a { color: #535353; }

.generic-popup.outer-shadow { box-shadow: 0 -1px 25px rgba(0, 0, 0, 0.3); left: 50%; top: 50%; margin-left: -200px; margin-top: -200px; position: absolute; z-index: 9999; border-radius: 7px; display: none; }

.generic-popup.content { border-radius: 7px; color: #999999; padding: 20px; background: #f5f5f5; width: 360px; position: relative; text-align: center; }
.generic-popup.content .description { padding: 4px 0 25px 0; }

.generic-popup .no-center { max-width: 360px; text-align: right; position: relative; }

.generic-popup.content h1 { font-size: 24px; text-shadow: 0 0 1px #eee; color: #666; }

.generic-popup.content h1.noimg { margin-right: 0; line-height: 32px; }

.generic-popup.content h1 img { position: relative; top: 5px; margin-right: 15px; }

.generic-popup.content h1 span { display: inline-block; height: 25px; width: 25px; margin-right: 15px; position: relative; top: 5px; }

.generic-popup.content h2 { font-size: 14px; font-weight: 300; text-shadow: 0 0 1px #eee; margin: 20px 0 0 0; color: #666; }

.generic-popup.content .split-left { color: #666; display: inline-block; text-align: left; width: 180px; }

.generic-popup.content .split-right { color: #666; display: inline-block; text-align: right; width: 180px; }

.generic-popup input[type='text'], .generic-popup input[type='password'] { background: none; border: 1px solid #ccc; border-top: 1px solid #999; border-radius: 3px; box-shadow: 0 1px 2px #bbb inset; padding: 9px; font-size: 16px; color: #333; display: block; width: 342px; margin: 0; }
.generic-popup input[type='text'].inline-input, .generic-popup input[type='password'].inline-input { width: 150px; }

@-moz-document url-prefix() { .generic-popup input[type='text'], .generic-popup input[type='password'] { padding-top: 7px; } }
.generic-popup form p { text-align: left; position: relative; }

.account-infield { color: #999; font-size: 16px; font-weight: normal; position: absolute; top: 8px; left: 10px; z-index: 1; }

.account-input { position: relative; z-index: 2; }
.account-input.always-caps { text-transform: uppercase; }

.generic-popup .suggest-holder { color: #c66; display: block; font-size: 90%; margin-top: -28px; position: absolute; right: 0; width: 284px; }

.generic-popup .suggest-holder a { color: #c66; }

.green-button { background-image: linear-gradient(to bottom, #e0ffc2 0%, #b1e37f 100%); border: 1px solid #a7c28c; border-radius: 4px; box-shadow: inset 0 1px 0 0 rgba(255, 255, 255, 0.5), 0 1px 0 0 white; color: #42661e; cursor: pointer; display: inline-block; font-weight: bold; margin: 0 0 0 5px; min-width: 50px; padding: 5px 8px 5px 8px; text-align: center; text-shadow: 0 1px rgba(255, 255, 255, 0.6); }
.green-button:hover:not(disabled) { background: #b1e37f; }
.green-button:disabled, .green-button.disabled { cursor: default; opacity: 0.4; }

.gray-button { background-image: linear-gradient(to bottom, #f5f5f5 0%, #dedede 100%); border: 1px solid #bbb; border-radius: 4px; box-shadow: inset 0 1px 0 0 rgba(255, 255, 255, 0.5), 0 1px 0 0 white; color: #444; cursor: pointer; display: inline-block; font-weight: bold; margin: 0 0 0 5px; min-width: 50px; padding: 5px 8px 5px 8px; text-align: center; text-shadow: 0 1px rgba(255, 255, 255, 0.6); }

a:hover .gray-button { background: #e4e4e4; }

.button-link { cursor: pointer; text-decoration: none; }
.button-link:disabled, .button-link.disabled { pointer-events: none; }

input[type="number"].classy-input, input[type="password"].classy-input, input[type="tel"].classy-input, input[type="text"].classy-input { border: 1px solid #ccc; box-shadow: inset 0 1px 0 #eee,#fff 0 1px 0; margin: 0; padding: 7px; border-radius: 3px; background-color: white; color: #999; }

.classy-input[disabled='disabled'] { background: #ccc; color: #333; }

.info-tooltip > i { font-size: .8em; opacity: 0.7; transition: all 0.1s linear; }
.info-tooltip:hover > i, .info-tooltip:focus > i { opacity: 1; }

.small-link, .link-holder { font-size: 12px; font-weight: normal; line-height: 20px; }

.generic-popup .small-link { margin: .3em; text-decoration: underline; }

.link-holder { text-align: left; position: absolute; left: 2px; top: -2px; height: 20px; width: 200px; }

.link-holder a, .generic-popup .small-link { color: #888; }

.link-holder a { text-decoration: none; }

.generic-popup .clearfix { clear: both; }

.generic-popup .center { float: none; left: 0; }

.generic-popup.content h2.subtitle { padding-bottom: 12px; text-align: center; margin-top: -10px; }

.generic-popup .button-holder { margin-top: 20px; }

.subtitle.warning { font-weight: bold; }

.generic-popup .error-holder { color: #333; font-size: 14px; padding: 0 4px; position: absolute; left: -280px; text-align: right; z-index: 10; display: none; }

.error-holder .errorlist { margin: 0; padding: 0 0 0 30px; }

.arrow-holder { position: absolute; left: -525px; top: 0; width: 500px; height: 42px; }

.arrow-error { float: right; padding: 12px 0 16px 16px; background: url("//humblebundle-a.akamaihd.net/static/hashed/2d10ad27ca2af9ebcc54fd4322657696e5e50dec.png") no-repeat; margin-right: -5px; margin-top: -2px; font-size: 14px; color: white; font-weight: bold; text-align: right; display: none; position: absolute; right: 0; }

.arrow-error-right { background: url("//humblebundle-a.akamaihd.net/static/hashed/d00e64d9e0b5a925c42404a41014b85aecb2f0ea.png") no-repeat; width: 26px; height: 45px; position: absolute; right: -26px; top: 0; z-index: 100; }

.arrow-error a { color: #fff; }

#email-errors { top: 155px; }

.generic-popup .errorlist .error-item { color: #c66; text-decoration: none; }

.generic-popup .message-holder { margin-bottom: 20px; line-height: 22px; font-weight: normal; }

.generic-popup p { margin: 0 0 20px 0; padding: 0; }

.header-text { font-size: 18px; }

.account-switch { background: #ddd; border-top: 1px solid #ccc; border-bottom-right-radius: 7px; border-bottom-left-radius: 7px; margin: 20px -20px -22px; font-weight: normal; font-size: 14px; color: #333; }

.account-switch .create-account { color: #333; display: block; padding: 12px; text-decoration: none; }

.account-switch .create-account .create-inner { font-weight: bold; text-decoration: underline; }

.grayout, .generic-bbm-wrapper { background: url("//humblebundle-a.akamaihd.net/static/hashed/cb322c1cdfcdae03f826d02c39b7d998800d15c6.png"); }

.grayout { position: fixed; top: 0; left: 0; z-index: 998; right: 0; bottom: 0; background: rgba(40, 44, 52, 0.85); display: none; }

.grayout-inner { position: relative; width: 100%; height: 100%; }

.slide-down { display: none; }

.above-text-label { display: block; text-align: left; margin-bottom: 8px; }

/* Modal positioning */
.generic-bbm-wrapper { position: fixed; left: 0; top: 0; width: 100%; height: 100%; z-index: 998; background: rgba(0, 0, 0, 0.5); overflow-x: auto; overflow-y: auto; }

.generic-bbm-modal { position: relative; top: calc(50% - 250px); left: calc(50% - 200px); width: 276px; }

.generic-bbm-modal.eula-modal { top: calc(50% - 360px); left: calc(50% - 300px); width: 600px; }
.generic-bbm-modal.eula-modal .generic-popup.content { width: 100%; height: 100%; }
.generic-bbm-modal.eula-modal .generic-popup.content .message-holder { max-height: 500px; text-align: left; white-space: pre-line; overflow-x: hidden; overflow-y: scroll; }
.generic-bbm-modal.eula-modal .generic-popup.content .noimg { font-size: 22px; margin: 0.25em 0; }

.generic-bbm-views { width: 100%; }

/* Modal theme */
.generic-bbm-wrapper { -webkit-transition: background-color 0.3s; }

.generic-bbm-modal { border-radius: 3px; box-shadow: 0 -1px 25px rgba(0, 0, 0, 0.3); box-sizing: initial; }

.captcha-invisible { display: none; }

/* Animations */
/* Open modal */
@-webkit-keyframes generic-bbm-open { 0% { -webkit-transform: matrix(0.99126, 0, 0, 0.99126, 0, 43.8813); opacity: 0.1259; }
  4% { -webkit-transform: matrix(0.99295, 0, 0, 0.99295, 0, 45.06809); opacity: 0.29544; }
  8% { -webkit-transform: matrix(0.99467, 0, 0, 0.99467, 0, 46.26922); opacity: 0.46703; }
  12% { -webkit-transform: matrix(0.99619, 0, 0, 0.99619, 0, 47.33355); opacity: 0.61908; }
  16% { -webkit-transform: matrix(0.99743, 0, 0, 0.99743, 0, 48.19991); opacity: 0.74284; }
  20% { -webkit-transform: matrix(0.99837, 0, 0, 0.99837, 0, 48.86067); opacity: 0.83724; }
  24% { -webkit-transform: matrix(0.99905, 0, 0, 0.99905, 0, 49.33658); opacity: 0.90523; }
  28% { -webkit-transform: matrix(0.99952, 0, 0, 0.99952, 0, 49.66049); opacity: 0.9515; }
  32% { -webkit-transform: matrix(0.99981, 0, 0, 0.99981, 0, 49.8675); opacity: 0.98107; }
  36% { -webkit-transform: matrix(0.99999, 0, 0, 0.99999, 0, 49.98966); opacity: 0.99852; }
  40% { -webkit-transform: matrix(1.00008, 0, 0, 1.00008, 0, 50.05361); opacity: 1.00766; }
  44% { -webkit-transform: matrix(1.00011, 0, 0, 1.00011, 0, 50.08); opacity: 1.01143; }
  48% { -webkit-transform: matrix(1.00012, 0, 0, 1.00012, 0, 50.08394); opacity: 1.01199; }
  52% { -webkit-transform: matrix(1.00011, 0, 0, 1.00011, 0, 50.07589); opacity: 1.01084; }
  56% { -webkit-transform: matrix(1.00009, 0, 0, 1.00009, 0, 50.06265); opacity: 1.00895; }
  60% { -webkit-transform: matrix(1.00007, 0, 0, 1.00007, 0, 50.04833); opacity: 1.0069; }
  64% { -webkit-transform: matrix(1.00005, 0, 0, 1.00005, 0, 50.03518); opacity: 1.00503; }
  68% { -webkit-transform: matrix(1.00004, 0, 0, 1.00004, 0, 50.02421); opacity: 1.00346; }
  72% { -webkit-transform: matrix(1.00002, 0, 0, 1.00002, 0, 50.01567); opacity: 1.00224; }
  76% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00941); opacity: 1.00134; }
  80% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00506); opacity: 1.00072; }
  84% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.00223); opacity: 1.00032; }
  88% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.0005); opacity: 1.00007; }
  92% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99956); opacity: 0.99994; }
  96% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99913); opacity: 0.99988; }
  100% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50); opacity: 1; } }
.generic-bbm-modal--open { -webkit-animation-duration: 0.3s; -webkit-animation-name: generic-bbm-open; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

/* Open a stacked modal */
@-webkit-keyframes generic-bbm-stacked { 0% { -webkit-transform: matrix(0.99874, 0, 0, 0.99874, 0, 49.1187); opacity: 0.93705; }
  4% { -webkit-transform: matrix(0.99705, 0, 0, 0.99705, 0, 47.93192); opacity: 0.85228; }
  8% { -webkit-transform: matrix(0.99533, 0, 0, 0.99533, 0, 46.73078); opacity: 0.76648; }
  12% { -webkit-transform: matrix(0.99381, 0, 0, 0.99381, 0, 45.66645); opacity: 0.69046; }
  16% { -webkit-transform: matrix(0.99257, 0, 0, 0.99257, 0, 44.80009); opacity: 0.62858; }
  20% { -webkit-transform: matrix(0.99163, 0, 0, 0.99163, 0, 44.13933); opacity: 0.58138; }
  24% { -webkit-transform: matrix(0.99095, 0, 0, 0.99095, 0, 43.66342); opacity: 0.54739; }
  28% { -webkit-transform: matrix(0.99049, 0, 0, 0.99049, 0, 43.33951); opacity: 0.52425; }
  32% { -webkit-transform: matrix(0.99019, 0, 0, 0.99019, 0, 43.1325); opacity: 0.50946; }
  36% { -webkit-transform: matrix(0.99002, 0, 0, 0.99002, 0, 43.01034); opacity: 0.50074; }
  40% { -webkit-transform: matrix(0.98992, 0, 0, 0.98992, 0, 42.94639); opacity: 0.49617; }
  44% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92001); opacity: 0.49429; }
  48% { -webkit-transform: matrix(0.98988, 0, 0, 0.98988, 0, 42.91606); opacity: 0.494; }
  52% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92411); opacity: 0.49458; }
  56% { -webkit-transform: matrix(0.98991, 0, 0, 0.98991, 0, 42.93736); opacity: 0.49553; }
  60% { -webkit-transform: matrix(0.98993, 0, 0, 0.98993, 0, 42.95167); opacity: 0.49655; }
  64% { -webkit-transform: matrix(0.98995, 0, 0, 0.98995, 0, 42.96482); opacity: 0.49749; }
  68% { -webkit-transform: matrix(0.98997, 0, 0, 0.98997, 0, 42.97579); opacity: 0.49827; }
  72% { -webkit-transform: matrix(0.98998, 0, 0, 0.98998, 0, 42.98433); opacity: 0.49888; }
  76% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99059); opacity: 0.49933; }
  80% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99494); opacity: 0.49964; }
  84% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.99777); opacity: 0.49984; }
  88% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.9995); opacity: 0.49996; }
  92% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00044); opacity: 0.50003; }
  96% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00088); opacity: 0.50006; }
  100% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43); opacity: 0.5; } }
.generic-bbm-modal--stacked { -webkit-animation-duration: 0.43333s; -webkit-animation-name: generic-bbm-stacked; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

/* Close a stacked modal */
@-webkit-keyframes generic-bbm-stacked-reverse { 0% { -webkit-transform: matrix(0.99123, 0, 0, 0.99123, 0, 43.86266); opacity: 0.56162; }
  4% { -webkit-transform: matrix(0.99293, 0, 0, 0.99293, 0, 45.05306); opacity: 0.64665; }
  8% { -webkit-transform: matrix(0.99465, 0, 0, 0.99465, 0, 46.25785); opacity: 0.7327; }
  12% { -webkit-transform: matrix(0.99618, 0, 0, 0.99618, 0, 47.32543); opacity: 0.80896; }
  16% { -webkit-transform: matrix(0.99742, 0, 0, 0.99742, 0, 48.19443); opacity: 0.87103; }
  20% { -webkit-transform: matrix(0.99837, 0, 0, 0.99837, 0, 48.8572); opacity: 0.91837; }
  24% { -webkit-transform: matrix(0.99905, 0, 0, 0.99905, 0, 49.33456); opacity: 0.95247; }
  28% { -webkit-transform: matrix(0.99951, 0, 0, 0.99951, 0, 49.65946); opacity: 0.97568; }
  32% { -webkit-transform: matrix(0.99981, 0, 0, 0.99981, 0, 49.8671); opacity: 0.99051; }
  36% { -webkit-transform: matrix(0.99999, 0, 0, 0.99999, 0, 49.98963); opacity: 0.99926; }
  40% { -webkit-transform: matrix(1.00008, 0, 0, 1.00008, 0, 50.05377); opacity: 1.00384; }
  44% { -webkit-transform: matrix(1.00012, 0, 0, 1.00012, 0, 50.08024); opacity: 1.00573; }
  48% { -webkit-transform: matrix(1.00012, 0, 0, 1.00012, 0, 50.08419); opacity: 1.00601; }
  52% { -webkit-transform: matrix(1.00011, 0, 0, 1.00011, 0, 50.07612); opacity: 1.00544; }
  56% { -webkit-transform: matrix(1.00009, 0, 0, 1.00009, 0, 50.06284); opacity: 1.00449; }
  60% { -webkit-transform: matrix(1.00007, 0, 0, 1.00007, 0, 50.04848); opacity: 1.00346; }
  64% { -webkit-transform: matrix(1.00005, 0, 0, 1.00005, 0, 50.03529); opacity: 1.00252; }
  68% { -webkit-transform: matrix(1.00004, 0, 0, 1.00004, 0, 50.02428); opacity: 1.00173; }
  72% { -webkit-transform: matrix(1.00002, 0, 0, 1.00002, 0, 50.01572); opacity: 1.00112; }
  76% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00944); opacity: 1.00067; }
  80% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00508); opacity: 1.00036; }
  84% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.00223); opacity: 1.00016; }
  88% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.0005); opacity: 1.00004; }
  92% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99956); opacity: 0.99997; }
  96% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99912); opacity: 0.99994; }
  100% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50); opacity: 1; } }
.generic-bbm-modal--stacked-reverse { -webkit-animation-duration: 0.43333s; -webkit-animation-name: generic-bbm-stacked-reverse; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

/* Close a modal */
@-webkit-keyframes generic-bbm-close { 0% { -webkit-transform: matrix(0.99874, 0, 0, 0.99874, 0, 49.1187); opacity: 0.8741; }
  4% { -webkit-transform: matrix(0.99705, 0, 0, 0.99705, 0, 47.93192); opacity: 0.70456; }
  8% { -webkit-transform: matrix(0.99533, 0, 0, 0.99533, 0, 46.73078); opacity: 0.53297; }
  12% { -webkit-transform: matrix(0.99381, 0, 0, 0.99381, 0, 45.66645); opacity: 0.38092; }
  16% { -webkit-transform: matrix(0.99257, 0, 0, 0.99257, 0, 44.80009); opacity: 0.25716; }
  20% { -webkit-transform: matrix(0.99163, 0, 0, 0.99163, 0, 44.13933); opacity: 0.16276; }
  24% { -webkit-transform: matrix(0.99095, 0, 0, 0.99095, 0, 43.66342); opacity: 0.09477; }
  28% { -webkit-transform: matrix(0.99049, 0, 0, 0.99049, 0, 43.33951); opacity: 0.0485; }
  32% { -webkit-transform: matrix(0.99019, 0, 0, 0.99019, 0, 43.1325); opacity: 0.01893; }
  36% { -webkit-transform: matrix(0.99002, 0, 0, 0.99002, 0, 43.01034); opacity: 0.00148; }
  40% { -webkit-transform: matrix(0.98992, 0, 0, 0.98992, 0, 42.94639); opacity: -0.00766; }
  44% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92001); opacity: -0.01143; }
  48% { -webkit-transform: matrix(0.98988, 0, 0, 0.98988, 0, 42.91606); opacity: -0.01199; }
  52% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92411); opacity: -0.01084; }
  56% { -webkit-transform: matrix(0.98991, 0, 0, 0.98991, 0, 42.93736); opacity: -0.00895; }
  60% { -webkit-transform: matrix(0.98993, 0, 0, 0.98993, 0, 42.95167); opacity: -0.0069; }
  64% { -webkit-transform: matrix(0.98995, 0, 0, 0.98995, 0, 42.96482); opacity: -0.00503; }
  68% { -webkit-transform: matrix(0.98997, 0, 0, 0.98997, 0, 42.97579); opacity: -0.00346; }
  72% { -webkit-transform: matrix(0.98998, 0, 0, 0.98998, 0, 42.98433); opacity: -0.00224; }
  76% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99059); opacity: -0.00134; }
  80% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99494); opacity: -0.00072; }
  84% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.99777); opacity: -0.00032; }
  88% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.9995); opacity: -7e -5; }
  92% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00044); opacity: 6.0e-05; }
  96% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00088); opacity: 0.00012; }
  100% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43); opacity: 0; } }
.generic-bbm-modal--close { -webkit-animation-duration: 0.43333s; -webkit-animation-name: generic-bbm-close; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

#account-login-authy-token-holder { display: none; }

@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) { .generic-bbm-modal--open, .generic-bbm-modal--stacked, .generic-bbm-modal--stacked-reverse, .generic-bbm-modal--destroy { -webkit-animation: none !important; } }
  #flash {
    position:fixed;
    right: 30px;
    top:10px;
    background: black;
    opacity: .8;
    border-radius: 10px;
    color:#eee;
    padding:20px;
    min-width: 200px;
    max-width: 400px;
    text-align: center;
    z-index: 99999;
    box-shadow: 1px 1px 5px #000;
    display:none;
  }
html, body {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  margin: 0;
  padding: 0;
}

// Localize.js uses the <var> tag to indicate certain special things. However,
// some browsers apply special CSS to the <var> tag which we don't want. This
// effectively removes any special CSS that the browser might apply to <var>.
var {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
.humble-banner { box-sizing: content-box; background: radial-gradient(ellipse closest-side, #4b4b4b 0%, black 40%); height: 90px; padding: 10px 0; }
.humble-banner a, .humble-banner a:visited { display: block; width: 651px; height: 89px; text-align: center; margin: 0 auto; text-decoration: none; position: relative; }
.humble-banner p { font-size: 18px; line-height: 18px; color: #ccc; font-style: italic; margin: 0; padding: 0; position: absolute; top: 36px; left: -250px; width: 240px; text-align: right; }
.humble-banner img { margin: 12px 0 0 0; height: 45px; width: auto; }
.humble-banner h3 { margin: 0; padding: 0; display: inline-block; position: relative; }
.humble-banner h4 { font-size: 14px; line-height: 14px; color: #eee; margin: 0; font-weight: normal; padding: 4px 0 16px 0; }
.sharer {
  display: inline-block;
  vertical-align: middle;
}

.sharer.l {
  float: none;
  position: static;
}

.sharer + .sharer,
script + .sharer {
  margin-left: 15px;
}

.social-media-shares {
  text-align: center;
  padding-bottom: 10px;
}
  </style>
  
  <style type="text/css">@font-face { font-family: 'hb-icons'; src: url("/static/hashed/17015ce97435ec01a0b93ed4cd7e0c07d8358d94.woff2") format("woff2"), url("/static/hashed/aa7c3e70c582fdfe2eaa1f7fa385de1fdf9ad5aa.woff") format("woff"), url("/static/hashed/a644e848801b42652db065692ad02c14597addc3.ttf") format("truetype"), url("/static/hashed/e0d86cf22c1a59129aaccbf71a27375ce4d8ab4a.otf") format("opentype"); font-weight: normal; font-style: normal; }
/* Sophia Pro */
@font-face { font-family: 'Sofia Pro'; src: url("/static/hashed/9e29ad97c24ce996ebe7aefbc55c0077ed0d8d2f.woff2") format("woff2"), url("/static/hashed/cbe7d774210bd1694c15df789ac02ccf3b2b4e92.woff") format("woff"), url("/static/hashed/c25e4297360ab6310322bcc95cf47b58fd6321bc.ttf") format("truetype"), url("/static/hashed/a294c7b2895267014ac902206c4bd4c75b586a04.otf") format("opentype"); font-weight: 900; font-style: normal; }
@font-face { font-family: 'Sofia Pro'; src: url("/static/hashed/86b0d4d2129d83657c3712791efc7e9754aa8a82.woff2") format("woff2"), url("/static/hashed/c0623e77d8862256a4360e1115d945053eb655ef.woff") format("woff"), url("/static/hashed/e01d35c833cf887534576322604e6e1ec2c95361.ttf") format("truetype"), url("/static/hashed/1b015efad5d8d477ac94c6c74de3a6d3d3ed16df.otf") format("opentype"); font-weight: 900; font-style: italic; }
@font-face { font-family: 'Sofia Pro'; src: url("/static/hashed/34c59909d0360e2d5e43bcb210176a753e1866b0.woff2") format("woff2"), url("/static/hashed/11d59a3ff5cdd3390fb93fbd9615dc0fb56a8c65.woff") format("woff"), url("/static/hashed/7e9bccdbfb3878e6a5453bf99993eed610d0e41d.ttf") format("truetype"), url("/static/hashed/18a648d337ad820b6dbf8145682d67d5259dcebd.otf") format("opentype"); font-weight: 300; font-style: normal; }
@font-face { font-family: 'Sofia Pro'; src: url("/static/hashed/5b6a9522d5ddf17bbc23ee59f994e6df291ed825.woff2") format("woff2"), url("/static/hashed/df30037a1c8ff81537368af51b9e3fe836ee2804.woff") format("woff"), url("/static/hashed/9746d94d32ced44188e055d15495eed7f8fd43b1.ttf") format("truetype"), url("/static/hashed/1ce1b93b6c5386c81aed0a4d365d51809545ec39.otf") format("opentype"); font-weight: 300; font-style: italic; }
@font-face { font-family: 'Sofia Pro'; src: url("/static/hashed/0052ab0bbfee0e88edc1e6c68494d9449016fd24.woff2") format("woff2"), url("/static/hashed/dcfc553e267fb5bb92a7510b6be35159fdadf57f.woff") format("woff"), url("/static/hashed/9370f719a25957b05ace466b39c2a2d4b33734c6.ttf") format("truetype"), url("/static/hashed/ab1f225985185b4ebb319b4c7f89b1d9b2b59848.otf") format("opentype"); font-weight: normal; font-style: normal; }
@font-face { font-family: 'Sofia Pro'; src: url("/static/hashed/c294b2a2521169835a44953e87e2cc8900cee5ec.woff2") format("woff2"), url("/static/hashed/9322caa9a8ca9c74d5f0af655d789d1d7d63a24a.woff") format("woff"), url("/static/hashed/034595580ccc31b93f69fe336eb28bd519f5dc95.ttf") format("truetype"), url("/static/hashed/f4e4f58e25e1a1ad121ed70b9c4832bb69c941b3.otf") format("opentype"); font-weight: normal; font-style: italic; }</style>
  <link rel="stylesheet" href="https://humblebundle-a.akamaihd.net/static/hashed/149e1a4113c4b83734843264419d4e94a6094e3a.css">
  <link rel="stylesheet" href="https://humblebundle-a.akamaihd.net/static/hashed/9ecf9ad2ae9d3451f6c06cc46198a39e6bd3473f.css">
<style>
  .charity-selection .charity-results .charity-preview .select-charity, .charity-selection .charity-results .charity-preview .remove-charity, .charity-selection .featured-charities .featured-charities-list .charity-preview .select-charity, .charity-details .charity-title .select-charity { display: block; padding: 4px 0; border-radius: 3px; border: none; background: rgba(255, 255, 255, 0.3); border: 1px solid rgba(0, 0, 0, 0.2); text-align: center; font-size: 12px; font-weight: bold; text-decoration: none; color: #494f5c; }

.charity-selection .charity-results .charity-preview .select-charity.is-selected, .charity-selection .featured-charities .featured-charities-list .charity-preview .select-charity.is-selected, .charity-details .charity-title .select-charity.is-selected { border: 1px solid rgba(0, 0, 0, 0.1); background: #17a1e5; color: #fff; }

.charity-selection h2 { font-size: 26px; color: #494f5c; font-weight: 200; margin: -6px 0 0 0; }
.charity-selection .charity-search { padding-bottom: 20px; position: relative; font-size: 14px; }
.charity-selection .charity-search input, .charity-selection .charity-search label, .charity-selection .charity-search button { display: inline-block; margin-right: 10px; }
.charity-selection .charity-search input, .charity-selection .charity-search select, .charity-selection .charity-search button { border-radius: 3px; height: 31px; padding: 4px; box-sizing: border-box; border: 1px solid #ddd; margin-top: 4px; font-size: 14px; }
.charity-selection .charity-search label { text-transform: uppercase; font-size: 10px; color: #a1a7b2; }
.charity-selection .charity-search label::first-letter { margin-left: 2px; }
.charity-selection .charity-search .query { position: relative; width: 350px; }
.charity-selection .charity-search .query input { width: 100%; padding-left: 26px; color: #494f5c; }
.charity-selection .charity-search .query i { position: absolute; bottom: 8px; left: 8px; font-size: 14px; color: #a1a7b2; }
.charity-selection .charity-search .category select, .charity-selection .charity-search .country select, .charity-selection .charity-search .state select { width: 100%; display: inline-block; color: #494f5c; }
.charity-selection .charity-search .category { width: 250px; }
.charity-selection .charity-search .country { width: 210px; }
.charity-selection .charity-search .state { display: none; }
.charity-selection .charity-search .state.is-united-states, .charity-selection .charity-search .country.is-united-states { width: 100px; display: inline-block; }
.charity-selection .charity-search button { width: 100px; margin-right: 0; border: 1px solid rgba(0, 0, 0, 0.2); box-shadow: 0px 1px 2px rgba(255, 255, 255, 0.2) inset; background-image: linear-gradient(top, #4DC4FF 0%, #17A1E6 100%); text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.2); color: #fff; font-weight: 500; }
.charity-selection .charity-search:after { content: ''; display: block; clear: both; }
.charity-selection .results-heading { margin: 4px 0 0 0; font-size: 20px; font-weight: 200; }
.charity-selection .results-heading-disclaimer { margin: 4px 0 2px 0; font-size: 12px; color: #7b818c; font-weight: normal; display: none; }
.charity-selection .charity-img { height: 64px; width: 64px; background-color: white; background-size: contain; background-repeat: no-repeat; background-position: center center; border-radius: 3px; overflow: hidden; position: absolute; cursor: pointer; left: 0; top: 0; }
.charity-selection .partnership-line { position: absolute; right: 0; bottom: 0; color: #7B818C; font-size: 12px; font-style: italic; }
.charity-selection .partnership-line a { color: #7B818C; }
.charity-selection .charity-results { padding-top: 5px; margin-bottom: 20px; margin-right: -20px; }
.charity-selection .charity-results .charity-selection-message { text-align: center; color: #7b818c; margin: 65px; }
.charity-selection .charity-results .charity-selection-message h1 { font-size: 24px; font-weight: normal; }
.charity-selection .charity-results .charity-selection-message img { vertical-align: middle; margin-right: 5px; }
.charity-selection .charity-results .charity-preview { width: 300px; margin: 20px 20px 20px 0; display: inline-block; text-align: left; vertical-align: top; position: relative; padding-left: 76px; box-sizing: border-box; }
.charity-selection .charity-results .charity-preview.is-disallowed { opacity: 0.5; }
.charity-selection .charity-results .charity-preview.is-disallowed button { outline: none; }
.charity-selection .charity-results .charity-preview a { text-decoration: none; }
.charity-selection .charity-results .charity-preview .select-charity { display: inline-block; font-size: 10px; height: 18px; padding: 1px 8px; text-transform: uppercase; }
.charity-selection .charity-results .charity-preview .select-charity .unselected-text { display: inline; }
.charity-selection .charity-results .charity-preview .select-charity .disallowed-text, .charity-selection .charity-results .charity-preview .select-charity .selected-text { display: none; }
.charity-selection .charity-results .charity-preview .select-charity.is-selected .selected-text { display: inline; }
.charity-selection .charity-results .charity-preview .select-charity.is-selected .disallowed-text, .charity-selection .charity-results .charity-preview .select-charity.is-selected .unselected-text { display: none; }
.charity-selection .charity-results .charity-preview .select-charity.is-disallowed { cursor: default; background: #333; }
.charity-selection .charity-results .charity-preview .select-charity.is-disallowed .disallowed-text { display: inline; color: #787878; }
.charity-selection .charity-results .charity-preview .select-charity.is-disallowed .selected-text, .charity-selection .charity-results .charity-preview .select-charity.is-disallowed .unselected-text { display: none; }
.charity-selection .charity-results .charity-preview .remove-charity { background-color: #cb272c; color: white; display: inline-block; font-size: 10px; height: 18px; margin-left: 5px; padding: 1px 8px; text-transform: uppercase; }
.charity-selection .charity-results .charity-preview .charity-name { margin: 0 0 0 auto; }
.charity-selection .charity-results .charity-preview .charity-name h4 { margin: -1px 0 0 0; padding: 0 0 7px 0; height: 18px; font-size: 16px; font-weight: 400; white-space: nowrap; overflow-x: hidden; text-overflow: ellipsis; width: 204px; }
.charity-selection .charity-results .charity-preview .charity-name h5.location { margin: 0 0 9px 0; font-size: 12px; font-weight: normal; color: #7b818c; height: 14px; }
.charity-selection .featured-charities { border-bottom: 1px solid #ddd; margin-bottom: 20px; padding-bottom: 20px; min-height: 116px; }
.charity-selection .featured-charities::after { clear: both; content: ""; display: table; }
.charity-selection .featured-charities .featured-description-wrapper { float: left; }
.charity-selection .featured-charities .featured-heading { font-size: 20px; font-weight: 200; margin: 20px 0 18px 0; }
.charity-selection .featured-charities .featured-charities-description { width: 245px; margin: 0; line-height: 16px; }
.charity-selection .featured-charities .featured-charities-list { padding-top: 20px; float: right; }
.charity-selection .featured-charities .featured-charities-list .charity-list { text-align: right; }
.charity-selection .featured-charities .featured-charities-list .charity-preview { width: 64px; margin: 0 -10px 0 65px; display: inline-block; text-align: center; vertical-align: top; position: relative; box-sizing: border-box; }
.charity-selection .featured-charities .featured-charities-list .charity-preview:first-of-type { margin-left: 0; }
.charity-selection .featured-charities .featured-charities-list .charity-preview a { text-decoration: none; }
.charity-selection .featured-charities .featured-charities-list .charity-preview .charity-img { position: static; display: block; margin: 0 auto; }
.charity-selection .featured-charities .featured-charities-list .charity-preview .select-charity { padding: 1px 8px; font-size: 10px; text-transform: uppercase; height: 18px; margin: 0 auto; }
.charity-selection .featured-charities .featured-charities-list .charity-preview .select-charity .selected-text, .charity-selection .featured-charities .featured-charities-list .charity-preview .select-charity .unselected-text { display: none; }
.charity-selection .featured-charities .featured-charities-list .charity-preview .select-charity.is-selected .selected-text { display: inline; }
.charity-selection .featured-charities .featured-charities-list .charity-preview .select-charity:not(.is-selected) .unselected-text { display: inline; }
.charity-selection .featured-charities .featured-charities-list .charity-preview .charity-name { margin: 0 0 0 auto; }
.charity-selection .featured-charities .featured-charities-list .charity-preview .charity-name h4 { margin: 12px -40% 12px -40%; height: 18px; font-size: 12px; font-weight: normal; }
.charity-selection .featured-charities .featured-charities-list .charity-preview .charity-name h5.location { display: none; }

.charity-details { margin-bottom: 40px; }
.charity-details:after { content: ''; display: block; clear: both; }
.charity-details .charity-title { display: block; position: relative; padding-bottom: 16px; border-bottom: 1px solid #ddd; margin-bottom: 20px; }
.charity-details .charity-title h2 { font-size: 26px; font-weight: 200; margin: 0; }
.charity-details .charity-title .select-charity { padding: 7px 14px; font-size: 14px; position: absolute; top: 0; right: 0; }
.charity-details .charity-title .select-charity .selected-text, .charity-details .charity-title .select-charity .unselected-text { display: none; }
.charity-details .charity-title .select-charity.is-selected .selected-text { display: inline; }
.charity-details .charity-title .select-charity:not(.is-selected) .unselected-text { display: inline; }
.charity-details .charity-img { width: 190px; height: 190px; float: left; border: 1px solid #ddd; border-radius: 3px; background-color: white; background-size: contain; background-repeat: no-repeat; background-position: center center; position: relative; }
.charity-details .charity-sidebar { margin-left: 210px; }
.charity-details .charity-sidebar .charity-info { font-style: italic; }
.charity-details .charity-sidebar .charity-info strong { font-style: normal; }
.charity-details .charity-sidebar .charity-link { display: block; font-weight: bold; font-style: normal; color: #17a1e5; margin: 1em 0; }
.charity-details .charity-description { font-size: 14px; line-height: 21px; }

.charity-account-cta { position: fixed; bottom: -56px; left: 0; right: 0; height: 48px; text-align: center; z-index: 1000; }
.charity-account-cta .charity-account-cta-message { display: inline-block; height: 48px; padding: 18px 40px; box-sizing: border-box; border-radius: 3px 3px 0 0; background: #d5d9e1; border: 1px solid rgba(161, 167, 178, 0.5); box-shadow: 0 -1px 8px rgba(0, 0, 0, 0.3); }
.charity-account-cta .charity-account-cta-message p { margin: 0; }

.unstyled-link { text-decoration: none; }

.genericbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/aafd697db4950b99bc95a0ef740f10d7301eb437.png") no-repeat; }

.activated .genericbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/7f9102778b07eec38f1ba5911c95c24d3aa98318.png") no-repeat; }

.steambutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/4679a3c4d14fbda0fe37478d446d001fad44e3c1.png") no-repeat; }

.activated .steambutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/7d32b8cb2ed51ab18ec0e5a40208afd4a41c988c.png") no-repeat; }

.uplaybutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/4b3fd1c208843f91a063bec2349b526202a4fe6e.png") no-repeat; }

.activated .uplaybutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/4ca5ac1bf3373babd5a508d6556f5f7fd6ad4b38.png") no-repeat; }

.originbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/e76fbc1ccb8733279587f6038056cd3fdc0271a9.png") no-repeat; }

.activated .originbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/3ff62f831583f243b65f8954c08f40702eed5912.png") no-repeat; }

.ouyabutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/e8916956991bdd418ccdb45e6dead81cae599a34.png") no-repeat; }

.activated .ouyabutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/cb5ea8b036c49c5f6466d97c37703016668df034.png") no-repeat; }

.desurabutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/97b4d580682444ec310e39480957a39d84a50106.png") no-repeat; }

.activated .desurabutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/72c7a91a612ceee5ceda77133c9d79bf66b8dec3.png") no-repeat; }

.onlivebutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/e7426f51dea62e220deeb988794cb32e15c265ae.png") no-repeat; }

.activated .onlivebutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/8c812b14676720a1c5541e5ff0084336f8ca952b.png") no-repeat; }

.multiplayerbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/6f98857f10330e006847a2571bd2fcdd972da502.png") no-repeat; }

.activated .multiplayerbutton { background: url("//humblebundle-a.akamaihd.net/static/hashed/20048fabc7a0a68316b0315f584c58ad95b17055.png") no-repeat; }

.squareenix_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/ac97edf1d373f749576bab85be377698494478d9.png") no-repeat; }

.activated .squareenix_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/3af19fcba4ca44990c78e1aebee17bbadd21afe7.png") no-repeat; }

.bethesda_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/61a2c4c13f0b95b11aec7784356d325f1ad76223.png") no-repeat; }

.activated .bethesda_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/80a34f59a907904dcb29c5e434affb9f88ee6fc6.png") no-repeat; }

.telltalegames_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/c3c956701f7cbf7842d1fef8d713f829042dbfb4.png") no-repeat; }

.activated .telltalegames_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/cfe22581a0a30154a85744ae2f58671af6b731b6.png") no-repeat; }

.nintendo_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/32be74acd8de11c5a9a240c5ce3c00d0287b83a3.png") no-repeat; }

.activated .nintendo_button { background: url("//humblebundle-a.akamaihd.net/static/hashed/2a16694e165dc6e39f3e89f6eba6d1451d278f6a.png") no-repeat; }

.soldout { visibility: hidden; }

.bbm-modal .whitebox .loading { padding: 50px; width: 300px; }
.bbm-modal .whitebox .downloads { padding-right: 30px; }
.bbm-modal .whitebox .platform-chooser { padding-top: 30px; }
.bbm-modal .whitebox .row { padding-left: 15px; }
.bbm-modal .whitebox .keyfield { width: 350px; height: 28px; color: #808080; text-align: center; line-height: 28px; font-size: 12px; -webkit-font-smoothing: antialiased; float: left; background: url("//humblebundle-a.akamaihd.net/static/hashed/9e9017643ddecc7f2d3cd0032c577b88d96ce5e0.png") no-repeat; }
.bbm-modal .whitebox .clear { clear: both; height: 0; }

.bbm-modal { background: #fff; color: #333; font-size: 14px; font-weight: normal; box-shadow: 0 0 6px rgba(0, 0, 0, 0.6), 0 1px 2px rgba(0, 0, 0, 0.9); }

/* Modal positioning */
.bbm-wrapper { background: rgba(0, 0, 0, 0.4); position: fixed; left: 0; top: 0; width: 100%; height: 100%; z-index: 100; padding: 0 10px 0 10px; text-align: left; overflow: auto; }

.bbm-modal { border-radius: 3px; min-width: 761px; margin: auto; margin-bottom: 40px; width: auto; max-width: 550px; }

.bbm-views { width: 100%; }

.generic-bbm-views { width: 100%; }

/* BLOCKS */
.bbm-modal__topbar, .bbm-modal__bottombar { padding: 0 30px; }

.bbm-modal__topbar { border-bottom: 1px solid rgba(0, 0, 0, 0.1); border-radius: 3px 3px 0 0; padding: 10px 30px; background: #bbb; font-weight: bold; font-size: 16px; margin-bottom: 30px; }
.bbm-modal__topbar i { margin-right: 10px; }
.bbm-modal__topbar > ul { list-style: none; text-align: center; padding: 0; margin: 0; }

.bbm-modal__tab { display: inline-block; padding: 15px 10px; }
.bbm-modal__tab a { font-size: 16px; font-weight: bold; color: #999999; }
.bbm-modal__tab a:hover, .bbm-modal__tab a.active { color: #222222; }

.bbm-modal__title { padding: 20px 30px; margin: 0; line-height: 1em; color: #312d3a; }

.bbm-modal__section { padding: 60px 30px 0px 30px; font-size: 14px; font-weight: normal; line-height: 26px; color: #333; }
.bbm-modal__section p:last-child { padding: 0; margin-bottom: 0; }
.bbm-modal__section a { color: #333; }
.bbm-modal__section h3 { margin: 0; font-size: 20px; line-height: 1em; }

.bbm-modal__bottombar { border-top: 1px solid rgba(0, 0, 0, 0.1); padding: 18px; text-align: right; margin-top: 30px; }

/* MODULES */
.bbm-group { content: ""; display: table; clear: both; }

.bbm-button { display: inline-block; color: rgba(49, 45, 58, 0.8); text-decoration: none; font-size: 14px; font-weight: 500; position: relative; line-height: 1em; padding: 10px 14px; border-radius: 3px; background: #fcfcfc; background-image: -o-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); background-image: -moz-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); background-image: -webkit-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); background-image: -ms-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); background-image: linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.15) 100%); -moz-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1), inset 0 0 0 1px rgba(0, 0, 0, 0.2); -webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1), inset 0 0 0 1px rgba(0, 0, 0, 0.2); box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1), inset 0 0 0 1px rgba(0, 0, 0, 0.2); }
.bbm-button.inactive { opacity: 0.5; pointer-events: none; }
.bbm-button:active { background-image: -o-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); background-image: -moz-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); background-image: -webkit-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); background-image: -ms-linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); background-image: linear-gradient(rgba(70, 30, 170, 0) 0%, rgba(65, 61, 75, 0.25) 100%); -moz-box-shadow: inset 0 1px 2px 0 rgba(0, 0, 0, 0.5), inset 0 0 0 1px rgba(0, 0, 0, 0.2); -webkit-box-shadow: inset 0 1px 2px 0 rgba(0, 0, 0, 0.5), inset 0 0 0 1px rgba(0, 0, 0, 0.2); box-shadow: inset 0 1px 2px 0 rgba(0, 0, 0, 0.5), inset 0 0 0 1px rgba(0, 0, 0, 0.2); }

/* ANIMATIONS */
/* Open modal */
@-webkit-keyframes bbm-open { 0% { -webkit-transform: matrix(0.99126, 0, 0, 0.99126, 0, 43.8813); opacity: 0.1259; }
  4% { -webkit-transform: matrix(0.99295, 0, 0, 0.99295, 0, 45.06809); opacity: 0.29544; }
  8% { -webkit-transform: matrix(0.99467, 0, 0, 0.99467, 0, 46.26922); opacity: 0.46703; }
  12% { -webkit-transform: matrix(0.99619, 0, 0, 0.99619, 0, 47.33355); opacity: 0.61908; }
  16% { -webkit-transform: matrix(0.99743, 0, 0, 0.99743, 0, 48.19991); opacity: 0.74284; }
  20% { -webkit-transform: matrix(0.99837, 0, 0, 0.99837, 0, 48.86067); opacity: 0.83724; }
  24% { -webkit-transform: matrix(0.99905, 0, 0, 0.99905, 0, 49.33658); opacity: 0.90523; }
  28% { -webkit-transform: matrix(0.99952, 0, 0, 0.99952, 0, 49.66049); opacity: 0.9515; }
  32% { -webkit-transform: matrix(0.99981, 0, 0, 0.99981, 0, 49.8675); opacity: 0.98107; }
  36% { -webkit-transform: matrix(0.99999, 0, 0, 0.99999, 0, 49.98966); opacity: 0.99852; }
  40% { -webkit-transform: matrix(1.00008, 0, 0, 1.00008, 0, 50.05361); opacity: 1.00766; }
  44% { -webkit-transform: matrix(1.00011, 0, 0, 1.00011, 0, 50.08); opacity: 1.01143; }
  48% { -webkit-transform: matrix(1.00012, 0, 0, 1.00012, 0, 50.08394); opacity: 1.01199; }
  52% { -webkit-transform: matrix(1.00011, 0, 0, 1.00011, 0, 50.07589); opacity: 1.01084; }
  56% { -webkit-transform: matrix(1.00009, 0, 0, 1.00009, 0, 50.06265); opacity: 1.00895; }
  60% { -webkit-transform: matrix(1.00007, 0, 0, 1.00007, 0, 50.04833); opacity: 1.0069; }
  64% { -webkit-transform: matrix(1.00005, 0, 0, 1.00005, 0, 50.03518); opacity: 1.00503; }
  68% { -webkit-transform: matrix(1.00004, 0, 0, 1.00004, 0, 50.02421); opacity: 1.00346; }
  72% { -webkit-transform: matrix(1.00002, 0, 0, 1.00002, 0, 50.01567); opacity: 1.00224; }
  76% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00941); opacity: 1.00134; }
  80% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00506); opacity: 1.00072; }
  84% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.00223); opacity: 1.00032; }
  88% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.0005); opacity: 1.00007; }
  92% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99956); opacity: 0.99994; }
  96% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99913); opacity: 0.99988; }
  100% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50); opacity: 1; } }
.bbm-modal--open { -webkit-animation-duration: 0.3s; -webkit-animation-name: bbm-open; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

/* Open a stacked modal */
@-webkit-keyframes bbm-stacked { 0% { -webkit-transform: matrix(0.99874, 0, 0, 0.99874, 0, 49.1187); opacity: 0.93705; }
  4% { -webkit-transform: matrix(0.99705, 0, 0, 0.99705, 0, 47.93192); opacity: 0.85228; }
  8% { -webkit-transform: matrix(0.99533, 0, 0, 0.99533, 0, 46.73078); opacity: 0.76648; }
  12% { -webkit-transform: matrix(0.99381, 0, 0, 0.99381, 0, 45.66645); opacity: 0.69046; }
  16% { -webkit-transform: matrix(0.99257, 0, 0, 0.99257, 0, 44.80009); opacity: 0.62858; }
  20% { -webkit-transform: matrix(0.99163, 0, 0, 0.99163, 0, 44.13933); opacity: 0.58138; }
  24% { -webkit-transform: matrix(0.99095, 0, 0, 0.99095, 0, 43.66342); opacity: 0.54739; }
  28% { -webkit-transform: matrix(0.99049, 0, 0, 0.99049, 0, 43.33951); opacity: 0.52425; }
  32% { -webkit-transform: matrix(0.99019, 0, 0, 0.99019, 0, 43.1325); opacity: 0.50946; }
  36% { -webkit-transform: matrix(0.99002, 0, 0, 0.99002, 0, 43.01034); opacity: 0.50074; }
  40% { -webkit-transform: matrix(0.98992, 0, 0, 0.98992, 0, 42.94639); opacity: 0.49617; }
  44% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92001); opacity: 0.49429; }
  48% { -webkit-transform: matrix(0.98988, 0, 0, 0.98988, 0, 42.91606); opacity: 0.494; }
  52% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92411); opacity: 0.49458; }
  56% { -webkit-transform: matrix(0.98991, 0, 0, 0.98991, 0, 42.93736); opacity: 0.49553; }
  60% { -webkit-transform: matrix(0.98993, 0, 0, 0.98993, 0, 42.95167); opacity: 0.49655; }
  64% { -webkit-transform: matrix(0.98995, 0, 0, 0.98995, 0, 42.96482); opacity: 0.49749; }
  68% { -webkit-transform: matrix(0.98997, 0, 0, 0.98997, 0, 42.97579); opacity: 0.49827; }
  72% { -webkit-transform: matrix(0.98998, 0, 0, 0.98998, 0, 42.98433); opacity: 0.49888; }
  76% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99059); opacity: 0.49933; }
  80% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99494); opacity: 0.49964; }
  84% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.99777); opacity: 0.49984; }
  88% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.9995); opacity: 0.49996; }
  92% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00044); opacity: 0.50003; }
  96% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00088); opacity: 0.50006; }
  100% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43); opacity: 0.5; } }
.bbm-modal--stacked { -webkit-animation-duration: 0.43333s; -webkit-animation-name: bbm-stacked; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

/* destroy a stacked modal */
@-webkit-keyframes bbm-stacked-reverse { 0% { -webkit-transform: matrix(0.99123, 0, 0, 0.99123, 0, 43.86266); opacity: 0.56162; }
  4% { -webkit-transform: matrix(0.99293, 0, 0, 0.99293, 0, 45.05306); opacity: 0.64665; }
  8% { -webkit-transform: matrix(0.99465, 0, 0, 0.99465, 0, 46.25785); opacity: 0.7327; }
  12% { -webkit-transform: matrix(0.99618, 0, 0, 0.99618, 0, 47.32543); opacity: 0.80896; }
  16% { -webkit-transform: matrix(0.99742, 0, 0, 0.99742, 0, 48.19443); opacity: 0.87103; }
  20% { -webkit-transform: matrix(0.99837, 0, 0, 0.99837, 0, 48.8572); opacity: 0.91837; }
  24% { -webkit-transform: matrix(0.99905, 0, 0, 0.99905, 0, 49.33456); opacity: 0.95247; }
  28% { -webkit-transform: matrix(0.99951, 0, 0, 0.99951, 0, 49.65946); opacity: 0.97568; }
  32% { -webkit-transform: matrix(0.99981, 0, 0, 0.99981, 0, 49.8671); opacity: 0.99051; }
  36% { -webkit-transform: matrix(0.99999, 0, 0, 0.99999, 0, 49.98963); opacity: 0.99926; }
  40% { -webkit-transform: matrix(1.00008, 0, 0, 1.00008, 0, 50.05377); opacity: 1.00384; }
  44% { -webkit-transform: matrix(1.00012, 0, 0, 1.00012, 0, 50.08024); opacity: 1.00573; }
  48% { -webkit-transform: matrix(1.00012, 0, 0, 1.00012, 0, 50.08419); opacity: 1.00601; }
  52% { -webkit-transform: matrix(1.00011, 0, 0, 1.00011, 0, 50.07612); opacity: 1.00544; }
  56% { -webkit-transform: matrix(1.00009, 0, 0, 1.00009, 0, 50.06284); opacity: 1.00449; }
  60% { -webkit-transform: matrix(1.00007, 0, 0, 1.00007, 0, 50.04848); opacity: 1.00346; }
  64% { -webkit-transform: matrix(1.00005, 0, 0, 1.00005, 0, 50.03529); opacity: 1.00252; }
  68% { -webkit-transform: matrix(1.00004, 0, 0, 1.00004, 0, 50.02428); opacity: 1.00173; }
  72% { -webkit-transform: matrix(1.00002, 0, 0, 1.00002, 0, 50.01572); opacity: 1.00112; }
  76% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00944); opacity: 1.00067; }
  80% { -webkit-transform: matrix(1.00001, 0, 0, 1.00001, 0, 50.00508); opacity: 1.00036; }
  84% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.00223); opacity: 1.00016; }
  88% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50.0005); opacity: 1.00004; }
  92% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99956); opacity: 0.99997; }
  96% { -webkit-transform: matrix(1, 0, 0, 1, 0, 49.99912); opacity: 0.99994; }
  100% { -webkit-transform: matrix(1, 0, 0, 1, 0, 50); opacity: 1; } }
.bbm-modal--stacked-reverse { -webkit-animation-duration: 0.43333s; -webkit-animation-name: bbm-stacked-reverse; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

/* destroy a modal */
@-webkit-keyframes bbm-destroy { 0% { -webkit-transform: matrix(0.99874, 0, 0, 0.99874, 0, 49.1187); opacity: 0.8741; }
  4% { -webkit-transform: matrix(0.99705, 0, 0, 0.99705, 0, 47.93192); opacity: 0.70456; }
  8% { -webkit-transform: matrix(0.99533, 0, 0, 0.99533, 0, 46.73078); opacity: 0.53297; }
  12% { -webkit-transform: matrix(0.99381, 0, 0, 0.99381, 0, 45.66645); opacity: 0.38092; }
  16% { -webkit-transform: matrix(0.99257, 0, 0, 0.99257, 0, 44.80009); opacity: 0.25716; }
  20% { -webkit-transform: matrix(0.99163, 0, 0, 0.99163, 0, 44.13933); opacity: 0.16276; }
  24% { -webkit-transform: matrix(0.99095, 0, 0, 0.99095, 0, 43.66342); opacity: 0.09477; }
  28% { -webkit-transform: matrix(0.99049, 0, 0, 0.99049, 0, 43.33951); opacity: 0.0485; }
  32% { -webkit-transform: matrix(0.99019, 0, 0, 0.99019, 0, 43.1325); opacity: 0.01893; }
  36% { -webkit-transform: matrix(0.99002, 0, 0, 0.99002, 0, 43.01034); opacity: 0.00148; }
  40% { -webkit-transform: matrix(0.98992, 0, 0, 0.98992, 0, 42.94639); opacity: -0.00766; }
  44% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92001); opacity: -0.01143; }
  48% { -webkit-transform: matrix(0.98988, 0, 0, 0.98988, 0, 42.91606); opacity: -0.01199; }
  52% { -webkit-transform: matrix(0.98989, 0, 0, 0.98989, 0, 42.92411); opacity: -0.01084; }
  56% { -webkit-transform: matrix(0.98991, 0, 0, 0.98991, 0, 42.93736); opacity: -0.00895; }
  60% { -webkit-transform: matrix(0.98993, 0, 0, 0.98993, 0, 42.95167); opacity: -0.0069; }
  64% { -webkit-transform: matrix(0.98995, 0, 0, 0.98995, 0, 42.96482); opacity: -0.00503; }
  68% { -webkit-transform: matrix(0.98997, 0, 0, 0.98997, 0, 42.97579); opacity: -0.00346; }
  72% { -webkit-transform: matrix(0.98998, 0, 0, 0.98998, 0, 42.98433); opacity: -0.00224; }
  76% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99059); opacity: -0.00134; }
  80% { -webkit-transform: matrix(0.98999, 0, 0, 0.98999, 0, 42.99494); opacity: -0.00072; }
  84% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.99777); opacity: -0.00032; }
  88% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 42.9995); opacity: -7e -5; }
  92% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00044); opacity: 6.0 e-05; }
  96% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43.00088); opacity: 0.00012; }
  100% { -webkit-transform: matrix(0.99, 0, 0, 0.99, 0, 43); opacity: 0; } }
.bbm-modal--destroy { -webkit-animation-duration: 0.43333s; -webkit-animation-name: bbm-destroy; -webkit-animation-timing-function: linear; -webkit-animation-fill-mode: both; -webkit-transform-origin: 50% 50%; -webkit-backface-visibility: hidden; }

.admin-quicklinks { list-style: none; z-index: 150; position: fixed; bottom: 10px; right: 10px; height: 45px; width: 47px; margin: 0; padding: 5px; border: 2px solid #cb272c; border-radius: 5px; background: #fff; font-size: 12px; text-align: right; box-sizing: content-box; transition: height 200ms ease-out, width 200ms ease-out, padding 200ms ease-out; }
.admin-quicklinks .hb-bundle { position: fixed; color: #cb272c; right: 16px; font-size: 45px; }
.admin-quicklinks:hover { height: auto; width: auto; padding: 10px; }
.admin-quicklinks:hover .hb-bundle { display: none; }
.admin-quicklinks:hover .menu-item { display: block; width: auto; }
.admin-quicklinks .menu-item { display: none; width: 0; padding: 5px 0; }
.admin-quicklinks .quicklink { color: #000; text-decoration: none; }

.admin-tiny-link { position: relative; overflow: visible; font-size: 12px; color: white !important; z-index: 100; text-decoration: none; }
.admin-tiny-link i { position: absolute; left: -10px; top: -10px; text-shadow: 0 2px 3px rgba(0, 0, 0, 0.6); transform: scale(1); transform-origin: center; transition: text-shadow .3s ease, transform .3s ease; }
.admin-tiny-link i:hover { text-shadow: 0 3px 5px rgba(0, 0, 0, 0.4); transform: scale(2); }
.admin-tiny-link.disabled { display: none; }

.early-unlocks-box-art-display { display: flex; justify-content: center; background-image: url("//humblebundle-a.akamaihd.net/static/hashed/c4e776a095b10a28a80f4130cf67f34df6987047.png"); background-size: contain; background-position: center center; background-repeat: no-repeat; height: 346px; }
.early-unlocks-box-art-display.nocrates { background-image: none; }
.early-unlocks-box-art-display.multiple { background-image: url("//humblebundle-a.akamaihd.net/static/hashed/14be0a5788d217ac41af9afa55c3ffdff9c23de3.png"); }
.early-unlocks-box-art-display.margin-bottom { margin-bottom: 50px; }

.early-unlock-box-art { padding-top: 96px; }

.early-unlock-showcase { background-color: #3B3E48; background-position: center; background-repeat: no-repeat; background-size: 100% 100%; margin-top: -56px; padding: 56px 0 50px; }

.early-unlock-info { width: 800px; text-align: center; margin: auto; }
.early-unlock-info .humble-monthly-10-note span { font-size: 16pt; font-weight: bold; position: relative; top: -16px; margin-left: 16px; }
.early-unlock-info .humble-monthly-10-note span a { color: white; text-decoration: none; }

.early-unlock-game-text { font-size: 12pt; line-height: 18pt; width: 580px; margin: auto; margin-bottom: 30px; }

.early-unlocks-box-art-display .early-unlock-box-art-wrapper { position: relative; /** Modified from https://jsfiddle.net/josedvq/3HG6d/ **/ }
.early-unlocks-box-art-display .early-unlock-box-art-wrapper .early-unlock-box-art-msrp-wrapper { position: absolute; bottom: 180px; left: -9px; }
.early-unlocks-box-art-display .early-unlock-box-art-wrapper .early-unlock-box-art-msrp-wrapper .early-unlock-box-art-msrp-display { background-color: #00a0e8; padding: 10px; font-size: 16px; font-weight: bold; color: white; text-align: center; }
.early-unlocks-box-art-display .early-unlock-box-art-wrapper .box-art-msrp-triangle { width: 0; height: 0; border-top: 10px solid #1d508b; border-left: 20px solid transparent; }

.humble-monthly .header-timer { margin-bottom: 25px; }
.humble-monthly article section.header-box-art-display { margin-top: 50px; }
.humble-monthly article section.header-box-art-display .inner-early-unlock-wrapper { display: flex; height: 100%; margin: 0 auto; position: relative; max-width: 800px; width: 100%; }
.humble-monthly article section.header-box-art-display .inner-early-unlock-wrapper .box-art-wrapper { display: flex; justify-content: center; height: inherit; margin: 0 auto; }
.humble-monthly article section.header-box-art-display .inner-early-unlock-wrapper .box-art-wrapper .box-art { height: 100%; max-height: 470px; margin-left: 1em; }
.humble-monthly article section.header-box-art-display .inner-early-unlock-wrapper .box-art-wrapper .box-art:first-of-type { margin-left: 0; }
.humble-monthly article section.header-box-art-display .inner-early-unlock-wrapper .timer-wrapper .subscribe { display: inline-block; position: relative; text-align: center; top: -160px; }
.humble-monthly article section.header-box-art-display .inner-early-unlock-wrapper .timer-wrapper .subscribe .button.subscribed { margin-top: 25%; }
.humble-monthly article section.header-box-art-display .inner-early-unlock-wrapper .box-art-msrp-text { background-color: #FF8F59; bottom: 4em; box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5); left: 50%; padding: .5em 1em; position: absolute; text-align: center; transform: translateX(-50%); z-index: 10; }
.humble-monthly article section.header-box-art-display .inner-early-unlock-wrapper .box-art-msrp-text .base-price { display: block; font-size: 1.3em; font-weight: bold; }
.humble-monthly article section.header-box-art-display .inner-early-unlock-wrapper .box-art-msrp-text .msrp-text { opacity: .8; text-decoration: line-through; }
.humble-monthly.mobile .header-timer { margin-bottom: 25px; text-align: center; }
.humble-monthly.mobile article section.header-box-art-display .inner-early-unlock-wrapper { flex-direction: column; height: 205px; }
.humble-monthly.mobile article section.header-box-art-display .inner-early-unlock-wrapper .box-art-wrapper { height: 100%; order: 2; position: static; width: 100%; }
.humble-monthly.mobile article section.header-box-art-display .inner-early-unlock-wrapper .box-art-wrapper .box-art { display: block; height: auto; left: auto; max-height: 100%; top: 3.5em; z-index: 3; }

.pagination { margin: 10px 0; white-space: nowrap; text-align: left; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
.pagination .jump-to-page { cursor: pointer; display: inline-block; padding: 5px 10px; border-radius: 3px; background: #484f5c; }

.charity-selection { height: 523px; }
.charity-selection .cyoc-spinner-dark { display: inline-block; }
.charity-selection .cyoc-spinner-light { display: none; }
.charity-selection h1, .charity-selection h2, .charity-selection h3, .charity-selection p, .charity-selection a { color: #eeeeee; }
.charity-selection h2 { font-size: 18px; font-weight: bold; }
.charity-selection .charity-results .charity-preview { padding-left: 0; width: 117px; text-align: center; }
.charity-selection .charity-results .charity-preview .charity-img { width: 64px; height: 64px; position: relative; margin: auto; }
.charity-selection .charity-results .charity-preview .charity-name { position: relative; width: 124px; text-align: center; padding-bottom: 0; margin-top: 4px; }
.charity-selection .charity-results .charity-preview .charity-name .see-details { cursor: pointer; }
.charity-selection .charity-results .charity-preview .charity-name h4 { width: 124px; font-size: 14px; margin-top: 10px; }
.charity-selection .charity-results .charity-preview .select-charity { background: #A1A7B2; color: white; margin: auto; position: relative; left: -4px; }
.charity-selection .pagination .jump-to-page { background: #393D49; }
.charity-selection .pagination .jump-to-page:hover, .charity-selection .pagination .jump-to-page.current { background: #1E2127; }

.order-form .show-charity-selector { text-decoration: underline; cursor: pointer; }
.order-form .custom-values-inner { overflow: visible; }
.order-form .custom-values-inner .subsplit-wrapper { overflow: visible; }
.order-form .partnership-line { display: none; }
.order-form .subsplit-wrapper .cyoc-wrapper { left: 0px; }
.order-form .subsplit-wrapper .cyoc-wrapper .top-arrow { left: 250px; }
.order-form .cyoc-wrapper { float: left; background: #E4E7ED; height: 354px; display: none; position: relative; width: 897px; left: -114px; padding: 20px; border-top: 1px solid #A6A9B2; border-bottom: 1px solid #A6A9B2; margin-bottom: 10px; }
.order-form .cyoc-wrapper .top-arrow { position: relative; top: -31px; left: 180px; margin-left: -12px; -webkit-backface-visibility: hidden; background-position: center; width: 23px; height: 11px; background-image: url("//humblebundle-a.akamaihd.net/static/hashed/189096a19ea989ec5b84f8edd0e9efa61bb4c476.png"); background-image: -webkit-image-set(url("//humblebundle-a.akamaihd.net/static/hashed/189096a19ea989ec5b84f8edd0e9efa61bb4c476.png") 1x, url("//humblebundle-a.akamaihd.net/static/hashed/bbe05e5bac2f08dabc6100b32ca67f32c34e044d.png") 2x); }
.order-form .cyoc-wrapper h1, .order-form .cyoc-wrapper h2, .order-form .cyoc-wrapper h3, .order-form .cyoc-wrapper p, .order-form .cyoc-wrapper a { color: #494f5c; }
.order-form .cyoc-wrapper .charity-search label.query { width: 280px; }
.order-form .cyoc-wrapper .cyoc-spinner-dark { display: none; }
.order-form .cyoc-wrapper .cyoc-spinner-light { display: inline-block; }
.order-form .cyoc-wrapper .pagination { color: black; }
.order-form .cyoc-wrapper .pagination .jump-to-page { background: #CBD0DA; }
.order-form .cyoc-wrapper .pagination .jump-to-page:hover, .order-form .cyoc-wrapper .pagination .jump-to-page.current { background: #a1a5ad; }
.order-form .splits-holder > .cyoc-wrapper { left: -64px; }

.cyoc-selector-slide { display: none; }

.slideout-expandable { background: #33373e; color: #eeeeee; border-top: 1px solid #24282f; border-bottom: 1px solid #24282f; position: relative; padding: 30px 0; -webkit-backface-visibility: hidden; }
.slideout-expandable .selected-game-arrow.top-arrow { top: -35px; left: 50%; opacity: 1; }

.slideout-expandable .overflow-wrapper { overflow: hidden; }

.charity-img { flex-shrink: 0; }

.charity-img { width: 100px; height: 100px; display: inline-block; background-repeat: no-repeat; background-size: contain; background-position: center center; border-radius: 3px; overflow: hidden; }

.charity-popup { position: fixed; max-width: 750px; width: 100%; background-color: white; border-radius: 3px; padding: 20px; padding-bottom: 30px; z-index: 1000; top: 50%; left: 50%; transform: translate(-50%, -50%); max-height: 100%; overflow-y: scroll; }
.charity-popup .charity-info-wrapper { padding: 20px; }
.charity-popup a { color: #17a1e5; font-weight: bold; }
.charity-popup .charity-logo { max-width: 100%; max-height: 150px; }
.charity-popup h2 { font-weight: normal; }
.charity-popup p { margin: 0; font-size: 15px; line-height: 1.5; }
.charity-popup .charity-title { font-size: 16px; }
.charity-popup .charity-description { margin-top: 10px; font-size: 15px; line-height: 1.5; padding-bottom: 15px; }
.charity-popup .close-button-holder { height: 0; position: relative; overflow: visible; }
.charity-popup .close-button-holder .close-button { position: absolute; right: -10px; top: -10px; cursor: pointer; }

html { box-sizing: border-box; }

*, *::after, *::before { box-sizing: inherit; }

body { background: #333; min-width: 880px; -webkit-font-smoothing: antialiased; }

#dlheader { position: relative; margin: 0 auto 20px auto; min-width: 880px; }

#logo { margin: 30px auto 0 auto; position: static; }

#logo img { display: block; margin: 20px auto; max-width: 640px; }

/* page content */
.unlock-time { color: #7B818C; font-size: 16px; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-weight: 500; margin: 0 auto 8px; text-align: center; }

#papers-top, #papers-bottom { background: url("//humblebundle-a.akamaihd.net/static/hashed/4396bdf4831e7f1368dcdb5a8ec237f1b42bdbc2.png") no-repeat; }

#papers-top { position: absolute; top: 0; left: 0; height: 280px; width: 831px; }

#papers-bottom { position: absolute; bottom: 0; left: 0; height: 22px; width: 831px; background-position: 0 bottom; }

#papers-mid { position: absolute; top: 280px; bottom: 22px; left: 0; width: 831px; background: url("//humblebundle-a.akamaihd.net/static/hashed/277729198acf769d0141fb22563b3b2b3709c9fb.png") repeat-y; }

#papers-content { position: relative; width: 762px; margin: 0 auto; padding: 30px 0; min-height: 290px; }

#download-page-wrapper { width: 831px; margin: 0 auto 24px auto; }

#main { position: relative; color: #4c4c4c; box-sizing: content-box; }

.order-adder-whitebox { font-weight: normal; }

/* spiel */
#spiel { /* Workaround for Android browser's bizarre "auto-fit pages" default setting https://code.google.com/p/android/issues/detail?id=40186 */ background: url(data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==) no-repeat; }

.download-social-alignment { display: flex; flex-direction: center; align-items: center; width: 100%; }

#videopaperclip { left: -57px !important; }

/* staples */
.staple { position: absolute; background: url("//humblebundle-a.akamaihd.net/static/hashed/48b8b5e63decea9ee3f0403b55f2206f264bea77.png") no-repeat; width: 61px; height: 24px; }

.s1 { left: 14px; top: 10px; }

.staple.s2 { top: 12px; background-image: url("//humblebundle-a.akamaihd.net/static/hashed/0507bcfe93848a8f0e6510f07d37d2f9c94141a3.png"); width: 62px; height: 22px; right: 13px; }

.staple.s3 { top: 11px; background-image: url("//humblebundle-a.akamaihd.net/static/hashed/b25714fd7197b111813e2ce2e3cca830cfb13305.png"); width: 62px; height: 22px; left: 13px; }

.staple.s4 { top: 11px; background-image: url("//humblebundle-a.akamaihd.net/static/hashed/0b68f713d61d04eb6a28677999d576d63a2d695f.png"); width: 64px; height: 18px; right: 12px; }

#payment-amount img { margin-bottom: -5px; }

.instruction-expand { color: #5D801A !important; text-align: center; display: block; }

.instructions { display: none; }

.steaminfo { font-size: 16px; cursor: pointer; }

.key-expander .nosteam { font-weight: normal; width: 70%; margin: 0 auto; padding: 1em 0; }

.descitem a.steaminfo { text-decoration: none; }

.youtubeCentered { margin: auto; width: 580px; }

.shrinksizer.instructionsteps { padding: 16px 20px; }

.magic-or { padding-left: 230px; }

#ubuntuinstructions { padding-top: 20px; text-align: center; }

#ubuntuinstructions h2 { padding-bottom: 10px; }

#share-box { text-align: center; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.75); line-height: 21px; font-size: 14px; }

.ebookinstructions { display: block; font-weight: normal; }

.ebookinstructions .open-in-external-window { color: #5d801a; display: block; font-size: 16px; font-weight: bold; text-align: center; }

.ebookinstructions .slide-down-trigger { font-weight: bold; }

.ebookinstructions .slide-down { font-size: 13px; line-height: 170%; }

.ebookinstructions .steptext { padding-top: 6px; }

.ebookinstructions h2 { font-size: 20px; font-weight: bold; margin-bottom: 1em; }

.ebookinstructions h3 { font-size: 120%; font-weight: bold; margin-top: 0; padding-top: 0; }

.ebookinstructions .pre-box { font-size: 130%; text-align: center; }

.ebookinstructions .sms-form { width: 400px; }

#send-email-message { color: #468847; padding-left: 2px; }

#send-email-message.error { color: #b94a48; }

#ebook-email-form { position: relative; }

#email-kindle { width: 128px; }

#send-email { top: 10px; right: 10px; }

#ebook-email-form .email-details { font-size: 10px; margin-bottom: 0; line-height: 14px; }

#download-page-wrapper a, #download-page-wrapper a:visited { color: #5d801a; }

.whitecontent a { font-weight: bold; }

.small .flexbtn { min-width: 50px; }

.small .dldetails { width: 60px; }

#download-page-wrapper .order-form { border: 1px solid #b5b8bf; }
#download-page-wrapper .order-form a { color: inherit; }

.media-object { display: block; }
.media-object::after { clear: both; content: ""; display: table; }
.media-object .avatar { float: left; margin-right: 10px; }
.media-object .details { float: left; }

.credit { padding: 30px; }
.credit p { margin: 0; }
.credit p + p { margin-top: 1.2em; }
.credit .credit-expiry { font-style: italic; }

.coupon .column { box-sizing: border-box; }
.coupon .coupon-info, .coupon .redeem-product { padding: 0 90px; }
.coupon .coupon-info { display: flex; justify-content: space-between; align-items: center; line-height: 1.35; }
.coupon .coupon-info .coupon-name { font-size: 16px; font-weight: bold; max-width: 438px; }
.coupon .coupon-info .coupon-name .admin-tiny-link i { position: relative; }
.coupon .coupon-info .coupon-icon { max-width: 32px; max-height: 32px; margin-top: 5px; }
.coupon .coupon-info .coupon-terms { color: inherit !important; }
.coupon .coupon-info .expired { color: #d0021b; }
.coupon .coupon-info .discount-price { box-sizing: border-box; border-radius: 3px; padding: 5px 10px; display: inline-block; border: 1px solid #d0021b; font-weight: bold; font-size: 12px; color: #d0021b; margin-left: 10px; }
.coupon .coupon-info .discount-amount { color: #d0021b; }
.coupon .redeem-product { margin-top: 20px; padding-top: 10px; margin-bottom: -10px; border-top: 1px solid #e4e7ed; text-align: right; font-weight: bold; }
.coupon .platforms { margin: 0 20px 0 0; text-align: left; display: inline-block; }
.coupon .platforms li > i { color: inherit; display: inline-block; margin-left: 5px; }
.coupon .platforms .platform-info { top: 35px; border: 1px solid #e4e7ed; box-shadow: 0 1px 1px #e4e7ed; }

#monthly-coupon h3, #trove-promo h3 { font-size: 1.3em; margin: 0; }
#monthly-coupon p, #trove-promo p { font-size: 1.1em; font-weight: 300; margin: .3em 0 0; }
#monthly-coupon .button-container, #trove-promo .button-container { padding-top: 20px; }
#monthly-coupon .button-container a, #trove-promo .button-container a { white-space: nowrap; }
#monthly-coupon .image-wrapper, #trove-promo .image-wrapper { flex-basis: 70px; flex-shrink: 0; padding-right: 20px; text-align: right; }
#monthly-coupon .coupon-details, #monthly-coupon .trove-details, #trove-promo .coupon-details, #trove-promo .trove-details { flex-basis: 100%; flex-shrink: 1; }

#monthly-coupon.wrapper { display: flex; flex-direction: row; justify-content: space-around; }
#monthly-coupon .hb-bundle { color: #cb272c; font-size: 60px; }
#monthly-coupon .coupon-details .coupon-info-link { color: #757b86; display: inline-block; margin: 5px 0; }
#monthly-coupon .coupon-details .tooltip-right { color: #3b3e48 !important; }
#monthly-coupon .coupon-details .tooltip-right:before { border-right-color: #333; top: 5px; }
#monthly-coupon .coupon-details .tooltip-right:after { background-color: #333; color: #fff; }
#monthly-coupon .centered { text-align: center; }
#monthly-coupon .store-logo { margin-bottom: .2em; width: 200px; }
#monthly-coupon .button { color: white !important; }

#trove-promo.wrapper { display: flex; justify-content: space-around; }
#trove-promo .trove-logo { height: 60px; }
#trove-promo .trove-details { padding-top: 10px; }

/* Additional order adder styling */
.order-form .splits-holder > .cyoc-wrapper { left: -72px; width: 680px; overflow-y: scroll; }

.order-form .subsplit-wrapper .cyoc-wrapper { left: -62px; width: 680px; overflow-y: scroll; }

.charity-selection .charity-results .charity-name h4 { overflow-y: hidden; }

/* We don't want this functionality on the order adder */
.js-remove-charity { display: none; }
  
  
  .green-button { background-image: linear-gradient(to bottom, #e0ffc2 0%, #b1e37f 100%); border: 1px solid #a7c28c; border-radius: 4px; box-shadow: inset 0 1px 0 0 rgba(255, 255, 255, 0.5), 0 1px 0 0 white; color: #42661e; cursor: pointer; display: inline-block; font-weight: bold; margin: 0 0 0 5px; min-width: 50px; padding: 5px 8px 5px 8px; text-align: center; text-shadow: 0 1px rgba(255, 255, 255, 0.6); }
.green-button:hover:not(disabled) { background: #b1e37f; }
.green-button:disabled, .green-button.disabled { cursor: default; opacity: 0.4; }

.gray-button { background-image: linear-gradient(to bottom, #f5f5f5 0%, #dedede 100%); border: 1px solid #bbb; border-radius: 4px; box-shadow: inset 0 1px 0 0 rgba(255, 255, 255, 0.5), 0 1px 0 0 white; color: #444; cursor: pointer; display: inline-block; font-weight: bold; margin: 0 0 0 5px; min-width: 50px; padding: 5px 8px 5px 8px; text-align: center; text-shadow: 0 1px rgba(255, 255, 255, 0.6); }

a:hover .gray-button { background: #e4e4e4; }

.button-link { cursor: pointer; text-decoration: none; }
.button-link:disabled, .button-link.disabled { pointer-events: none; }

input[type="number"].classy-input, input[type="password"].classy-input, input[type="tel"].classy-input, input[type="text"].classy-input { border: 1px solid #ccc; box-shadow: inset 0 1px 0 #eee,#fff 0 1px 0; margin: 0; padding: 7px; border-radius: 3px; background-color: white; color: #999; }

.classy-input[disabled='disabled'] { background: #ccc; color: #333; }

.info-tooltip > i { font-size: .8em; opacity: 0.7; transition: all 0.1s linear; }
.info-tooltip:hover > i, .info-tooltip:focus > i { opacity: 1; }
  #settings .indicator {
  background: url(https://humblebundle-a.akamaihd.net/static/hashed/e73d51c16b07d083026843ceda9c22056b9d04a2.gif) no-repeat;
  display: none;
  padding: 0 0 0 0;
  margin-left: 10px;
  top: 3px;
}

#settings .indicator.on {
  display: inline-block;
}
#settings input[type=submit] {
  margin-top: 5px;
}
#settings .submitholder {
  height: 30px;
  margin-left: 330px;
  position: relative;
}
#settings .account-claimbutton,
#settings .account-claimbutton-signedout {
  padding: 0 0 0 33px;
  line-height: 28px;
}
#settings .account-claimbutton div,
#settings .account-claimbutton-signedout div {
  padding: 0;
}

#change-email {
  position: absolute;
  left: 16px;
  bottom: 26px;
  color: #666;
  font-size: 10px;
}
#change-email-form{
  width:280px;
  position:absolute;
  bottom:-10px;
  left:-40px;
  background:white;
  border-radius:5px;
  padding:6px 6px 6px 16px;
  border:black solid 1px;
  z-index:200;
  box-shadow: 2px 2px 5px 1px rgba(0,0,0,0.5);
  display:none;
}
#change-email-form .alignlabel{
  text-align: right;
  width:132px;
  float:left;
  padding-top:3px;
}
#change-email-form .cebuttons {
  text-align:center;
  padding-top:4px;
}
  /* tabbed-key-redeem.css */
.expandkeys-new {
  display:block;
  overflow:hidden;
  text-align:center;
  margin-bottom:8px;
  color:#5d801a !important;
  font-size:16px;
}
.keytab {
  display: none;
}

.keytabs {
  padding: 8px 0 7px 0;
  margin: -48px 0 28px -10px;
  text-align: left;
  width: 720px;
  line-height: 15px;
}

.keytabs a {
  text-decoration: none;
  color: #666;
  margin: 0;
}

.keytabs li.activekeytab a {
  color: #333;
}

.keytabs li {
  display: inline;
  list-decoration: none;
  margin: 0 -1px 0 0;
  padding: 9px 20px 5px 20px;
  border: 1px solid #aaa;
  border-radius: 5px 5px 0 0;
  -moz-border-radius: 5px 5px 0 0;
  -webkit-border-radius: 5px 5px 0 0;
  -ms-border-radius: 5px 5px 0 0;
  -o-border-radius: 5px 5px 0 0;
  background: #eee;
  font-weight: bold;
}

.keytabs li.activekeytab {
  background: white;
  border-bottom: 1px solid white;
}

#keystation {
  margin-top: 40px;
}

.shrinksizer-new {
  display:none;
  overflow: hidden;
}

.redeeminstructions {
  margin-bottom: 1em;
}

.instructions_html, .instructions_html a{
  color: #5D801A;
}
.urlredeemlink {
  text-align: center;
  margin: auto;
  width:200px;
}

/* Custom styling for store keys */
.overgrowthspf_link {
  color: #5D801A;
  font-size: 15px;
}
.overgrowthspf_instruct {
  padding-top: 10px;
}
  /* stats.css */
.stats-box {
  line-height: 24px;
  position: relative;
  font-weight: normal;
  font-size: 12px;
}

.stats-box h4 {
  font-size: 18px;
  font-weight: normal;
  margin: 0 0 14px 0;
}

.stats-box dd {
  margin-top: -23px;
  text-align: right;
  height: 23px;
}

.stats-pre-columns {
  width: 33.33333%;
  margin-bottom: 2em;
}

.stats-group-pre-columns {
  display: inline-block;
  width: 100%;
}

.stats-col-1-of-3,
.stats-col-2-of-3,
.stats-col-3-of-3 {
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  width: 33.33333%;
  float: left;
  position: relative;
}

.stats-col-1-of-3 {
  padding-right: 20px;
}

.stats-col-2-of-3 {
  padding-right: 10px;
  padding-left: 10px;
}

.stats-col-3-of-3 {
  padding-left: 20px;
}

.stats-box:after {
  content: '';
  display: block;
  clear: both;
}

.stats-info, .pubnub-promo {
  color: #ccc;
  font-style: italic;
  font-size: 10px;
  line-height: 12px;
  margin: 0;
}

.stats-info {
  margin-top: 14px;
  cursor: help;
}

.pubnub-promo {
  margin-top: -12px;
  text-align: right;
}

.piechart {
  margin: -4px -11px;
}

.chartcolor {
  display: inline-block;
  height: 12px;
  margin-right: 4px;
  width: 12px;
}

.chartlegend {
  position: absolute;
  top: 78px;
  left: 180px;
  margin: 0;
  padding: 0;
  list-style: none;
  white-space: nowrap;
}

.stats-box .contributor-list {
  line-height: 19px;
  margin: 0 0 0 -8px;
}
.stats-box .contributor-list dd {
  margin-top: -19px;
  height: 19px;
}

.stats-box .contributor-list dt {
  position: relative;
}

.contributor-list .number {
  width: 20px;
  text-align: right;
  display: block;
}

.contributor-list .contributor-name {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 28px;
  right: 70px;
  display: block;
}

.contributor-list a,
.contributor-list a:visited {
  color: #0072e6;
  font-weight: bold;
  text-decoration: none;
}

/* single platform version with no pie chart */
.stats-box .contributor-list.short {
  line-height: 24px;
  margin-left: -8px;
}
.stats-box .contributor-list.short dd {
  margin-top: -24px;
}
.stats-box .contributor-list.noheading {
  margin-top: 38px;
}
  /** Styles for the SteamRedeemer module, used to display a user's Steam keys on an order's associated download page. */
.sr-widget .sr-widget-header { margin-bottom: 13px; }
.sr-widget .sr-widget-content { width: 70%; margin: auto; }

.sr-user .sr-user-button { display: flex; align-items: center; float: right; padding: 2px 14px; border-radius: 3px; background-color: #ededed; background: linear-gradient(to top, #e6e6e6, #f4f4f4); border: 1px solid #d8d8d8; cursor: pointer; }
.sr-user .sr-user-button.sr-linked { cursor: default; }
.sr-user .sr-user-button .sr-user-button-icon { margin: 0 5px; }
.sr-user .sr-user-button .sr-user-button-text { font-weight: normal; }

.sr-key .custom-instruction { margin-top: 10px; }
.sr-key .sr-key-heading { font-size: 17px; }
.sr-key .sr-key-heading .sr-key-heading-alert { position: relative; display: inline-block; color: #17A1E5; }
.sr-key .sr-key-heading .sr-key-heading-alert .sr-key-heading-alert-help-text { width: 150px; font-size: 13px; position: absolute; top: 3px; left: 20px; }
.sr-key .sr-key-heading .admin-tiny-link i { position: relative; }
.sr-key .sr-key-content-region { margin: 8px 0 23px; }

.sr-unredeemed { display: flex; justify-content: space-between; }
.sr-unredeemed .sr-unredeemed-button { display: flex; align-items: center; justify-content: center; border: 1px solid #808080; border-radius: 3px; width: 48%; background-color: #c5c5c5; background: linear-gradient(to top, #cacaca, #e7e7e7); font-weight: normal; font-size: 14px; height: 31px; box-sizing: initial; cursor: pointer; }
.sr-unredeemed .sr-unredeemed-button .sr-unredeemed-button-steam-icon { margin-right: 8px; }
.sr-unredeemed .sr-unredeemed-button .sr-unredeemed-button-gift-icon { font-size: 19px; margin-right: 7px; margin-top: 2px; }
.sr-unredeemed .sr-unredeemed-button .sr-unredeemed-button-gift-text { margin-top: 3px; }
.sr-unredeemed .sr-unredeemed-button.sr-inactive { background-color: #F3F3F3; background: linear-gradient(to top, #E8E8E8, #F6F6F6); }
.sr-unredeemed .sr-unredeemed-button.sr-inactive > * { opacity: .37; }

.sr-redeemed .sr-redeemed-bubble { width: 100%; background-color: #F7F7F7; height: 34px; line-height: 34px; border-radius: 4px; border: 1px solid #808080; text-align: center; margin-bottom: 11px; }

.redeem-instructions { font-size: 14px; font-weight: normal; text-align: center; }

.recommend-this-game { font-size: 14px; font-weight: normal; padding: 6px 0 10px; text-align: center; }
.recommend-this-game .sr-redeem-button { border: 1px solid transparent; border-radius: 15px; color: white !important; cursor: pointer; display: inline-block; font-size: 12px; padding: 4px 10px; text-decoration: none; }
.recommend-this-game .sr-redeem-button.yes-button { background-color: darkgreen; }
.recommend-this-game .sr-redeem-button.no-button { background-color: red; }
.recommend-this-game .tooltip-right:after { border: 1px solid rgba(40, 44, 52, 0.25); box-shadow: none; }

.game-recommended { display: none; font-size: 14px; font-weight: normal; padding-top: 6px; text-align: center; }

.sr-footer { text-align: center; font-weight: normal; border-top: 1px solid #D3D3D3; padding-top: 7px; }
.sr-footer > * { margin: 10px 0; }
.sr-footer .sr-footer-button { color: white !important; }
.sr-footer .sr-footer-partial-gift-cta { margin-bottom: 28px; }
.sr-footer .sr-footer-partial-gift-cta p { margin: 10px 0; }

.sr-warning-modal .sr-warning-modal-content { margin: 4px 0 5px 0; }
.sr-warning-modal .sr-warning-modal-content .sr-warning-modal-content-text { color: black; padding-bottom: 5px; margin: 0; font-size: 16px; font-weight: normal; }
.sr-warning-modal .sr-warning-modal-region-list { color: black; text-align: center; margin: auto 15%; padding: 10px 0px; list-style: none; max-height: 300px; column-count: 3; column-gap: 10px; overflow-y: auto; }
.sr-warning-modal .sr-warning-modal-region-list li { max-width: 50px; }
.sr-warning-modal .sr-warning-modal-buttons { margin-bottom: 3px; }

.sr-warning-modal-buttons .sr-warning-modal-button { width: 43%; height: 32px; border-radius: 3px; font-weight: normal; font-size: 14px; color: white; }
.sr-warning-modal-buttons .sr-warning-modal-confirm-button { margin-right: 7px; background-color: #afc04b; background: linear-gradient(to top, #9cb33b, #b5cc53); border: 1px solid #879b35; }
.sr-warning-modal-buttons .sr-warning-modal-cancel-button { background-color: #aaaaaa; background: linear-gradient(to top, #969696, #c2c2c2); border: 1px solid #7f838e; }
</style>

  <script type="text/javascript" async="" src="https://www.google.com/recaptcha/api.js?render=explicit&amp;onload=on_recaptcha_loaded"></script><script async="" src="//ping.smyte.com/p.js"></script><script src="https://connect.facebook.net/signals/config/1658430177760250?v=2.7.19" async=""></script><script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script id="twitter-wjs" src="https://platform.twitter.com/widgets.js"></script><script>
    
    window.app = window.app || {};
    window.pageData = {atTime: 1502138941 };
    window.models = window.models || {};

window.models.product_json = {"disclaimer_text": null, "machine_name": "fandomandphilosophy_bookbundle", "monetary_content_event_data": [{"amount": 0.01, "type": "price"}, {"amount": 1.0, "warning_locked": "Warning: You must pay at least $1.00 for content!", "type": "price"}, {"amount": 8.0, "warning_locked": "Warning: You will not receive the $8 content! Add just \u003c%\u003d money_difference %\u003e more to unlock!", "type": "price"}, {"amount": 15.0, "warning_locked": "Warning: You will not receive the $15 content! Add just \u003c%\u003d money_difference %\u003e more to unlock!", "type": "price"}], "expand_default_split": false, "tpkd_cutoff_amount": 1.0, "bundle_display_vars": {"active_content_events": ["lessthan1", "initial", "bt8", "bt15"], "over": false, "cleanavg": "11.95", "pricing_tiers": {"initial": 1.0, "bt15": 15.0, "bt8": 8.0, "lessthan1": 0.01}}, "split_disclaimer": null, "expand_subsplits": false, "giving_fund": "ppgf", "stats_template": "Single Platform", "order_form_vars": {"country_code": "US", "splitsjson": "[{\"partner_split\": 0.59999999999999998, \"sibling_split\": 0.65000000000000002, \"class\": \"wiley\", \"name\": \"Wiley-Blackwell\"}, {\"class\": \"paypalgivingfund\", \"secondary_id\": \"cyoc\", \"partner_split\": 0.10000000000000001, \"sibling_split\": 0.14999999999999999, \"name\": \"Choose your own charity\"}, {\"partner_split\": 0.14999999999999999, \"sibling_split\": 0.20000000000000001, \"class\": \"humblebundle\", \"name\": \"Humble Tip\"}]", "avguuid": "No6szldOM13bRRHZ", "stripe_pubkey": "pk_live_Z77z5cJvv0rUOE1ayBDe1xHq", "is_order_adder": false, "min_leaderboard": 30.0, "avg": "11.95269603524229074889867841", "avghash": "AOtkoLxmn3bwC+8Z+E9J24Y1KiQcDSUc4O1VbT+I+sM\u003d"}, "default_dollar_price": 25, "human_name": "Humble Book Bundle: Fandom \u0026 Philosophy presented by Wiley-Blackwell", "disallowed_payment_processors": ["coinbase"], "has_nonsteam_keys": false, "splits": [{"partner_split": 0.59999999999999998, "sibling_split": 0.65000000000000002, "class": "wiley", "name": "Wiley-Blackwell"}, {"class": "paypalgivingfund", "secondary_id": "cyoc", "partner_split": 0.10000000000000001, "sibling_split": 0.14999999999999999, "name": "Choose your own charity"}, {"partner_split": 0.14999999999999999, "sibling_split": 0.20000000000000001, "class": "humblebundle", "name": "Humble Tip"}], "has_steam_keys": false, "product_title": "the Humble Book Bundle: Fandom \u0026 Philosophy presented by Wiley-Blackwell", "category": "bundle", "pretty_path": "/books/fandom-philosophy-books", "has_any_keys": false, "end": "2017-08-09T18:00:00", "auth_required_for_purchase_if_free": false, "slider_replacement_text": "All for one and one for all!", "start": "2017-07-26T18:00:00", "has_free_content": false, "eula": null, "has_free_keys": false, "media_type": "ebook", "cutoff_warning_override": null};
window.models.keyentity_json = {"avghash": "KFQp0m8vatw1BGYzB+LhfXhHER6OSsQwhIF3RK+TDFw\u003d", "gamekey": "kUn6uX6dSUrhH5V8", "forced_content_events": [], "avg": "11.96493664871713652201457080", "avguuid": "z80gJrbiZ17t1hu9", "cleanfamilytotal": "15.00"};

window.models.user_json = {
  email: "wagonboost@gmail.com",
  payment_credentials: [],
  has_monthly_active_subscriber_perks: false,
  has_steam_link: true
};

window.models.request = {
  country_code: "US",
  humble_guard_enabled: true,
};
  </script>
  <script id="main-js" data-dist_version="4db5c70d4b18a42ea4c0d67ff1732fe14b634533" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/main.min.js"></script>
  <script>
  (function ($, Backbone) {
  'use strict';

  var Stats = Backbone.Model.extend({
    defaults: {
      'stats_data': {},
      'total_contributions': '0',
      'total_contributed': '$0.00',
      'average_contribution': '$0.00',
      'average_mac': '$0.00',
      'average_windows': '$0.00',
      'average_linux': '$0.00',
      'average_android': '$0.00',
      'percent_mac': '',
      'percent_windows': '',
      'percent_linux': '',
    },
    initialize: function() {
      _.bindAll(this, 'recalculate');
      this.bind('change', this.recalculate, this);
      this.recalculate();
    },
    recalculate: function() {
      var calculated_values = {};
      var stats_data = this.get('stats_data');

      if (!stats_data || !stats_data.rawplatformtotals || !stats_data.numberofcontributions) {
        return;
      }

      var total = new Big(stats_data['rawtotal']);
      var macRawTotal = new Big(stats_data.rawplatformtotals.mac);
      var windowsRawTotal = new Big(stats_data.rawplatformtotals.windows);
      var linuxRawTotal = new Big(stats_data.rawplatformtotals.linux);
      var androidRawTotal = new Big(stats_data.rawplatformtotals.android);

      var totalContribution = parseInt(stats_data.numberofcontributions.total);
      var macTotalContribution = parseInt(stats_data.numberofcontributions.mac);
      var windowsTotalContribution = parseInt(stats_data.numberofcontributions.window);
      var linuxTotalContribution = parseInt(stats_data.numberofcontributions.linux);
      var androidTotalContribution = parseInt(stats_data.numberofcontributions.android);

      var platform_total = macRawTotal.add(windowsRawTotal).add(linuxRawTotal);

      // Totals
      calculated_values['total_contributions'] = numberWithCommas(totalContribution);
      calculated_values['total_contributed'] = moneyfmt(total);

      // Averages
      calculated_values['average_contribution'] = moneyfmt(total.div(totalContribution || 1));
      calculated_values['average_mac'] = moneyfmt(macRawTotal.div(macTotalContribution || 1));
      calculated_values['average_windows'] = moneyfmt(windowsRawTotal.div(windowsTotalContribution || 1));
      calculated_values['average_linux'] = moneyfmt(linuxRawTotal.div(linuxTotalContribution || 1));
      calculated_values['average_android'] = moneyfmt(androidRawTotal.div(androidTotalContribution || 1));

      // Percentages
      calculated_values['percent_mac'] = parseFloat(macRawTotal.div(platform_total).toFixed(2));
      calculated_values['percent_windows'] = parseFloat(windowsRawTotal.div(platform_total).toFixed(2));
      calculated_values['percent_linux'] = parseFloat(linuxRawTotal.div(platform_total).toFixed(2));

      this.set(calculated_values, { silent: true });
    }
  });

  window.StatsView = Backbone.View.extend({
    events: {
      'mouseenter .piechart': 'show_grayscale_chart',
      'mouseleave .piechart': 'show_color_chart'
    },
    initialize: function (options) {
      this.options = options;
      this.model = new Stats({
        'stats_data': this.options['initial_stats_data'],
        'leaderboard_data': this.options['leaderboard_data']
      });

      _.bindAll(this,
        'render',
        'show_grayscale_chart',
        'show_color_chart'
      );

      if (!this.$el.length) {
        throw new Error('$el is required');
      }

      // render the html
      var raw_template = this.options['template'];
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var tmpl = _.template(raw_template);
      var template_json = this.model.toJSON();
      this.$el.html(tmpl(template_json));

      // populate values for the first column
      this.render();

      // initialize pie chart
      this.show_color_chart();

      // linkify leaderboard
      this.$('.contributor-name').each(function() { twitter_linkify($(this)); });

      // automatically re-render when the model changes
      this.model.on('change', this.render);
    },
    render: function() {
      /*
       * Update the values in the first column (totals / averages). The pie
       * chart and leaderboard do not live update.
       *
       * Note: The HTML elements where they are displayed have classes matching
       * the corresponding fields on the model. This code relys on that.
       */
      var model_json = this.model.toJSON();
      for (var key in model_json) {
        var $field = this.$('.' + key);
        if ($field.length == 1) {
          if ((key != 'average_contribution') || this.options['live_update_average'] || ($field.text() === '')) {
            $field.text(model_json[key]);
          }
        }
      }
    },
    show_grayscale_chart: function () {
      var $piechart = this.$('.piechart');
      $piechart.attr('src', $piechart.data('grayscaleSrc'));
      this.$('.chartlegend .chartcolor').each(function() {
        $(this).css('background-color', $(this).data('grayscaleColor'));
      });
    },
    show_color_chart: function () {
      var $piechart = this.$('.piechart');
      $piechart.attr('src', $piechart.data('colorSrc'));
      this.$('.chartlegend .chartcolor').each(function() {
        $(this).css('background-color', $(this).data('color'));
      });
    }
  });
})(jQuery, Backbone);  // END CLOSURE
  
    (function () {
  $(function() {
    
var sales_counter = function(machine_name, products_sold, statsView, element_query) {
  // set up the animated counter
  var animatedCounter = null;
  var $counterElement = $(element_query);
  if ($counterElement.length) {

    var numDigits = 6;
  
    animatedCounter = $counterElement.animatedCounter({'numDigits': numDigits}).data('animatedCounter');
  }

  var lastStatsTimestamp = 0;

  // subscribe to pubnub notifications which will be used to update the stats and counter if we are not on a receipt page
  pubnub_client.subscribe({
    'channel': 'humble'+machine_name,
    'callback': function(message) {
      if (!message.stats) {
        return;
      }
      var counterValue = parseInt(message.stats.numberofcontributions.total);
      // ignore outdated messages
      if (message.timestamp <= lastStatsTimestamp) {
        return;
      }
      lastStatsTimestamp = message.timestamp;
      // update the animated counter with the new data
      if (animatedCounter) {
        animatedCounter.setValue(counterValue);
      }
      // update the stats box with the new data
      if (statsView) {
        statsView.model.set({'stats_data': message.stats});
      }
    }
  });
}

    'use strict';
    // set up the backbone stats controller
    var statsView = null;
    var $stats_holder = $('#stats-holder');
    var $stats_template = $('#stats-template');

    var $leaderboard = $('#leaderboard-data');
    var leaderboard_html = $leaderboard.length ? $leaderboard.html().trim() : '';
    var leaderboard_data = leaderboard_html ? JSON.parse(leaderboard_html) : [];

    if (typeof StatsView != 'undefined' && $stats_holder.length && $stats_template.length) {
      statsView = new StatsView({
        'initial_stats_data': {"rawtotal": 94964.169999999998, "sales_bt8": 5989, "numberofcontributions": {"windows": 5430, "ios": 412, "mac": 719, "linux": 415, "android": 969, "total": 7945.0}, "sales_bt15": 5653, "sales_initial": 7928, "sales_lessthan1": 17, "rawplatformtotals": {"windows": 62917.120000000003, "mac": 11132.73, "ios": 5040.79, "android": 10745.530000000001, "linux": 5128.0}},
        'leaderboard_data': leaderboard_data,
        'live_update_average': true,
        'el': $stats_holder,
        'template': $stats_template.html()
      });
    }

    // Set up the sales counter
    sales_counter('fandomandphilosophy_bookbundle', 0, statsView, '#heading-bundles-sold .digit-holder, #heading-bundles-sold .mini-digit-holder');
  })
})();
  
  // keypage.js


images = [];
var uplay_link = '';
var get_uplay_ticket = null;

function npreload(items) {
  for (var i=0; i<items.length; i++) {
    var nimg = new Image();
    nimg.src = items[i];
    images.push(nimg);
  }
}



/*
 * Format 5 as 05 (e.g.)
 */
function zeropad(num) {
  num += '';
  if (num.length == 1) {
    num = '0' + num;
  }
  return num;
}

/*
 * Get steam profile data for a given user and call the provided callbacks.  On sucess it will cache the steam profile data.
 * steam_id: the steam id of the profile to retrieve, null for currently logged in user
 * options['success']
 * options['error']
 * options['complete']: functions to call for the respective callbacks, will be a no-op if not provided
 * options['context']: the context to call the callbacks with, window by default
 * returns an object containing steam_name and avatar_url
 */
window.steam_profiles = {};
function get_steam_profile(steam_id, options) {
  options = options || {};
  options['context'] = options['context'] || window;
  $.each(['success', 'error', 'complete'], function(index, callback_name) {
    options[callback_name] = options[callback_name] || $.noop;
  });

  if (window.steam_profiles[steam_id]) {
    options['success'].call(options['context'], window.steam_profiles[steam_id]);
    return;
  }

  $.ajax({
    url: '/user/steam_profile',
    dataType: 'json',
    data: {steam_id: steam_id},
    success: function(profile_data) {
      window.steam_profiles[steam_id] = profile_data;
      options['success'].apply(options['context'], arguments);
    },
    error: function() {
      options['error'].apply(options['context'], arguments);
    },
    complete: function() {
      options['complete'].apply(options['context'], arguments);
    },
  });
}

/*
 * Format and display the dates that new builds were posted, in the user's local
 * timezone. Detect if there are new builds since the user visited the download
 * page, and highlight them.
 */
require(['account/accountModals'], function (AccountModals) {
  $(function() {
    var HumbleGuardModal = AccountModals.AccountHumbleGuardModal;

  
    var newbuilds = {'Mac': 0, 'Windows': 0, 'Linux': 0};

    // Display a string at the top of the download list for each platform informing
    // the user of how many new builds there are since their last visit.
    for (pretty_platform in newbuilds) {
      if (!newbuilds.hasOwnProperty(pretty_platform) || newbuilds[pretty_platform] == 0) continue;
      var platform = pretty_platform.toLowerCase();
      var plural = '';
      if (newbuilds[pretty_platform] > 1) {
        plural = 's';
      }
      var builds_string = newbuilds[pretty_platform] + ' updated ' + pretty_platform + ' build' + plural + ' posted since your last visit!';
      $('.newbuilds.' + platform).html('<div>' + builds_string + '</div>');
    }

    $('#keystation,.key-expander').click(function(e) {
      var t = $(this);
      if (t.hasClass('kexpanded')) return;
      t.addClass('kexpanded');
      e.preventDefault();
      t.find('.expandkeys').animate({height:0,opacity:0});
      t.find('.shrinkwrapper').animate({height:t.find('.shrinksizer').height() + 6}, function() {$(this).height('auto');});
    });

    
    
    $(document).ready(function() {
      $('.auto-expand-redeemer').trigger('click');
    });

    $('.keystation-new').click(function(e){
      var parentbox = $(this).closest('.whitebox');
      e.preventDefault();
      parentbox.find('.keystation-new').animate({height:0,opacity:0});
      if (parentbox.find('.keytabs').length > 0) {
        parentbox.closest('.whitebox').animate({'margin-top':'40px'});
      }
      parentbox.find('.shrinksizer-new').css({'overflow':'visible'});
      parentbox.find('.keytabs').css({'opacity':0});
      parentbox.find('.keytabs').animate({'opacity':1.0},1000);
      parentbox.find('.shrinksizer-new').animate({height:'toggle'});
      parentbox.find('.keystation-new').remove();
    });

  
  
  

    $('.keyfield').click(function(e) {
      // When clicking an already redeemed key, select the entire string.
      var $holder = $(this).parent();
      if ($holder.hasClass('activated')) {
        e.preventDefault();
        selectText(this);
      }
    });

    $('.keyredeemer, .giftbutton').click(function(e) {
      e.preventDefault();
      var $that = $(this);
      var $holder = $that.parent();
      if ($that.data('enabled') === true) {
        return;
      }
      $that.data('enabled', true);

      function fetchkey() {
        var keytype = $holder.data('keytype');
        var keyindex = $holder.data('keyindex');
        var helpertext = $holder.data('helpertext') || '';
        var uplay_user_ticket = '';
        if (get_uplay_ticket) {
          uplay_user_ticket = get_uplay_ticket();
        }


        $holder.addClass('pending').find('.keyfield-content').html('<img class="indicator" src="https://humblebundle-a.akamaihd.net/static/hashed/e73d51c16b07d083026843ceda9c22056b9d04a2.gif" /> Retrieving key...');
        var retry = 5;

        function redeemerror(data) {
          if (!data) {
            data = {};
          }

          retry--;
          if (retry <= 0 || data.fatal_error) {
            var error_msg = data.error == 'Already Purchased' ? 'Your Steam account already owns this game' :
                            data.error == 'Duplicate activation code' ? 'This key has been activated already' :
                            data.error == 'Does not own required app' ? 'You need to purchase the base product first' :
                            data.error == 'Restricted country' ? 'This product not available in your country' :
                            data.error == 'Bad activation code' ? 'Steam errored, please refresh page and try again' :
                            data.error == 'Humble Guard Required' ? 'Humble Account Security check required.' :
                            data.error == 'Too many bad activation code attempts in period' ? 'Too many Steam keys redeemed. Try again later.' :
                            data.error_msg ? data.error_msg : 'Please try redeeming again later';

            $holder.find('.keyfield-content').text(error_msg);
            if (data.error_msg && (data.error_msg.toLowerCase().indexOf('sold out') != -1)) {
              $holder.find('.keyredeemer').addClass('soldout');
              $holder.find('.giftbutton').hide();
            }

          } else {
            setTimeout(grabkey, 3500);
          }
        }

        function humbleGuardHandler(jqXHR) {
          var data;
          try {
            data = $.parseJSON(jqXHR.responseText);
          } catch (e) {
            // probably a 500, let the standard error handler take it instead
            return;
          }
          if (data.humble_guard_required) {
            jqXHR.fatal_error = true;
            jqXHR.error = "Humble Guard Required";
            $holder.removeClass('activated');
            var modal = new HumbleGuardModal({
                 onSuccess: function (view) {
                  fetchkey();
                  view.close();
                }
              });
            $('#site-modal').html(modal.render().el);
          }
        }

        function grabkey() {
          $.post(
            '/humbler/redeemkey',
            {
              keytype: keytype,
              key: 'kUn6uX6dSUrhH5V8',
              keyindex: keyindex,
              uplay_ticket: uplay_user_ticket,
              gift: $that.hasClass('giftbutton')
            },
            function (data) {
              if (data && data.success) {
                $holder.removeClass('pending');
                $holder.addClass('activated');
                if (data.steam_id) {
                  var link_text = 'this account';
                  if (data.steam_name) {
                    link_text = _.escape(data.steam_name);
                  }

                  $holder.find('.keyfield-content').html('redeemed to <a href="http://steamcommunity.com/profiles/' + data.steam_id + '" target="_blank">' + link_text + '</a>');
                  $holder.find('.giftbutton').hide();

                  _gaTrackEvent('Download page', 'Redeemed Steam key', keytype);

                } else if (data.giftkey) {
                  $holder.addClass('is-gift');
                  $holder.find('.keyfield-content').html('https://humblebundle.com/gift?key=' + data.giftkey);
                  $holder.find('.giftbutton').hide();
                } else {
                  var $keyfield = $holder.find('.keyfield-content');
                  $keyfield.html(helpertext + data.key);  // data.key has already been escaped by the backend
                  selectText($keyfield[0]);  // Highlight text so it can easily be copied to clipboard
                }

              } else if (data.access_token_missing) {
                $holder.find('.keyfield-content').html('<a href="/steam/link" target="_blank">Connect to Steam</a> to redeem!');

              } else if (data.bad_access_token) {
                $holder.find('.keyfield-content').html('Steam access expired. <a href="/steam/link" target="_blank">Reconnect to Steam</a> to redeem!');

              } else if (data.uplay_ticket_missing) {
                $holder.find('.keyfield-content').html('<a href="'+ uplay_link + '" target="_blank">Connect to uPlay</a> to redeem!');

              } else {
                redeemerror(data);
              }
            },
            'json'
          ).fail(humbleGuardHandler)
           .fail(redeemerror)
           .always(function() {
              $that.data('enabled', false);
           });
        }
        grabkey();
      }

      fetchkey();
    });

    // redeem all button (origin_bundle only)
    $('.origin_bundle_redeem_all_button').click(function(e) {
      e.preventDefault();
      var keytype = $(this).data('keytype');
      // click all unactivated redeem key buttons that match the provided selector
      $(".redeemholder").each(
          function (index, elem) {
            if ($(elem).hasClass("activated")) {
              return;
            }
            // check for the type of button we are looking for
            var button = $(elem).find("." + keytype + "button").get(0);
            if (button) {
              $(button).click();
            }
          }
      );
    });
  
  });
});

// preload the images for the redeemed state of the 3rd party key redeemers
npreload([
  'https://humblebundle-a.akamaihd.net/static/hashed/8c812b14676720a1c5541e5ff0084336f8ca952b.png',
  'https://humblebundle-a.akamaihd.net/static/hashed/72c7a91a612ceee5ceda77133c9d79bf66b8dec3.png',
  'https://humblebundle-a.akamaihd.net/static/hashed/7d32b8cb2ed51ab18ec0e5a40208afd4a41c988c.png',
  'https://humblebundle-a.akamaihd.net/static/hashed/7f9102778b07eec38f1ba5911c95c24d3aa98318.png',
  'https://humblebundle-a.akamaihd.net/static/hashed/20048fabc7a0a68316b0315f584c58ad95b17055.png',
  'https://humblebundle-a.akamaihd.net/static/hashed/e73d51c16b07d083026843ceda9c22056b9d04a2.gif' 
  ]);

$(document).ready(function() {
  $('.keytabs li').click(function(e) {
    var parentbox = $(this).closest('.whitebox');
    e.preventDefault();

    parentbox.find('.keytab').css({'visibility':'hidden'}).hide(200);
    parentbox.find('.keytabs li.activekeytab').removeClass('activekeytab');
    $(this).addClass('activekeytab');
    var tgtSelector = $(this).find('a').attr('href');
    parentbox.find(tgtSelector).show(200,function(){ $(this).css({'visibility':'visible'});})
  });
});


$(document).ready(function() {
  $('#deletekeypage').click(function(e) {
    e.preventDefault();
    $('#deletekeyconfirm').fadeIn();
  });
  $('#dkcancel').click(function(e) {
    e.preventDefault();
    $('#deletekeyconfirm').fadeOut();
  });


  $('#dkconfirm').click(function(e) {
    e.preventDefault();
    var url = '/delete-key';
    $.post(url, {'key': 'kUn6uX6dSUrhH5V8'}, function(data) {
      var dict = JSON.parse(strip_json_prefix(data));
      var result = '';
      if (dict.hasOwnProperty('result')) {
        result = dict['result'];
      } else {
        result = 'Sorry, a problem occurred.';
      }
      $('#deletekeyconfirm').html('<p class=\'centered-text\'>' + result + '</p>');
    }, 'text');
  });
  
    require(['downloadPages/uplay'], function(uplay) {
      uplay_link = uplay.getConnectLink();
      uplay.init($('.uplay-login-status'));
      get_uplay_ticket = uplay.getTicket;
    });
  
});



$(document).ready(function() {
  $('.steam-profile .js-unlink-submit').on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    $(e.currentTarget).closest('form').submit();
  });

  // fetch and update steam info for the currently logged in user
  var $steam_profile = $('.steam-profile');
  if ($steam_profile.length) {
    var $spinner = $('<div class=\'indicator\'></div>');
    $steam_profile.children().hide();
    $steam_profile.append($spinner);

    // get steam profile for current user
    get_steam_profile(null, {
      context: this,
      success: function(profile_data) {
        $steam_profile.children().show();
        if (profile_data['steam_name'] && profile_data['avatar_url']) {
          $steam_profile.find('.account-text a:first').text(profile_data['steam_name']);
          $steam_profile.find('.profile-pic').css('background-image', 'url(' + profile_data['avatar_url'] + ')');
        } else {
          $steam_profile.find('.profile-pic').hide();
        }
      },
      error: function(profile_data) {
        $steam_profile.children().show();
        $steam_profile.find('.profile-pic').hide();
      },
      complete: function(profile_data) {
        $spinner.remove();
      },
    });
  }

  // fetch steam profile data for already redeemed keys
  // get unique steam ids
  var steam_ids = {};
  $('.keyfield-content a[data-steam-id]').each(function(index, el) {
    steam_ids[$(el).data('steamId')] = true;
  });

  // fetch unique keys and update the redeem text
  var self = this;
  $.each(steam_ids, function(key, value) {

    var $spinner = $('<img class="indicator" src="https://humblebundle-a.akamaihd.net/static/hashed/e73d51c16b07d083026843ceda9c22056b9d04a2.gif" />');
    var $steam_profile_links = $('.keyfield-content a[data-steam-id=' + key + ']');
    var original_text = $steam_profile_links.first().text();
    $steam_profile_links.html($spinner);

    get_steam_profile(key, {
      context: self,
      success: function(profile_data) {
        var link_text = profile_data['steam_name'] || original_text;
        $steam_profile_links.text(link_text);
      },
      error: function(profile_data) {
        $steam_profile_links.text(original_text);
      },
    });
  });
});

// arch_toggle.js
$(document).ready(function() {
  $('.arc-toggle input').change(function() {
    var arc = $(this).val() == '64';
    $(this).closest('.row').toggleClass('arc64',arc);
  });
});
</script>
<script type="application/ld+json">
  {
    "@context": "http://schema.org",
    "@type": "WebSite",
    "url": "https://www.humblebundle.com/",
    "potentialAction": {
      "@type": "SearchAction",
      "target": "https://www.humblebundle.com/store/search?search={search_term}",
      "query-input": "required name=search_term"
    }
  }
</script>

<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="account/accountModals" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/javascript/bundle.js"></script><script type="text/javascript" charset="utf-8" async="" src="https://platform.twitter.com/js/button.56d4a00aea1af069615f067f4e79aaba.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="https://humblebundle-a.akamaihd.net/static/hashed/998cdf8d471fa4ae7935c0bc267cae547fa8826e.js" src="https://humblebundle-a.akamaihd.net/static/hashed/998cdf8d471fa4ae7935c0bc267cae547fa8826e.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="downloadPages/initDownloadList" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/javascript/downloadPages/initDownloadList.js"></script><style type="text/css" id="diigolet-chrome-css">body#dummybodyid .diigolet,body#dummybodyid .diigolet a,body#dummybodyid .diigolet em,body#dummybodyid .diigolet span,body#dummybodyid .diigolet div,body#dummybodyid .diigolet dl,body#dummybodyid .diigolet dt,body#dummybodyid .diigolet dd,body#dummybodyid .diigolet ul,body#dummybodyid .diigolet ol,body#dummybodyid .diigolet li,body#dummybodyid .diigolet h1,body#dummybodyid .diigolet h2,body#dummybodyid .diigolet h3,body#dummybodyid .diigolet h4,body#dummybodyid .diigolet h5,body#dummybodyid .diigolet h6,body#dummybodyid .diigolet pre,body#dummybodyid .diigolet form,body#dummybodyid .diigolet fieldset,body#dummybodyid .diigolet p,body#dummybodyid .diigolet blockquote,body#dummybodyid .diigolet th,body#dummybodyid .diigolet td,body#dummybodyid .diigolet input,body#dummybodyid .diigolet textarea,body#dummybodyid .diigolet select,body#dummybodyid .diigolet *{background:transparent none;padding:0;margin:0;flex-direction:row;border:#000 0 solid;text-align:left;text-decoration:none;text-transform:none;text-indent:0;line-height:normal;word-break:normal;word-wrap:normal;width:auto;height:auto;color:inherit;font:inherit;float:none;cursor:default;position:static;overflow:visible;max-width:none;box-shadow:none;opacity:1;border-radius:0;}
body#dummybodyid .diigolet{color:#000;font:normal normal normal 13px arial,helvetica,clean,sans-serif;}
body#dummybodyid .diigolet input[type=text],body#dummybodyid .diigolet textarea,body#dummybodyid .diigolet select,body#dummybodyid .diigolet fieldset{background-color:#FFF;border:1px #999 solid;padding:1px;font-size:12px;display:inline;border-radius:2px;-webkit-transition:border linear .2s,box-shadow linear .2s;}
body#dummybodyid .diigolet select{padding:0;height:20px;}
body#dummybodyid .diigolet input[type=text],body#dummybodyid .diigolet textarea{cursor:text;}
body#dummybodyid .diigolet input[type=text]{height:20px;}
body#dummybodyid .diigolet input[type="button"],body#dummybodyid .diigolet input[type="submit"],body#dummybodyid .diigolet input[type="reset"],body#dummybodyid .diigolet input[type="file"]{color:buttontext;cursor:default;padding:2px 5px;text-align:center;border:1px solid #ccc;background:#fff;border-radius:2px;background-image:-webkit-gradient(linear,0% 0,0% 100%,from(#f8f8f8),to(#d2d2d2));}
body#dummybodyid .diigolet input[type="button"]:active,body#dummybodyid .diigolet input[type="submit"]:active,body#dummybodyid .diigolet input[type="reset"]:active,body#dummybodyid .diigolet input[type="file"]:active{background:#ddd;}
body#dummybodyid .diigolet textarea{white-space:normal!important;resize:vertical!important;padding:2px!important;}
body#dummybodyid .diigolet input.diigo-check{border:none;vertical-align:middle;}
body#dummybodyid .diigolet input.diigo-button{font-size:12px!important;font-weight:bold;padding:4px 8px;cursor:pointer;border-radius:4px;}
body#dummybodyid .diigolet input.diigo-button#diigolet-dlgBm-btnSave{width:56px;color:white;height:25px;-webkit-border-radius:4px;background-color:rgba(237,237,237,0);-webkit-box-shadow:0 1px 1px rgba(0,0,0,.15);border:solid 1px #0388dc;background-image:-webkit-linear-gradient(top,#4eaffa,#0492f5);}
body#dummybodyid .diigolet input.diigo-button#diigolet-dlgBm-btnSave:hover{background-image:-webkit-linear-gradient(top,#349ef0,#0580d6);}
body#dummybodyid .diigolet input.diigo-button#diigolet-dlgBm-btnSave:active{background-image:-webkit-linear-gradient(bottom,#4eaffa,#0492f5);}
body#dummybodyid .diigolet input.diigo-downlist{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/arrow-down.png) 50% 50% no-repeat,-webkit-gradient(linear,0% 0,0% 100%,from(#f8f8f8),to(#d2d2d2));width:12px;margin-left:-16px;}
body#dummybodyid .diigolet input.diigo-downlist:active{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/arrow-down.png) 50% 50% no-repeat,#ddd;}
body#dummybodyid .diigolet div.diigo-buttonswitchlist{padding:4px 2px;border:1px solid #ccc;position:absolute;right:72px;background:#fff;z-index:100000;}
body#dummybodyid .diigolet div.diigo-buttonswitchlist ul li{padding:2px 6px;}
body#dummybodyid .diigolet div.diigo-buttonswitchlist ul li:hover{background:#43658F;color:#fff;cursor:pointer;}
body#dummybodyid #diigoletFNSubmit{width:50px;}
body#dummybodyid .diigolet table{border-collapse:collapse;border-spacing:0;width:auto;}
body#dummybodyid .diigolet label{cursor:pointer!important;display:inline;vertical-align:middle;}
body#dummybodyid .diigolet fieldset,body#dummybodyid .diigolet img{border:0;}
body#dummybodyid .diigolet address,body#dummybodyid .diigolet caption,body#dummybodyid .diigolet cite,body#dummybodyid .diigolet code,body#dummybodyid .diigolet dfn,body#dummybodyid .diigolet em,body#dummybodyid .diigolet strong,body#dummybodyid .diigolet th,body#dummybodyid .diigolet var{font-style:normal;font-weight:bold;}
body#dummybodyid .diigolet ol,body#dummybodyid .diigolet ul,body#dummybodyid .diigolet li{list-style:none;display:block;}
body#dummybodyid .diigolet caption,body#dummybodyid .diigolet th{text-align:left;}
body#dummybodyid .diigolet h1,body#dummybodyid .diigolet h2,body#dummybodyid .diigolet h3,body#dummybodyid .diigolet h4,body#dummybodyid .diigolet h5,body#dummybodyid .diigolet h6{font-weight:bold;}
body#dummybodyid .diigolet q:before,body#dummybodyid .diigolet q:after{content:'';}
body#dummybodyid .diigolet abbr,body#dummybodyid .diigolet acronym{border:0;}
body#dummybodyid .diigolet a:link,body#dummybodyid .diigolet a:visited,body#dummybodyid .diigolet a:hover,body#dummybodyid .diigolet a:active{text-decoration:none;color:#00F;cursor:pointer!important;}
body#dummybodyid .diigolet a:hover{text-decoration:underline;}
body#dummybodyid .diigolet a *{cursor:inherit;}
body#dummybodyid #diigolet-tray{position:fixed;top:0;left:10;width:16px;height:16px;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletIconv3.gif") no-repeat left -4px;z-index:2147483646;}
body#dummybodyid .diigolet a.diigolet-Help:link,body#dummybodyid .diigolet a.diigolet-Help:visited{color:#06F;}
body#dummybodyid .diigolet a.diigolet-Help:hover,body#dummybodyid .diigo a.diigolet-Help:active{color:#00F;}
body#dummybodyid .diigolet label{margin-left:3px;}
body#dummybodyid .diigolet span.noComments{color:#AAA;font-size:10px;}
body#dummybodyid #diigolet-toolbar{border:none;width:100%;position:absolute;top:0;left:0;z-index:2147483647;color:#333;}
body#dummybodyid #diigolet-tb-content{padding:3px 5px;background:#EFEDDE url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigolet-toolbar-bg2.gif) repeat scroll 0;}
body#dummybodyid #diigolet-tb-bar span,body#dummybodyid #diigolet-tb-bar div,body#dummybodyid #diigolet-tb-bar a,body#dummybodyid #diigolet-tb-bar em{line-height:24px;}
body#dummybodyid #diigolet-tb-shadow{height:5px;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigolet-toolbar-shadow.png) repeat-x left top;}
* html body#dummybodyid #diigolet-tb-shadow.ie6{filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=scale,src="chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigolet-toolbar-shadow.png");overflow:hidden;background:none;}
body#dummybodyid #diigolet-help{display:none;position:absolute;top:29px;right:10px;width:200px;border:1px #ccc solid;background-color:#FFC;padding:6px 16px 6px 6px;}
body#dummybodyid .diigolet a.diigoletButton{height:24px;float:left;padding-right:4px;cursor:pointer!important;}
body#dummybodyid .diigolet a.diigoletButton:hover{text-decoration:none;color:#000;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn3_r.png") no-repeat right top;}
body#dummybodyid .diigolet a.diigoletButton:active{background-position:right bottom;}
body#dummybodyid .diigolet a.diigoletButton b{font-weight:normal;color:#000;line-height:24px;float:left;padding-left:4px;height:24px;}
body#dummybodyid #diigolet-button-highlight-dropdown{width:8px;height:16px;margin-right:4px;background:transparent url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/down_arrow.gif') no-repeat scroll left 2px;}
body#dummybodyid #diigolet-button-highlight-dropdown.mouseovered{border-left:1px solid #888;margin-right:0;text-decoration:none;width:11px;height:24px;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn4.png") no-repeat left top!important;}
body#dummybodyid #diigolet-button-highlight-dropdown.mouseoveredIe{border-left:1px solid #888;margin-right:1px;text-decoration:none;width:11px;height:24px;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn4.png") no-repeat left top!important;}
body#dummybodyid #diigolet-button-highlight-dropdown.checked{border-left:1px solid #888;margin-right:0;text-decoration:none;width:11px;height:24px;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn4_s.png") no-repeat left top!important;}
body#dummybodyid #diigolet-button-highlight.mouseovered{text-decoration:none;color:#000;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn3_r.png") no-repeat right top!important;}
body#dummybodyid #diigolet-button-highlight.mouseoveredIe{text-decoration:none;color:#000;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn3_r.png") no-repeat right top!important;}
body#dummybodyid #diigolet-button-highlight.mouseovered b.outer{background:transparent url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn3.png') no-repeat left top;}
body#dummybodyid #diigolet-button-highlight.mouseoveredIe b.outer{background:transparent url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn3.png') no-repeat left top;}
body#dummybodyid a#diigolet-button-highlight b.outer{padding-right:5px;}
body#dummybodyid a#diigolet-button-highlight{padding-right:0!important;}
body#dummybodyid a.diigoletButton:hover b.outer{background:transparent url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn3.png') no-repeat left top;}
body#dummybodyid a.diigoletButton:active b.outer{background-position:left bottom;}
body#dummybodyid .diigolet a.diigoletButton b b{font-size:12px;padding-left:20px;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletIconv3.gif") no-repeat left 50%;}
body#dummybodyid .diigolet a.diigoletButton:active b b{position:relative;top:1px;left:1px;}
body#dummybodyid .diigolet a.diigoletButton.diigoletDisabled{cursor:default;}
body#dummybodyid .diigolet a.diigoletButton.diigoletDisabled b b{color:#999;position:static;}
body#dummybodyid .diigolet a.diigoletButton.diigoletDisabled:hover{background:none transparent;}
body#dummybodyid .diigolet a.diigoletButton.diigoletDisabled:hover b.outer{background:none transparent;}
body#dummybodyid .diigolet a.diigoletButton.checked{background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn3_r.png") no-repeat right top;background-position:right bottom;}
body#dummybodyid .diigolet a.diigoletButton.checked b.outer{background:transparent url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletBtn3.png') no-repeat left top;background-position:left bottom;}
body#dummybodyid .diigolet a.diigoletButton.checked b b{position:relative;top:1px;left:1px;}
body#dummybodyid #diigolet-tb-btnSidebar b b{background-position:left -24px;}
body#dummybodyid #diigolet-tb-btnSidebar.toClose b b{background-position:left -48px;}
body#dummybodyid #diigolet-tb-btnBookmark b b{background-position:left -144px;}
body#dummybodyid #diigolet-tb-btnBookmark.saved b b{background-position:left -120px;}
body#dummybodyid #diigolet-button-highlight b b{background-position:left -72px;}
body#dummybodyid #diigolet-button-highlight.dontShow b b{background-position:left -96px;}
body#dummybodyid #diigolet-button-highlight.yellow b b{background-position:left -355px;}
body#dummybodyid #diigolet-button-highlight.blue b b{background-position:left -375px;}
body#dummybodyid #diigolet-button-highlight.green b b{background-position:left -395px;}
body#dummybodyid #diigolet-button-highlight.pink b b{background-position:left -415px;}
body#dummybodyid .diigolet .colorItem{padding-left:20px;height:16px;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletIconv3.gif") no-repeat left -440px;}
body#dummybodyid #diigolet-context-yellow b,body#dummybodyid #diigolet-colorMenu-yellow b{background-position:left -440px;}
body#dummybodyid #diigolet-context-blue b,body#dummybodyid #diigolet-colorMenu-blue b{background-position:left -460px;}
body#dummybodyid #diigolet-context-green b,body#dummybodyid #diigolet-colorMenu-green b{background-position:left -480px;}
body#dummybodyid #diigolet-context-pink b,body#dummybodyid #diigolet-colorMenu-pink b{background-position:left -500px;}
body#dummybodyid #diigolet-context-yellow.colorchecked b,body#dummybodyid #diigolet-colorMenu-yellow.colorchecked b{background-position:left -520px;}
body#dummybodyid #diigolet-context-blue.colorchecked b,body#dummybodyid #diigolet-colorMenu-blue.colorchecked b{background-position:left -540px;}
body#dummybodyid #diigolet-context-green.colorchecked b,body#dummybodyid #diigolet-colorMenu-green.colorchecked b{background-position:left -560px;}
body#dummybodyid #diigolet-context-pink.colorchecked b,body#dummybodyid #diigolet-colorMenu-pink.colorchecked b{background-position:left -580px;}
body#dummybodyid #diigolet-tb-btnFloatNote b b{background-position:left -167px;}
body#dummybodyid #diigolet-tb-btnTwitter b b{background:transparent url("http://twitter.com/favicon.ico") no-repeat left 50%;}
body#dummybodyid #diigolet-tb-btnComment b b{background-position:left -192px;}
body#dummybodyid #diigolet-tb-btnComment.commented b b{background-position:left -192px;}
body#dummybodyid #diigolet-tb-btnMore b b{background-position:left 0;}
body#dummybodyid #diigolet-tb-btnSignIn b b{background-position:left -264px;}
body#dummybodyid #diigolet-tb-btnHide{float:right;height:24px;width:16px;background:transparent url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletIconv3.gif") no-repeat left -240px;}
body#dummybodyid div.diigoIcon{cursor:pointer!important;margin:0;padding:0;position:absolute;display:none;width:24px!important;z-index:2147483643;height:23px!important;background:transparent url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/edit-highlight.png') no-repeat left;-webkit-transition:-webkit-transform 150ms ease;vertical-align:text-bottom;}
body#dummybodyid span.diigoHighlightCommentLocator{vertical-align:text-bottom;line-height:0;}
body#dummybodyid div.diigoIcon span{color:#000;display:block;font-family:Helvetica,Arial,sans-serif;font-size:13px;font-weight:700;line-height:18px;text-align:center;text-shadow:0 1px 1px #FFF;text-decoration:none;text-indent:0;display:none;}
body#dummybodyid div.diigoHighlightcommented{display:inline-block!important;}
body#dummybodyid div.ImageIcon{background-color:transparent!important;}
body#dummybodyid div.diigoIcon:hover{background-color:transparent!important;background-repeat:no-repeat!important;-webkit-transform:translate(0px,-2px);}
body#dummybodyid div.diigoHighlightcommented.TextIcon{bottom:0;}
body#dummybodyid div.diigoHighlightcommented.public{background:#FFF url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/public-annotation.png') no-repeat left;}
body#dummybodyid div.diigoHighlightcommented.private.yellow{background:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/annotation-icon.png') 0 0 no-repeat;}
body#dummybodyid div.diigoHighlightcommented.private.blue{background:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/annotation-icon.png') 0 -46px no-repeat;}
body#dummybodyid div.diigoHighlightcommented.private.green{background:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/annotation-icon.png') 0 -92px no-repeat;}
body#dummybodyid div.diigoHighlightcommented.private.pink{background:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/annotation-icon.png') 0 -138px no-repeat;}
body#dummybodyid div.diigoHighlightcommented.group.yellow{background:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/annotation-icon.png') 0 -23px no-repeat;}
body#dummybodyid div.diigoHighlightcommented.group.blue{background:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/annotation-icon.png') 0 -69px no-repeat;}
body#dummybodyid div.diigoHighlightcommented.group.green{background:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/annotation-icon.png') 0 -115px no-repeat;}
body#dummybodyid div.diigoHighlightcommented.group.pink{background:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/annotation-icon.png') 0 -161px no-repeat;}
body#dummybodyid #diigolet-toolbar .dropdownMenu{display:none;border:1px solid #999;font:12px arial,helvetica,clean,sans-serif;background-color:Menu;padding:2px 0;z-index:2147483647;position:absolute;top:30px;width:140px;}
body#dummybodyid #diigolet-toolbar .dropdownMenu a,body#dummybodyid #diigolet-toolbar .dropdownMenu a:link,body#dummybodyid #diigolet-toolbar .dropdownMenu a:visited,body#dummybodyid #diigolet-toolbar .dropdownMenu a:hover,body#dummybodyid #diigolet-toolbar .dropdownMenu a:active{display:block;padding:2px 12px;font-weight:normal;text-decoration:none;color:#000;background:#fff;cursor:default;}
body#dummybodyid #diigolet-toolbar .dropdownMenu a:hover,body#dummybodyid #diigolet-toolbar .dropdownMenu a:active{color:#fff;background:#09f;}
body#dummybodyid #diigolet-notify{display:none;position:absolute;top:33px;left:0;border:1px #ccc solid;background-color:#FFC;padding:6px 16px 6px 6px;z-index:2147483647;}
body#dummybodyid #diigolet-notify.right{left:auto;right:0;text-align:right;}
body#dummybodyid .diigolet .tagList{margin:2px 0;float:left;}
body#dummybodyid .diigolet .diigo-su-tag .tagButton{display:inline-block;height:16px;padding:0 5px;line-height:16px;background-color:#f2f2f2;border-top:1px solid rgba(0,0,0,0);border-left:1px solid rgba(0,0,0,0);border-right:1px solid #C9D7F1;border-bottom:1px solid #C9D7F1;color:#858585;border-radius:1px;cursor:pointer;margin-right:3px;}
body#dummybodyid .diigolet .diigo-su-tag .tagButton:hover{border-color:#82b3f8;}
body#dummybodyid .diigolet .diigo-su-tag .tagButton.inused{color:#3f99a1;}
body#dummybodyid .diigolet .diigo-su-tag .tagButton.selected{border-color:#82b3f8;}
body#dummybodyid .diigolet .tagLoading a{display:none;margin-bottom:10px;}
body#dummybodyid .diigolet .tagList.tagLoading .loading{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/indicator.gif) no-repeat left top;height:16px;padding-left:22px;display:block;}
body#dummybodyid .diigolet .tagLoading .tagListHeader{display:none;}
body#dummybodyid .diigolet .tagListHeader{cursor:pointer;float:left;width:100px;line-height:23px;}
body#dummybodyid .diigolet .tagListHeader:hover{text-decoration:underline;}
body#dummybodyid .diigolet .tagList div{color:#666!important;font-size:12px!important;font-weight:bold!important;padding-right:5px!important;text-align:left!important;}
body#dummybodyid #diigolet-twitter{background-color:threedface;font-family:Arial,sans-serif;font-size:13px;color:windowtext;padding:5px 5px;margin:0;left:0;top:30px;z-index:2147483646;width:380px;position:static;border:1px #09F solid;border-left-width:0;}
body#dummybodyid #diigolet-twitter input{vertical-align:middle;}
body#dummybodyid .diigolet .twitterlogo{width:210px;height:49px;FILTER:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=scale,src="http://assets3.twitter.com/images/twitter.png");}
body#dummybodyid #diigolet-tagForward{background-color:white;width:460px;font-family:Arial,Helvetica,sans-serif;-webkit-border-radius:0;cursor:default;position:static;right:5px;top:75px;z-index:2147483646;border:1px solid rgba(0,0,0,.25);box-shadow:0 1px 5px rgba(0,0,0,.3);-webkit-user-select:none;background-clip:content-box;-webkit-animation:fadeinScale 200ms ease;}
body#dummybodyid #diigolet-tagForward.show{-webkit-animation:fadeinScale 200ms ease;}
body#dummybodyid #diigolet-tagForward.hide{-webkit-animation:fadeoutScale 200ms ease;}
body#dummybodyid #diigolet-tagForward *{-webkit-box-sizing:content-box!important;box-sizing:content-box!important;}
body#dummybodyid #diigolet-tagForward-topBar{height:38px;vertical-align:middle;background-color:#f5f5f5;border-bottom:1px solid #ddd;}
body#dummybodyid #diigolet-tagForward-topBar>span{line-height:38px;display:inline-block;margin-left:15px;color:#4B4B4B;font-size:16px;cursor:move;}
body#dummybodyid #diigolet-tagForward-topBar .focus-research-tip{margin-left:3px;font-size:12px;display:none;}
body#dummybodyid #diigolet-tagForward .tabContainer{text-align:center;margin:5px;}
body#dummybodyid #diigolet-tagForward .tab{margin-right:8px;margin-left:8px;padding:0 8px 2px 8px;font-weight:bold;}
body#dummybodyid #diigolet-tagForward .tabContainer a:link,body#dummybodyid #diigolet-tagForward .tabContainer a:visited{padding:4px;border:1px #fff solid;font-weight:bold;color:#06c;text-decoration:none;}
body#dummybodyid #diigolet-tagForward .tabContainer a.active:link,body#dummybodyid #diigolet-tagForward .tabContainer a.active:visited{border:none;background-color:#09f;color:#fff;padding:5px;}
body#dummybodyid #diigolet-tagForward .tabContainer a:hover,body#dummybodyid #diigolet-tagForward .tabContainer a:active{border:1px #09f solid;}
body#dummybodyid #diigolet-tagForward div.tabContent{display:none;}
body#dummybodyid #diigolet-tagForward div.tabContent.active{display:block;}
body#dummybodyid #diigolet-tagForward-caption{text-align:center;line-height:30px;font-size:14px;font-weight:bold;}
body#dummybodyid #diigolet-tagForward-remove{float:right;color:#f00;background:-webkit-linear-gradient(bottom,#ebebeb,#f5f5f5);margin-top:6px;margin-right:15px;cursor:pointer;height:24px;width:27px;border:1px solid #c4c4c4;border-radius:4px;box-shadow:0 1px 0 #fff;}
body#dummybodyid #diigolet-tagForward-remove:active{background:-webkit-linear-gradient(top,#ebebeb,#f5f5f5);}
body#dummybodyid #diigolet-tagForward-remove>span{float:left;background-image:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/remove.png');height:14px;width:11px;margin-top:5px;margin-left:8px;cursor:pointer;}
body#dummybodyid #diigolet-tagForward-remove:hover>span{background-position:0 -14px;}
body#dummybodyid #diigolet-Bookmark-Form{padding:20px 15px 0 15px;}
body#dummybodyid #diigolet-Bookmark-Form input[type="text"],body#dummybodyid #diigolet-Bookmark-Form textarea{outline:none;border:none;background-color:white;-webkit-transition:height .1s ease-in-out;}
body#dummybodyid #diigolet-Bookmark-Form input[type="text"]{line-height:20px;min-height:20px;}
body#dummybodyid #diigolet-tagForward .diigo-hr{width:426px;border-top:1px #ccc solid;margin:0 auto;height:1px;overflow:hidden;}
body#dummybodyid .diigolet .diigo-table{margin:10px 20px;}
body#dummybodyid .diigolet .diigo-table td{padding:2px 0;}
body#dummybodyid .diigolet .diigo-table th{color:#666;font-weight:bold;padding-right:5px;width:62px;text-align:left;font-size:12px!important;}
body#dummybodyid .diigolet .diigolet-input{width:350px;padding:1px;font-size:12px!important;height:16px!important;padding-left:3px!important;line-height:16px!important;outline:none!important;}
body#dummybodyid .diigolet .diigolet-input:focus{border:solid 1px #3996ed;-webkit-box-shadow:0 0 1px rgba(77,144,254,.55);}
body#dummybodyid #Diigo-Bookmark-Description,body#dummybodyid #Diigo-Forward-PS{border:1px solid #d7d7d7;background-color:white;-webkit-transition:border 400ms ease;min-height:56px;}
body#dummybodyid #Diigo-Bookmark-Description.focus{border:1px solid #aaa;}
body#dummybodyid #Diigo-Bookmark-Description-Input{width:413px;max-width:413px;font-family:Arial;height:45px;margin-left:6px;margin-top:3px;font-size:12px;padding:2px;}
body#dummybodyid #Diigo-Bookmark-Url{border-left:1px solid #DCDCDC;border-right:1px solid #DCDCDC;background-color:white;position:relative;-webkit-transform:rotateX(-90deg);height:0;position:relative;}
body#dummybodyid #Diigo-Bookmark-Url.fold{-webkit-animation:fold 400ms ease both;-webkit-animation-play-state:running;}
body#dummybodyid #Diigo-Bookmark-Url.unfold{-webkit-animation:unfold 400ms ease both;-webkit-animation-play-state:running;border-bottom:1px solid #DCDCDC;}
body#dummybodyid #Diigo-Bookmark-Url>div#url-arrow{height:6px;width:13px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/dp-arrow.png");position:absolute;left:11px;top:-6px;}
body#dummybodyid #Diigo-Bookmark-Url-Input{margin-top:3px;width:412px;margin-left:5px;}
body#dummybodyid #Diigo-Bookmark-Title{height:30px;border:1px solid #d7d7d7;background-color:white;-webkit-transition:border 400ms ease;position:relative;}
body#dummybodyid .diigolet .diigo-alert-tip{background-color:rgba(255,0,0,0.8);position:absolute;left:117px;top:-29px;padding:4px 6px;display:block;font-size:12px;font-weight:bold;pointer-events:none;font-family:arial,sans-serif;color:white;display:none;line-height:16px;}
body#dummybodyid .diigolet .diigo-alert-tip span{background:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/alert.png') -6px -4px no-repeat;text-indent:17px;display:inline-block;vertical-align:middle;}
body#dummybodyid .diigolet .diigo-alert-tip .diigo-alert-tip-arrow{position:absolute;border:5px solid;border-top-color:transparent;border-right-color:transparent;border-bottom-color:rgba(255,0,0,0.8);border-left-color:transparent;top:24px;height:0;width:0;line-height:0;-webkit-transform:rotate(180deg);left:91px;}
body#dummybodyid .diigolet #Diigo-Bookmark-Url .diigo-alert-tip{left:136px;}
body#dummybodyid .diigolet #Diigo-Bookmark-Url .diigo-alert-tip-arrow{left:71px;}
body#dummybodyid #Diigo-Bookmark-Title.focus{border:1px solid #aaa;}
body#dummybodyid #Diigo-Bookmark-Title-Input{margin:4px 0 0 0;width:392px;border:none;outline:none;font-size:14px;}
body#dummybodyid #Diigo-Bookmark-Title #link-icon{float:left;height:30px;width:30px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/URL.png") 4px 0 no-repeat;cursor:pointer;}
body#dummybodyid #Diigo-Bookmark-Title #link-icon:hover{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/URL.png") 4px -30px no-repeat;}
body#dummybodyid #Diigo-Bookmark-Title #link-icon.unfold{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/URL.png") 4px -30px no-repeat;}
body#dummybodyid #Diigo-Bookmark-Options .diigo-option{font-size:12px;height:inherit;width:120px;display:inline-block;padding:13px 0 15px 0;color:#555;}
body#dummybodyid .diigo-option:hover{background-position:0 -20px;}
body#dummybodyid .diigo-option:active{background-position:0 -40px;}
body#dummybodyid .diigo-option.active{background-position:0 -40px;}
body#dummybodyid .diigo-option .op-checkbox,body#dummybodyid #Diigo-Bookmark-checkShareExisting .op-checkbox{height:13px;width:15px;display:inline-block;vertical-align:middle;position:relative;cursor:pointer;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/checkbox.png");}
body#dummybodyid .diigo-option .op-label{margin-left:7px;text-indent:20px;display:inline-block;vertical-align:middle;cursor:pointer;}
body#dummybodyid #Diigo-Bookmark-checkShareExisting{display:none;}
body#dummybodyid #Diigo-Bookmark-checkShareExisting .op-label{margin-left:7px;text-indent:-6px;display:inline-block;vertical-align:middle;cursor:pointer;}
body#dummybodyid #Diigo-Bookmark-Options .op-checkbox-container{display:inline;cursor:pointer;}
body#dummybodyid #Diigo-Bookmark-uploadCache{margin-left:20px;}
body#dummybodyid .diigolet .op-checkbox-container:hover>.op-checkbox{background-position:0 -13px;}
body#dummybodyid .diigolet .op-checkbox-container.checked .op-checkbox{background-position:0 -26px;}
body#dummybodyid #Diigo-Bookmark-Privacy .op-label{background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/private.png");background-repeat:no-repeat;}
body#dummybodyid #Diigo-Bookmark-Unread .op-label{background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/op-readlater.png");background-repeat:no-repeat;}
body#dummybodyid #Diigo-Bookmark-uploadCache .op-label{background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/cache.png");background-repeat:no-repeat;}
body#dummybodyid #Diigo-Bookmark-Url.invalid{border:1px solid #f00;margin-top:-1px;}
body#dummybodyid #Diigo-Bookmark-Url.invalid div{background-position:0 -6px;}
body#dummybodyid #Diigo-Bookmark-Title.invalid{border:1px solid #f00;}
body#dummybodyid #Diigo-Bookmark-Tag-Wrapper{min-height:24px;border:1px solid #d7d7d7;background-color:white;margin-top:15px;position:relative;-webkit-transition:border 400ms ease;height:30px;}
body#dummybodyid #Diigo-Bookmark-Tag-Wrapper.focus{border:1px solid #aaa;}
body#dummybodyid #Diigo-Bookmark-Tag-Input{margin-top:4px;margin-left:2px;width:389px;}
body#dummybodyid #Diigo-Bookmark-Tag{height:30px;}
body#dummybodyid .diigolet #Diigo-Bookmark-Tag{box-shadow:none;}
body#dummybodyid #Diigo-Bookmark-Tag-Wrapper.active{border:solid 1px #3996ed;-webkit-box-shadow:0 0 1px rgba(77,144,254,.55);}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud{border:1px solid #d7d7d7;border-bottom-right-radius:3px;border-bottom-left-radius:3px;display:none;background-color:white;font-size:12px;margin-top:-1px;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud>div:first-child{height:25px;width:100%;line-height:25px;font-weight:bold;border-bottom:1px solid #ccc;text-indent:2px;clear:both;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud>div:first-child a{float:right;margin-right:3px;text-decoration:none;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud>div:first-child a:hover{text-decoration:underline;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud-Container{max-height:180px;overflow:auto;width:421px;padding:3px 5px 5px 0;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud-Container::-webkit-scrollbar{width:6px;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud-Container::-webkit-scrollbar-track-piece{background-color:transparent;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud-Container::-webkit-scrollbar-thumb:vertical{height:20px;background-color:#CCC;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud-Container::-webkit-scrollbar-thumb:hover{background-color:#aaa;}
body#dummybodyid #Diigo-Bookmark-Tag-Wrapper.opened+#Diigo-Bookmark-Tag-Cloud{visibility:visible;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud ul li{display:inline-block;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud .Diigo-Bookmark-Tag-item{margin-left:3px;text-decoration:none;color:#04c;line-height:normal;display:inline-block;line-height:140%;cursor:pointer;padding:0 2px;}
body#dummybodyid #Diigo-Bookmark-checkShare{display:none;}
body#dummybodyid #Diigo-Bookmark-checkShareExisting{margin-right:3px;}
body#dummybodyid #Diigo-Bookmark-checkShare input[type=checkbox]{width:14px;height:14px;margin:0;cursor:pointer;vertical-align:middle;background:#fff;border:1px solid #dcdcdc;-webkit-border-radius:1px;-moz-border-radius:1px;border-radius:1px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;position:relative!important;}
body#dummybodyid #Diigo-Bookmark-checkShare input[type=checkbox]:hover{border-color:#c6c6c6;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,0.1);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,0.1);box-shadow:inset 0 1px 1px rgba(0,0,0,0.1);}
body#dummybodyid #Diigo-Bookmark-checkShare input[type=checkbox]:active{border-color:#c6c6c6;background:#ebebeb;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud .Diigo-Bookmark-Tag-item.selected{background-color:#09f;color:white;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud>div:first-child{height:20px;width:100%;line-height:20px;font-weight:bold;border-bottom:1px solid #ccc;text-indent:2px;}
body#dummybodyid #Diigo-Bookmark-Tag-Cloud .Diigo-Bookmark-Tag-item:hover{text-decoration:underline;}
body#dummybodyid #Diigo-Bookmark-Tag-Eidt{float:right;margin-right:3px;}
body#dummybodyid #Diigo-Bookmark-Tag-suggestion{margin-top:7px;}
body#dummybodyid #diigolet-bm-tagListContainer-recommend{margin-top:3px;display:none;}
body#dummybodyid #Diigo-Bookmark-Tag-suggestion .diigo-su-tag{line-height:26px;font-size:12px;min-height:26px;margin-top:5px;}
body#dummybodyid #Diigo-Bookmark-Tag-suggestion .diigo-su-tag a{display:inline-block;text-decoration:none;color:#555;width:93px;}
body#dummybodyid #Diigo-Bookmark-Tag-suggestion .loading{display:inline-block;height:10px;width:120px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/loading.gif");}
body#dummybodyid #Diigo-Bookmark-Tag-suggestion .diigo-su-tag a:hover{text-decoration:underline;}
body#dummybodyid #Diigo-Bookmark-Tag-dropdown{height:30px;width:28px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/dropdown.png");float:left;cursor:pointer;}
body#dummybodyid #Diigo-Bookmark-Tag-dropdown:hover{background-position:0 -30px;}
body#dummybodyid .diigo-table .diigo-invalid-input{display:none;height:16px;width:16px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/icons.png");background-position:-16px -80px;margin-left:4px;}
body#dummybodyid #diigo-list-group{margin-top:17px;width:430px;height:24px;}
body#dummybodyid #diigolet-Bookmark-Form #Diigo-outliner #diigo-list-addInput{width:309px;height:26px;border:1px solid #d7d7d7;-webkit-transition:border 400ms ease;padding:0 3px;}
body#dummybodyid #Diigo-outliner{height:30px;margin-bottom:15px;}
body#dummybodyid #Diigo-outliner>div{float:left;height:20px;font-size:12px;color:#04c;font-weight:bold;line-height:20px;}
body#dummybodyid #diigo-list-group>div{float:left;height:20px;font-size:12px;color:#04c;width:200px;font-weight:bold;line-height:20px;}
body#dummybodyid #Diigo-outliner #diigo-list-add-tip{border-radius:4px;padding:5px 14px 5px 14px;font-size:12px;text-shadow:0 1px 0 rgba(255,255,255,0.5);background-color:#f2dede;border:1px solid #eed3d7;color:#b94a48;font-weight:normal;width:399px;display:none;}
body#dummybodyid #Diigo-outliner #diigo-list-add-tip a{float:right;margin:0 5px;color:b94a48;text-decoration:none;}
body#dummybodyid #Diigo-outliner #diigo-list-add-tip a:hover{text-decoration:underline;}
body#dummybodyid #Diigo-outliner #diigo-list-add{position:relative;display:none;}
body#dummybodyid #diigo-list-add .diigo-alert-tip{left:7px;top:-29px;}
body#dummybodyid #Diigo-outliner .diigo-alert-tip .diigo-alert-tip-arrow{left:43px;}
body#dummybodyid #diigo-list-group #diigo-list-addInput{width:102px;height:26px;border:1px solid #d7d7d7;-webkit-transition:border 400ms ease;padding:0 3px;font-weight:normal;color:#000;border-radius:0;}
body#dummybodyid #diigo-list-group #diigo-list-addInput:focus{border:1px solid #aaa;}
body#dummybodyid #diigo-list-add>*{float:left;}
body#dummybodyid #diigo-list-addBtn{height:26px;min-width:38px;background-image:-webkit-linear-gradient(top,#53aaf0,#118cef);border:1px solid #066ec1;color:#fff;border-radius:2px;line-height:26px;font-weight:normal;margin-left:6px;cursor:pointer;-webkit-transition:.3s cubic-bezier(0.175,0.885,0.32,1.275) all;text-align:center;}
body#dummybodyid #diigo-list-addBtn:not(.processing):hover{background-image:-webkit-linear-gradient(top,#45a2ee,#037bdb);}
body#dummybodyid #diigo-list-addBtn:not(.processing):active{background-image:-webkit-linear-gradient(bottom,#53aaf0,#118cef);}
body#dummybodyid #diigo-list-addBtn .label{margin:8px;cursor:pointer;-webkit-transition:.3s cubic-bezier(0.175,0.885,0.320,1.275) all;}
body#dummybodyid #diigo-list-addBtn .spinner{left:8px;margin-left:-16px;opacity:0;height:16px;width:16px;-webkit-transition:.3s cubic-bezier(0.175,0.885,0.320,1.275) all;display:inline-block;position:relative;top:3px;visibility:hidden;}
body#dummybodyid #diigo-list-addBtn.processing+a{display:none;}
body#dummybodyid #diigo-list-addBtn.processing .spinner{opacity:1;margin-left:12px;left:-7px;visibility:visible;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/addlist-processing.gif");}
body#dummybodyid #diigo-list-addCancel{color:#999;cursor:pointer;font-weight:normal;line-height:26px;margin-left:5px;font-size:12px;margin-top:2px;}
body#dummybodyid #diigo-list-addCancel:hover{text-decoration:underline;}
body#dummybodyid #diigo-list-group>div>select:hover{background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/select-arrow-hover.png"),-webkit-linear-gradient(top,#fbfbfb,#f3f3f3);}
body#dummybodyid #diigo-list-group>div>select.processing{background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/loading5.gif"),-webkit-linear-gradient(top,#f5f5f5,#fff);}
body#dummybodyid #diigo-list-group>div>select:active{background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/select-arrow-hover.png"),-webkit-linear-gradient(top,#f5f5f5,#fff);}
body#dummybodyid #diigolet-bm-tagListContainer-group{display:none;}
body#dummybodyid #diigo-list-group>div>select,body#dummybodyid #Diigo-outliner>div>select{height:28px;width:430px;display:block;-webkit-appearance:none!important;border:1px solid #d7d7d7;background-position:right;background-repeat:no-repeat;color:#333;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/popup-image/select-arrow.png"),-webkit-linear-gradient(top,#fff,#f5f5f5);outline:none;cursor:pointer;font-size:12px;padding-right:22px;border-radius:0;font-weight:normal;box-sizing:border-box!important;}
body#dummybodyid #Diigo-Bookmark-bottom{height:49px;padding-top:24px;}
body#dummybodyid #Diigo-Bookmark-bottom>div:first-child{float:left;margin-top:3px;margin-left:15px;}
body#dummybodyid #diigolet-dlgBm-btnSave{display:inline-block;height:28px;width:82px;line-height:28px;background-image:-webkit-linear-gradient(top,#53aaf0,#118cef);float:right;cursor:pointer;margin-right:15px;text-align:center;color:white;border-radius:2px;border:1px solid #066ec1;font-size:14px;}
body#dummybodyid #diigolet-dlgBm-btnSave:hover{background-image:-webkit-linear-gradient(top,#45a2ee,#037bdb);}
body#dummybodyid #diigolet-dlgBm-btnSave:active{background-image:-webkit-linear-gradient(bottom,#53aaf0,#118cef);}
body#dummybodyid #diigolet-dlgBm-btnCancel{display:inline-block;float:right;font-size:14px;color:#999;height:12px;cursor:pointer;margin-top:8px;margin-right:19px;}
body#dummybodyid #diigolet-dlgBm-btnCancel:hover{text-decoration:underline;}
body#dummybodyid .diigolet .diigolet-submit{width:140px;height:25px;text-align:center;}
body#dummybodyid #diigolet-txtPermalink{background-color:#eee;padding:3px;font-size:13px;}
body#dummybodyid #diigolet-cross-promotion{font-family:arial,helvetica,sans-serif;font-size:12px;padding:10px;}
body#dummybodyid #diigolet-cross-promotion a{background:whiteSmoke;border:1px solid #CCC;color:#06C;display:block;padding:3px 10px;text-align:center;text-decoration:none;-webkit-box-shadow:rgba(255,255,255,0.6) 0 1px 0;-webkit-border-radius:10px;-webkit-transition:all .25s linear;}
body#dummybodyid #diigolet-cross-promotion a:hover{background:white;text-decoration:none;color:#04c;}
body#dummybodyid .diigoletContexMenu{font:12px arial,helvetica,clean,sans-serif;z-index:2147483645;}
body#dummybodyid #diigolet-csm #diigolet-csm-research-mode{width:18px;height:18px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/focus-research-csm.png");position:absolute;top:-8px;left:-9px;z-index:1;display:none;}
body#dummybodyid #diigolet-csm.diigo-researchMode #diigolet-csm-research-mode{display:block;}
body#dummybodyid #diigolet-csm .csm-action{display:block;height:22px!important;width:27px!important;border:1px solid rgba(0,0,0,.15);border-radius:1px 0 0 1px;opacity:.9;z-index:100000;float:left;margin:0!important;}
body#dummybodyid #diigolet-csm #diigolet-csm-highlight{background-image:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/highlight-csm.png),-webkit-linear-gradient(#fff,#f5f5f5);}
body#dummybodyid #diigolet-csm #diigolet-csm-highlight:active{background-image:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/highlight-csm.png),-webkit-linear-gradient(#f2f2f2,#fff);}
body#dummybodyid #diigolet-csm #diigolet-csm-highlightAndComment{border-width:1px 1px 1px 0;border-style:solid;border-color:rgba(0,0,0,.15);border-radius:1px 0 0 1px;background-image:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/stickynote-csm.png),-webkit-linear-gradient(#fff,#f5f5f5);}
body#dummybodyid #diigolet-csm #diigolet-csm-highlightAndComment:active{background-image:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/stickynote-csm.png),-webkit-linear-gradient(#f2f2f2,#fff);}
body#dummybodyid #diigolet-csm #diigolet-csm-search{border-width:1px 1px 1px 0;border-style:solid;border-color:rgba(0,0,0,.15);border-radius:1px 0 0 1px;background-image:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/search-csm.png),-webkit-linear-gradient(#fff,#f5f5f5);}
body#dummybodyid #diigolet-csm #diigolet-csm-search:active{background-image:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/search-csm.png),-webkit-linear-gradient(#f2f2f2,#fff);}
body#dummybodyid #diigolet-csm.yellow #diigolet-csm-highlight{background-position:0 0;}
body#dummybodyid #diigolet-csm.blue #diigolet-csm-highlight{background-position:0 -22px;}
body#dummybodyid #diigolet-csm.green #diigolet-csm-highlight{background-position:0 -44px;}
body#dummybodyid #diigolet-csm.pink #diigolet-csm-highlight{background-position:0 -66px;}
body#dummybodyid #diigolet-csm.yellow #diigolet-csm-highlightAndComment{background-position:0 0;}
body#dummybodyid #diigolet-csm.blue #diigolet-csm-highlightAndComment{background-position:0 -22px;}
body#dummybodyid #diigolet-csm.green #diigolet-csm-highlightAndComment{background-position:0 -44px;}
body#dummybodyid #diigolet-csm.pink #diigolet-csm-highlightAndComment{background-position:0 -66px;}
body#dummybodyid #diigolet-csm .csm-action:not(#diigolet-csm-search).editing{opacity:1!important;}
body#dummybodyid #diigolet-csm a:visited,body#dummybodyid #diigolet-csm a:link{padding:0!important;}
body#dummybodyid #diigolet-csm{z-index:100000;height:22px!important;}
body#dummybodyid #diigolet-csm>div{float:left;position:relative;}
body#dummybodyid #diigolet-csm a:hover{opacity:1!important;}
body#dummybodyid #diigolet-csm #diigolet-csm-dropdown:hover{background-position:0 -44px;}
body#dummybodyid #diigolet-csm #diigolet-csm-highlight:hover+a#diigolet-csm-dropdown{background-position:0 -22px;}
body#dummybodyid #diigolet-csm #diigolet-csm-dropdown:active{background-position:0 -66px;}
body#dummybodyid #diigolet-csm .diigolet-csm-color{position:absolute;top:23px;left:1px;background-color:white;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.35);line-height:13px;overflow:hidden;height:0;visibility:visible!important;z-index:-1;display:block!important;}
body#dummybodyid #diigolet-csm-highlightAndComment-wrapper .diigolet-csm-color{left:0;}
body#dummybodyid #diigolet-csm .diigolet-csm-color.hidden{height:0;}
body#dummybodyid #diigolet-csm .diigolet-csm-color.small{height:0;width:27px;display:block;}
body#dummybodyid #diigolet-csm .diigolet-csm-coloritem{float:left;display:block;cursor:pointer;padding:0;margin:0;}
body#dummybodyid .diigolet-csm-color.small .diigolet-csm-coloritem{height:7px;width:10px;}
body#dummybodyid #diigolet-csm .diigolet-csm-coloritem.yellow{background-color:#fc6;border:1px solid #fc6;margin-right:1px;margin-bottom:1px;margin-left:1px;margin-top:1px;}
body#dummybodyid #diigolet-csm .diigolet-csm-coloritem.blue{background-color:#7ccce5;border:1px solid #7ccce5;margin-bottom:1px;margin-top:1px;}
body#dummybodyid #diigolet-csm .diigolet-csm-coloritem.green{background-color:#b4db66;border:1px solid #b4db66;margin-right:1px;margin-left:1px;margin-bottom:1px;}
body#dummybodyid #diigolet-csm .diigolet-csm-coloritem.pink{background-color:#f98baf;border:1px solid #f98baf;margin-right:0!important;margin-bottom:1px;}
body#dummybodyid #diigolet-csm .diigolet-csm-color .diigolet-csm-coloritem:hover{border-color:#36c;}
body#dummybodyid #diigolet-annMenu{height:26px;border-top:2px solid #43B4EA;border-radius:2px;background-color:#fff;padding:1px;position:absolute;box-shadow:-1px 0 0 rgba(0,0,0,0.1),1px 0 0 rgba(0,0,0,0.1),0px 1px 1px rgba(0,0,0,0.2);-webkit-user-select:none;-webkit-animation:fadeIn 130ms ease-in;box-sizing:content-box!important;}
body#dummybodyid #diigolet-annMenu .diigolet-annMenu-item{height:20px;width:20px;float:left;padding:1px;position:relative;cursor:pointer;-webkit-transition:background-color 200ms ease;border-radius:3px;padding:3px;box-sizing:content-box!important;}
body#dummybodyid #diigolet-annMenu .diigolet-annMenu-item *{box-sizing:content-box!important;}
body#dummybodyid #diigolet-annMenu .diigolet-annMenu-item>b{cursor:pointer;}
body#dummybodyid #diigolet-annMenu .diigolet-annMenu-item:hover{background-color:#d8f2ff;}
body#dummybodyid #diigolet-annMenu #diigolet-annMenu-currentColor{height:12px;width:12px;border:1px solid #289FE4;margin:3px 0 0 2px;}
body#dummybodyid #diigolet-annMenu #diigolet-annMenu-currentColor>b{height:10px;width:10px;border:1px solid #fff;display:block;background-color:#fc6;cursor:pointer;}
body#dummybodyid #diigolet-annMenu #diigolet-annMenu-currentColor.yellow>b{background-color:#fc6;}
body#dummybodyid #diigolet-annMenu #diigolet-annMenu-currentColor.blue>b{background-color:#7ccce5;}
body#dummybodyid #diigolet-annMenu #diigolet-annMenu-currentColor.green>b{background-color:#b4db66;}
body#dummybodyid #diigolet-annMenu #diigolet-annMenu-currentColor.pink>b{background-color:#f98baf;}
body#dummybodyid #diigolet-annMenu .diigolet-annMenu-item>b{display:block;height:20px;width:20px;}
body#dummybodyid #diigolet-annMenu-add>b{background-image:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/ann-add.png');}
body#dummybodyid #diigolet-annMenu-share>b{background-image:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/ann-share.png');}
body#dummybodyid #diigolet-annMenu-del>b{background-image:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/ann-del.png');}
body#dummybodyid #diigolet-annMenu-more>b{background-image:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/ann-more.png');}
body#dummybodyid #diigolet-annMenu-colorPicker{height:62px;width:14px;border:1px solid #96bbd5;padding:3px 2px;background-color:#fff;position:relative;top:3px;left:-1px;display:none;-webkit-animation:diigo-dropdown .15s ease-in 1;}
body#dummybodyid #diigolet-annMenu-colorPicker .ann-colorItem{height:12px;width:12px;border-width:1px;border-style:solid;display:block;margin-bottom:2px;}
body#dummybodyid #diigolet-annMenu-colorPicker .ann-colorItem:hover{border-color:#06f!important;}
body#dummybodyid #diigolet-annMenu-colorPicker .ann-colorItem.colorchecked b{width:4px;height:4px;background:#666;margin-top:4px;margin-left:4px;display:block;}
body#dummybodyid .ann-colorItem#diigolet-context-yellow{border-color:#e9a110;background-color:#fc6;}
body#dummybodyid .ann-colorItem#diigolet-context-blue{border-color:#33a5c9;background-color:#7ccce5;}
body#dummybodyid .ann-colorItem#diigolet-context-green{border-color:#9ac83b;background-color:#b4db66;}
body#dummybodyid .ann-colorItem#diigolet-context-pink{border-color:#da376c;background-color:#f98baf;}
body#dummybodyid #diigolet-annMenu-arrow{position:absolute;top:100%;left:33px;height:8px;width:14px;background-image:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/ann-arrow.png);}
body#dummybodyid #diigolet-annMenu.onlyMy #diigolet-annMenu-arrow{left:59px;}
body#dummybodyid #diigolet-annMenu-tip{padding-left:4px;border-top:1px solid #eee;margin-top:1px;color:#999;}
body#dummybodyid #diigolet-annMenu-moreThings{display:none;position:absolute;top:110%;left:77%;min-width:236px;max-width:236px;padding:3px;border:1px solid #94bcd6;box-shadow:0 1px 2px rgba(0,0,0,.15);background-color:#fff;border-radius:3px;font:12px/18px arial;color:#333;}
body#dummybodyid .diigoletContexMenu a:link,body#dummybodyid .diigoletContexMenu a:visited{display:block;padding:2px 3px;text-decoration:none;color:#000;cursor:default;white-space:nowrap;}
body#dummybodyid .diigoletContexMenu a:hover:not(.colorItem),body#dummybodyid .diigoletContexMenu a:active{color:#fff;background:#09f;}
body#dummybodyid .diigoletContexMenu div.sep{line-height:0;border-top:1px solid #AAA;margin:3px 0;}
body#dummybodyid *html .diigoletContexMenu ._selection a{width:45px;}
body#dummybodyid *html .diigoletContexMenu ._highlight a{width:90px;}
body#dummybodyid .diigolet.diigoletFN{z-index:2147483644;width:300px;-webkit-user-select:none;}
body#dummybodyid .diigolet.diigoletFN *{flex-direction:row;}
body#dummybodyid #diigolet-dlg-sticky.groupNew #FN-post-form{display:block;}
body#dummybodyid #diigolet-dlg-sticky.groupNew #FN-group-content-nav{display:none;}
body#dummybodyid #diigolet-dlg-sticky.groupNew #FN-group-content{display:none;}
body#dummybodyid .diigolet.diigoletFN.onlyPrivate #diigolet-dlg-sticky-switcher{margin-left:29px;}
body#dummybodyid .diigolet.diigoletFN.onlyGroup #diigolet-dlg-sticky-switcher{margin-left:29px;}
body#dummybodyid #diigolet-dlg-sticky-top{height:30px;border-radius:2px 2px 0 0;position:relative;z-index:2;-webkit-transition:background-color 200ms ease;padding-right:5px;}
body#dummybodyid #diigolet-dlg-sticky.yellow #diigolet-dlg-sticky-top{background:#f1c40f;}
body#dummybodyid #diigolet-dlg-sticky.blue #diigolet-dlg-sticky-top{background:#5cc7ff;}
body#dummybodyid #diigolet-dlg-sticky.green #diigolet-dlg-sticky-top{background:#47bf87;}
body#dummybodyid #diigolet-dlg-sticky.pink #diigolet-dlg-sticky-top{background:#fe97bc;}
body#dummybodyid #diigolet-dlg-sticky-content{background-color:#fcfbf7;border-radius:0 0 2px 2px;border-width:0 1px 1px 1px;border-color:rgba(0,0,0,.08);border-style:solid;box-shadow:0 1px 3px rgba(0,0,0,.08);position:relative;}
body#dummybodyid #diigolet-dlg-sticky-logo{float:left;height:20px;width:20px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/FN-logo.png") 50% 50% no-repeat;margin:4px 5px 0 4px;}
body#dummybodyid #diigolet-dlg-sticky-top>span{vertical-align:middle;line-height:28px;font-size:14px;color:#bb6602;}
body#dummybodyid #diigolet-dlg-sticky-close{float:right;height:20px;width:20px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/FN-close.png") 50% 50% no-repeat;margin:5px 4px 0 0;cursor:pointer;display:none;}
body#dummybodyid #diigolet-dlg-sticky-color{position:relative;float:right;margin:7px 4px 0 0;cursor:pointer;z-index:2;}
body#dummybodyid #diigolet-dlg-sticky-addTab{height:12px;width:21px;margin:9px 7px 0 0;display:none;float:right;cursor:pointer;}
body#dummybodyid #diigolet-dlg-sticky.onlyPrivate #diigolet-dlg-sticky-addTab{display:block;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/add-tab.png") 0 0 no-repeat;}
body#dummybodyid #diigolet-dlg-sticky.onlyGroup #diigolet-dlg-sticky-addTab{display:block;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/add-tab.png") 0 -12px no-repeat;}
body#dummybodyid #diigolet-dlg-sticky-currentColor{height:12px;width:12px;border:1px solid #fff;cursor:pointer;border-radius:1px;}
body#dummybodyid #diigolet-dlg-sticky-colorPicker{height:62px;width:13px;padding:3px 3px 3px 2px;background-color:#fff;position:absolute;top:122%;left:-2px;display:none;-webkit-animation:diigo-dropdown .15s ease-in 1;box-shadow:0 1px 1px rgba(0,0,0,0.25);z-index:3;}
body#dummybodyid #diigolet-dlg-sticky-colorPicker .dlg-colorItem{height:12px;width:12px;border-width:1px;border-style:solid;display:block;margin-bottom:2px;}
body#dummybodyid #diigolet-dlg-sticky-colorPicker .dlg-colorItem[color="yellow"]{border-color:#e9a110;background-color:#fc6;}
body#dummybodyid #diigolet-dlg-sticky-colorPicker .dlg-colorItem[color="blue"]{border-color:#33a5c9;background-color:#7ccce5;}
body#dummybodyid #diigolet-dlg-sticky-colorPicker .dlg-colorItem[color="green"]{border-color:#9ac83b;background-color:#b4db66;}
body#dummybodyid #diigolet-dlg-sticky-colorPicker .dlg-colorItem[color="pink"]{border-color:#da376c;background-color:#f98baf;}
body#dummybodyid #diigolet-dlg-sticky-colorPicker .dlg-colorItem.colorchecked b{width:4px;height:4px;background:#666;margin-top:4px;margin-left:4px;display:block;}
body#dummybodyid #diigolet-dlg-sticky-colorPicker .dlg-colorItem:hover{border-color:#06f!important;}
body#dummybodyid .FN-content-wrapper{display:none;opacity:0;-webkit-animation:fadeIn .2s ease-out;}
body#dummybodyid 0%{opacity:0;}
body#dummybodyid 100%{opacity:1;}
body#dummybodyid .FN-content-wrapper.private{min-height:120px;}
body#dummybodyid #diigolet-dlg-sticky-content .FN-content-wrapper.private textarea{margin:6px 6px 0 6px;min-height:104px;width:282px;background-color:#fcfbf7;border:none;outline:none;overflow-y:visible;resize:none!important;font-size:12px;line-height:18px;word-wrap:break-word;}
body#dummybodyid #diigolet-dlg-sticky-content #FN-content-footer{text-align:right;margin-top:-5px;}
body#dummybodyid #diigolet-dlg-sticky-content #FN-content-footer #editing{height:30px;border-top:1px solid #ECECE7;display:none;}
body#dummybodyid #diigolet-dlg-sticky-content #FN-content-footer #editing a{float:right;}
body#dummybodyid #diigolet-dlg-sticky-content #FN-content-footer #editing #FN-private-saveBtn{height:20px;width:50px;border-radius:2px;border:1px solid #85a0a6;color:#85a0a6;font-size:12px;text-align:center;line-height:20px;margin:4px 4px 4px 10px;}
body#dummybodyid #diigolet-dlg-sticky-content #FN-content-footer #editing #FN-private-saveBtn:active{background:#85a0a6;color:#fff;}
body#dummybodyid #diigolet-dlg-sticky-content #FN-content-footer #editing #FN-private-cancelBtn{text-decoration:none;color:#A3A39E;font-size:12px;line-height:30px;}
body#dummybodyid #diigolet-dlg-sticky-content #FN-content-footer #editing #FN-private-cancelBtn:hover{text-decoration:underline;}
body#dummybodyid #diigolet-dlg-sticky-content #FN-content-footer #editDone{height:22px;}
body#dummybodyid #FN-private-saveBtn.notify{-webkit-animation:borderNotice 600ms ease both;-webkit-animation-iteration-count:2;}
body#dummybodyid #FN-content-footer #FN-private-datetime{font-family:Arial,Helvetica;font-size:12px;color:#999;line-height:22px;margin-right:10px;float:right;}
body#dummybodyid #FN-content-footer #FN-private-delete{display:none;float:left;vertical-align:middle;line-height:22px;margin-left:8px;color:#999;cursor:pointer;-webkit-transition:color 200ms ease;}
body#dummybodyid #FN-content-footer #FN-private-delete b{display:block;float:left;height:12px;width:11px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/private-del.png");background-repeat:no-repeat;margin:5px 3px 0 0;cursor:pointer;}
body#dummybodyid #FN-content-footer #FN-private-delete:hover{color:red;}
body#dummybodyid #FN-content-footer #FN-private-delete:hover b{background-position:0 -12px;}
body#dummybodyid .FN-content-wrapper.group{min-height:50px;}
body#dummybodyid .FN-radio{display:none;}
body#dummybodyid #diigolet-dlg-sticky-switcher{position:absolute;left:82px;top:-25px;z-index:2;}
body#dummybodyid #diigolet-dlg-sticky-switcher.onlyOneTab span{margin-left:28px;}
body#dummybodyid #diigolet-dlg-sticky-switcher .FN-switcher{float:left;height:14px;text-align:center;font-size:12px;cursor:pointer;padding:3px 8px;color:#fff;line-height:14px;-webkit-transition:background-color 200ms ease;border-radius:2px;}
body#dummybodyid #diigolet-dlg-sticky-switcher .FN-switcher b{height:12px;width:13px;float:left;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/tab-logo.png");background-repeat:no-repeat;margin:1px 1px 0 0;cursor:pointer;}
body#dummybodyid #diigolet-dlg-sticky-content.private #FN-switcher-private{background-color:rgba(0,0,0,.12);}
body#dummybodyid #diigolet-dlg-sticky-content #FN-switcher-private b{background-position:0 0;}
body#dummybodyid #diigolet-dlg-sticky-content #FN-switcher-group b{background-position:0 -12px;}
body#dummybodyid #diigolet-dlg-sticky-content.group #FN-switcher-group{background-color:rgba(0,0,0,.12);}
body#dummybodyid #diigolet-dlg-sticky.onlyPrivate #FN-switcher-group{display:none;}
body#dummybodyid #diigolet-dlg-sticky.onlyGroup #FN-switcher-private{display:none;}
body#dummybodyid #diigolet-dlg-sticky-content.private .FN-content-wrapper.private{opacity:1;display:block;}
body#dummybodyid #diigolet-dlg-sticky-content.group .FN-content-wrapper.group{opacity:1;-webkit-transition:opacity ease-out .2s .1s;display:block;}
body#dummybodyid #FN-post-form{padding:10px;display:none;}
body#dummybodyid #FN-post-form>div:last-child{margin-top:6px;}
body#dummybodyid #FN-post-form textarea{width:272px;max-width:272px;height:54px;outline:none;line-height:18px;border:1px solid #ddd;}
body#dummybodyid #FN-post-form textarea.notify,body#dummybodyid #FN-post-form select.notify{-webkit-animation:borderNotice 600ms ease both;-webkit-animation-iteration-count:2;}
body#dummybodyid #FN-post-form button{float:right;margin:0;height:24px;width:50px;text-align:center;background-image:-webkit-linear-gradient(top,#fff,#f5f5f5);border:1px solid #ccc;font-size:14px;border-radius:2px;cursor:pointer;-webkit-transition:.3s cubic-bezier(0.175,0.885,0.32,1.275) all,10ms ease background-color;overflow:hidden;position:relative;}
body#dummybodyid #FN-post-form .button-label{-webkit-transition:.3s cubic-bezier(0.175,0.885,0.32,1.275) all;position:relative;cursor:pointer;z-index:3;}
body#dummybodyid #FN-post-form .button-spinner{position:absolute;z-index:2;display:inline-block;width:18px;height:18px;opacity:0;-webkit-transition:.3s cubic-bezier(0.175,0.885,0.32,1.275) all;left:31px;margin-left:-16px;margin-top:-10px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/uploading.gif");}
body#dummybodyid #FN-post-form textarea:disabled{color:#999;background-color:#eee;}
body#dummybodyid #FN-post-form button:disabled{background-color:#ddd;background-image:none;cursor:default;}
body#dummybodyid #FN-post-form button:disabled .button-label{opacity:0;top:16px;}
body#dummybodyid #FN-post-form button:disabled .button-spinner{opacity:1;top:12px;}
body#dummybodyid #FN-post-form a{float:right;font-size:12px;text-decoration:none;color:#aaa;margin:5px 12px 5px 5px;}
body#dummybodyid #FN-post-form a:hover{text-decoration:underline;}
body#dummybodyid #FN-post-form.notEdit #FN-group-share{margin-left:67px;}
body#dummybodyid #FN-post-form.notEdit div:first-child{display:none;}
body#dummybodyid #FN-post-form.notEdit button,body#dummybodyid #FN-post-form.notEdit a{display:none;}
body#dummybodyid #FN-group-content-nav{width:100%;height:25px;border-bottom:1px solid #eee;color:#333;font-size:12px;text-align:center;position:relative;z-index:1;}
body#dummybodyid #FN-current-group{line-height:25px;padding:2px 10px;cursor:pointer;}
body#dummybodyid #FN-current-group b{height:0;width:0;border-width:5px;border-style:solid;border-bottom-color:transparent;border-left-color:transparent;border-right-color:transparent;border-top-color:#666;display:inline-block;margin:2px 2px 0 6px;vertical-align:middle;cursor:pointer;}
body#dummybodyid #FN-current-group span{cursor:pointer;}
body#dummybodyid #FN-group-menu{margin:0;position:absolute;width:196px;top:90%;left:50px;background-color:#fff;border:1px solid rgba(0,0,0,.12);text-align:left;box-shadow:0 1px 2px rgba(0,0,0,.1);-webkit-animation:diigo-dropdown .15s ease-in 1;padding:2px;display:none;}
body#dummybodyid #FN-group-content-nav li{list-style:none;height:20px;width:100%;line-height:20px;font-size:12px;color:#333;cursor:pointer;text-indent:9px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
body#dummybodyid #FN-group-share-new-ul{margin-top:2px;padding-top:2px;border-top:1px solid #ccc;}
body#dummybodyid #FN-group-content-nav li:hover{background-color:#aaa;color:#fff;}
body#dummybodyid #FN-group-content-container{min-height:80px;max-height:200px;overflow-y:auto;padding:0 10px 10px 10px;margin-top:-1px;}
body#dummybodyid #FN-group-content-container .FN-group-comment-item{border-top:1px solid #eee;padding:5px 0;position:relative;}
body#dummybodyid #FN-group-content-container .FN-group-comment-item-tbar{position:relative;font-size:12px;}
body#dummybodyid #FN-group-content-container .FN-group-comment-item-content{font-size:12px;line-height:18px;}
body#dummybodyid #FN-group-content-container .FN-group-comment-item-tbar .FN-group-comment-name{text-decoration:none;margin-right:3px;color:#0072d6;float:left;}
body#dummybodyid #FN-group-content-container .FN-group-comment-item-time{font-size:12px;color:#777;}
body#dummybodyid #FN-group-content-postform{padding:10px;position:relative;}
body#dummybodyid #FN-group-content-postform textarea{height:18px;width:204px;max-width:208px;border:1px solid #d7d7d7;outline:none;line-height:18px;vertical-align:bottom;-webkit-transition:background-color .1s ease-in-out;}
body#dummybodyid #FN-group-content-postform.active textarea{height:36px;border-color:#aaa;}
body#dummybodyid #FN-group-content-postform textarea.notify{-webkit-animation:borderNotice 600ms ease both;-webkit-animation-iteration-count:2;}
body#dummybodyid #FN-group-content-postform textarea:disabled{color:#999;background-color:#eee;}
body#dummybodyid #FN-group-content-postform .post-action{vertical-align:bottom;display:inline-block;width:50px;padding:0 0 0 14px;}
body#dummybodyid #FN-group-content-postform .post-action a{position:relative;left:4px;top:2px;color:#aaa;display:none;}
body#dummybodyid #FN-group-content-postform.active .post-action a{display:block;}
body#dummybodyid #FN-group-content-postform .post-action a:hover{text-decoration:underline;}
body#dummybodyid #FN-group-content-postform button{margin:0;height:24px;width:50px;text-align:center;background-image:-webkit-linear-gradient(top,#fff,#f5f5f5);border:1px solid #ccc;font-size:14px;cursor:pointer;-webkit-transition:.3s cubic-bezier(0.175,0.885,0.32,1.275) all,10ms ease background-color;overflow:hidden;position:relative;}
body#dummybodyid #FN-group-content-postform .button-label{-webkit-transition:.3s cubic-bezier(0.175,0.885,0.32,1.275) all;position:relative;cursor:pointer;z-index:3;}
body#dummybodyid #FN-group-content-postform .button-spinner{position:absolute;z-index:2;display:inline-block;width:18px;height:18px;opacity:0;-webkit-transition:.3s cubic-bezier(0.175,0.885,0.32,1.275) all;left:31px;margin-left:-16px;margin-top:-10px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/uploading.gif");}
body#dummybodyid #FN-group-content-postform button:disabled{background-color:#ddd;background-image:none;cursor:default;}
body#dummybodyid #FN-group-content-postform button:disabled .button-label{opacity:0;top:16px;}
body#dummybodyid #FN-group-content-postform button:disabled .button-spinner{opacity:1;top:12px;}
body#dummybodyid #FN-group-content-container .FN-group-comment-item-delete{text-decoration:none;font-size:12px;color:#999;cursor:pointer;visibility:hidden;float:right;}
body#dummybodyid #FN-group-content-container .FN-group-comment-item:hover .FN-group-comment-item-delete{visibility:visible;}
body#dummybodyid #FN-group-content-container .FN-group-comment-item-delete:hover{color:red;}
body#dummybodyid #diigolet-dlg-sticky-content ::-webkit-scrollbar{width:8px;}
body#dummybodyid #diigolet-dlg-sticky-content ::-webkit-scrollbar-track-piece{background-color:transparent;}
body#dummybodyid #diigolet-dlg-sticky-content ::-webkit-scrollbar-thumb:vertical{height:20px;background-color:#CCC;}
body#dummybodyid #diigolet-dlg-sticky-content ::-webkit-scrollbar-thumb:hover{background-color:#aaa;}
body#dummybodyid #diigolet-dlg-sticky-content select{-webkit-appearance:none;width:150px;height:24px;border:1px solid #ccc;background-position:right;background-repeat:no-repeat;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/FN-select-arrow.png"),-webkit-linear-gradient(top,#fff,#fafafa);outline:none;cursor:pointer;font-size:12px;border-radius:2px;padding-right:14px;}
body#dummybodyid .diigolet.diigoletFN a:link,body#dummybodyid .diigolet.diigoletFN a:visited{color:#06c;}
body#dummybodyid .diigolet.diigoletFN a:hover,body#dummybodyid .diigolet.diigoletFN a:active{color:#333;text-decoration:none;}
body#dummybodyid .diigolet .diigoletFNL{width:23px;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_l.png) no-repeat left top;}
body#dummybodyid .diigolet .diigoletFNT{height:32px;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_t.png) no-repeat right top;cursor:move!important;}
body#dummybodyid .diigolet .diigoletFNR{width:16px;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_r.png) no-repeat left bottom;overflow:hidden;vertical-align:bottom;}
body#dummybodyid .diigolet .diigoletFNB{height:34px;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_b.png) no-repeat left bottom;}
body#dummybodyid .diigolet .diigoletFNTH{vertical-align:top;width:12px;}
body#dummybodyid .diigolet .diigoletFNTH div{width:12px;height:12px;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_h_rt.gif) no-repeat right top;position:relative;top:5px;left:-22px;overflow:hidden;cursor:ne-resize!important;}
body#dummybodyid .diigolet .diigoletFNB{vertical-align:top;overflow:hidden;}
body#dummybodyid .diigolet .diigoletFNPosN .diigoletFNXjjR,body#dummybodyid .diigolet .diigoletFNPosN .diigoletFNXjjT,body#dummybodyid .diigolet .diigoletFNPosN .diigoletFNXjjB,body#dummybodyid .diigolet .diigoletFNPosN .diigoletFNTH div,body#dummybodyid .diigolet .diigoletFNPosN .diigoletFNB div{display:none;}
body#dummybodyid .diigolet .diigoletFNT h1{font:12px/19px Arial,Helvetica,sans-serif;font-weight:bold;color:#666;margin:4px 0 0 5px;padding:0;}
body#dummybodyid .diigolet .diigoletFNT div.menu{margin:3px 21px 10px 0;background-color:#fff9a4;border-right:1px solid #f2e984;border-left:1px solid #c9b822;}
body#dummybodyid .diigolet .diigoletFNT div.menu a{display:block;line-height:19px;float:left;color:#666;padding:0 5px;border-right:1px solid #c9b822;text-decoration:none;}
body#dummybodyid .diigolet .diigoletFNT div.menu a:hover,body#dummybodyid .diigolet .diigoletFNT div.menu a:active{background-color:#fff587;color:#333;}
body#dummybodyid .diigolet .diigoletFNT div.menu a.diigoletFNOpt{background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_downdot.gif) no-repeat right top;padding-right:14px;}
body#dummybodyid .diigolet .diigoletFNT{font:12px/32px Arial,Helvetica,sans-serif;}
body#dummybodyid .diigolet .diigoletFNContent,body#dummybodyid .diigolet .diigoletFNComment{background-color:#fff89f;color:#666;font-family:Arial,Helvetica,sans-serif;font-size:11px;overflow:auto;width:355px;zoom:1;border-bottom:1px solid #E0DB9D;}
body#dummybodyid .diigolet .diigoletFNContent .diigoletFNAuthorP{font-size:10px;font-weight:normal;color:#666;margin:0 11px 5px 0;padding:2px 5px;line-height:100%;}
body#dummybodyid .diigolet .diigoletFNContent .diigoletFNAuthorP .diigoletFNAuthor{border-bottom:1px dotted #ccc;color:#06c;}
body#dummybodyid .diigolet .diigoletFNContent .diigoletFNAuthorP .diigoletFNAuthor:hover,body#dummybodyid .diigoletFNContent .diigoletFNAuthorP .diigoletFNAuthor:active{border-bottom:1px solid #ccc;color:#333;}
body#dummybodyid .diigolet .diigoletFNContent .diigoletFNAuthorP a{color:#999;}
body#dummybodyid .diigolet .diigoletFNContent .diigoletFNAuthorP a:hover,body#dummybodyid .diigoletFNContent .diigoletFNAuthorP a:active{color:#666;}
body#dummybodyid .diigolet.diigoletFN blockquote{display:inline-block;}
body#dummybodyid .diigolet .diigoletFNComment select,body#dummybodyid .diigolet .diigoletFNComment input,body#dummybodyid .diigolet .diigoletFNComment textarea{font:11px/15px Verdana,Arial,Helvetica,sans-serif;max-width:345px;}
body#dummybodyid .diigolet .diigoletFNComment p{margin:5px 0;}
body#dummybodyid .diigolet .diigoletFNTDiv{height:32px;overflow:hidden;}
body#dummybodyid .diigolet.diigoletFN .menu{float:right;height:19px;overflow:hidden;}
body#dummybodyid .diigolet .labelList label{margin-right:2px;background-color:#eee;color:#666;white-space:nowrap;font-weight:normal;font-size:9px;}
body#dummybodyid .diigolet .labelList span{padding:0 2px;}
body#dummybodyid .diigolet .labelList a{padding:0 2px;background-color:#ffe76a;}
body#dummybodyid .diigolet .labelList a:hover{color:#fef5c7;text-decoration:none;}
body#dummybodyid .diigolet .labelList a.del{border:none;padding-right:2px;font-weight:normal;}
body#dummybodyid .diigolet a.del{cursor:pointer;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletIconv3.gif") no-repeat left -343px;}
body#dummybodyid .diigolet a.del:hover{filter:alpha(opacity=100);-moz-opacity:1;background-position:1px -342px;text-decoration:none;}
body#dummybodyid .diigolet ul.diigoletFNDropdown{position:absolute;display:none;left:10px;background-color:#fff89f;border:1px solid #c9b822;z-index:2147483647;}
body#dummybodyid .diigolet ul.diigoletFNDropdown li{padding-left:25px;}
body#dummybodyid .diigolet ul.diigoletFNDropdown a:link,body#dummybodyid .diigolet ul.diigoletFNDropdown a:visited{color:#666;display:block;width:85px;font:11px Arial,Helvetica,sans-serif;}
body#dummybodyid .diigolet ul.diigoletFNDropdown a:hover,body#dummybodyid .diigolet ul.diigoletFNDropdown a:active{background-color:#fff567;color:#333;}
body#dummybodyid .diigolet.diigoletFNIEPatch .diigoletFNL{background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_l.gif) no-repeat left top;}
body#dummybodyid .diigolet.diigoletFNIEPatch .diigoletFNT{background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_t.gif) no-repeat right top;}
body#dummybodyid .diigolet.diigoletFNIEPatch .diigoletFNR{background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_r.gif) no-repeat left bottom;}
body#dummybodyid .diigolet.diigoletFNIEPatch .diigoletFNB{background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_b.gif) no-repeat left bottom;}
body#dummybodyid .diigolet.diigoletFNIEPatch .diigoletFNT{height:23px;}
body#dummybodyid .diigolet.diigoletFNIEPatch .diigoletFNTDiv{height:23px;}
body#dummybodyid .diigoletFN.editing .diigoletFNComment{display:block;}
body#dummybodyid .personalText{color:#555!important;font-size:10px!important;display:inline-block;overflow:hidden!important;text-overflow:ellipsis!important;white-space:nowrap!important;width:343px!important;margin-top:4px!important;}
body#dummybodyid .IconFeild{float:left!important;margin-left:8px!important;margin-top:5px!important;}
body#dummybodyid .IconFeild:hover .editIcon{background-position:right!important;}
body#dummybodyid .multipalCol{padding-top:0!important;}
body#dummybodyid .singleCol{padding-top:7px!important;}
body#dummybodyid .myCommentSpan{margin-left:35px!important;}
body#dummybodyid .notMyCommentSpan{margin-left:15px!important;}
body#dummybodyid .footText{line-height:1.5;width:343px!important;}
body#dummybodyid div.floatNote{position:absolute!important;width:34px;height:34px;text-align:center;background-image:url('chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_icon.png')!important;background-repeat:no-repeat;z-index:2147483643;}
body#dummybodyid div.floatNote.private.yellow{background-position:0 0;}
body#dummybodyid div.floatNote.private.blue{background-position:0 -68px;}
body#dummybodyid div.floatNote.private.green{background-position:0 -136px;}
body#dummybodyid div.floatNote.private.pink{background-position:0 -204px;}
body#dummybodyid div.floatNote.group.yellow{background-position:0 -34px;}
body#dummybodyid div.floatNote.group.blue{background-position:0 -102px;}
body#dummybodyid div.floatNote.group.green{background-position:0 -170px;}
body#dummybodyid div.floatNote.group.pink{background-position:0 -238px;}
body#dummybodyid div.floatNote.diigoshow{-webkit-animation:bounceIn 400ms ease both;-webkit-animation-play-state:running;}
body#dummybodyid div.floatNote.diigoadd{-webkit-animation:flipInY 600ms ease both;-webkit-animation-play-state:running;}
body#dummybodyid div.floatNote span{position:absolute;left:-4px;top:-3px;display:block;border-radius:15px;background-color:#666;padding:2px 3px;border:1px solid #fff;height:8px;font-size:11px;color:#fff;line-height:8px;}
html body#dummybodyid div.floatNote{filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=scale,src="chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_icon.png");overflow:hidden;background:none;overflow:visible;}
body#dummybodyid em.diigoHighlight{text-align:inherit;text-decoration:inherit;line-height:inherit;font:inherit;color:inherit;display:inline;position:relative;zoom:1;margin:0;padding:0;}
body#dummybodyid em.diigoHighlight.hover{cursor:move;}
body#dummybodyid em.diigoHighlight.hover.yellow{background-color:#F5F548;}
body#dummybodyid em.diigoHighlight.hover.blue{background-color:#84B9EF;}
body#dummybodyid em.diigoHighlight.hover.green{background-color:#A0DE60;}
body#dummybodyid em.diigoHighlight.hover.pink{background-color:#F9B0B0;}
body#dummybodyid em.diigoHighlight.diigoHighlightcommented{margin-right:25px;}
body#dummybodyid em.diigoHighlight.mouseOvered{background-color:#ffc62a!important;}
body#dummybodyid em.diigoHighlight.yellow{background-color:#FF9;}
body#dummybodyid img.diigoHighlight.yellow{cursor:pointer;outline:2px solid #FF9!important;}
body#dummybodyid em.diigoHighlight.blue{background-color:#ABD5FF;}
body#dummybodyid img.diigoHighlight.blue{cursor:pointer;outline:2px solid #ABD5FF!important;}
body#dummybodyid em.diigoHighlight.green{background-color:#B2E57E;}
body#dummybodyid img.diigoHighlight.green{cursor:pointer;outline:2px solid #B2E57E!important;}
body#dummybodyid em.diigoHighlight.pink{background-color:#fcc;}
body#dummybodyid img.diigoHighlight.pink{cursor:pointer;outline:2px solid #fcc!important;}
body#dummybodyid img.diigoHighlight.mouseOvered{cursor:pointer;outline:2px solid #ffc62a!important;}
body#dummybodyid .diigolet .diigolet-closeBtn{position:absolute;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/close1.gif);width:14px;height:14px;top:2px;right:2px;cursor:pointer!important;}
body#dummybodyid .ac_results{border:1px solid #ddd;background:#fff none repeat scroll 0;cursor:pointer!important;font-size:11px!important;left:0;position:absolute;width:392px;z-index:2147483647;border-radius:1px;}
body#dummybodyid .ac_results ul{margin:0;padding:0;}
body#dummybodyid .ac_results li{list-style-image:none;list-style-position:outside;list-style-type:none;padding:2px 5px;border-radius:1px;}
body#dummybodyid .ac_results a{width:100%;}
body#dummybodyid .ac_results li.over{color:white;background:#09f none repeat scroll 0;}
body#dummybodyid #gtooltip{background-color:#2a2a2a;border:1px solid #fff;color:#fff;display:block;font-size:12px!important;font-weight:bold!important;opacity:0;padding:4px 6px!important;pointer-events:none;position:absolute!important;-webkit-transition:visibility .13s,opacity .13s ease-out,left 0 linear .13s,top 0 linear .13s;-moz-transition:visibility .13s,opacity .13s ease-out,left 0 linear .13s,top 0 linear .13s;-o-transition:visibility .13s,opacity .13s ease-out,left 0 linear .13s,top 0 linear .13s;transition:visibility .13s,opacity .13s ease-out,left 0 linear .13s,top 0 linear .13s;visibility:hidden;font-family:arial,sans-serif!important;z-index:2147483647;top:-100px;left:-100px;line-height:15px!important;}
body#dummybodyid #gtooltip.show{visibility:visible;opacity:1;-webkit-transition:visibility 0,opacity .13s ease-in;}
body#dummybodyid #gtooltip #gtooltip-arrow{position:absolute!important;border:5px solid!important;border-top-color:transparent!important;border-right-color:transparent!important;border-bottom-color:#2a2a2a!important;border-left-color:transparent!important;height:0!important;width:0!important;line-height:0!important;}
body#dummybodyid #gtooltip #gtooltip-content{white-space:nowrap!important;}
body#dummybodyid .diigo-scrollmarker{height:6px;width:6px;cursor:pointer;overflow:hidden;font-size:12px;z-index:1000000;border-radius:20px;}
body#dummybodyid #diigolet-highlight-share{background-color:#fcfbf7;width:402px;font-family:Arial,Helvetica,sans-serif;-webkit-border-radius:0;cursor:default;position:absolute;z-index:2147483646;box-shadow:0 1px 3px rgba(0,0,0,.08);background-clip:content-box;visibility:hidden;opacity:0;border-radius:2px;}
body#dummybodyid #diigolet-highlight-share.show{opacity:1;visibility:visible;}
body#dummybodyid #diigolet-highlight-share-top{height:30px;vertical-align:middle;background-color:#39baf6;line-height:30px;padding:0 10px;font-size:14px;color:white;text-align:left;border-radius:2px 2px 0 0;}
body#dummybodyid .diigolet-question-mark{height:12px;width:12px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/q-mark.png");cursor:pointer;position:relative;display:inline-block;margin:9px 7px 0 6px;}
body#dummybodyid .diigolet-question-mark-tip{padding:5px;position:absolute;bottom:139%;left:-82px;display:none;width:180px;color:#7f8d99;border-radius:2px;box-shadow:0 0 0 2px rgba(0,0,0,.2);background:#fff;font:normal 12px/14px Arial,helvetica,sans-serif;}
body#dummybodyid #diigolet-highlight-share-close{float:right;height:16px;width:16px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/win-close.png") 50% 50% no-repeat;margin-top:7px;opacity:.5;cursor:pointer;}
body#dummybodyid #diigolet-highlight-share-close:hover{opacity:1;}
body#dummybodyid #diigolet-highlight-container{border-radius:0 0 2px 2px;border-width:0 1px 1px 1px;border-color:rgba(0,0,0,.08);border-style:solid;}
body#dummybodyid #diigolet-highlight-main{padding:10px 10px;}
body#dummybodyid #diigolet-highlight-share-textarea{border:1px solid #d7d7d7;outline:none;width:372px;height:42px;max-width:374px;line-height:18px;-webkit-transition:border-color 200ms ease;font:12px/14px Arial;min-height:42px;padding:3px 3px;resize:vertical;box-sizing:content-box;}
body#dummybodyid #diigolet-highlight-share-textarea:disabled{background-color:#eee;}
body#dummybodyid #diigolet-highlight-share-textarea:focus{border:1px solid #AAA;}
body#dummybodyid .clearfloat:after{display:block;clear:both;content:"";visibility:hidden;height:0;}
body#dummybodyid .clearfloat{zoom:1;}
body#dummybodyid #diigolet-highlight-footer{padding:0 10px 10px 10px;position:relative;}
body#dummybodyid #diigolet-highlight-footer a{float:right;}
body#dummybodyid #diigolet-highlight-share-copybtn{height:24px;width:60px;line-height:24px;cursor:pointer;text-align:center;color:white;border-radius:2px;border:1px solid #066ec1;font-size:12px;text-decoration:none;border-radius:2px;border:1px solid #85a0a6;color:#85a0a6;font-size:12px;text-align:center;}
body#dummybodyid #diigolet-highlight-share-copybtn:active{background:#85a0a6;color:#fff;}
body#dummybodyid #diigolet-highlight-share-cancelbtn{color:#999;height:12px;font-size:12px;margin:6px 14px 0 0;text-decoration:none;border:none!important;}
body#dummybodyid #diigolet-highlight-share-cancelbtn:hover{text-decoration:underline;}
body#dummybodyid #diigolet-highlight-footer .diigolet-highlight-social-btn{float:left!important;height:26px;width:26px;margin-right:12px;}
body#dummybodyid #diigolet-highlight-share-twitter{background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/highlight-share.png");}
body#dummybodyid #diigolet-highlight-share-facebook{background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/highlight-share.png");background-position:-26px 0;}
body#dummybodyid #diigolet-highlight-share-copySuccess{position:absolute;top:0;right:85px;padding:5px 10px;background:#FFF1A8;color:black;border-radius:3px;line-height:18px;font-size:12px;-webkit-transition:all .3s;opacity:0;-webkit-transform-style:preserve-3d;-webkit-transform:rotateY(-70deg);}
body#dummybodyid #diigolet-highlight-share-copySuccess.show{-webkit-transform:rotateY(0deg);opacity:1;}
body#dummybodyid #diigo-annotationList{background-color:#fff;width:423px;font-family:Arial,Helvetica,sans-serif;-webkit-border-radius:0;cursor:default;z-index:2147483646;box-shadow:0 1px 3px rgba(0,0,0,0.08);background-clip:content-box;border-radius:2px;position:fixed;top:52px;left:0;-webkit-animation:slideInRight 200ms ease;}
body#dummybodyid #diigo-annotationList-btn{height:20px;width:20px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/warning-orphanHighlight.png");position:fixed;right:0;top:55px;cursor:pointer;z-index:1000001;}
body#dummybodyid #diigo-annotationList-top{height:30px;vertical-align:middle;background-color:#39BAF6;line-height:30px;padding:0 10px;font-size:14px;color:#FFF;text-align:left;border-radius:2px 2px 0 0;text-indent:5px;}
body#dummybodyid #diigo-annotationList-top b{height:12px;width:14px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/list-icon.png");float:left;margin-top:10px;margin-left:-4px;display:block;}
body#dummybodyid #diigo-annotationList-close{float:right;height:16px;width:16px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/win-close.png") 50% 50% no-repeat;margin-top:7px;opacity:.5;cursor:pointer;}
body#dummybodyid #diigo-annotationList-close:hover{opacity:1;}
body#dummybodyid #diigo-annotationList-toolbar{height:30px;font:normal 12px/30px arial,Helvetica;}
body#dummybodyid #diigo-annotationList-toolbar span{float:left;color:#333;margin-left:10px;}
body#dummybodyid #diigo-annotationList-toolbar a{float:right;margin-right:10px;text-decoration:none;color:#0072d6;}
body#dummybodyid #diigo-annotationList-box{border-radius:0 0 2px 2px;border-width:0 1px 1px 1px;border-color:rgba(0,0,0,0.08);border-style:solid;padding:5px 6px 0 6px;position:relative;max-height:300px;overflow:auto;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item{margin-bottom:8px;position:relative;background-color:#f9f9f9;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-orphan .diigo-annotationList-highlight,body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-orphan .diigo-annotationList-sticky{padding-right:19px;}
body#dummybodyid .diigo-annotationList-item .diigo-annotationList-orphan-warning{height:19px;width:19px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/orphan-warning.png");position:absolute;top:0;right:0;opacity:.65;}
body#dummybodyid .diigo-orphan-warning{height:15px;width:15px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/orphan-warning-small.png");float:left;opacity:.65;margin-right:4px;margin-top:7px;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-highlight{padding:6px 6px;font:normal 12px/14px arial,Helvetica;color:#333;border-left-style:solid;border-left-width:4px;border-bottom:1px solid #eee;position:relative;word-wrap:break-word;white-space:normal;word-break:break-all;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-yellow .diigo-annotationList-highlight{border-left-color:#FFBA01;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-blue .diigo-annotationList-highlight{border-left-color:#6EAAF5;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-green .diigo-annotationList-highlight{border-left-color:#7BBD3F;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-pink .diigo-annotationList-highlight{border-left-color:#FF9C9C;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-sticky{padding:6px 6px 6px 26px;font:normal 12px/14px arial,Helvetica;color:#333;background-color:#f9f9f9;border-left-style:solid;border-left-width:4px;border-left-color:#DDD;border-bottom:1px solid #eee;position:relative;word-wrap:break-word;white-space:normal;word-break:break-all;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-yellow .diigo-annotationList-sticky .diigo-anntationList-floatIcon{background-position:0 -16px;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-blue .diigo-annotationList-sticky .diigo-anntationList-floatIcon{background-position:0 -32px;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-green .diigo-annotationList-sticky .diigo-anntationList-floatIcon{background-position:0 -48px;}
body#dummybodyid #diigo-annotationList-box .diigo-annotationList-item.diigo-pink .diigo-annotationList-sticky .diigo-anntationList-floatIcon{background-position:0 -64px;}
body#dummybodyid .diigo-annotationList-item .diigo-annotationList-item-action{position:absolute;right:1px;bottom:1px;font:normal 10px/12px arial,Helvetica;display:none;z-index:10000;}
body#dummybodyid .diigo-annotationList-item .diigo-annotationList-item-btn{background-color:rgba(0,0,0,0.3);padding:2px;color:#fff;cursor:pointer;z-index:1;opacity:.8;float:left;margin-left:5px;}
body#dummybodyid .diigo-annotationList-item .diigo-annotationList-item-btn:hover{opacity:1;}
body#dummybodyid .diigo-annotationList-commentItem{padding:5px 6px;background-color:#f9f9f9;word-break:break-all;border-left-style:solid;border-left-width:4px;border-left-color:#DDD;border-bottom:1px solid #eee;font:normal 12px/14px arial,Helvetica;}
body#dummybodyid .diigo-annotationList-item:hover .diigo-annotationList-item-action{display:block;}
body#dummybodyid .diigo-anntationList-floatIcon{background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/float_note_icon.png");height:16px;width:16px;position:absolute;left:5px;top:5px;}
body#dummybodyid #diigo-annotationList-main{position:relative;}
body#dummybodyid #diigo-annotationList-notification{height:30px;width:150px;border:2px solid rgba(0,0,0,.15);position:absolute;left:50%;top:50%;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/success.png") 5px 50% no-repeat;text-indent:26px;font:normal 12px/30px arial,Helvetica;background-color:#fff;border-radius:2px;-webkit-transform:translate(-50%,-50%);background-clip:content-box;z-index:1;display:none;}
body#dummybodyid #diigo-annotationList-noItem{padding:10px;font-weight:bold;}
body#dummybodyid .diigo-customize-scrollbar::-webkit-scrollbar{width:6px;}
body#dummybodyid .diigo-customize-scrollbar::-webkit-scrollbar-track-piece{background-color:transparent;}
body#dummybodyid .diigo-customize-scrollbar::-webkit-scrollbar-thumb:vertical{height:20px;background-color:#CCC;}
body#dummybodyid .diigo-customize-scrollbar::-webkit-scrollbar-thumb:hover{background-color:#aaa;}
body#dummybodyid .diigolet-highlight-selected{-webkit-animation:highlight 800ms ease-in-out;}
body#dummybodyid #diigo-ext-tutorial-wrapper{position:fixed;bottom:0;right:0;left:0;top:0;background:rgba(0,0,0,.8);text-align:center;font-family:arial,Helvetica;z-index:10000;font-size:16px!important;visibility:hidden;opacity:0;transition:opacity .2s linear;}
body#dummybodyid #diigo-ext-tutorial-wrapper.active{visibility:visible;opacity:1;}
body#dummybodyid #diigo-ext-tutorial-panel{display:inline-block;width:805px;height:664px;border-radius:5px;background:white;vertical-align:middle;position:relative;transform:scale(0.95);transition:transform .2s linear;}
body#dummybodyid #diigo-ext-tutorial-wrapper.active #diigo-ext-tutorial-panel{transform:scale(1);}
body#dummybodyid #diigo-ext-tutorial-panel .diigo-ext-tutorial-btn{display:block;height:36px;width:36px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/back_icon.png");position:absolute;top:300px;transition:transfrom 200ms ease;}
body#dummybodyid #diigo-ext-tutorial-panel .diigo-ext-tutorial-btn:active{transform:scale(0.95);}
body#dummybodyid #diigo-ext-tutorial-panel #diigo-ext-tutorial-prev{left:-64px;display:none;}
body#dummybodyid #diigo-ext-tutorial-panel #diigo-ext-tutorial-next{-webkit-transform:rotate(180deg);right:-64px;}
body#dummybodyid #diigo-ext-tutorial-panel #diigo-ext-tutorial-next:active{transform:scale(0.95) rotate(180deg);}
body#dummybodyid #diigo-ext-tutorial-panel #diigo-ext-tutorial-close{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/close_icon.png");right:-64px;display:none;}
body#dummybodyid #diigo-ext-tutorial-banner{height:169px;border-radius:5px 5px 0 0;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/bg.png"),#4e8df7;color:white;position:relative;overflow:hidden;}
body#dummybodyid #diigo-ext-tutorial-banner-text{height:65px;position:relative;top:38px;transform:translate3d(0,-80px,0);opacity:0;transition:transform .5s cubic-bezier(0.77,0,0.175,1) .2s,opacity .5s cubic-bezier(0.77,0,0.175,1) .2s;}
body#dummybodyid #diigo-ext-tutorial-banner-text>div{font-size:19px;}
body#dummybodyid #diigo-ext-tutorial-banner-text span{line-height:47px;font-size:24px;font-weight:600;}
body#dummybodyid #diigo-ext-tutorial-wrapper::after{display:inline-block;height:100%;margin-left:-.05em;content:'';vertical-align:middle;}
body#dummybodyid #diigo-ext-tutorial-container{height:495px;border-radius:0 0 5px 5px;position:relative;}
body#dummybodyid .diigo-ext-tutorial-slide{visibility:hidden;opacity:0;position:absolute;left:0;right:0;transition:opacity 600ms ease-in-out;}
body#dummybodyid #diigo-ext-tutorial-wrapper.active .diigo-ext-tutorial-slide.active{visibility:visible;opacity:1;}
body#dummybodyid .diigo-ext-tutorial-slide .left,body#dummybodyid .diigo-ext-tutorial-slide .right{float:left;}
body#dummybodyid .diigo-ext-tutorial-slide .left{width:350px;}
body#dummybodyid .diigo-ext-tutorial-slide .right{width:400px;text-align:left;color:#757575;}
body#dummybodyid .diigo-ext-tutorial-slide .right>div{width:360px;line-height:20px;}
body#dummybodyid #diigo-tutorial-image1{height:347px;width:297px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/save.png");margin:22px 0 0 83px;}
body#dummybodyid #diigo-tutorial-image2{height:421px;width:186px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/screenshot.png");margin:22px 0 0 83px;}
body#dummybodyid #diigo-tutorial-image3{height:312px;width:537px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/highlighted.png");margin:75px 0 0 25px;}
body#dummybodyid .diigo-ext-tutorial-3 .left{width:581px;}
body#dummybodyid .diigo-ext-tutorial-3 .right{width:auto;}
body#dummybodyid .diigo-ext-tutorial-3 .right>div{width:194px;}
body#dummybodyid #diigo-tutorial-image4{height:302px;width:261px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/outliner.png");margin:83px 0 0 62px;}
body#dummybodyid .diigo-ext-tutorial-4 .left{width:350px;}
body#dummybodyid .diigo-ext-tutorial-4 .right{width:auto;}
body#dummybodyid .diigo-ext-tutorial-4 .right>div{width:375px;}
body#dummybodyid #diigo-ext-tutorial-elem1{position:absolute;left:138px;bottom:0;height:80px;width:74px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/spaceman.png");transform:translate3d(0,80px,0);transition:transform 600ms cubic-bezier(0.77,0,0.175,1);}
body#dummybodyid #diigo-ext-tutorial-elem2{position:absolute;right:97px;bottom:79px;height:48px;width:48px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/moon.png");transform:scale(0);transition:transform .5s cubic-bezier(0.77,0,0.175,1);}
body#dummybodyid #diigo-ext-tutorial-elem3{position:absolute;right:97px;bottom:-34px;height:118px;width:125px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/img/tutorial/rocket.png");transform:translate3d(100px,84px,0);transition:transform .5s cubic-bezier(0.77,0,0.175,1);}
body#dummybodyid #diigo-ext-tutorial-wrapper.active.step4 #diigo-ext-tutorial-elem1,body#dummybodyid #diigo-ext-tutorial-wrapper.active.step4 #diigo-ext-tutorial-elem2,body#dummybodyid #diigo-ext-tutorial-wrapper.active.step4 #diigo-ext-tutorial-elem3{transform:translate3d(0,0,0);transform:scale(1);}
body#dummybodyid #diigo-ext-tutorial-wrapper.active.step2 #diigo-ext-tutorial-elem1{transform:translate3d(0,0,0);}
body#dummybodyid #diigo-ext-tutorial-wrapper.active.step3 #diigo-ext-tutorial-elem2,body#dummybodyid #diigo-ext-tutorial-wrapper.active.step3 #diigo-ext-tutorial-elem1{transform:translate3d(0,0,0);}
body#dummybodyid #diigo-ext-tutorial-wrapper.active #diigo-ext-tutorial-banner-text{transform:translate3d(0,0,0);opacity:1;}
body#dummybodyid #diigo-code-clipper{height:24px;width:24px;background:red;position:absolute;opacity:.5;cursor:pointer;}
body#dummybodyid #diigo-code-clipped{position:absolute;display:inline-block;padding:0 4px;font-size:12px;border-radius:2px;text-align:center;color:white;background:rgba(0,0,0,.5);}
body#dummybodyid #diigo-code-clipper .clipped-area{display:none;}
body#dummybodyid #diigo-code-clipper.clipped{pointer-events:none;font-size:12px;display:inline-block;width:auto;}
body#dummybodyid #diigo-code-clipper.clipped .clipped-area{display:block;}
body#dummybodyid #diigo-code-clipper:hover{opacity:1;}
body#dummybodyid #d3df-sidebar{border:1px #ccc solid;z-index:99997;}
body#dummybodyid #d3df-sidebar div.heading{padding:3px;font-size:13px;border-top:1px #E8EEF7 solid;font-weight:bold;zoom:1;}
body#dummybodyid #d3df-sidebar div.popOut{width:16px;height:16px;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/popout.gif) no-repeat scroll left top;cursor:pointer;}
body#dummybodyid #d3df-sidebar div.popOut.popIn{background-image:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/popin.gif);}
body#dummybodyid #d3df-sidebar div.popOut.close{background-image:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/close1.gif);}
body#dummybodyid #d3df-sidebar div.heading a.add{background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletIconv1.gif) no-repeat scroll left -172px;padding-left:18px;display:block;float:right;font-weight:normal;}
body#dummybodyid #d3df-sidebar a.togglePanel{background:transparent url(http://www.diigo.com/images/v2/eoc.gif) no-repeat scroll left top;display:block;float:right;width:16px;height:16px;}
body#dummybodyid #d3df-sidebar a.togglePanel.collapsed{background-position:left bottom;}
body#dummybodyid #d3df-sidebar ul,body#dummybodyid #d3df-sidebar ul li{list-style:none;overflow:hidden;zoom:1;}
body#dummybodyid #d3df-sidebar li.highlight a.highlight{overflow:hidden;height:24px;zoom:1;}
body#dummybodyid #d3df-sidebar ul.highlights li{margin:1px;}
body#dummybodyid #d3df-sidebar ul.comments li{margin:1px;padding:2px;}
body#dummybodyid #d3df-sidebar div.noComments{font-size:11px;text-align:center;padding:15px 5px;}
body#dummybodyid #d3df-sidebar p.commentBody,body#dummybodyid #d3df-sidebar p.commentBody a{font-size:11px;}
body#dummybodyid #d3df-sidebar a.avatar{float:left;margin-right:3px;}
body#dummybodyid #d3df-sidebar a.avatar img{padding:1px;border:1px #CCC solid;width:32px;height:32px;}
body#dummybodyid #d3df-sidebar .commentInfo{font-size:12px;}
body#dummybodyid #d3df-sidebar .commentInfo a{border-bottom:1px dotted #999;}
body#dummybodyid #d3df-sidebar a.highlight{line-height:24px;padding-left:18px;display:block;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletIconv1.gif) no-repeat scroll left -192px;}
body#dummybodyid #d3df-sidebar a.floatNote{padding-left:16px;background:transparent url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/diigoletIconv1.gif) no-repeat scroll left -144px;}
body#dummybodyid #d3df-sidebar a.highlight .jumpTo{line-height:24px;padding-left:5px;font-size:12px;font-style:italic;}
body#dummybodyid #d3df-sidebar.themeDefault .bgColor1{background-color:#C3D9FF;}
body#dummybodyid #d3df-sidebar.themeDefault .bgColor2{background-color:#E8EEF7;}
body#dummybodyid #d3df-sidebar.themeDefault .bgColor3{background-color:#FFF;}
body#dummybodyid #d3df-sidebar.themeDefault .color1{color:#999;}
body#dummybodyid #d3df-sidebar.themeDefault .color2{color:#333;}
body#dummybodyid.diigoHiPen-yellow{cursor:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/highlighter-orange.cur) 4 15,text!important;}
body#dummybodyid.diigoHiPen-blue{cursor:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/highlighter-blue.cur) 4 15,auto!important;}
body#dummybodyid.diigoHiPen-green{cursor:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/highlighter-green.cur) 4 15,text!important;}
body#dummybodyid.diigoHiPen-pink{cursor:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/ietoolbar-images/highlighter-pink.cur) 4 15,text!important;}
body#dummybodyid .diigolet.notice{font:bold 13px/1.5 Helvetica,Arial,sans-serif;position:fixed;top:5px;left:0;width:100%;text-align:center;z-index:2147483647;height:1px;-webkit-animation:fadeIn 400ms ease;}
body#dummybodyid .diigolet.notice>div{border:1px solid #fad42e;background:#fea;border-radius:5px;color:#000;display:inline-block;padding:5px 10px 5px 5px;-webkit-box-shadow:rgba(0,0,0,0.3) 0 1px 1px;}
body#dummybodyid .diigolet.notice>div>b{display:inline-block;height:16px;width:16px;margin:2px 3px 0 0;background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/icons.png) 0 -80px no-repeat;float:left;}
body#dummybodyid .diigolet.notice>div>p>a{font-size:12px;}
body#dummybodyid .diigolet.notice>div>p{float:left;max-width:420px;}
body#dummybodyid .diigolet.notice>div.alert{background:#fef6f3;border-color:#cd0a0a;}
body#dummybodyid .diigolet.notice>div.alert p #retry{margin-left:3px;text-decoration:underline;}
body#dummybodyid .diigolet.notice>div.alert>b{background-position:-16px -80px;}
body#dummybodyid .diigolet.notice>div.info>b{background-position:-32px -80px;}
body#dummybodyid .diigolet.notice>div.wait>b{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/processing.gif) no-repeat scroll left 0 transparent;}
body#dummybodyid .diigolet.notice div #close{display:block;height:12px;width:12px;background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/close.png);float:right;margin-left:10px;margin-top:3px;}
body#dummybodyid .diigolet.notice div #close:hover{background-position:0 -12px;}
body#dummybodyid #diigolet-panel-panel{z-index:2147483641;}
body#dummybodyid #diigolet-panel-panel.notSignedIn .signedIn{display:none;}
body#dummybodyid #diigolet-panel-panel.signedIn .notSignedIn{display:none;}
body#dummybodyid #diigolet-panel-panel{height:36px;border-top-left-radius:19px;border-bottom-left-radius:19px;font:normal 12px/1.5 Helvetica,Arial,sans-serif;position:fixed;left:5px;top:5px;background-color:#fff;white-space:nowrap;border:1px solid #ccc;-webkit-user-select:none;background-clip:content-box;box-shadow:0 2px 10px rgba(0,0,0,.2);}
body#dummybodyid #diigolet-panel-panel:hover #diigolet-panel-space{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -379px 0 no-repeat;opacity:.4;}
body#dummybodyid #diigolet-panel-panel.fold #diigolet-panel-logo{opacity:1;width:28px;}
body#dummybodyid #diigolet-panel-panel.fold #diigolet-panel-main{width:0;border-radius:0;}
body#dummybodyid #diigolet-panel-panel.orphanHighlight.fold #diigolet-panel-logo{background-position:-84px 0;}
body#dummybodyid #diigolet-panel-panel.orphanHighlight.fold #diigolet-panel-logo:hover{background-position:-112px 0;}
body#dummybodyid .clearfloat:after{display:block;clear:both;content:"";visibility:hidden;height:0;}
body#dummybodyid .clearfloat{zoom:1;}
body#dummybodyid #diigolet-panel-main{height:36px;display:inline-block;background-color:rgba(255,255,255,1);border-radius:19px 0 0 19px;overflow:hidden;-webkit-transition:left 100ms ease-in-out;}
body#dummybodyid #diigolet-panel-logo{display:inline-block;width:0;height:36px;border-top-left-radius:19px;border-bottom-left-radius:19px;background-image:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/di.png");background-position:0 0;background-color:#fff;opacity:0;cursor:pointer;}
body#dummybodyid #diigolet-panel-logo:hover{background-position:-28px 0;}
body#dummybodyid #diigolet-panel-space{width:12px;height:36px;display:inline-block;background-color:#fff;}
body#dummybodyid #diigolet-panel-panel .diigolet-panel-btn{height:36px;float:left;}
body#dummybodyid #diigolet-panel-panel .diigolet-panel-btn>b{height:36px;width:36px;display:block;cursor:pointer;margin:0 auto;-webkit-transition:background-color 200ms ease;}
body#dummybodyid #diigolet-panel-panel .diigolet-panel-btn>b:hover{background-color:#E7F0FF;}
body#dummybodyid #diigolet-panel-panel .diigolet-panel-btn>b:active{-webkit-transform:scale(.9);}
body#dummybodyid #diigolet-panel-fold{height:36px;float:left;cursor:pointer;width:19px;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") 0 0 no-repeat;}
body#dummybodyid #diigolet-panel-fold:hover{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -38px 0 no-repeat;}
body#dummybodyid #diigolet-panel-Highlight{width:48px;}
body#dummybodyid #diigolet-panel-btnHighlight{width:34px;height:36px;float:right;}
body#dummybodyid #diigolet-panel-btnHighlight>b{height:36px;width:36px;display:block;cursor:pointer;-webkit-transition:background-color 200ms ease,border-radius 200ms ease;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -105px 0 no-repeat;}
body#dummybodyid #diigolet-panel-Highlight.pen #diigolet-panel-btnHighlight>b{height:36px;width:36px;margin:0;}
body#dummybodyid #diigolet-panel-Highlight:not(.pen) #diigolet-panel-btnHighlight>b:hover{background-color:#E7F0FF!important;}
body#dummybodyid #diigolet-panel-btnHighlight>b:active{-webkit-transform:scale(.9);}
body#dummybodyid #diigolet-panel-Highlight.pen #diigolet-panel-btnHighlight>b{background-color:#E7F0FF;-webkit-transform:scale(0.9);}
body#dummybodyid #diigolet-panel-btnHighlight.yellow>b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -73px 0 no-repeat;}
body#dummybodyid #diigolet-panel-btnHighlight.blue>b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -105px 0 no-repeat;}
body#dummybodyid #diigolet-panel-btnHighlight.green>b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -137px 0 no-repeat;}
body#dummybodyid #diigolet-panel-btnHighlight.pink>b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -169px 0 no-repeat;}
body#dummybodyid #diigolet-panel-hightlight-dropdown.yellow>b{background-color:#ffb000;}
body#dummybodyid #diigolet-panel-hightlight-dropdown.blue>b{background-color:#39abed;}
body#dummybodyid #diigolet-panel-hightlight-dropdown.green>b{background-color:#7c0;}
body#dummybodyid #diigolet-panel-hightlight-dropdown.pink>b{background-color:#f6b;}
body#dummybodyid #diigolet-panel-hightlight-dropdown{width:14px;height:36px;float:right;background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -360px 0 no-repeat;cursor:pointer;}
body#dummybodyid #diigolet-panel-hightlight-dropdown:hover{background-color:#E7F0FF;}
body#dummybodyid #diigolet-panel-hightlight-dropdown>b{height:5px;width:5px;border-radius:12px;display:block;margin-top:16px;margin-left:5px;cursor:pointer;}
body#dummybodyid #diigolet-panel-btnStickyNote{width:42px;}
body#dummybodyid #diigolet-panel-btnStickyNote b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -234px -1px no-repeat;}
body#dummybodyid #diigolet-panel-btnBookmark{width:42px;}
body#dummybodyid #diigolet-panel-btnBookmark b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -296px -1px no-repeat;}
body#dummybodyid #diigolet-panel-btnBookmark.diigo-research-mode b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -485x -1px no-repeat;}
body#dummybodyid #diigolet-panel-btnBookmark.saved b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -328px -1px no-repeat;}
body#dummybodyid #diigolet-panel-btnAnnotationList b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -419px -1px no-repeat;}
body#dummybodyid #diigolet-panel-panel.orphanHighlight #diigolet-panel-btnAnnotationList b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -451px -1px no-repeat;}
body#dummybodyid #diigolet-panel-orphanHighlight{width:46px;}
body#dummybodyid #diigolet-panel-orphanHighlight b{background:url("chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/toolbar-icon.png") -266px -1px no-repeat;}
body#dummybodyid #diigolet-panel-colorPicker{display:none;position:absolute;left:15px;top:41px;width:91px;background-color:#fff;box-shadow:0 1px 4px rgba(0,0,0,.35);border-radius:2px;padding:5px 0;-webkit-animation:diigo-dropdown .15s ease-in 1;}
body#dummybodyid #diigolet-panel-colorPicker.dropdownShown{display:block;}
body#dummybodyid #diigolet-panel-colorPicker-arrow{border:5px solid;border-top-color:transparent;border-right-color:transparent;border-bottom-color:#fff;border-left-color:transparent;position:absolute;left:40px;top:-9px;}
body#dummybodyid #diigolet-panel-colorPicker li{font-weight:normal;display:block;padding-right:10px!important;padding-left:10px!important;text-decoration:none!important;line-height:26px;height:26px;color:#434343;min-width:60px;width:71px;background:none!important;border:none!important;-webkit-transition:background-color 200ms ease;}
body#dummybodyid #diigolet-panel-colorPicker li:hover{background-color:#e8e8e8!important;color:#434343!important;text-decoration:none!important;}
body#dummybodyid #diigolet-panel-colorPicker li span{display:inline-block;width:12px;height:12px;border-radius:7px;margin-right:5px;vertical-align:middle;margin-bottom:3px;}
body#dummybodyid #diigolet-panel-colorPicker li span b{width:4px;height:4px;background:#606060;margin-top:4px;margin-left:4px;border-radius:2px;}
body#dummybodyid #diigolet-panel-colorPicker li.selected span b{display:block;}
body#dummybodyid #diigolet-panel-colorPicker li.yellow span{background:#fde200;border:1px solid #b0a224;}
body#dummybodyid #diigolet-panel-colorPicker li.blue span{background:#7db3f9;border:1px solid #63799a;}
body#dummybodyid #diigolet-panel-colorPicker li.green span{background:#86ca25;border:1px solid #718b49;}
body#dummybodyid #diigolet-panel-colorPicker li.pink span{background:#ff9b9a;border:1px solid #ae657a;}
body#dummybodyid .diigolet .moreActionShare b{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/icons.png) 0 -96px no-repeat;}
body#dummybodyid #diigolet-dialog-share{background-color:#fcfbf7;border-radius:2px;font:normal 13px/1.5 Helvetica,Arial,sans-serif;position:fixed;left:5px;top:7px;box-shadow:0 1px 3px rgba(0,0,0,.08);white-space:nowrap;width:520px;z-index:2147483646;}
body#dummybodyid #diigolet-dialog-share *{white-space:normal;}
body#dummybodyid #diigolet-dialog-share-title{height:30px;vertical-align:middle;background-color:#39baf6;line-height:30px;padding:0 10px;font-size:14px;color:white;text-align:left;border-radius:2px 2px 0 0;}
body#dummybodyid #diigolet-dialog-share-closeBtn{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/images/win-close.png) 50% 50% no-repeat;float:right;height:16px;margin-left:10px;width:16px;margin-top:7px;}
body#dummybodyid #diigolet-dialog-share-content{border-radius:0 0 2px 2px;border-width:1px 1px 1px 1px;border-color:rgba(0,0,0,.08);border-style:solid;}
body#dummybodyid #diigolet-dialog-share-social{padding:10px;}
body#dummybodyid #diigolet-dialog-share-social .social-item{height:50px;width:100px;border-radius:3px;background:red;margin:10px 20px 10px 0;display:block;float:left;}
body#dummybodyid #diigolet-share-shareToTabs{background-color:#fcfbf7;list-style-type:none;padding:0 5px;margin:0;height:30px;line-height:30px;border-left:1px solid rgba(0,0,0,.08);border-right:1px solid rgba(0,0,0,.08);}
body#dummybodyid #diigolet-share-shareToTabs li{display:inline-block;line-height:22px;height:24px;margin-top:6px;}
body#dummybodyid #diigolet-share-shareToTabs li a{text-decoration:none;border-bottom-color:#3669a8;border-top-left-radius:5px;border-top-right-radius:5px;color:#000;opacity:.8;display:block;padding:0 5px;}
body#dummybodyid #diigolet-share-shareToTabs a:hover{opacity:1;}
body#dummybodyid #diigolet-share-shareToTabs a.current{border-radius:2px 2px 0 0;border-width:1px 1px 0 1px;border-color:rgba(0,0,0,.08);border-style:solid;border-bottom:1px solid #fcfbf7;color:#000;opacity:1;z-index:0;position:relative;top:1px;}
body#dummybodyid #diigolet-share-shareToTabs a.current:hover{color:#222;}
body#dummybodyid #diigolet-share-shareToTabs li b{display:inline-block;width:16px;height:16px;vertical-align:text-bottom;margin-right:3px;}
body#dummybodyid .diigolet .shareToTwitter b{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/icons.png) -16px -96px no-repeat;}
body#dummybodyid .diigolet .shareToFacebook b{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/icons.png) -32px -96px no-repeat;}
body#dummybodyid .diigolet .shareToGplus b{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/icons.png) -48px -96px no-repeat;}
body#dummybodyid .diigolet .shareToEmail b{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/icons.png) 0 -112px no-repeat;}
body#dummybodyid .diigolet .getAnnotatedLink b{background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/icons.png) -16px -112px no-repeat;}
body#dummybodyid .diigolet .twitterDesc{color:#777;font-size:13px;line-height:20px;}
body#dummybodyid #diigolet-twitter-saveBtn{display:block;line-height:24px;cursor:pointer;text-align:center;color:white;border-radius:2px;border:1px solid #066ec1;font-size:12px;text-decoration:none;border-radius:2px;border:1px solid #85a0a6;color:#85a0a6;font-size:12px;text-align:center;height:20px;width:50px;line-height:20px;float:right;}
body#dummybodyid #diigolet-twitter-saveBtn:active{background:#85a0a6;color:#fff;}
body#dummybodyid #diigolet-twitter-cancelBtn{color:#999;height:12px;font-size:12px;margin:1px 8px 0 6px;text-decoration:none;float:right;}
body#dummybodyid #diigolet-twitter-cancelBtn:hover{text-decoration:underline;}
body#dummybodyid #diigolet-email-saveBtn{display:block;line-height:24px;cursor:pointer;text-align:center;color:white;border-radius:2px;border:1px solid #066ec1;font-size:12px;text-decoration:none;border-radius:2px;border:1px solid #85a0a6;color:#85a0a6;font-size:12px;text-align:center;height:20px;width:50px;line-height:20px;float:right;margin-top:4px;}
body#dummybodyid #diigolet-email-saveBtn:active{background:#85a0a6;color:#fff;}
body#dummybodyid #diigolet-email-cancelBtn{color:#999;height:12px;font-size:12px;margin:6px 14px 0 0;text-decoration:none;float:right;}
body#dummybodyid #diigolet-email-cancelBtn:hover{text-decoration:underline;}
body#dummybodyid #diigolet-annotatedLink-saveBtn{display:block;line-height:24px;cursor:pointer;text-align:center;color:white;border-radius:2px;border:1px solid #066ec1;font-size:12px;text-decoration:none;border-radius:2px;border:1px solid #85a0a6;color:#85a0a6;font-size:12px;text-align:center;height:20px;width:50px;line-height:20px;float:right;}
body#dummybodyid #diigolet-annotatedLink-saveBtn:active{background:#85a0a6;color:#fff;}
body#dummybodyid #diigolet-annotatedLink-cancelBtn{color:#999;height:12px;font-size:12px;margin:2px 8px 0 6px;text-decoration:none;float:right;}
body#dummybodyid #diigolet-annotatedLink-cancelBtn:hover{text-decoration:underline;}
body#dummybodyid #diigolet-share-twitterLeftChars{color:#999;float:right;font-size:20px;font-weight:700;line-height:20px;}
body#dummybodyid #diigolet-share-twitterLeftChars.full{color:#F00;}
body#dummybodyid #diigolet-dialog-share .inputTxt{border:1px solid #7F9DB9;font:normal 12px/1.5 Arial,Helvetica,sans-serif;border:1px solid #d7d7d7;-webkit-transition:border-color 200ms ease;outline:none;}
body#dummybodyid #diigolet-dialog-share .inputTxt:focus{border:1px solid #AAA;}
body#dummybodyid #diigolet-dialog-share-twitterMsg{height:54px;width:492px;}
body#dummybodyid #diigolet-dialog-share .buttonRow{margin-top:5px;text-align:right;}
body#dummybodyid #diigolet-dialog-share .buttonRow input{margin-left:5px;padding:1px 6px;}
body#dummybodyid #diigolet-dialog-share input.defaultAction{font-weight:700;}
body#dummybodyid #diigolet-dialog-share-twitter{padding:10px;}
body#dummybodyid #diigolet-dialog-share-facebook{padding:5px;font-size:20px;height:100px;line-height:100px;text-align:center;}
body#dummybodyid #diigolet-dialog-share-gPlus{padding:5px;font-size:20px;height:100px;line-height:100px;text-align:center;}
body#dummybodyid #diigolet-dialog-share-gBuzz iframe{border:none;height:340px;width:100%;overflow:hidden;}
body#dummybodyid #diigolet-dialog-share-email{padding:10px;}
body#dummybodyid #diigolet-dialog-share-email>table{width:100%;border-width:0;margin-bottom:5px;}
body#dummybodyid #diigolet-dialog-share-email>table td{padding:2px 0;}
body#dummybodyid #diigolet-dialog-share-email label{font-weight:700;}
body#dummybodyid #diigolet-dialog-share-email-to,body#dummybodyid #diigolet-dialog-share-email-subject{width:100%;}
body#dummybodyid #diigolet-dialog-share-email-message{height:72px;width:100%;}
body#dummybodyid #diigolet-dialog-share-email-quotes-checker{font-weight:400!important;float:right;}
body#dummybodyid #diigolet-dialog-share-email-quotes-checker input{margin-right:2px;vertical-align:text-bottom;}
body#dummybodyid #diigolet-dialog-share-email-quotes{border:1px solid #bbb;border-radius:3px;width:100%;max-height:150px;overflow-y:scroll;}
body#dummybodyid #diigolet-aidlog-share-email-quotes-content{margin:5px 10px 10px 10px;}
body#dummybodyid #diigolet-dialog-share-annotatedLink{padding:10px;}
body#dummybodyid .diigolet .annotatedLinkInfo{border:1px solid #fad42e;background:#fea;border-radius:5px;color:#000;display:inline-block;padding:0 0 0 20px!important;position:relative;margin-bottom:10px!important;}
body#dummybodyid .diigolet .annotatedLinkInfo b{display:inline-block;height:16px;width:16px;margin-right:3px;background:url(chrome-extension://pnhplgjpclknigjpccbcnmicgcieojbh/diigolet/chrome-panel-images/icons.png) -32px -80px no-repeat;position:absolute;left:1px;top:1px;}
body#dummybodyid #diigolet-dialog-share-annotatedLink-value{font-weight:700!important;font-size:13px!important;padding:2px;width:496px;}
body#dummybodyid #diigolet-dialog-share-annotatedLink-value.loading{color:#ccc;font-style:italic;}
body#dummybodyid #diigolet-dialog-share-annotatedLink-optLinks{float:left;}
body#dummybodyid .diigolet .autocompleteContacts{border:1px solid #d9d9d9;border-top-color:#999;border-left-color:#999;width:380px;}
body#dummybodyid .diigolet .recInput{font:12px verdana;border-width:0;float:left;margin:2px;padding-top:2px;}
body#dummybodyid .diigolet .recItem{border:1px solid #7B9EBD;padding:0 2px;background-color:#F0F5FE;float:left;margin:2px 2px 0 0;}
body#dummybodyid .diigolet .recInputSizer{position:absolute;visibility:hidden;left:0;bottom:0;font:11px verdana;}
body#dummybodyid .diigolet .accTip{position:absolute;border:1px solid #ddd;border-top:none;background-color:#f5f5f5;font-size:11px;color:#777;text-align:left;padding:2px 0;text-indent:5px;z-index:8998;}
body#dummybodyid .diigolet .accNotice{position:absolute;border:1px solid #ffd324;border-top:none;background-color:#fff6bf;font-size:11px;color:#600;text-align:left;padding:2px 0;text-indent:5px;z-index:8999;}
body#dummybodyid .diigolet .accList{position:absolute;border:1px solid #999;border-top:none;background-color:#fff;font:10px verdana;color:#777;text-align:left;z-index:9000;line-height:18px;}
body#dummybodyid .diigolet .accList .cItem{border-bottom:1px solid #ddd;background-color:#fff;cursor:pointer;padding:2px;color:#333;}
body#dummybodyid .diigolet .accList .cItem b{font-size:11px;font-weight:normal;color:#000;}
body#dummybodyid .diigolet .accList .cItem i,body#dummybodyid .recItem i{font-size:7pt;color:#090;font-style:normal;margin-right:2px;}
body#dummybodyid .diigolet .accList div strong{background-color:#FFFADB;padding:0 2px;}
body#dummybodyid .diigolet .accList div.hover{background-color:#E0ECFF;text-decoration:none;}
body#dummybodyid .diigolet .recItem a{color:#999;font-family:Verdana,Arial,Helvetica,sans-serif;font-size:12px;font-weight:bold;line-height:16px;margin:0 1px 0 3px;}
body#dummybodyid .diigolet .recItem a:hover{color:#333;text-decoration:none;}
body#dummybodyid .diigolet .cItem span.extraDesc{float:none;font-weight:normal;color:#777;margin-left:10px;font-style:italic;}
body#dummybodyid .diigolet .cItem span.extraDesc .keywordStrong{color:#000;font-style:italic;background-color:#fff;}
body#dummybodyid .diigolet .cItem span.keywordStrong{float:none;font-weight:bold;}
</style><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="charity/bundle" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/javascript/charity/bundle.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="downloadPages/uplay" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/javascript/downloadPages/uplay.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="lib/hbTemplate" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/javascript/lib/hbTemplate.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="lib/ubisoft/uplay-prod" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/javascript/lib/ubisoft/uplay-prod.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="lib/email-validation" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/javascript/lib/email-validation.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="lib/easyXDM" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/javascript/lib/easyXDM.js"></script><style type="text/css">
.ui-helper-hidden { display: none; }
.ui-helper-hidden-accessible { border: 0; clip: rect(0 0 0 0); height: 1px; margin: -1px; overflow: hidden; padding: 0; position: absolute; width: 1px; }
.ui-helper-reset { margin: 0; padding: 0; border: 0; outline: 0; line-height: 1.3; text-decoration: none; font-size: 100%; list-style: none; }
.ui-helper-clearfix:before, .ui-helper-clearfix:after { content: ""; display: table; border-collapse: collapse; }
.ui-helper-clearfix:after { clear: both; }
.ui-helper-clearfix { min-height: 0;  }
.ui-helper-zfix { width: 100%; height: 100%; top: 0; left: 0; position: absolute; opacity: 0; filter: Alpha(Opacity=0);  }
.ui-front { z-index: 100; }
.ui-state-disabled { cursor: default !important; }
.ui-icon { display: block; text-indent: -99999px; overflow: hidden; background-repeat: no-repeat; }
.ui-widget-overlay { position: fixed; top: 0; left: 0; width: 100%; height: 100%; }
.ui-draggable-handle { -ms-touch-action: none; touch-action: none; }
.ui-resizable { position: relative; }
.ui-resizable-handle { position: absolute; font-size: 0.1px; display: block; -ms-touch-action: none; touch-action: none; }
.ui-resizable-disabled .ui-resizable-handle, .ui-resizable-autohide .ui-resizable-handle { display: none; }
.ui-resizable-n { cursor: n-resize; height: 7px; width: 100%; top: -5px; left: 0; }
.ui-resizable-s { cursor: s-resize; height: 7px; width: 100%; bottom: -5px; left: 0; }
.ui-resizable-e { cursor: e-resize; width: 7px; right: -5px; top: 0; height: 100%; }
.ui-resizable-w { cursor: w-resize; width: 7px; left: -5px; top: 0; height: 100%; }
.ui-resizable-se { cursor: se-resize; width: 12px; height: 12px; right: 1px; bottom: 1px; }
.ui-resizable-sw { cursor: sw-resize; width: 9px; height: 9px; left: -5px; bottom: -5px; }
.ui-resizable-nw { cursor: nw-resize; width: 9px; height: 9px; left: -5px; top: -5px; }
.ui-resizable-ne { cursor: ne-resize; width: 9px; height: 9px; right: -5px; top: -5px; }
.ui-sortable-handle { -ms-touch-action: none; touch-action: none; }
.ui-datepicker { width: 17em; padding: .2em .2em 0; display: none; }
.ui-datepicker .ui-datepicker-header { position: relative; padding: .2em 0; }
.ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-next { position: absolute; top: 2px; width: 1.8em; height: 1.8em; }
.ui-datepicker .ui-datepicker-prev-hover, .ui-datepicker .ui-datepicker-next-hover { top: 1px; }
.ui-datepicker .ui-datepicker-prev { left: 2px; }
.ui-datepicker .ui-datepicker-next { right: 2px; }
.ui-datepicker .ui-datepicker-prev-hover { left: 1px; }
.ui-datepicker .ui-datepicker-next-hover { right: 1px; }
.ui-datepicker .ui-datepicker-prev span, .ui-datepicker .ui-datepicker-next span { display: block; position: absolute; left: 50%; margin-left: -8px; top: 50%; margin-top: -8px; }
.ui-datepicker .ui-datepicker-title { margin: 0 2.3em; line-height: 1.8em; text-align: center; }
.ui-datepicker .ui-datepicker-title select { font-size: 1em; margin: 1px 0; }
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year { width: 45%; }
.ui-datepicker table { width: 100%; font-size: .9em; border-collapse: collapse; margin: 0 0 .4em; }
.ui-datepicker th { padding: .7em .3em; text-align: center; font-weight: bold; border: 0; }
.ui-datepicker td { border: 0; padding: 1px; }
.ui-datepicker td span, .ui-datepicker td a { display: block; padding: .2em; text-align: right; text-decoration: none; }
.ui-datepicker .ui-datepicker-buttonpane { background-image: none; margin: .7em 0 0 0; padding: 0 .2em; border-left: 0; border-right: 0; border-bottom: 0; }
.ui-datepicker .ui-datepicker-buttonpane button { float: right; margin: .5em .2em .4em; cursor: pointer; padding: .2em .6em .3em .6em; width: auto; overflow: visible; }
.ui-datepicker .ui-datepicker-buttonpane button.ui-datepicker-current { float: left; }
.ui-datepicker.ui-datepicker-multi { width: auto; }
.ui-datepicker-multi .ui-datepicker-group { float: left; }
.ui-datepicker-multi .ui-datepicker-group table { width: 95%; margin: 0 auto .4em; }
.ui-datepicker-multi-2 .ui-datepicker-group { width: 50%; }
.ui-datepicker-multi-3 .ui-datepicker-group { width: 33.3%; }
.ui-datepicker-multi-4 .ui-datepicker-group { width: 25%; }
.ui-datepicker-multi .ui-datepicker-group-last .ui-datepicker-header, .ui-datepicker-multi .ui-datepicker-group-middle .ui-datepicker-header { border-left-width: 0; }
.ui-datepicker-multi .ui-datepicker-buttonpane { clear: left; }
.ui-datepicker-row-break { clear: both; width: 100%; font-size: 0; }
.ui-datepicker-rtl { direction: rtl; }
.ui-datepicker-rtl .ui-datepicker-prev { right: 2px; left: auto; }
.ui-datepicker-rtl .ui-datepicker-next { left: 2px; right: auto; }
.ui-datepicker-rtl .ui-datepicker-prev:hover { right: 1px; left: auto; }
.ui-datepicker-rtl .ui-datepicker-next:hover { left: 1px; right: auto; }
.ui-datepicker-rtl .ui-datepicker-buttonpane { clear: right; }
.ui-datepicker-rtl .ui-datepicker-buttonpane button { float: left; }
.ui-datepicker-rtl .ui-datepicker-buttonpane button.ui-datepicker-current, .ui-datepicker-rtl .ui-datepicker-group { float: right; }
.ui-datepicker-rtl .ui-datepicker-group-last .ui-datepicker-header, .ui-datepicker-rtl .ui-datepicker-group-middle .ui-datepicker-header { border-right-width: 0; border-left-width: 1px; }
.ui-slider { position: relative; text-align: left; }
.ui-slider .ui-slider-handle { position: absolute; z-index: 2; width: 1.2em; height: 1.2em; cursor: default; -ms-touch-action: none; touch-action: none; }
.ui-slider .ui-slider-range { position: absolute; z-index: 1; font-size: .7em; display: block; border: 0; background-position: 0 0; }
.ui-slider.ui-state-disabled .ui-slider-handle, .ui-slider.ui-state-disabled .ui-slider-range { filter: inherit; }
.ui-slider-horizontal { height: .8em; }
.ui-slider-horizontal .ui-slider-handle { top: -.3em; margin-left: -.6em; }
.ui-slider-horizontal .ui-slider-range { top: 0; height: 100%; }
.ui-slider-horizontal .ui-slider-range-min { left: 0; }
.ui-slider-horizontal .ui-slider-range-max { right: 0; }
.ui-slider-vertical { width: .8em; height: 100px; }
.ui-slider-vertical .ui-slider-handle { left: -.3em; margin-left: 0; margin-bottom: -.6em; }
.ui-slider-vertical .ui-slider-range { left: 0; width: 100%; }
.ui-slider-vertical .ui-slider-range-min { bottom: 0; }
.ui-slider-vertical .ui-slider-range-max { top: 0; }
.ui-widget { font-family: Trebuchet MS,Tahoma,Verdana,Arial,sans-serif; font-size: 1.1em; }
.ui-widget .ui-widget { font-size: 1em; }
.ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button { font-family: Trebuchet MS,Tahoma,Verdana,Arial,sans-serif; font-size: 1em; }
.ui-widget-content { border: 1px solid #dddddd; background: #eeeeee url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAABkEAAAAAAy19n/AAAAAmJLR0T//xSrMc0AAAAJcEhZcwAAAEgAAABIAEbJaz4AAABYSURBVBjTxcK9DUBAAIDRjxk0dBQaE4gR7KFVM4rEDBIjEKVV7s79OZ0teHk8FR/NCAehJ6TcK3eD3/EtbsPV2AVbYmZMgh7RMdfAFaEmVIE8kR0yR4gfv1IulNTJHsTLAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE1LTA2LTIxVDA3OjM1OjAyKzAwOjAwQ18YfgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxNS0wNi0yMVQwNzozNTowMiswMDowMDICoMIAAAAASUVORK5CYII=) 50% top repeat-x; color: #333333; }
.ui-widget-content a { color: #333333; }
.ui-widget-header { border: 1px solid #e78f08; background: #f6a828 url(data:image/png;base64,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) 50% 50% repeat-x; color: #ffffff; font-weight: bold; }
.ui-widget-header a { color: #ffffff; }
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default { border: 1px solid #cccccc; background: #f6f6f6 url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAGQEAAAAAAao4lEAAAAAmJLR0T//xSrMc0AAAAJcEhZcwAAAEgAAABIAEbJaz4AAABISURBVDjLY/g1mWEUjSKqo2/fGL5LMXzPYfh+nOGHFsOPBQw/xRh+TmX4JcLwq4vhNwPD71yG3xcZ/igx/Ilk+JM0ikYRMQgA8pJH3iOhTlAAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTUtMDYtMjFUMDc6MzU6MDIrMDA6MDBDXxh+AAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE1LTA2LTIxVDA3OjM1OjAyKzAwOjAwMgKgwgAAAABJRU5ErkJggg==) 50% 50% repeat-x; font-weight: bold; color: #1c94c4; }
.ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited { color: #1c94c4; text-decoration: none; }
.ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus { border: 1px solid #fbcb09; background: #fdf5ce url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAGQEAIAAACwqkHPAAAABmJLR0T///////8JWPfcAAAACXBIWXMAAABIAAAASABGyWs+AAAAmklEQVRIx+3PPwsBARgH4N/7s0gmXZSuKMvNdl/AV2A1X1ltzBaf5UazEp3RpKujFMV0uT/dy6cQwzs98wPdZVk8IwAAhmEYxrdBWSZJGFKq4smGaGDENeFgwgfREp8d6Ph1OEZEWxaVOXSVRieHcGXJALrNnvEQes6nlz20yO9Xl9IUn128e0VwS4k6BvQIoob+X6QNwzB+yAca/jJVRVy4gQAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxNS0wNi0yMVQwNzozNTowMiswMDowMENfGH4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTUtMDYtMjFUMDc6MzU6MDIrMDA6MDAyAqDCAAAAAElFTkSuQmCC) 50% 50% repeat-x; font-weight: bold; color: #c77405; }
.ui-state-hover a, .ui-state-hover a:hover, .ui-state-hover a:link, .ui-state-hover a:visited, .ui-state-focus a, .ui-state-focus a:hover, .ui-state-focus a:link, .ui-state-focus a:visited { color: #c77405; text-decoration: none; }
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active { border: 1px solid #fbd850; background: #ffffff url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAGQAQAAAABHIzd2AAAAAmJLR0QAAd2KE6QAAAAJcEhZcwAAAEgAAABIAEbJaz4AAAARSURBVCjPY2hgGIWjcBTigACVaMgB0zSxaQAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxNS0wNi0yMVQwNzozNTowMiswMDowMENfGH4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTUtMDYtMjFUMDc6MzU6MDIrMDA6MDAyAqDCAAAAAElFTkSuQmCC) 50% 50% repeat-x; font-weight: bold; color: #eb8f00; }
.ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited { color: #eb8f00; text-decoration: none; }
.ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight { border: 1px solid #fed22f; background: #ffe45c url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAABkEAIAAACY3hF0AAAABmJLR0T///////8JWPfcAAAACXBIWXMAAABIAAAASABGyWs+AAAAhklEQVQoz+WQMQrCUBBEH1NaCzaxTc7iHcwhcoiktP6kS8BK8BIWHkYQrM1mLD5Bb6Bg9Xg7syws9mNztADgj3CjFbifk4A+0od1UWDfr2kloJkGgZsYBdRTKfB+qgTOtgzrqHJWCtg9T++9pdnEIHAb22yjwPk6XRQCzvNa4IsP3//ST+MF5uU/iXGyfBoAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTUtMDYtMjFUMDc6MzU6MDIrMDA6MDBDXxh+AAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE1LTA2LTIxVDA3OjM1OjAyKzAwOjAwMgKgwgAAAABJRU5ErkJggg==) 50% top repeat-x; color: #363636; }
.ui-state-highlight a, .ui-widget-content .ui-state-highlight a, .ui-widget-header .ui-state-highlight a { color: #363636; }
.ui-state-error, .ui-widget-content .ui-state-error, .ui-widget-header .ui-state-error { border: 1px solid #cd0a0a; background: #b81900 url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoEAIAAABTDPN5AAAABmJLR0T///////8JWPfcAAAACXBIWXMAAABIAAAASABGyWs+AAAA4ElEQVRo3u3YMQoCMRBG4c02XkCQLcXKwsN5Eq+znScRa8FasLP4q0DGZASLecmr0mSHr9tMuh5Pr91+MnpfnofHfXK2OW9v9jdb+t/cuR+qCaZSC2A2NQP3QFVpXZfFfy0iVc3eC3GpmusAR6fq3ARmUJvAJGoFzKOaYCq1AGZTM3APVJW+v5ZIVOX+8YhL1dwfwRGpOrvBcalucHSqA8ygNoFJ1AqYRzXBVGoBzKZm4B6oauy0uNSx06JTm8AkagXMo5pgKrUAZlMzcA9UNXZaXOrYadGpbnB0qgPMoKoPsn/eaLRwj54AAAAldEVYdGRhdGU6Y3JlYXRlADIwMTUtMDYtMjFUMDc6MzU6MDIrMDA6MDBDXxh+AAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE1LTA2LTIxVDA3OjM1OjAyKzAwOjAwMgKgwgAAAABJRU5ErkJggg==) 50% 50% repeat; color: #ffffff; }
.ui-state-error a, .ui-widget-content .ui-state-error a, .ui-widget-header .ui-state-error a { color: #ffffff; }
.ui-state-error-text, .ui-widget-content .ui-state-error-text, .ui-widget-header .ui-state-error-text { color: #ffffff; }
.ui-priority-primary, .ui-widget-content .ui-priority-primary, .ui-widget-header .ui-priority-primary { font-weight: bold; }
.ui-priority-secondary, .ui-widget-content .ui-priority-secondary, .ui-widget-header .ui-priority-secondary { opacity: .7; filter: Alpha(Opacity=70);  font-weight: normal; }
.ui-state-disabled, .ui-widget-content .ui-state-disabled, .ui-widget-header .ui-state-disabled { opacity: .35; filter: Alpha(Opacity=35);  background-image: none; }
.ui-state-disabled .ui-icon { filter: Alpha(Opacity=35);  }
.ui-icon { width: 16px; height: 16px; }
.ui-icon, .ui-widget-content .ui-icon { background-image: url(data:image/png;base64,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); }
.ui-widget-header .ui-icon { background-image: url(data:image/png;base64,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); }
.ui-state-default .ui-icon { background-image: url(data:image/png;base64,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); }
.ui-state-hover .ui-icon, .ui-state-focus .ui-icon { background-image: url(data:image/png;base64,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); }
.ui-state-active .ui-icon { background-image: url(data:image/png;base64,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); }
.ui-state-highlight .ui-icon { background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAADwCAMAAADYSUr5AAABDlBMVEUijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEijvEzfqCuAAAAWXRSTlMAGRAzBAhQv4KZLyJVcUBmYBoTMswNITwWQkhLIB5aIycxUyyFNIeAw2rIz8Y4RRy8uL58q7WljKqorR+yKf0BnlEk7woGAgOPomKUSqCvbd+cR2M/b3+RaPlAXvEAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAPZElEQVR42u1dC2PbthEGyUiq6ZiSXblLE6ex1mTO5iXZq+u6ro3abG26pOkSd13v//+RAXzhcIeHWMoUbeOTLesIEMB9PIB3ACgLERERMQIkkOy6CTvWH0bOQO/mJeDXP8EMqMzDEkIsEBRMAmh7jHSVmuAjAKwC8FRAzi8/DmoS1AI5AQltj5FOryAjgJ7OK2CZkwEZYO23q+BJ5wwKkttfui1z4s20VTAL5k2kF5hbiPcKcwvwNGB4C7CTwproI4CdDcxEPKUTExx+DNiAj0u9C9AuNPxdYOe46Y5QRERERERExIhx6Z7gjv2ghEVrQJ33hJ5BsxsBfsIq8M0HsAkhWfqglFgawAhgGWh2M1xMWAWUAE90qUofMhhi7be32JNsmVFJPKeLwBQglAQMNh3ALVjYbNaI1jaYD0jM0nw9atcWYEXiaXH/+QDeQ3Y6BoRx3e8CERERERERERG7Qz/HP+iaBsvvHXj0LAD4cip0yN27fXw7AGtQoDTwH+HqkWTgWczTwZVmr8DbAEuqv35bCT6CWDorjGnAqwOSCI7EhlFWHjkBXIkb1M/DZQgRwCeAwK9B+HRPFlPBOjeZ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); }
.ui-state-error .ui-icon, .ui-state-error-text .ui-icon { background-image: url(data:image/png;base64,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); }
.ui-icon-blank { background-position: 16px 16px; }
.ui-icon-carat-1-n { background-position: 0 0; }
.ui-icon-carat-1-ne { background-position: -16px 0; }
.ui-icon-carat-1-e { background-position: -32px 0; }
.ui-icon-carat-1-se { background-position: -48px 0; }
.ui-icon-carat-1-s { background-position: -64px 0; }
.ui-icon-carat-1-sw { background-position: -80px 0; }
.ui-icon-carat-1-w { background-position: -96px 0; }
.ui-icon-carat-1-nw { background-position: -112px 0; }
.ui-icon-carat-2-n-s { background-position: -128px 0; }
.ui-icon-carat-2-e-w { background-position: -144px 0; }
.ui-icon-triangle-1-n { background-position: 0 -16px; }
.ui-icon-triangle-1-ne { background-position: -16px -16px; }
.ui-icon-triangle-1-e { background-position: -32px -16px; }
.ui-icon-triangle-1-se { background-position: -48px -16px; }
.ui-icon-triangle-1-s { background-position: -64px -16px; }
.ui-icon-triangle-1-sw { background-position: -80px -16px; }
.ui-icon-triangle-1-w { background-position: -96px -16px; }
.ui-icon-triangle-1-nw { background-position: -112px -16px; }
.ui-icon-triangle-2-n-s { background-position: -128px -16px; }
.ui-icon-triangle-2-e-w { background-position: -144px -16px; }
.ui-icon-arrow-1-n { background-position: 0 -32px; }
.ui-icon-arrow-1-ne { background-position: -16px -32px; }
.ui-icon-arrow-1-e { background-position: -32px -32px; }
.ui-icon-arrow-1-se { background-position: -48px -32px; }
.ui-icon-arrow-1-s { background-position: -64px -32px; }
.ui-icon-arrow-1-sw { background-position: -80px -32px; }
.ui-icon-arrow-1-w { background-position: -96px -32px; }
.ui-icon-arrow-1-nw { background-position: -112px -32px; }
.ui-icon-arrow-2-n-s { background-position: -128px -32px; }
.ui-icon-arrow-2-ne-sw { background-position: -144px -32px; }
.ui-icon-arrow-2-e-w { background-position: -160px -32px; }
.ui-icon-arrow-2-se-nw { background-position: -176px -32px; }
.ui-icon-arrowstop-1-n { background-position: -192px -32px; }
.ui-icon-arrowstop-1-e { background-position: -208px -32px; }
.ui-icon-arrowstop-1-s { background-position: -224px -32px; }
.ui-icon-arrowstop-1-w { background-position: -240px -32px; }
.ui-icon-arrowthick-1-n { background-position: 0 -48px; }
.ui-icon-arrowthick-1-ne { background-position: -16px -48px; }
.ui-icon-arrowthick-1-e { background-position: -32px -48px; }
.ui-icon-arrowthick-1-se { background-position: -48px -48px; }
.ui-icon-arrowthick-1-s { background-position: -64px -48px; }
.ui-icon-arrowthick-1-sw { background-position: -80px -48px; }
.ui-icon-arrowthick-1-w { background-position: -96px -48px; }
.ui-icon-arrowthick-1-nw { background-position: -112px -48px; }
.ui-icon-arrowthick-2-n-s { background-position: -128px -48px; }
.ui-icon-arrowthick-2-ne-sw { background-position: -144px -48px; }
.ui-icon-arrowthick-2-e-w { background-position: -160px -48px; }
.ui-icon-arrowthick-2-se-nw { background-position: -176px -48px; }
.ui-icon-arrowthickstop-1-n { background-position: -192px -48px; }
.ui-icon-arrowthickstop-1-e { background-position: -208px -48px; }
.ui-icon-arrowthickstop-1-s { background-position: -224px -48px; }
.ui-icon-arrowthickstop-1-w { background-position: -240px -48px; }
.ui-icon-arrowreturnthick-1-w { background-position: 0 -64px; }
.ui-icon-arrowreturnthick-1-n { background-position: -16px -64px; }
.ui-icon-arrowreturnthick-1-e { background-position: -32px -64px; }
.ui-icon-arrowreturnthick-1-s { background-position: -48px -64px; }
.ui-icon-arrowreturn-1-w { background-position: -64px -64px; }
.ui-icon-arrowreturn-1-n { background-position: -80px -64px; }
.ui-icon-arrowreturn-1-e { background-position: -96px -64px; }
.ui-icon-arrowreturn-1-s { background-position: -112px -64px; }
.ui-icon-arrowrefresh-1-w { background-position: -128px -64px; }
.ui-icon-arrowrefresh-1-n { background-position: -144px -64px; }
.ui-icon-arrowrefresh-1-e { background-position: -160px -64px; }
.ui-icon-arrowrefresh-1-s { background-position: -176px -64px; }
.ui-icon-arrow-4 { background-position: 0 -80px; }
.ui-icon-arrow-4-diag { background-position: -16px -80px; }
.ui-icon-extlink { background-position: -32px -80px; }
.ui-icon-newwin { background-position: -48px -80px; }
.ui-icon-refresh { background-position: -64px -80px; }
.ui-icon-shuffle { background-position: -80px -80px; }
.ui-icon-transfer-e-w { background-position: -96px -80px; }
.ui-icon-transferthick-e-w { background-position: -112px -80px; }
.ui-icon-folder-collapsed { background-position: 0 -96px; }
.ui-icon-folder-open { background-position: -16px -96px; }
.ui-icon-document { background-position: -32px -96px; }
.ui-icon-document-b { background-position: -48px -96px; }
.ui-icon-note { background-position: -64px -96px; }
.ui-icon-mail-closed { background-position: -80px -96px; }
.ui-icon-mail-open { background-position: -96px -96px; }
.ui-icon-suitcase { background-position: -112px -96px; }
.ui-icon-comment { background-position: -128px -96px; }
.ui-icon-person { background-position: -144px -96px; }
.ui-icon-print { background-position: -160px -96px; }
.ui-icon-trash { background-position: -176px -96px; }
.ui-icon-locked { background-position: -192px -96px; }
.ui-icon-unlocked { background-position: -208px -96px; }
.ui-icon-bookmark { background-position: -224px -96px; }
.ui-icon-tag { background-position: -240px -96px; }
.ui-icon-home { background-position: 0 -112px; }
.ui-icon-flag { background-position: -16px -112px; }
.ui-icon-calendar { background-position: -32px -112px; }
.ui-icon-cart { background-position: -48px -112px; }
.ui-icon-pencil { background-position: -64px -112px; }
.ui-icon-clock { background-position: -80px -112px; }
.ui-icon-disk { background-position: -96px -112px; }
.ui-icon-calculator { background-position: -112px -112px; }
.ui-icon-zoomin { background-position: -128px -112px; }
.ui-icon-zoomout { background-position: -144px -112px; }
.ui-icon-search { background-position: -160px -112px; }
.ui-icon-wrench { background-position: -176px -112px; }
.ui-icon-gear { background-position: -192px -112px; }
.ui-icon-heart { background-position: -208px -112px; }
.ui-icon-star { background-position: -224px -112px; }
.ui-icon-link { background-position: -240px -112px; }
.ui-icon-cancel { background-position: 0 -128px; }
.ui-icon-plus { background-position: -16px -128px; }
.ui-icon-plusthick { background-position: -32px -128px; }
.ui-icon-minus { background-position: -48px -128px; }
.ui-icon-minusthick { background-position: -64px -128px; }
.ui-icon-close { background-position: -80px -128px; }
.ui-icon-closethick { background-position: -96px -128px; }
.ui-icon-key { background-position: -112px -128px; }
.ui-icon-lightbulb { background-position: -128px -128px; }
.ui-icon-scissors { background-position: -144px -128px; }
.ui-icon-clipboard { background-position: -160px -128px; }
.ui-icon-copy { background-position: -176px -128px; }
.ui-icon-contact { background-position: -192px -128px; }
.ui-icon-image { background-position: -208px -128px; }
.ui-icon-video { background-position: -224px -128px; }
.ui-icon-script { background-position: -240px -128px; }
.ui-icon-alert { background-position: 0 -144px; }
.ui-icon-info { background-position: -16px -144px; }
.ui-icon-notice { background-position: -32px -144px; }
.ui-icon-help { background-position: -48px -144px; }
.ui-icon-check { background-position: -64px -144px; }
.ui-icon-bullet { background-position: -80px -144px; }
.ui-icon-radio-on { background-position: -96px -144px; }
.ui-icon-radio-off { background-position: -112px -144px; }
.ui-icon-pin-w { background-position: -128px -144px; }
.ui-icon-pin-s { background-position: -144px -144px; }
.ui-icon-play { background-position: 0 -160px; }
.ui-icon-pause { background-position: -16px -160px; }
.ui-icon-seek-next { background-position: -32px -160px; }
.ui-icon-seek-prev { background-position: -48px -160px; }
.ui-icon-seek-end { background-position: -64px -160px; }
.ui-icon-seek-start { background-position: -80px -160px; }
.ui-icon-seek-first { background-position: -80px -160px; }
.ui-icon-stop { background-position: -96px -160px; }
.ui-icon-eject { background-position: -112px -160px; }
.ui-icon-volume-off { background-position: -128px -160px; }
.ui-icon-volume-on { background-position: -144px -160px; }
.ui-icon-power { background-position: 0 -176px; }
.ui-icon-signal-diag { background-position: -16px -176px; }
.ui-icon-signal { background-position: -32px -176px; }
.ui-icon-battery-0 { background-position: -48px -176px; }
.ui-icon-battery-1 { background-position: -64px -176px; }
.ui-icon-battery-2 { background-position: -80px -176px; }
.ui-icon-battery-3 { background-position: -96px -176px; }
.ui-icon-circle-plus { background-position: 0 -192px; }
.ui-icon-circle-minus { background-position: -16px -192px; }
.ui-icon-circle-close { background-position: -32px -192px; }
.ui-icon-circle-triangle-e { background-position: -48px -192px; }
.ui-icon-circle-triangle-s { background-position: -64px -192px; }
.ui-icon-circle-triangle-w { background-position: -80px -192px; }
.ui-icon-circle-triangle-n { background-position: -96px -192px; }
.ui-icon-circle-arrow-e { background-position: -112px -192px; }
.ui-icon-circle-arrow-s { background-position: -128px -192px; }
.ui-icon-circle-arrow-w { background-position: -144px -192px; }
.ui-icon-circle-arrow-n { background-position: -160px -192px; }
.ui-icon-circle-zoomin { background-position: -176px -192px; }
.ui-icon-circle-zoomout { background-position: -192px -192px; }
.ui-icon-circle-check { background-position: -208px -192px; }
.ui-icon-circlesmall-plus { background-position: 0 -208px; }
.ui-icon-circlesmall-minus { background-position: -16px -208px; }
.ui-icon-circlesmall-close { background-position: -32px -208px; }
.ui-icon-squaresmall-plus { background-position: -48px -208px; }
.ui-icon-squaresmall-minus { background-position: -64px -208px; }
.ui-icon-squaresmall-close { background-position: -80px -208px; }
.ui-icon-grip-dotted-vertical { background-position: 0 -224px; }
.ui-icon-grip-dotted-horizontal { background-position: -16px -224px; }
.ui-icon-grip-solid-vertical { background-position: -32px -224px; }
.ui-icon-grip-solid-horizontal { background-position: -48px -224px; }
.ui-icon-gripsmall-diagonal-se { background-position: -64px -224px; }
.ui-icon-grip-diagonal-se { background-position: -80px -224px; }
.ui-corner-all, .ui-corner-top, .ui-corner-left, .ui-corner-tl { border-top-left-radius: 4px; }
.ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr { border-top-right-radius: 4px; }
.ui-corner-all, .ui-corner-bottom, .ui-corner-left, .ui-corner-bl { border-bottom-left-radius: 4px; }
.ui-corner-all, .ui-corner-bottom, .ui-corner-right, .ui-corner-br { border-bottom-right-radius: 4px; }
.ui-widget-overlay { background: #666666 url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoEAAAAAD5BTvyAAAAAmJLR0T//xSrMc0AAAAJcEhZcwAAAEgAAABIAEbJaz4AAAB6SURBVEjH7dXLEYAgDEVRqk0HNmpFMgxi+Lnw3Z0hSzJnmZuO8x6b3vPn530vsVwDKa6CHFdAkssgyy1AjTNLLDeAOteBBOdAhmsgxVWQ4wpIchlkuQ34nXPni+EWoMZNoMoNoM51IMFFU3QumqJz0RSdi6bo3C+bcgHap6IryOSd+AAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxNS0wNi0yMVQwNzozNTowMiswMDowMENfGH4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTUtMDYtMjFUMDc6MzU6MDIrMDA6MDAyAqDCAAAAAElFTkSuQmCC) 50% 50% repeat; opacity: .5; filter: Alpha(Opacity=50);  }
.ui-widget-shadow { margin: -5px 0 0 -5px; padding: 5px; background: #000000 url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAABkAQAAAADcH0/XAAAAAmJLR0QAAd2KE6QAAAAJcEhZcwAAAEgAAABIAEbJaz4AAAAPSURBVCjPY2AYBaOA+gAAAlgAAXU2hncAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTUtMDYtMjFUMDc6MzU6MDIrMDA6MDBDXxh+AAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE1LTA2LTIxVDA3OjM1OjAyKzAwOjAwMgKgwgAAAABJRU5ErkJggg==) 50% 50% repeat-x; opacity: .2; filter: Alpha(Opacity=20);  border-radius: 5px; }
</style><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="lib/lzstring" src="https://humblebundle-a.akamaihd.net/4db5c70d4b18a42ea4c0d67ff1732fe14b634533/dist/javascript/lib/lzstring.js"></script><style type="text/css">.fb_hidden{position:absolute;top:-10000px;z-index:10001}.fb_reposition{overflow:hidden;position:relative}.fb_invisible{display:none}.fb_reset{background:none;border:0;border-spacing:0;color:#000;cursor:auto;direction:ltr;font-family:"lucida grande", tahoma, verdana, arial, sans-serif;font-size:11px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:1;margin:0;overflow:visible;padding:0;text-align:left;text-decoration:none;text-indent:0;text-shadow:none;text-transform:none;visibility:visible;white-space:normal;word-spacing:normal}.fb_reset>div{overflow:hidden}.fb_link img{border:none}@keyframes fb_transform{from{opacity:0;transform:scale(.95)}to{opacity:1;transform:scale(1)}}.fb_animate{animation:fb_transform .3s forwards}
.fb_dialog{background:rgba(82, 82, 82, .7);position:absolute;top:-10000px;z-index:10001}.fb_reset .fb_dialog_legacy{overflow:visible}.fb_dialog_advanced{padding:10px;-moz-border-radius:8px;-webkit-border-radius:8px;border-radius:8px}.fb_dialog_content{background:#fff;color:#333}.fb_dialog_close_icon{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 0 transparent;cursor:pointer;display:block;height:15px;position:absolute;right:18px;top:17px;width:15px}.fb_dialog_mobile .fb_dialog_close_icon{top:5px;left:5px;right:auto}.fb_dialog_padding{background-color:transparent;position:absolute;width:1px;z-index:-1}.fb_dialog_close_icon:hover{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -15px transparent}.fb_dialog_close_icon:active{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -30px transparent}.fb_dialog_loader{background-color:#f6f7f9;border:1px solid #606060;font-size:24px;padding:20px}.fb_dialog_top_left,.fb_dialog_top_right,.fb_dialog_bottom_left,.fb_dialog_bottom_right{height:10px;width:10px;overflow:hidden;position:absolute}.fb_dialog_top_left{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png) no-repeat 0 0;left:-10px;top:-10px}.fb_dialog_top_right{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png) no-repeat 0 -10px;right:-10px;top:-10px}.fb_dialog_bottom_left{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png) no-repeat 0 -20px;bottom:-10px;left:-10px}.fb_dialog_bottom_right{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png) no-repeat 0 -30px;right:-10px;bottom:-10px}.fb_dialog_vert_left,.fb_dialog_vert_right,.fb_dialog_horiz_top,.fb_dialog_horiz_bottom{position:absolute;background:#525252;filter:alpha(opacity=70);opacity:.7}.fb_dialog_vert_left,.fb_dialog_vert_right{width:10px;height:100%}.fb_dialog_vert_left{margin-left:-10px}.fb_dialog_vert_right{right:0;margin-right:-10px}.fb_dialog_horiz_top,.fb_dialog_horiz_bottom{width:100%;height:10px}.fb_dialog_horiz_top{margin-top:-10px}.fb_dialog_horiz_bottom{bottom:0;margin-bottom:-10px}.fb_dialog_iframe{line-height:0}.fb_dialog_content .dialog_title{background:#6d84b4;border:1px solid #365899;color:#fff;font-size:14px;font-weight:bold;margin:0}.fb_dialog_content .dialog_title>span{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif) no-repeat 5px 50%;float:left;padding:5px 0 7px 26px}body.fb_hidden{-webkit-transform:none;height:100%;margin:0;overflow:visible;position:absolute;top:-10000px;left:0;width:100%}.fb_dialog.fb_dialog_mobile.loading{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif) white no-repeat 50% 50%;min-height:100%;min-width:100%;overflow:hidden;position:absolute;top:0;z-index:10001}.fb_dialog.fb_dialog_mobile.loading.centered{width:auto;height:auto;min-height:initial;min-width:initial;background:none}.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner{width:100%}.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content{background:none}.loading.centered #fb_dialog_loader_close{color:#fff;display:block;padding-top:20px;clear:both;font-size:18px}#fb-root #fb_dialog_ipad_overlay{background:rgba(0, 0, 0, .45);position:absolute;bottom:0;left:0;right:0;top:0;width:100%;min-height:100%;z-index:10000}#fb-root #fb_dialog_ipad_overlay.hidden{display:none}.fb_dialog.fb_dialog_mobile.loading iframe{visibility:hidden}.fb_dialog_content .dialog_header{-webkit-box-shadow:white 0 1px 1px -1px inset;background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#738ABA), to(#2C4987));border-bottom:1px solid;border-color:#1d4088;color:#fff;font:14px Helvetica, sans-serif;font-weight:bold;text-overflow:ellipsis;text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0;vertical-align:middle;white-space:nowrap}.fb_dialog_content .dialog_header table{-webkit-font-smoothing:subpixel-antialiased;height:43px;width:100%}.fb_dialog_content .dialog_header td.header_left{font-size:12px;padding-left:5px;vertical-align:middle;width:60px}.fb_dialog_content .dialog_header td.header_right{font-size:12px;padding-right:5px;vertical-align:middle;width:60px}.fb_dialog_content .touchable_button{background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#4966A6), color-stop(.5, #355492), to(#2A4887));border:1px solid #29487d;-webkit-background-clip:padding-box;-webkit-border-radius:3px;-webkit-box-shadow:rgba(0, 0, 0, .117188) 0 1px 1px inset, rgba(255, 255, 255, .167969) 0 1px 0;display:inline-block;margin-top:3px;max-width:85px;line-height:18px;padding:4px 12px;position:relative}.fb_dialog_content .dialog_header .touchable_button input{border:none;background:none;color:#fff;font:12px Helvetica, sans-serif;font-weight:bold;margin:2px -12px;padding:2px 6px 3px 6px;text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0}.fb_dialog_content .dialog_header .header_center{color:#fff;font-size:16px;font-weight:bold;line-height:18px;text-align:center;vertical-align:middle}.fb_dialog_content .dialog_content{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif) no-repeat 50% 50%;border:1px solid #555;border-bottom:0;border-top:0;height:150px}.fb_dialog_content .dialog_footer{background:#f6f7f9;border:1px solid #555;border-top-color:#ccc;height:40px}#fb_dialog_loader_close{float:left}.fb_dialog.fb_dialog_mobile .fb_dialog_close_button{text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0}.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon{visibility:hidden}#fb_dialog_loader_spinner{animation:rotateSpinner 1.2s linear infinite;background-color:transparent;background-image:url(https://static.xx.fbcdn.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);background-repeat:no-repeat;background-position:50% 50%;height:24px;width:24px}@keyframes rotateSpinner{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
.fb_iframe_widget{display:inline-block;position:relative}.fb_iframe_widget span{display:inline-block;position:relative;text-align:justify}.fb_iframe_widget iframe{position:absolute}.fb_iframe_widget_fluid_desktop,.fb_iframe_widget_fluid_desktop span,.fb_iframe_widget_fluid_desktop iframe{max-width:100%}.fb_iframe_widget_fluid_desktop iframe{min-width:220px;position:relative}.fb_iframe_widget_lift{z-index:1}.fb_hide_iframes iframe{position:relative;left:-10000px}.fb_iframe_widget_loader{position:relative;display:inline-block}.fb_iframe_widget_fluid{display:inline}.fb_iframe_widget_fluid span{width:100%}.fb_iframe_widget_loader iframe{min-height:32px;z-index:2;zoom:1}.fb_iframe_widget_loader .FB_Loader{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif) no-repeat;height:32px;width:32px;margin-left:-16px;position:absolute;left:50%;z-index:4}</style></head>

<body id="dummybodyid">
  <div class="page-wrap">
  
    
      
    
  <div class="navigation-container">


<nav class="navbar">
  <ul class="navbar-items-left">

    <li class="navbar-item-header">
      <a href="/">
        <i class="navbar-item-header-icon hb hb-bundle"></i>
      </a>
    </li>
  <script type="text/template" id="site-search-list-product">
  <div data-product='<%- machine_name %>' class='site-search-list-product product-<%- machine_name %>'>
  <% var classes = 'product-details-link'; %>
  <% if (on_sale) { %>
    <% classes += ' product-' + sale_type + '-sale'; %>
  <% } %>
  <% if (type === 'bundle' || type === 'monthly') { %>
    <a href='<%- bundle_path %>?hmb_source=search_bar' class='<%- classes %>'>
  <% } else { %>
    <a href='/store<%- link %>?hmb_source=search_bar' class='<%- classes %>'>
  <% } %>
      <div class='scrollable-wrapper' title='<%- human_name %>'>
        <img class='product-image' src='<%- storefront_icon %>' alt=''/>
        <div class='product-list-wrapper'>
          <div class='wishlist-holder'></div>
          <div class='buy-button'>
            <div class='action-button'>
  <% var button_classes = ''; %>
  <% var button_text = ''; %>
  <% if (on_sale) { %>
    <% var percent_off = Math.round(100.0 * ((full_price[0] - current_price[0]) / full_price[0])); %>
  <% } %>

  <% var text_class = 'text'; %>
  <% if (!can_be_purchased || type === 'bundle') { %>
    <% button_text = 'View'; %>
  <% } else { %>

    <% if (type != 'bundle' && display_as_free) { %>
      <% button_text = 'Free'; %>
      <% button_classes += ' on-sale'; %>
    <% } else { %>
      <% button_text = button_text || moneyfmt(current_price[0], current_price[1], false, current_country !== 'US') %>
      <% text_class += ' store-price'; %>
    <% } %>
    <% if (on_sale && !display_as_free) { %>
              <span class='discount'>-<%= percent_off %>%</span>
      <% button_classes += ' on-sale'; %>
    <% } %>
      <% button_classes += ' js-show-product-details'; %>
  <% } %>
              <button class='store-item-button js-action-button <%= button_classes %>'>
                <i class='hb hb-shopping-cart'></i>
                <span class='<%- text_class %>'>
                  <%= button_text %>
                </span>
                <span class='view-text'>View</span>
              </button>
            </div>
          </div>
          <div class='product-title-and-description'>
            <h2 class='product-title'><%- human_name %></h2>
  <% if (type === 'monthly') { %>
            <h3 class="product-description"><%- description %></h3>
  <% } %>
          </div>
          <div class='platforms-wrapper'>

  <% if (cta_badge && cta_badge != 'n/a') { %>
          <%= render_platform_icons(icon_dict).trim() %><span class='cta-text <%= cta_badge %>'><%= cta_text %></span>
  <% } else { %>
          <%= render_platform_icons(icon_dict) %>
  <% } %>
          </div>
        </div>
      </div>
    </a>
  </div>
</script>

<script type="text/template" id="site-search-empty-product">
  <div class='site-search-list-product'>
    <div class='scrollable-wrapper empty-product'>
      <div class='product-list-wrapper'>
        <div class='product-title-and-description'>
          <span class="product-title">Sorry, we could not find what you were looking for!</span>
        </div>
      </div>
    </div>
  </div>
</script>


  <li class="navbar-item site-search">
    <span class="js-site-minisearch site-minisearch-view">
      <span class="js-site-searchbar-holder site-searchbar-holder">
        <div class="searchbar">
          <input class="js-site-search site-search" placeholder="Search Humble Bundle">
          <i class="js-clear-site-search hb hb-search clear-search-button"></i>
        </div>
      </span>
      <div class="js-site-search-results-holder site-search-results-holder">
        <div class="js-site-search-results site-search-results"></div>
      </div>
    </span>
  </li>



  </ul>
  <ul class="navbar-items-right">

  
    <li class="navbar-item">
      <a href="https://support.humblebundle.com" target="_blank">
        <i class="navbar-item-icon hb hb-support"></i>
        <span class="navbar-item-text">Support</span>
      </a>
    </li>
    <li class="navbar-item">
      <a href="http://blog.humblebundle.com/" target="_blank">
        <i class="navbar-item-icon hb hb-file"></i>
        <span class="navbar-item-text">Blog</span>
      </a>
    </li>
  
      <li class="navbar-item-dropdown navbar-user-item">
    
        <a class="navbar-item-dropdown-toggle" href="#">
          <i class="navbar-item-icon hb hb-user"></i>
            <span class="display-name">
              <div class="display-name-container" title="wagonboost@gmail.com">wagonboost@gmail.com</div>
            </span>
          <i class="hb hb-caret-down"></i>
        </a>
    
    
        <div class="navbar-item-dropdown-container is-hidden">
          <div class="navbar-item-dropdown-items">
            <div class="navbar-item-dropdown-arrow"></div>
            <ul>
              
              <li class="navbar-item-dropdown-item">
                <a href="/home/library">
                  <i class="navbar-item-dropdown-icon hb hb-library"></i>
                  <span class="navbar-item-dropdown-text">Library</span>
                </a>
              </li>
              <li class="navbar-item-dropdown-item">
                <a href="/home/purchases">
                  <i class="navbar-item-dropdown-icon hb hb-tier"></i>
                  <span class="navbar-item-dropdown-text">Purchases</span>
                </a>
              </li>
              <li class="navbar-item-dropdown-item">
                <a href="/home/keys">
                  <i class="navbar-item-dropdown-icon hb hb-key"></i>
                  <span class="navbar-item-dropdown-text">Keys</span>
                </a>
              </li>
              <li class="navbar-item-dropdown-item">
                <a href="/home/coupons">
                  <i class="navbar-item-dropdown-icon hb hb-scissors"></i>
                  <span class="navbar-item-dropdown-text">Coupons</span>
                </a>
              </li>
              <li class="navbar-item-dropdown-item">
                <a href="/store/wishlist">
                  <i class="navbar-item-dropdown-icon hb hb-star"></i>
                  <span class="navbar-item-dropdown-text">Wish List</span>
                </a>
              </li>
    
              <li class="navbar-item-dropdown-item">
                <a href="/user/wallet">
                  <i class="navbar-item-dropdown-icon hb hb-money"></i>
                  <span class="navbar-item-dropdown-text">Wallet</span>
                </a>
              </li>
    
              <li class="navbar-item-dropdown-item">
                <a href="/user/settings">
                  <i class="navbar-item-dropdown-icon hb hb-cog"></i>
                  <span class="navbar-item-dropdown-text">Settings</span>
                </a>
              </li>
    
    
              <li class="navbar-item-dropdown-item">
                <form id="navbar-logout-form" action="/logout?goto=/downloads&amp;qs=key%3DkUn6uX6dSUrhH5V8" method="POST">
                  <input type="hidden" class="csrftoken" name="_le_csrf_token" value="5_NSuAqJhQsSsdPT-1-1499367199">
                  <a href="#" onclick="document.getElementById('navbar-logout-form').submit(); return false;">
                    <i class="navbar-item-dropdown-icon hb hb-sign-out"></i>
                    <span class="navbar-item-dropdown-text">Logout</span>
                  </a>
                </form>
              </li>
            </ul>
          </div>
        </div>
    
      </li>
  


  </ul>
</nav>
</div><div class="base-main-wrapper">
    




    <div id="page-top-messages"></div>
  
<div class="page_title"></div>
      <div class="inner-main-wrapper">

  
    

<div class="js-admin-edit" data-entity-kind="product" data-machine-name="bestoffantagraphics_bookbundle">
  </div>

  

  <div class="humble-banner">
    <a href="/books/best-of-fantagraphics-comics?utm_source=download_page">
      <h3>
        <img class="banner-logo" src="https://humblebundle.imgix.net/misc/files/hashed/1919f3e2c0a895e576472651d717010ce7706782.png?auto=format&amp;lossless=1&amp;ixlib=python-0.2.0&amp;s=2723b9ee976e2dfafc741bd0d91acb4a" alt="Humble Comics Bundle: Best of Fantagraphics">
        <p>Also happening now:</p>
      </h3>
      <h4>Pay what you want for awesome comics and support charity!</h4>
    </a>
  </div>

  

  <div class="js-admin-edit" data-entity-kind="product" data-machine-name="fandomandphilosophy_bookbundle">
  </div>

  
  <div id="dlheader">
  
    
  
  
  
  
  

  
    <a id="logo" href="/books/fandom-philosophy-books"><img src="https://humblebundle.imgix.net/misc/files/hashed/06f613f2e90f5664cd23deda284745b935275cc3.png?auto=format&amp;lossless=1&amp;ixlib=python-0.2.0&amp;s=994dd7dd16649e0064c2a2c2e4eb94b4"></a>
  
  </div>
  

  <div id="download-page-wrapper">
    <div id="main">
      <div id="papers-top"></div>
      <div id="papers-mid"></div>
      <div id="papers-bottom"></div>
      <div id="papers-content">
  
  
  
  <div class="already-claimed" style="float:right;">This page is claimed by <strong>you</strong>.</div>

        <div id="headertext">
          <div id="hibtext">
            
                Thanks for purchasing the Humble Book Bundle: Fandom &amp; Philosophy presented by Wiley-Blackwell!<div class="js-admin-edit" data-entity-kind="product" data-machine-name="fandomandphilosophy_bookbundle">
  </div>
            
          </div>
          <div id="spiel">
  
  
  
            
  
  
            <p>
              Follow <a href="http://www.twitter.com/humble">@humble</a> on Twitter, Google+, and Facebook for the latest Humble Bundle status reports:
            </p>
            <div class="download-social-alignment">
              <iframe id="twitter-widget-0" scrolling="no" frameborder="0" allowtransparency="true" class="twitter-follow-button twitter-follow-button-rendered" style="position: static; visibility: visible; width: 288px; height: 28px;" title="Twitter Follow Button" src="https://platform.twitter.com/widgets/follow_button.85cf65311617c356fe9237c3e6c10afb.en.html#dnt=false&amp;id=twitter-widget-0&amp;lang=en&amp;screen_name=humble&amp;show_count=true&amp;show_screen_name=true&amp;size=l&amp;time=1502139056086" data-screen-name="humble"></iframe>
              <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
              <!-- Place this tag where you want the widget to render. -->
              &nbsp;&nbsp;&nbsp;&nbsp;
              <div style="text-indent: 0px; margin: 0px; padding: 0px; background: transparent; border-style: none; float: none; line-height: normal; font-size: 1px; vertical-align: baseline; display: inline-block; width: 170px; height: 24px;" id="___follow_0"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position: static; top: 0px; width: 170px; margin: 0px; border-style: none; left: 0px; visibility: visible; height: 24px;" tabindex="0" vspace="0" width="100%" id="I0_1502139057343" name="I0_1502139057343" src="https://apis.google.com/u/0/_/widget/render/follow?usegapi=1&amp;annotation=bubble&amp;height=24&amp;rel=publisher&amp;origin=https%3A%2F%2Fwww.humblebundle.com&amp;url=https%3A%2F%2Fplus.google.com%2F103555773917939181320&amp;gsrc=3p&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.en.xh47SggJVmI.O%2Fm%3D__features__%2Fam%3DAQ%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCNnAKKXzFeIiJTiMA4Bq29frxjzuA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1502139057343&amp;parent=https%3A%2F%2Fwww.humblebundle.com&amp;pfname=&amp;rpctoken=27005617" data-gapiattached="true"></iframe></div>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <div class="fb-like fb_iframe_widget" data-href="https://www.facebook.com/humblebundle" data-width="250px" data-colorscheme="light" data-layout="standard" data-action="like" data-show-faces="false" data-send="false" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=101146256651042&amp;color_scheme=light&amp;container_width=0&amp;href=https%3A%2F%2Fwww.facebook.com%2Fhumblebundle&amp;layout=standard&amp;locale=en_US&amp;sdk=joey&amp;send=false&amp;show_faces=false&amp;width=250px"><span style="vertical-align: bottom; width: 250px; height: 40px;"><iframe name="fcd9cf0134a5" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" title="fb:like Facebook Social Plugin" src="https://www.facebook.com/plugins/like.php?action=like&amp;app_id=101146256651042&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FXBwzv5Yrm_1.js%3Fversion%3D42%23cb%3Df1d261bcfa62208%26domain%3Dwww.humblebundle.com%26origin%3Dhttps%253A%252F%252Fwww.humblebundle.com%252Ff3dc07c33710fb%26relation%3Dparent.parent&amp;color_scheme=light&amp;container_width=0&amp;href=https%3A%2F%2Fwww.facebook.com%2Fhumblebundle&amp;layout=standard&amp;locale=en_US&amp;sdk=joey&amp;send=false&amp;show_faces=false&amp;width=250px" style="border: none; visibility: visible; width: 250px; height: 40px;" class=""></iframe></span></div>
            </div>
  
          </div>
        </div>

        <div class="js-coupon-whitebox-holder"></div>
        <div class="js-credit-whitebox-holder"></div>

  

  

  
  

  

  

  

<div class="generic-popup outer-shadow" id="confirm-content-event-choice-dialog">
  <div class="generic-popup content">
    <h1><span class="main-base-arrow"></span>Confirm Choice</h1>
    <form action="/humbler/choosecontent" method="post" data-input-prefix="confirm-content-event-choice-">
      <input type="hidden" name="gamekey" value="kUn6uX6dSUrhH5V8">
      <input type="hidden" name="parent_identifier" value="">
      <input type="hidden" name="chosen_identifier" value="">

      <div class="message-holder">Once you make your choice, you will not be able to change it. Are you sure you want to choose this option?</div>
      <div class="no-center">
        <span class="input-holder"><span id="confirm-content-event-choice-dummy"></span></span>
        <div class="button-holder">
          <a class="button-link cancel" href="#" data-goto=""><span class="gray-button">Cancel</span></a>
          <a class="button-link green-button submit js-submit" href="#">Confirm</a>
        </div>
        <div class="clearfix"></div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
require(['account/accountModals'], function(AccountModals) {
  $(function(){

    $('.js-choose-content-form').submit(function(e) {
      e.preventDefault();

      var $form = $(this);
      var $dialog = $('#confirm-content-event-choice-dialog');
      if ($dialog.closest('.grayout').length == 0) {
        var marginTop = '-' + ($dialog.height() / 2) + 'px';
        $dialog.css('margin-top', marginTop).fadeIn();
        $dialog.appendTo($('.grayout'));
      } else {
        $dialog.show();
      }
      $('.grayout').fadeIn();

      $dialog.find('input[name=parent_identifier]').val($form.find('input[name=parent_identifier]').val());
      $dialog.find('input[name=chosen_identifier]').val($form.find('input[name=chosen_identifier]:checked').val());
    });

    $('#confirm-content-event-choice-dialog form .js-submit').click(function (event) {
      event.preventDefault();
      var $form = $(event.target).closest('form'),
          url = $form.attr('action'),
          data = $form.serialize();

      $.ajax({
        type: 'POST',
        url: url,
        data: data,
        dataType: 'json',

        success: function(data) {
          if (data.success) {
            if (data.force_refresh) {
              window.location.reload();
            }
          } else {
            if (data.errors) {
              var errorStr = '';
              for (var fieldName in data.errors) {
                errorStr = data.errors[fieldName][0];
              }
              if (errorStr) {
                AccountModals.displayDialog('Error', errorStr, data.goto);
              }
            }
          }
        }
      });
    });
  });
});
</script>

  

  
        <div class="whitebox small order-adder-whitebox" id="addorder">
          <div class="whitetop"></div>
          <div class="whitemid"></div>
          <div class="whitebottom"></div>
          <div class="whitecontent">
            <div id="orderwrapper">
              <a href="#" id="expandorder">Like what we're doing?  Click here to increase your order amount!</a>
              <div id="keysizer">
                <div id="quickiefix">
                  Note: use this form if you'd like to boost the amount recorded on your order.
    
                  If you would like to purchase another copy, please go back to the <a href="/books/fandom-philosophy-books" class="green">main page</a> and start a new purchase.
    
                </div>
                <a name="contribute"></a>
                <div id="order-form-holder"><form action="/humbler/submit" id="order-form" class="order-form u-constrain-width" method="post" autocomplete="off">
  <input type="hidden" name="product" value="fandomandphilosophy_bookbundle">
  <input type="hidden" name="payment_type" value="">
  <input type="hidden" name="avg" value="11.96493664871713652201457080">
  <input type="hidden" name="avguuid" value="z80gJrbiZ17t1hu9">
  <input type="hidden" name="avghash" value="KFQp0m8vatw1BGYzB+LhfXhHER6OSsQwhIF3RK+TDFw=">

  <input type="hidden" name="gamekey" value="kUn6uX6dSUrhH5V8">




  <div class="order-form-header">
    <p><i class="hb hb-lock"></i>
      
        Add to your
        <strong>Humble Book Bundle: Fandom &amp; Philosophy presented by Wiley-Blackwell</strong>
        order
      
    </p>
  </div>

  <div class="order-form-amount-selection-step"><div><div class="order-form-adder-amount-radios">

  Name your price:
  <br>

    <input id="rb1" type="radio" name="radio-amount" class="radio-amount" value="100">
    <label for="rb1">$100</label>
    <br>
    <input id="rb2" type="radio" name="radio-amount" class="radio-amount" value="50">
    <label for="rb2">$50</label>
    <br>
    <input id="rb3" type="radio" name="radio-amount" class="radio-amount" value="25" checked="">
    <label for="rb3">$25</label>
    <br>
    <input id="rb4" type="radio" name="radio-amount" class="radio-amount" value="10">
    <label for="rb4">$10</label>
    <br>
    <input id="rb5" type="radio" name="radio-amount" class="radio-amount custom-radio-amount" value="custom">
    <label for="rb5">Custom Amount</label>

    <div class="customAmountHolder">
      <input name="master-amount" class="master-amount" type="text" value="$25.00" style="display:none">
    </div>

</div>
</div>


    <p class="order-form-adder-text">
      New Total: $15.00 + <span class="new-order-amount">$25.00</span> = <strong><span class="new-total">$40.00</span></strong>
    </p>



    <div class="order-form-image-fan-container u-order-form-redesign"></div>

    <div class="order-form-amount-error-container"></div>

    <div class="order-form-leaderboard-step" style="display: none;">You're a top contributor! Please provide a name for our leaderboard:
<input type="text" id="leaderboard_topname" class="order-form-leaderboard-input" name="topname" value="Anonymous" maxlength="70">

<label for="order-form-leaderboard-no-thanks-check" class="order-form-leaderboard-no-thanks-button js-no-thanks-button">No thanks</label>
<input id="order-form-leaderboard-no-thanks-check" type="checkbox">

<a href="https://support.humblebundle.com/hc/en-us/articles/202421394-top-contributor-faq" class="order-form-leaderboard-faq-link" target="_blank" title="Top Contributor FAQ">
  <i class="hb hb-support"></i>
</a>
</div>

    <div class="order-form-recaptcha-step">
      <div id="order-form-recaptcha"></div>
    </div>
  </div>


  <div class="order-form-split-step">
  
    <div class="order-form-split-header js-split-toggle">
      <div class="disclosure-triangle"></div>
      <p class="order-form-split-message js-order-admin-edit" data-entity-kind="product" data-machine-name="fandomandphilosophy_bookbundle" data-anchor-name="#row_splits" data-link-position="after">
        Choose where your money goes
      </p>
      <div class="u-order-form-redesign disclosure-triangle"></div>
      <button type="button" class="order-form-split-reset-button js-split-reset-button" style="display: none;">Reset</button>
    </div>

    <div class="custom-values" style="">
      <div class="custom-values-inner">
        <div class="splits-holder"><div class="order-form-split-payee slider-container">
  <div class="order-form-split">
    <div class="order-form-split-payee-label js-subsplit-toggle">


      <div class="order-form-split-payee-name js-order-form-split-payee-name " style="" title="Wiley-Blackwell">Wiley-Blackwell</div>
    </div>

    <div class="order-form-split-payee-slider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
      <div class="ui-slider-handle ui-state-default ui-corner-all" style="left: 65%;">
        <div class="tri-left"></div>
        <div class="tri-right"></div>
      </div>
    <div class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min" style="width: 65%;"></div></div>

    <input type="text" class="order-form-split-payee-amount-input">
  </div>
</div><div class="order-form-split-payee slider-container cyoc">
  <div class="order-form-split">
    <div class="order-form-split-payee-label js-subsplit-toggle">


      <div class="order-form-split-payee-name js-order-form-split-payee-name js-show-charity-selector show-charity-selector" style="" title="Choose your own charity">WaterAid America</div>
    </div>

    <div class="order-form-split-payee-slider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" style="opacity: 1;">
      <div class="ui-slider-handle ui-state-default ui-corner-all" style="left: 15%;">
        <div class="tri-left"></div>
        <div class="tri-right"></div>
      </div>
    <div class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min" style="width: 15%;"></div></div>

    <input type="text" class="order-form-split-payee-amount-input" style="opacity: 1;">
  </div>
</div>

<div class="js-cyoc-wrapper cyoc-wrapper cyoc" style="">
  <div class="top-arrow"></div>
  <div class="js-cyoc-holder charity-selection"> </div>
</div><div class="order-form-split-payee slider-container">
  <div class="order-form-split">
    <div class="order-form-split-payee-label js-subsplit-toggle">


      <div class="order-form-split-payee-name js-order-form-split-payee-name " style="" title="Humble Tip">Humble Tip</div>
    </div>

    <div class="order-form-split-payee-slider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
      <div class="ui-slider-handle ui-state-default ui-corner-all" style="left: 20%;">
        <div class="tri-left"></div>
        <div class="tri-right"></div>
      </div>
    <div class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min" style="width: 20%;"></div></div>

    <input type="text" class="order-form-split-payee-amount-input">
  </div>
</div><div class="order-form-ppgf-disclaimer">

    Charitable contributions administered by

    <a href="https://support.humblebundle.com/hc/en-us/articles/205183597" class="color-neutral-link" target="_blank">PayPal Giving Fund</a>
  </div></div>
      </div>
    
    </div>

  
  </div>






  <div class="order-form-payment-step">

    <div class="order-form-purchase-in-progress-spinner">
      <img src="https://humblebundle-a.akamaihd.net/static/hashed/26faf55c6e36ba3b1a57f9001942059fe05050f2.gif">
      Processing...
    </div>

    <div class="order-form-payment-options-container">


      <button type="button" class="order-form-stripe-payment-button js-payment-button" data-processor="stripe">
        <i class="hb hb-stripe"></i> Pay with Card
      </button>



      <button type="button" class="order-form-paypal-payment-button js-payment-button" data-processor="paypal">
        Check out with <img alt="Paypal" src="https://humblebundle-a.akamaihd.net/static/hashed/482b7908ee21571518d636bbefc08f0340c55d1e.svg">
      </button>





  
      <button type="button" class="order-form-amazon-payment-button js-payment-button" id="AmazonPayButton" data-processor="amazonhp">
        <i class="hb hb-amazon"></i> Pay with Amazon
      </button>
  



  






    </div>
  </div>
</form>


</div>
                <script type="application/json" id="order-form-extra-data">
  {
    "has_admin_access": false,
    "charity_constants": {"disallowed_charity_ids": [], "CHARITY_SEARCH_PARAMS": {"category": {"Civic and Public Benefit": "Civic and Public Benefit", "Basic Needs and Human Services": "Basic Needs and Human Services", "Health and Sports": "Health and Sports", "Arts and Humanities": "Arts and Humanities", "International": "International", "Education": "Education", "Religious": "Religious", "Environment and Protection of Animals": "Environment and Protection of Animals"}, "country": {"GB": "United Kingdom", "US": "United States"}, "state": {"WA": "Washington", "WI": "Wisconsin", "WV": "West Virginia", "FL": "Florida", "WY": "Wyoming", "NH": "New Hampshire", "NJ": "New Jersey", "NM": "New Mexico", "NC": "North Carolina", "ND": "North Dakota", "NE": "Nebraska", "NY": "New York", "RI": "Rhode Island", "NV": "Nevada", "CO": "Colorado", "CA": "California", "GA": "Georgia", "CT": "Connecticut", "OK": "Oklahoma", "OH": "Ohio", "KS": "Kansas", "SC": "South Carolina", "KY": "Kentucky", "OR": "Oregon", "SD": "South Dakota", "DE": "Delaware", "DC": "District of Columbia", "HI": "Hawaii", "TX": "Texas", "LA": "Louisiana", "TN": "Tennessee", "PA": "Pennsylvania", "VA": "Virginia", "AK": "Alaska", "AL": "Alabama", "AR": "Arkansas", "VT": "Vermont", "IL": "Illinois", "IN": "Indiana", "IA": "Iowa", "AZ": "Arizona", "ID": "Idaho", "ME": "Maine", "MD": "Maryland", "MA": "Massachusetts", "UT": "Utah", "MO": "Missouri", "MN": "Minnesota", "MI": "Michigan", "MT": "Montana", "MS": "Mississippi"}}, "featured_charities": [{"category": "Basic Needs and Human Services", "city": "Washington", "description": "Your gift to Disaster Relief enables the Red Cross to help people prepare for, respond to, and recover from disasters large and small - in your neighborhood and across the country. ", "url": "http://www.redcross.org", "country": "US", "charity_id": "3843", "state": "DC", "keywords": "disaster,armed forces,first aid,emergency response,floods, red cross, american red cross", "human_name": "American Red Cross", "logo_url": "https://pics.paypal.com/00/s/Mjk5MDliMzktMzYwOC00ZDRjLWIyNGQtZDc3N2I3Nzc3ZDQy/file.JPG"}, {"category": "Health and Sports", "city": "Redmond", "description": "Child's Play seeks to improve the lives of children in hospitals and healthcare facilities around the world through the kindness and generosity of the video game industry and the power of play.", "url": "http://www.childsplaycharity.org", "country": "US", "charity_id": "12277", "state": "WA", "keywords": "child's play,childs play,penny arcade,penny-arcade,charity", "human_name": "Child's Play", "logo_url": "https://pics.paypal.com/00/s/NmE5ZmVmNDUtYjhhNS00NGJmLTlkOGMtM2Y4MWZiNzVhODEy/file.PNG"}, {"category": "Education", "city": "San Francisco", "description": "The mission of the Wikimedia Foundation is to empower people around the world to collect and develop educational content under a free license or in the public domain, and to disseminate it globally. In collaboration with a network of chapters, the Foundation provides the essential infrastructure and organizational framework for the support and development of multilingual projects, such as Wikipedia, Wiktionary, Wikiquote, Wikibooks, Wikisource, Wikinews, Wikiversity, Wikispecies, and Wikimedia Commons.", "url": "http://www.wikimediafoundation.org/", "country": "US", "charity_id": "25618", "state": "CA", "keywords": "Encyclopedia,Collaborative,Open Source,Free,Knowledge", "human_name": "Wikimedia Foundation, Inc.", "logo_url": "https://pics.paypal.com/00/s/ZWZjYjUzODQtN2Q5Yy00NDkxLTkxNTYtNjJjMTA3MmVmNGY2/file.PNG"}, {"category": "Housing and Community Affairs,Culture, Sport and Recreation,Social Services and Relief", "city": "Huntingdon", "description": "GamesAid acts as a broker of charitable activity on behalf of individuals and companies within the UK\r\nvideo games industry. Funds are distributed to a diverse range of charities as nominated and\r\nvoted for by its members.\r\n\r\n", "url": "http://www.gamesaid.org", "country": "GB", "charity_id": "31075", "state": "Cambridgeshire", "keywords": "Computer Games, Software Downloads, Disabled Children", "human_name": "GamesAid", "logo_url": "https://pics.paypal.com/00/s/ZmQ4NmQyMjQtMjI1OC00MjRkLWIxNzYtYjdlOThlYjYyOTUz/file.PNG"}, {"category": "Basic Needs and Human Services", "city": "New York", "description": "Right now, 663 million people don't have access to clean water. That's 1 in 11 of us.\r\n\r\ncharity: water is a non-profit organization on a mission to bring clean and safe drinking water to every person on the planet. 100% of all public donations directly fund water project costs, we prove every project we build using photos and GPS coordinates on Google Maps, and we work with strong local implementing partners to build and maintain projects.", "url": "http://www.charitywater.org", "country": "US", "charity_id": "24627", "state": "NY", "keywords": "charity,water,sanitation,Africa,India", "human_name": "Charity Water", "logo_url": "https://pics.paypal.com/00/s/Yjc4NmNmMDQtNDZlZi00ZmE5LThmZTItMWMxMzgxMTk0NDdl/file.JPG"}, {"category": "Basic Needs and Human Services", "city": "New York", "description": "Currently, more than 650 million people live without safe water and 2.3 billion lack access to basic sanitation. WaterAid brings 30+ years of expertise to communities that need the 'know-how' and simple, low-cost equipment to set-up, operate and maintain their water and sanitation systems for the long-term.", "url": "http://www.wateraid.org", "country": "US", "charity_id": "17803", "state": "NY", "keywords": "water, sanitation, toilet, women's rights, education, poverty", "human_name": "WaterAid America", "logo_url": "https://pics.paypal.com/00/p/OWY0ZTU2MGItYjg4Yi00ZmZhLWFmNzktNmZkNjRkNWEyZDRi/image_3.JPG"}, {"category": "Civic and Public Benefit,Basic Needs and Human Services,Education", "city": "Harpers Ferry", "description": "The AbleGamers Foundation, also known as AbleGamers Charity, is a 50c(3) nonprofit public charity that aims to improve the overall quality of life for those with disabilities through the power of video games. With the support of large studios, and individual gamers, we are able to use the our love of video games to give people a sense of belonging, and a chance to be anything they want to be, regardless of ability. Thank you for your support.", "url": "http://ablegamers.com", "country": "US", "charity_id": "34580", "featured": true, "state": "WV", "keywords": "Disabled,Video Games,Handicap,Accessibility,people with disabilities, social isolation, depression", "human_name": "The AbleGamers Foundation Inc", "logo_url": "https://pics.paypal.com/00/s/OTkwMjFjNTEtZGNhOS00NzhhLTgwNmYtN2Y1N2RiNjlkN2Vm/file.PNG"}], "user_charity_id": "17803", "FEATURED_CHARITY_IDS": ["3843", "12277", "25618", "31075", "24627", "17803", "34580"], "CHARITY_SEARCH_PARAM_ORDER": ["query", "category", "country", "state", "page"]},
    "allowed_payment_processors": ["amazonhp", "free", "paypal", "stripe"],
    "streamlabs_enabled": false
  }
</script>

              </div>
            </div>
          </div>
        </div>

  
  

  <div class="js-asm-switcher-holder asm-download-page"></div>

  

  

  
  <div class="js-subproduct-whitebox-holder"></div>
  

  

  





 
  


<script id="gift-confirm-dialog-template" type="text/template">
<div class='generic-popup outer-shadow' id='gift-confirm-dialog'>
  <div class='generic-popup content'>
    <h1 class='noimg'>Gift this item?</h1>
    <h2 class='subtitle'>Gifting this item removes it from your order and turns it into a giftable link. You can't undo this action.</h2>
    <div class='no-center'>
      <div class='button-holder'>
        <a class='button-link cancel' href='#' data-goto=''><span class='gray-button'>Cancel</span></a>
        <a class='button-link submit' href='#'><span class='green-button'>Create Gift Link</span></a>
      </div>
      <div class='clearfix'></div>
    </div>
  </div>
</div>
</script>

  

  
    
      


<div class="whitebox small">
  <div class="whitetop"></div>
  <div class="whitemid"></div>
  <div class="whitebottom"></div>
  <div class="whitecontent">
    <div class="ebookinstructions" id="kindleinstructions">
      <a href="#" class="js-slide-down-trigger slide-down-trigger">Send the eBooks to my Kindle or Kindle reader</a>
      <div class="slide-down">
          <h2>Via USB</h2>
          <div class="stepholder">
            <div class="step num1"></div>
            <div class="steptext">
              <h3>Download your desired eBooks below as MOBI</h3>
            </div>
          </div>
          <div class="stepholder">
            <div class="step num2"></div>
            <div class="steptext">
              <h3>Follow <a href="http://www.amazon.com/gp/help/customer/display.html?nodeId=200798780" target="_blank">Amazon's official instructions on transferring your eBooks via USB</a></h3>
            </div>
          </div>

          <h2>Via Email</h2>
          <div class="stepholder">
            <div class="step"></div>
            <div class="steptext">
              <h3>Warning: Graphic novels must be transferred via USB due to their large file size of 10MB or more.</h3>
            </div>
          </div>
          <div class="stepholder">
            <div class="step num1"></div>
            <div class="steptext">
              <h3>Ensure your device is connected to the internet</h3>
              <p>To avoid mobile data charges, we recommend using Wi-Fi to transfer the eBooks to your device.</p>
            </div>
          </div>
          <div class="stepholder">
            <div class="step num2"></div>
            <div class="steptext">
              <h3>Allow Humble Bundle to email your Kindle account</h3>
              <p>
                Visit Amazon's <a href="https://www.amazon.com/gp/digital/fiona/manage?ie=UTF8" target="_blank">Manage Your Kindle</a> page and select the Settings tab.
                Locate the section titled <em><strong>Approved Personal Document E-mail List</strong></em>, click <em><strong>Add a new approved e-mail address</strong></em>, and type:
                </p><pre class="pre-box">kindle@humblebundle.com</pre>
              <p></p>
            </div>
          </div>
          <div class="stepholder">
            <div class="step num3"></div>
            <div class="steptext">
              <h3>Select which eBooks to Email</h3>
              <p>
                From the <a href="https://www.amazon.com/mn/dcw/myx.html#/home/settings/payment" target="_blank">Settings</a> page above, locate your Kindle email ending in @kindle.com from the <em><strong>Send-to-Kindle E-Mail Settings</strong></em> section and enter it into the input box below.
              </p>
              <p>
                Please note that you can now send individual titles to your Kindle!
                Simply select which book(s) you would like to send below before hitting the "Send Email" button.
                If you experience issues receiving your eBooks (sometimes caused by certain types of eReaders and the size of the eBooks), you may want to use this option.
              </p>
              <p>
                Please be aware that only certain titles are listed and available to send using this feature due to a 10MB size restriction.
              </p>
              <form method="POST" action="/util/kindle" class="sms-form" id="ebook-email-form">
                <input type="hidden" name="key" value="kUn6uX6dSUrhH5V8">
                <div class="clearfix"></div>
                <input id="email-kindle" class="classy-input" type="text" name="email_prefix" value="" placeholder="Your kindle address"> <strong>@free.kindle.com</strong>
                <input type="submit" id="send-ebook-email" class="button-link green-button" value="Send Email">
                <div class="clearfix"></div>
                <div id="send-email-message"></div>
                <div class="clearfix"></div>
                <p class="email-details">
                  We use the <em>@free.kindle.com</em> email domain <a href="http://www.amazon.com/gp/help/customer/display.html/?nodeId=200767340#fees" target="_blank">to avoid charging you</a>.
                </p>
                <br>
              <input type="checkbox" checked="checked" name="selected_books" value="blacksabbathandphilosophy_ebook">Black Sabbath and Philosophy: Mastering Reality<br><input type="checkbox" checked="checked" name="selected_books" value="finalfantasyandphilosophy_ebook">Final Fantasy and Philosophy: The Ultimate Walkthrough<br><input type="checkbox" checked="checked" name="selected_books" value="watchmenandphilosophy_ebook">Watchmen and Philosophy: A Rorschach Test<br><input type="checkbox" checked="checked" name="selected_books" value="supermanandphilosophy_ebook">Superman and Philosophy: What Would the Man of Steel Do?<br><input type="checkbox" checked="checked" name="selected_books" value="ironmanandphilosophy_ebook">Iron Man and Philosophy: Facing the Stark Reality<br><input type="checkbox" checked="checked" name="selected_books" value="spidermanandphilosophy_ebook">Spider-Man and Philosophy: The Web of Inquiry<br><input type="checkbox" checked="checked" name="selected_books" value="xmenandphilosophy_ebook">X-Men and Philosophy: Astonishing Insight and Uncanny Argument in the Mutant X-Verse<br><input type="checkbox" checked="checked" name="selected_books" value="gameofthronesandphilosophy_ebook">Game of Thrones and Philosophy: Logic Cuts Deeper Than Swords<br><input type="checkbox" checked="checked" name="selected_books" value="thehobbitandphilosophy_ebook">The Hobbit and Philosophy: For When You've Lost Your Dwarves, Your Wizard, and Your Way<br><input type="checkbox" checked="checked" name="selected_books" value="thewalkingdeadandphilosophy_ebook">The Walking Dead and Philosophy: Shotgun. Machete. Reason.<br><input type="checkbox" checked="checked" name="selected_books" value="ultimatesouthparkandphilosophy_ebook">The Ultimate South Park and Philosophy: Respect My Philosophah!<br><input type="checkbox" checked="checked" name="selected_books" value="battlestargalacticaandphilosophy_ebook">Battlestar Galactica and Philosophy: Knowledge Here Begins Out There<br></form>
              <p>Try syncing your device with the Kindle server if eBooks are not appearing.</p>
            </div>
          </div>
      </div> 
    </div>
  </div>
</div>


<div class="whitebox small">
  <div class="whitetop"></div>
  <div class="whitemid"></div>
  <div class="whitebottom"></div>
  <div class="whitecontent">
    <div class="ebookinstructions" id="otherebookinstructions">
  
  
      <a href="https://support.humblebundle.com/hc/en-us/articles/202712300" target="_blank" class="open-in-external-window">
  
      Instructions for Android, Nook, Kindle, and iOS devices</a>
    </div>
  </div>
</div>

    
  

  
      <div class="whitebox">
        <div class="whitetop"></div>
        <div class="whitemid"></div>
        <div class="whitebottom"></div>
        <div class="whitecontent">
          <div class="js-gamelist-holder">

          <div class="js-platform-chooser-holder"><div class="js-platform-chooser platform-chooser">
  <div class="dlplatform">
    <div class="textlabel">Choose platform:</div>
    <div class="dlplatform-list">
  
      
      
      <div data-platform="ebook" class="flexbtn ebook active">
        <div class="icon"></div>
        <div class="right"></div>
        <span class="label">eBooks</span><a class="a" href="#">eBooks</a>
      </div>
  
    </div>
  </div>
  <div style="clear:both;padding:4px;"></div>

  <div class="dltype">
    <div class="textlabel">Choose download type:
    </div>
    <div data-type="direct" class="flexbtn direct active">
      <div class="icon"></div>
      <div class="right"></div>
      <span class="label">Direct link</span><a class="a" href="#">Direct link</a>
    </div>
    <div data-type="bittorrent" class="flexbtn bittorrent">
      <div class="icon"></div>
      <div class="right"></div>
      <span class="label">BitTorrent</span><a class="a" href="#">BitTorrent</a>
    </div>
  </div>
  <div style="clear:both;padding:4px;"></div>

</div>
<div class="clear-fix"></div></div>
<div class="js-pre-downloads-holder" style="display: none;"></div>
<div class="js-progress-bar-holder"><div id="download-page-progress-bar" style="display: none;">
  <div id="download-page-outer-progress">
    <div id="download-page-inner-progress" style="width: 100%;"></div>
  </div>
  <div id="download-page-progress-text">1 of 1 orders retrieved.</div>
</div></div>
<div class="js-all-downloads-holder" style=""><div class="row battlestargalacticaandphilosophy show" data-human-name="Battlestar Galactica and Philosophy: Knowledge Here Begins Out There">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1405178140" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/be1d81beeb8a0ac2ac6067f93b3dd10cfd2061a4.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1405178140" target="_blank">
        Battlestar Galactica and Philosophy: Knowledge Here Begins Out There
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="battlestargalacticaandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1405178140" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="battlestargalacticaandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="battlestargalacticaandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="battlestargalacticaandphilosophy" data-download="battlestargalacticaandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="c4215d72b2de80e1cf1f61b8386b306a">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/battlestargalacticaandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=a0ef6e28c8c7323ffe5547971fe698aa" data-web="https://dl.humble.com/battlestargalacticaandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=a0ef6e28c8c7323ffe5547971fe698aa" data-bt="https://dl.humble.com/torrents/battlestargalacticaandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=ef2aafa2cb1a01e7005c848110f54d2a" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">579.2 kB</span>
    
      <a href="#c4215d72b2de80e1cf1f61b8386b306a" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="battlestargalacticaandphilosophy" data-download="battlestargalacticaandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="17253f69ee282ed54d7c27232288fcd2">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/battlestargalacticaandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=03430606011eac62325dbd6928776d6a" data-web="https://dl.humble.com/battlestargalacticaandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=03430606011eac62325dbd6928776d6a" data-bt="https://dl.humble.com/torrents/battlestargalacticaandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=bcc55972b99be876ed682ceb85b671d4" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">551.1 kB</span>
    
      <a href="#17253f69ee282ed54d7c27232288fcd2" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="battlestargalacticaandphilosophy" data-download="battlestargalacticaandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="b5d7e9ad0d131479f26a94d75caf21e4">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/battlestargalacticaandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=089febb5f759771ee04ed879f81889b7" data-web="https://dl.humble.com/battlestargalacticaandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=089febb5f759771ee04ed879f81889b7" data-bt="https://dl.humble.com/torrents/battlestargalacticaandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=7d8461a326d8e564134cd107af46e1e5" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">833.1 kB</span>
    
      <a href="#b5d7e9ad0d131479f26a94d75caf21e4" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row bioshockandphilosophy show" data-human-name="BioShock and Philosophy: Irrational Game, Rational Book">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1118915860" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/ebe9e15c9cf601458ed7eb5d0c242a21ca88260e.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1118915860" target="_blank">
        BioShock and Philosophy: Irrational Game, Rational Book
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="bioshockandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1118915860" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="bioshockandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="bioshockandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="bioshockandphilosophy" data-download="bioshockandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="adbd1ec43059705e27c3fdeb453a3f40">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/bioshockandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=32191ab44cce51d3fc42ffe2c61730b3" data-web="https://dl.humble.com/bioshockandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=32191ab44cce51d3fc42ffe2c61730b3" data-bt="https://dl.humble.com/torrents/bioshockandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=10201f491bc01f3801baf482a0449061" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">1 MB</span>
    
      <a href="#adbd1ec43059705e27c3fdeb453a3f40" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="bioshockandphilosophy" data-download="bioshockandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="d39eb91807b1d69d2f15a5b085b9f870">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/bioshockandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=19de3491f96033db83c454a7d8a8c8bf" data-web="https://dl.humble.com/bioshockandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=19de3491f96033db83c454a7d8a8c8bf" data-bt="https://dl.humble.com/torrents/bioshockandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=431d9e99f463ea4f2487e211b766672d" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">5.2 MB</span>
    
      <a href="#d39eb91807b1d69d2f15a5b085b9f870" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row blacksabbathandphilosophy show" data-human-name="Black Sabbath and Philosophy: Mastering Reality">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1118397592" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/c6129ca69e933ba8c2995ec756cff3cea698670d.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1118397592" target="_blank">
        Black Sabbath and Philosophy: Mastering Reality
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="blacksabbathandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1118397592" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="blacksabbathandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="blacksabbathandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="blacksabbathandphilosophy" data-download="blacksabbathandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="66768e410366e2a71fcce147334393c4">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/blacksabbathandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=1e8728f0613acd93370cf5d1cb35156e" data-web="https://dl.humble.com/blacksabbathandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=1e8728f0613acd93370cf5d1cb35156e" data-bt="https://dl.humble.com/torrents/blacksabbathandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=37e0bd6b7fb2b8f58bc7c8881cabccae" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">1.1 MB</span>
    
      <a href="#66768e410366e2a71fcce147334393c4" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="blacksabbathandphilosophy" data-download="blacksabbathandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="0e98864bcd40f79123bb360d3576951a">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/blacksabbathandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=6910fd18f002a6ab0f45e177cb73ddc7" data-web="https://dl.humble.com/blacksabbathandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=6910fd18f002a6ab0f45e177cb73ddc7" data-bt="https://dl.humble.com/torrents/blacksabbathandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=dfe53cfb538cc046dae07d7818247676" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">336.7 kB</span>
    
      <a href="#0e98864bcd40f79123bb360d3576951a" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="blacksabbathandphilosophy" data-download="blacksabbathandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="b2c6d3ecbdca0bef5f4343acd9f7b0f9">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/blacksabbathandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=b696dd37339e3881e6ad265345ef8914" data-web="https://dl.humble.com/blacksabbathandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=b696dd37339e3881e6ad265345ef8914" data-bt="https://dl.humble.com/torrents/blacksabbathandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=0dc7ba64dcf9faa4d23bc560833c13fe" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">3.2 MB</span>
    
      <a href="#b2c6d3ecbdca0bef5f4343acd9f7b0f9" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row dungeonsanddragonsandphilosophy show" data-human-name="Dungeons and Dragons and Philosophy: Read and Gain Advantage on All Wisdom Checks">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1118397622" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/72d304a30eb494ebf91426824f732da406997b9c.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1118397622" target="_blank">
        Dungeons and Dragons and Philosophy: Read and Gain Advantage on All Wisdom Checks
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="dungeonsanddragonsandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1118397622" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="dungeonsanddragonsandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="dungeonsanddragonsandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="dungeonsanddragonsandphilosophy" data-download="dungeonsanddragonsandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="4b1e4ff65695458509e376c77b0f8242">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/dungeonsanddragonsandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=a1bc14922b94d558781ecd13ccdd1898" data-web="https://dl.humble.com/dungeonsanddragonsandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=a1bc14922b94d558781ecd13ccdd1898" data-bt="https://dl.humble.com/torrents/dungeonsanddragonsandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=ad27270d4a45d003e53335ad00db8c97" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">399.4 kB</span>
    
      <a href="#4b1e4ff65695458509e376c77b0f8242" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="dungeonsanddragonsandphilosophy" data-download="dungeonsanddragonsandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="937bbd1e7a7117383f85b2154293bcd5">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/dungeonsanddragonsandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=5d395cb5a21cd62b90b5ca28030ce1e4" data-web="https://dl.humble.com/dungeonsanddragonsandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=5d395cb5a21cd62b90b5ca28030ce1e4" data-bt="https://dl.humble.com/torrents/dungeonsanddragonsandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=79c76505c25fb79cba6e0b7ddfd65751" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">2.1 MB</span>
    
      <a href="#937bbd1e7a7117383f85b2154293bcd5" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row familyguyandphilosophy show" data-human-name="Family Guy and Philosophy: A Cure for the Petarded">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?140516316X" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/30b6d8e71566e8a506b695741f3bbe03fc3048da.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?140516316X" target="_blank">
        Family Guy and Philosophy: A Cure for the Petarded
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="familyguyandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?140516316X" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="familyguyandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="familyguyandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="familyguyandphilosophy" data-download="familyguyandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="9ede8dda06cf846864493d0262e50620">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/familyguyandphilosophy_1500658630.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=9ae457edc0ae1b33e0544199227096b0" data-web="https://dl.humble.com/familyguyandphilosophy_1500658630.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=9ae457edc0ae1b33e0544199227096b0" data-bt="https://dl.humble.com/torrents/familyguyandphilosophy_1500658630.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=64b256c86989fbd7394834cc3687199b" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">1.5 MB</span>
    
      <a href="#9ede8dda06cf846864493d0262e50620" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row finalfantasyandphilosophy show" data-human-name="Final Fantasy and Philosophy: The Ultimate Walkthrough">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?0470415363" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/c4f9a728af0809b23915b38355d51466cd0d5077.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?0470415363" target="_blank">
        Final Fantasy and Philosophy: The Ultimate Walkthrough
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="finalfantasyandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?0470415363" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="finalfantasyandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="finalfantasyandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="finalfantasyandphilosophy" data-download="finalfantasyandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="8091c0ba666eed7b17f7d0378c3f3ac5">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/finalfantasyandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=b3650517b24b7b206ac498e923bc9632" data-web="https://dl.humble.com/finalfantasyandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=b3650517b24b7b206ac498e923bc9632" data-bt="https://dl.humble.com/torrents/finalfantasyandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=4665c8d7e9004c3348bcb45ea77af556" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">389.7 kB</span>
    
      <a href="#8091c0ba666eed7b17f7d0378c3f3ac5" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="finalfantasyandphilosophy" data-download="finalfantasyandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="b50dc13670a9b135c4696ab3922ad8cb">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/finalfantasyandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=70f02cf0cc9f4835f1fe526402b33982" data-web="https://dl.humble.com/finalfantasyandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=70f02cf0cc9f4835f1fe526402b33982" data-bt="https://dl.humble.com/torrents/finalfantasyandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=1fee4e89ae512fd5f4ef8a4a66727a72" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">312.8 kB</span>
    
      <a href="#b50dc13670a9b135c4696ab3922ad8cb" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="finalfantasyandphilosophy" data-download="finalfantasyandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="3894120928e54c4ebb72899b15ff1245">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/finalfantasyandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=3905c5c799a2be50210875af0bfcd64f" data-web="https://dl.humble.com/finalfantasyandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=3905c5c799a2be50210875af0bfcd64f" data-bt="https://dl.humble.com/torrents/finalfantasyandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=10068d1cd089974a83ecf0710944e95d" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">1.4 MB</span>
    
      <a href="#3894120928e54c4ebb72899b15ff1245" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row gameofthronesandphilosophy show" data-human-name="Game of Thrones and Philosophy: Logic Cuts Deeper Than Swords">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1118161998" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/3f05addc4da3dd16adc55affe33af7ea1c318ce7.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1118161998" target="_blank">
        Game of Thrones and Philosophy: Logic Cuts Deeper Than Swords
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="gameofthronesandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1118161998" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="gameofthronesandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="gameofthronesandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="gameofthronesandphilosophy" data-download="gameofthronesandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="ed26869eb9527e9db944fd39fa141a00">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/gameofthronesandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=f3c80814c850e4ddbd09ba43f6932229" data-web="https://dl.humble.com/gameofthronesandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=f3c80814c850e4ddbd09ba43f6932229" data-bt="https://dl.humble.com/torrents/gameofthronesandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=f5813cd535371c0ce7364f314a8e0042" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">558.1 kB</span>
    
      <a href="#ed26869eb9527e9db944fd39fa141a00" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="gameofthronesandphilosophy" data-download="gameofthronesandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="ed6e561af5fc4d34509e2ec7f6e9e9b0">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/gameofthronesandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=c5bf4118449c8126ae34bc208ad7e214" data-web="https://dl.humble.com/gameofthronesandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=c5bf4118449c8126ae34bc208ad7e214" data-bt="https://dl.humble.com/torrents/gameofthronesandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=14b29fe9db744483e9d322a24a45280a" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">835.5 kB</span>
    
      <a href="#ed6e561af5fc4d34509e2ec7f6e9e9b0" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="gameofthronesandphilosophy" data-download="gameofthronesandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="58493648cd8af49b21e0f4acc4ef9ce9">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/gameofthronesandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=901e39b1a4aede67e96f5e7e7d2f2362" data-web="https://dl.humble.com/gameofthronesandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=901e39b1a4aede67e96f5e7e7d2f2362" data-bt="https://dl.humble.com/torrents/gameofthronesandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=642c77fc60130677cd92d452212e65ec" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">3.4 MB</span>
    
      <a href="#58493648cd8af49b21e0f4acc4ef9ce9" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row houseofcardsandphilosophy show" data-human-name="House of Cards and Philosophy: Underwood's Republic">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1119092779" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/a9906cd2c26885ab47acdb55b8b47c22437cec7f.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1119092779" target="_blank">
        House of Cards and Philosophy: Underwood's Republic
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="houseofcardsandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1119092779" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="houseofcardsandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="houseofcardsandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="houseofcardsandphilosophy" data-download="houseofcardsandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="186c8a19030c23cec73955c076a01355">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/houseofcardsandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=d39e52db1d4257de10057db0d11bf46f" data-web="https://dl.humble.com/houseofcardsandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=d39e52db1d4257de10057db0d11bf46f" data-bt="https://dl.humble.com/torrents/houseofcardsandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=3aa3e300afb97c10d9c8a0e524f8f2a1" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">473.5 kB</span>
    
      <a href="#186c8a19030c23cec73955c076a01355" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="houseofcardsandphilosophy" data-download="houseofcardsandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="fbe0639df8b53a5f60bc1dd91d2bfb25">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/houseofcardsandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=8e1e07f148be5d3b9458d13aff5da248" data-web="https://dl.humble.com/houseofcardsandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=8e1e07f148be5d3b9458d13aff5da248" data-bt="https://dl.humble.com/torrents/houseofcardsandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=085aac371982275f840257b5d59d36dd" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">11.8 MB</span>
    
      <a href="#fbe0639df8b53a5f60bc1dd91d2bfb25" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row ironmanandphilosophy show" data-human-name="Iron Man and Philosophy: Facing the Stark Reality">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?0470482184" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/8352b4ccc4360b90448c73cab441fd393523ec20.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?0470482184" target="_blank">
        Iron Man and Philosophy: Facing the Stark Reality
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="ironmanandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?0470482184" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="ironmanandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="ironmanandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ironmanandphilosophy" data-download="ironmanandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="94f6ad0fe0cb97c6cf1b49f12f825350">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/ironmanandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=89b634e09478eb0ed88804ede16fb0a7" data-web="https://dl.humble.com/ironmanandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=89b634e09478eb0ed88804ede16fb0a7" data-bt="https://dl.humble.com/torrents/ironmanandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=e788d9da1178cddead233fe34c36835e" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">463.4 kB</span>
    
      <a href="#94f6ad0fe0cb97c6cf1b49f12f825350" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ironmanandphilosophy" data-download="ironmanandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="681942690b84a869d0dd369d95975d87">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/ironmanandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=3e5f6961dde9e3875fdb6f8906b6f711" data-web="https://dl.humble.com/ironmanandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=3e5f6961dde9e3875fdb6f8906b6f711" data-bt="https://dl.humble.com/torrents/ironmanandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=09975619903a861ca5655aaf2d513624" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">344 kB</span>
    
      <a href="#681942690b84a869d0dd369d95975d87" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ironmanandphilosophy" data-download="ironmanandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="6c8e7720c201b75aba7252ce45dedca9">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/ironmanandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=b1490bbe57cb65b74f1546b4083bd1c1" data-web="https://dl.humble.com/ironmanandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=b1490bbe57cb65b74f1546b4083bd1c1" data-bt="https://dl.humble.com/torrents/ironmanandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=158223e491aaee35567078008480c353" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">2.1 MB</span>
    
      <a href="#6c8e7720c201b75aba7252ce45dedca9" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row metallicaandphilosophy show" data-human-name="Metallica and Philosophy: A Crash Course in Brain Surgery">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1405163488" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/b490997e54be3f5798ec89b92097e156bb7f45bf.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1405163488" target="_blank">
        Metallica and Philosophy: A Crash Course in Brain Surgery
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="metallicaandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1405163488" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="metallicaandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="metallicaandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="metallicaandphilosophy" data-download="metallicaandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="c0226975f8e3cd915cc94b94088d3555">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/metallicaandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=888908b470404da8ea6564c9444025ed" data-web="https://dl.humble.com/metallicaandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=888908b470404da8ea6564c9444025ed" data-bt="https://dl.humble.com/torrents/metallicaandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=087a726510459a6f1406fe0e530ca4d9" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">4.1 MB</span>
    
      <a href="#c0226975f8e3cd915cc94b94088d3555" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row spidermanandphilosophy show" data-human-name="Spider-Man and Philosophy: The Web of Inquiry">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?0470575603" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/04c02d16215aaee423cb9f8b80f60d3bbffde309.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?0470575603" target="_blank">
        Spider-Man and Philosophy: The Web of Inquiry
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="spidermanandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?0470575603" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="spidermanandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="spidermanandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="spidermanandphilosophy" data-download="spidermanandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="f290b097d0ff3f9b5510c73f1c764de1">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/spidermanandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=e2018604e53412f3bb65ef8ef90d2750" data-web="https://dl.humble.com/spidermanandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=e2018604e53412f3bb65ef8ef90d2750" data-bt="https://dl.humble.com/torrents/spidermanandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=9a8c27715d63311204f39b04c12d3a06" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">500.2 kB</span>
    
      <a href="#f290b097d0ff3f9b5510c73f1c764de1" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="spidermanandphilosophy" data-download="spidermanandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="85ea7467573ad00d2c9daf44cd9c822c">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/spidermanandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=99ce4bcf2252f3bbd87fd34fbe2bd3fe" data-web="https://dl.humble.com/spidermanandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=99ce4bcf2252f3bbd87fd34fbe2bd3fe" data-bt="https://dl.humble.com/torrents/spidermanandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=c1810f8c4e2254a69e147bfcb974120a" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">779.8 kB</span>
    
      <a href="#85ea7467573ad00d2c9daf44cd9c822c" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="spidermanandphilosophy" data-download="spidermanandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="f987d0495378ee268e6b12449fa5bc8a">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/spidermanandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=630782ca1815d73fc2f2b70aa07eaf9c" data-web="https://dl.humble.com/spidermanandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=630782ca1815d73fc2f2b70aa07eaf9c" data-bt="https://dl.humble.com/torrents/spidermanandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=a1cd0e3d5c52c84ec467b8e904084c69" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">3.4 MB</span>
    
      <a href="#f987d0495378ee268e6b12449fa5bc8a" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row supermanandphilosophy show" data-human-name="Superman and Philosophy: What Would the Man of Steel Do?">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1118018095" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/850bc02f5b6d4bf64d5bc2f6915e2660191e1473.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1118018095" target="_blank">
        Superman and Philosophy: What Would the Man of Steel Do?
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="supermanandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1118018095" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="supermanandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="supermanandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="supermanandphilosophy" data-download="supermanandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="ae514751aa78e7c78b7f616c75eb9a5e">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/supermanandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=a609c924ddd5b006062dc73ff70cd7b5" data-web="https://dl.humble.com/supermanandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=a609c924ddd5b006062dc73ff70cd7b5" data-bt="https://dl.humble.com/torrents/supermanandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=08f0df1690fce529bae43a335d34423e" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">1.4 MB</span>
    
      <a href="#ae514751aa78e7c78b7f616c75eb9a5e" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="supermanandphilosophy" data-download="supermanandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="0db77a1f27960bca0fe51d761bc817c4">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/supermanandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=944a93a3ddcee2b699aecb798b778b4a" data-web="https://dl.humble.com/supermanandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=944a93a3ddcee2b699aecb798b778b4a" data-bt="https://dl.humble.com/torrents/supermanandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=e9935ed5bc7cfec947be27c45ae3f161" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">416.3 kB</span>
    
      <a href="#0db77a1f27960bca0fe51d761bc817c4" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="supermanandphilosophy" data-download="supermanandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="ccd821ad427512059bda36391daf88f5">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/supermanandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=8e024106b5efe2009b63685402e25480" data-web="https://dl.humble.com/supermanandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=8e024106b5efe2009b63685402e25480" data-bt="https://dl.humble.com/torrents/supermanandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=7ae9dd1472e4e45d873cb42069f61181" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">22.9 MB</span>
    
      <a href="#ccd821ad427512059bda36391daf88f5" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row thehobbitandphilosophy show" data-human-name="The Hobbit and Philosophy: For When You've Lost Your Dwarves, Your Wizard, and Your Way">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?0470405147" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/2fdee33e039dbf7a85566d7330c5e0a511abc8d0.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?0470405147" target="_blank">
        The Hobbit and Philosophy: For When You've Lost Your Dwarves, Your Wizard, and Your Way
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="thehobbitandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?0470405147" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="thehobbitandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="thehobbitandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="thehobbitandphilosophy" data-download="thehobbitandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="01a21883ec6aceaf0012920d54a717bb">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/thehobbitandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=60d09bc8b267ed2d26135f2eb98cc680" data-web="https://dl.humble.com/thehobbitandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=60d09bc8b267ed2d26135f2eb98cc680" data-bt="https://dl.humble.com/torrents/thehobbitandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=2e8fe6a8a38db1ed2a3bd04b1d089a50" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">1.9 MB</span>
    
      <a href="#01a21883ec6aceaf0012920d54a717bb" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="thehobbitandphilosophy" data-download="thehobbitandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="e84f26b65e42b27db8897ec132a8e5a1">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/thehobbitandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=358e554e06278dc6175ca85093ce6799" data-web="https://dl.humble.com/thehobbitandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=358e554e06278dc6175ca85093ce6799" data-bt="https://dl.humble.com/torrents/thehobbitandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=fc3d91dfaea091b9692db42be07cee98" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">939.5 kB</span>
    
      <a href="#e84f26b65e42b27db8897ec132a8e5a1" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="thehobbitandphilosophy" data-download="thehobbitandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="20d7408dc9dbdc169520842cd0feb589">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/thehobbitandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=52e866cd48e39d75f77c9ec7e3ca1c29" data-web="https://dl.humble.com/thehobbitandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=52e866cd48e39d75f77c9ec7e3ca1c29" data-bt="https://dl.humble.com/torrents/thehobbitandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=3b8b6ff9ac56c7cc710ea6a270f05126" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">2.6 MB</span>
    
      <a href="#20d7408dc9dbdc169520842cd0feb589" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row ultimatesouthparkandphilosophy show" data-human-name="The Ultimate South Park and Philosophy: Respect My Philosophah!">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1118386566" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/769ca5d71d641ec026e9c06987af2ebc070e9f03.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1118386566" target="_blank">
        The Ultimate South Park and Philosophy: Respect My Philosophah!
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="ultimatesouthparkandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1118386566" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="ultimatesouthparkandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="ultimatesouthparkandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ultimatesouthparkandphilosophy" data-download="ultimatesouthparkandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="80210f324b61035ee18b3721b504b28f">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/ultimatesouthparkandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=1a792bf2589b8d8fce06b781f10c050d" data-web="https://dl.humble.com/ultimatesouthparkandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=1a792bf2589b8d8fce06b781f10c050d" data-bt="https://dl.humble.com/torrents/ultimatesouthparkandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=67f3c492a6df5b936766c6ebd4c7d9b8" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">1.4 MB</span>
    
      <a href="#80210f324b61035ee18b3721b504b28f" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ultimatesouthparkandphilosophy" data-download="ultimatesouthparkandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="4d67011e43bcf9f634246c2f00f4621e">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/ultimatesouthparkandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=680ae27e7d1cc50e364626379c725189" data-web="https://dl.humble.com/ultimatesouthparkandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=680ae27e7d1cc50e364626379c725189" data-bt="https://dl.humble.com/torrents/ultimatesouthparkandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=d15dd47d69ad3e130076b4f35e536f6a" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">389.4 kB</span>
    
      <a href="#4d67011e43bcf9f634246c2f00f4621e" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ultimatesouthparkandphilosophy" data-download="ultimatesouthparkandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="64d127abec9819c7ddd9d5d58c27f3d5">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/ultimatesouthparkandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=50f1180a94cb7d02f31e2a98cbebf003" data-web="https://dl.humble.com/ultimatesouthparkandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=50f1180a94cb7d02f31e2a98cbebf003" data-bt="https://dl.humble.com/torrents/ultimatesouthparkandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=a385aae76eaa537f82e0c4f0baea8bd6" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">2.6 MB</span>
    
      <a href="#64d127abec9819c7ddd9d5d58c27f3d5" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row ultimatestartrekandphilosophy show" data-human-name="The Ultimate Star Trek and Philosophy: The Search for Socrates">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1119146003" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/d372e66b95118cfdd37554bd6e4fe459887c63d9.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1119146003" target="_blank">
        The Ultimate Star Trek and Philosophy: The Search for Socrates
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="ultimatestartrekandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1119146003" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="ultimatestartrekandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="ultimatestartrekandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ultimatestartrekandphilosophy" data-download="ultimatestartrekandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="e3c94de159066581083d3edd8741ca04">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/ultimatestartrekandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=e185499c97243567a92df3aeca0605dc" data-web="https://dl.humble.com/ultimatestartrekandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=e185499c97243567a92df3aeca0605dc" data-bt="https://dl.humble.com/torrents/ultimatestartrekandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=574f1ddda50ba259ce88627f697065b7" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">643.2 kB</span>
    
      <a href="#e3c94de159066581083d3edd8741ca04" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ultimatestartrekandphilosophy" data-download="ultimatestartrekandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="9288dc2d39547a5479098bd00f6f272e">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/ultimatestartrekandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=7d6b59984147c5342fca7850f00db1c7" data-web="https://dl.humble.com/ultimatestartrekandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=7d6b59984147c5342fca7850f00db1c7" data-bt="https://dl.humble.com/torrents/ultimatestartrekandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=37f5f1e4434ee94059c1db13ef69d8c9" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">2.1 MB</span>
    
      <a href="#9288dc2d39547a5479098bd00f6f272e" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row ultimatestarwarsandphilosophy show" data-human-name="The Ultimate Star Wars and Philosophy: You Must Unlearn What You Have Learned">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1119038065" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/d245f250a0f896a5d8f90766e66cd129a5dd4a94.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1119038065" target="_blank">
        The Ultimate Star Wars and Philosophy: You Must Unlearn What You Have Learned
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="ultimatestarwarsandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1119038065" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="ultimatestarwarsandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="ultimatestarwarsandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ultimatestarwarsandphilosophy" data-download="ultimatestarwarsandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="e1e256f706d3cb01c48d4e0734d90bd9">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/ultimatestarwarsandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=e8c3065964043ee244ca89d3acb336fa" data-web="https://dl.humble.com/ultimatestarwarsandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=e8c3065964043ee244ca89d3acb336fa" data-bt="https://dl.humble.com/torrents/ultimatestarwarsandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=de5da9f9bbe7c78466641500593af4dc" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">749.4 kB</span>
    
      <a href="#e1e256f706d3cb01c48d4e0734d90bd9" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="ultimatestarwarsandphilosophy" data-download="ultimatestarwarsandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="96c9e6257e36309e096fcff4fefbc8ad">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/ultimatestarwarsandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=9a8566438b74ecb7e0d3dc61d7f95c78" data-web="https://dl.humble.com/ultimatestarwarsandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=9a8566438b74ecb7e0d3dc61d7f95c78" data-bt="https://dl.humble.com/torrents/ultimatestarwarsandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=1f85a58fa23970de4379cb567ac3b8b7" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">7.4 MB</span>
    
      <a href="#96c9e6257e36309e096fcff4fefbc8ad" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row thewalkingdeadandphilosophy show" data-human-name="The Walking Dead and Philosophy: Shotgun. Machete. Reason.">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?1118346688" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/0f5e560a48f07283184f336a506bb655623383de.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?1118346688" target="_blank">
        The Walking Dead and Philosophy: Shotgun. Machete. Reason.
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="thewalkingdeadandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?1118346688" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="thewalkingdeadandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="thewalkingdeadandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="thewalkingdeadandphilosophy" data-download="thewalkingdeadandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="b429612d5e9712b272cc9408286977e9">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/thewalkingdeadandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=b241cafa4e6bee7d378d71063cb3e133" data-web="https://dl.humble.com/thewalkingdeadandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=b241cafa4e6bee7d378d71063cb3e133" data-bt="https://dl.humble.com/torrents/thewalkingdeadandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=818f90c3ce11e767749a862bcedc273a" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">231.5 kB</span>
    
      <a href="#b429612d5e9712b272cc9408286977e9" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="thewalkingdeadandphilosophy" data-download="thewalkingdeadandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="7c5a916f5e1d976aca4a3192e42da157">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/thewalkingdeadandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=69a050fb6ecb263c2526ad3ec31e42db" data-web="https://dl.humble.com/thewalkingdeadandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=69a050fb6ecb263c2526ad3ec31e42db" data-bt="https://dl.humble.com/torrents/thewalkingdeadandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=b247bfd261f659d608e1097cf9fb7856" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">273.5 kB</span>
    
      <a href="#7c5a916f5e1d976aca4a3192e42da157" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="thewalkingdeadandphilosophy" data-download="thewalkingdeadandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="ec744490317183a4c7786e234b14be9d">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/thewalkingdeadandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=911d2a1c02e5718b81014125b1471c6a" data-web="https://dl.humble.com/thewalkingdeadandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=911d2a1c02e5718b81014125b1471c6a" data-bt="https://dl.humble.com/torrents/thewalkingdeadandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=5809e47a537315567daf556c80a9510a" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">701.9 kB</span>
    
      <a href="#ec744490317183a4c7786e234b14be9d" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row watchmenandphilosophy show" data-human-name="Watchmen and Philosophy: A Rorschach Test">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?0470396857" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/c38ae2afa36677c75e732a61d7758600974300d7.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?0470396857" target="_blank">
        Watchmen and Philosophy: A Rorschach Test
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="watchmenandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?0470396857" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="watchmenandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="watchmenandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="watchmenandphilosophy" data-download="watchmenandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="d66f17f0cd52ea840fdb562d6037e9f6">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/watchmenandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=c25f1fe1660f8cadcdcd352b71f5375e" data-web="https://dl.humble.com/watchmenandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=c25f1fe1660f8cadcdcd352b71f5375e" data-bt="https://dl.humble.com/torrents/watchmenandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=5e4d55dd9ff19a2d14119a7a51f974ef" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">385.5 kB</span>
    
      <a href="#d66f17f0cd52ea840fdb562d6037e9f6" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="watchmenandphilosophy" data-download="watchmenandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="a933102e4ba9aa340b426cbad788293a">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/watchmenandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=afecda3e663fb530063cef28793df176" data-web="https://dl.humble.com/watchmenandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=afecda3e663fb530063cef28793df176" data-bt="https://dl.humble.com/torrents/watchmenandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=de738135b245a0171ea847bb8ec05dd2" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">289.8 kB</span>
    
      <a href="#a933102e4ba9aa340b426cbad788293a" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="watchmenandphilosophy" data-download="watchmenandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="ad26120338ed6b1c799a31a67472310e">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/watchmenandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=128c2b911b40ccdca10e1ef79f430c7e" data-web="https://dl.humble.com/watchmenandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=128c2b911b40ccdca10e1ef79f430c7e" data-bt="https://dl.humble.com/torrents/watchmenandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=9e21eb42eb4d74afed4e56a314e6978f" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">1.5 MB</span>
    
      <a href="#ad26120338ed6b1c799a31a67472310e" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div><div class="row xmenandphilosophy show" data-human-name="X-Men and Philosophy: Astonishing Insight and Uncanny Argument in the Mutant X-Verse">
  <div class="icn">

    <a href="http://www.wiley.com/remtitle.cgi?0470413409" class="afulllink" target="_blank">
      <img src="https://humblebundle-a.akamaihd.net/misc/files/hashed/9fe8e365d7c5e75365623c7a1e0da30b9ec24775.png">
    </a>

  </div>
  <div class="gameinfo">

    <div class="title">
      <a href="http://www.wiley.com/remtitle.cgi?0470413409" target="_blank">
        X-Men and Philosophy: Astonishing Insight and Uncanny Argument in the Mutant X-Verse
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="xmenandphilosophy"></div>
    </div>
    <div class="subtitle">
      <a href="http://www.wiley.com/remtitle.cgi?0470413409" target="_blank">
        Wiley
      </a>
    </div>

  </div>

  <div class="js-platform downloads windows">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads mac">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads linux">
    <div class="download-buttons">

    </div>
  
    <div class="arc-toggle">
      <label><input type="radio" name="xmenandphilosophy" value="32" checked=""> 32-bit</label><br>
      <label><input type="radio" name="xmenandphilosophy" value="64"> 64-bit</label>
    </div>
  
  </div>

  <div class="js-platform downloads ouya">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads android">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads audio">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads ebook show">
    <div class="download-buttons">

    <div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="xmenandphilosophy" data-download="xmenandphilosophy_ebook" data-download_struct_index="0" class="download small show" '="" data-md5="9a719717038068c16fb49de46d57c2c9">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">MOBI</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/xmenandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=dc298a00d135a9d231f830a63322ae98" data-web="https://dl.humble.com/xmenandphilosophy.mobi?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=dc298a00d135a9d231f830a63322ae98" data-bt="https://dl.humble.com/torrents/xmenandphilosophy.mobi.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=5d35c6ba79d4651ac21158a857743039" target="_blank">
        MOBI
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">561.4 kB</span>
    
      <a href="#9a719717038068c16fb49de46d57c2c9" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="xmenandphilosophy" data-download="xmenandphilosophy_ebook" data-download_struct_index="1" class="download small show" '="" data-md5="df95a96145bebe6faddd008b39bef712">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">EPUB</span>
    
    
    
    
    
      <a class="a" href="https://dl.humble.com/xmenandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=faa2b576b84bba998c06d754b74470e7" data-web="https://dl.humble.com/xmenandphilosophy.epub?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=faa2b576b84bba998c06d754b74470e7" data-bt="https://dl.humble.com/torrents/xmenandphilosophy.epub.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=d9576c3c7e923f724dc7442c5d5c5fd4" target="_blank">
        EPUB
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">590.9 kB</span>
    
      <a href="#df95a96145bebe6faddd008b39bef712" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div><div data-order-gamekey="kUn6uX6dSUrhH5V8" data-subproduct="xmenandphilosophy" data-download="xmenandphilosophy_ebook" data-download_struct_index="2" class="download small show" '="" data-md5="a85ed909977f2045667285d5c3bae61b">
  <div class="flexbtn active noicon js-start-download">
    <div class="right"></div>
    <span class="label">PDF</span>
    
    
    
    
    
      <a class="a" download="" href="https://dl.humble.com/xmenandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=1eddff527c09130a3d15670ec7cb445e" data-web="https://dl.humble.com/xmenandphilosophy.pdf?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=1eddff527c09130a3d15670ec7cb445e" data-bt="https://dl.humble.com/torrents/xmenandphilosophy.pdf.torrent?gamekey=kUn6uX6dSUrhH5V8&amp;ttl=1502225343&amp;t=67e994c1c704bc8c8b7f83daad41bb2b" target="_blank">
        PDF
      </a>
    
  </div>
  
  <div class="dldetails">
    <div class="dlsize">
    
      <span class="mbs">2.8 MB</span>
    
      <a href="#a85ed909977f2045667285d5c3bae61b" class="dlmd5">md5</a><br class="datebr">
      
    </div>
  </div>
  
</div></div>
  
  </div>

  <div class="js-platform downloads comedy">
    <div class="download-buttons">

    </div>
  
  </div>

  <div class="js-platform downloads video">
    <div class="download-buttons">

    </div>
  
  </div>

</div></div>
<div class="error-holder js-error-holder"></div></div>
        </div>
        <div class="staple s3"></div>
        <div class="staple s4"></div>
      </div>
  

  
          <div id="share-box">
            <p>
              While you are waiting for your downloads to complete, please consider spreading the word!
            </p>
            <div id="normal">


  


<div class="social-media-shares">

  
    <div class="sharer l twittershare">
  <iframe id="twitter-widget-2" scrolling="no" frameborder="0" allowtransparency="true" class="twitter-share-button twitter-share-button-rendered twitter-tweet-button" style="position: static; visibility: visible; width: 74px; height: 20px;" title="Twitter Tweet Button" src="https://platform.twitter.com/widgets/tweet_button.85cf65311617c356fe9237c3e6c10afb.en.html#dnt=false&amp;id=twitter-widget-2&amp;lang=en&amp;original_referer=https%3A%2F%2Fwww.humblebundle.com%2Fdownloads%3Fkey%3DkUn6uX6dSUrhH5V8&amp;size=m&amp;text=Pay%20what%20you%20want%20for%20deliciously%20nerdy%20ebooks%20and%20support%20charity!&amp;time=1502139056090&amp;type=share&amp;url=https%3A%2F%2Fwww.humblebundle.com%2Fbooks%2Ffandom-philosophy-books&amp;via=humblebooks" data-url="https://www.humblebundle.com/books/fandom-philosophy-books"></iframe>
</div>



  
    <div class="sharer l fb">
  <fb:like href="https://www.humblebundle.com/books/fandom-philosophy-books" send="false" layout="button_count" width="90" show_faces="false" font="arial" class=" fb_iframe_widget" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=101146256651042&amp;container_width=0&amp;font=arial&amp;href=https%3A%2F%2Fwww.humblebundle.com%2Fbooks%2Ffandom-philosophy-books&amp;layout=button_count&amp;locale=en_US&amp;sdk=joey&amp;send=false&amp;show_faces=false&amp;width=90"><span style="vertical-align: bottom; width: 91px; height: 20px;"><iframe name="f35b0341a0e68b" width="90px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" title="fb:like Facebook Social Plugin" src="https://www.facebook.com/plugins/like.php?app_id=101146256651042&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FXBwzv5Yrm_1.js%3Fversion%3D42%23cb%3Df3eeb9e4a233034%26domain%3Dwww.humblebundle.com%26origin%3Dhttps%253A%252F%252Fwww.humblebundle.com%252Ff3dc07c33710fb%26relation%3Dparent.parent&amp;container_width=0&amp;font=arial&amp;href=https%3A%2F%2Fwww.humblebundle.com%2Fbooks%2Ffandom-philosophy-books&amp;layout=button_count&amp;locale=en_US&amp;sdk=joey&amp;send=false&amp;show_faces=false&amp;width=90" style="border: none; visibility: visible; width: 91px; height: 20px;" class=""></iframe></span></fb:like>
</div>



  
    <div class="sharer l plus">
  <div id="___plusone_0" style="text-indent: 0px; margin: 0px; padding: 0px; background: transparent; border-style: none; float: none; line-height: normal; font-size: 1px; vertical-align: baseline; display: inline-block; width: 32px; height: 20px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position: static; top: 0px; width: 32px; margin: 0px; border-style: none; left: 0px; visibility: visible; height: 20px;" tabindex="0" vspace="0" width="100%" id="I2_1502139057357" name="I2_1502139057357" src="https://apis.google.com/u/0/se/0/_/+1/fastbutton?usegapi=1&amp;size=medium&amp;origin=https%3A%2F%2Fwww.humblebundle.com&amp;url=https%3A%2F%2Fwww.humblebundle.com%2Fbooks%2Ffandom-philosophy-books&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.en.xh47SggJVmI.O%2Fm%3D__features__%2Fam%3DAQ%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCNnAKKXzFeIiJTiMA4Bq29frxjzuA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh&amp;id=I2_1502139057357&amp;parent=https%3A%2F%2Fwww.humblebundle.com&amp;pfname=&amp;rpctoken=41883372" data-gapiattached="true" title="G+"></iframe></div>
</div>



  
    <script>
  reddit_url = 'https://www.humblebundle.com/books/fandom-philosophy-books';
  reddit_target = 'books';
</script>
<div class="sharer l reddit"><iframe src="https://redditstatic.s3.amazonaws.com/button/button1.html?width=120&amp;url=https%3A%2F%2Fwww.humblebundle.com%2Fbooks%2Ffandom-philosophy-books&amp;sr=books" height="22" width="120" scrolling="no" frameborder="0"></iframe></div>
  <script>


function run_once(name, f) {
    if (window["run_once_" + name]) {
      return;
  } else {
      f();
      window["run_once_" + name] = true;
  }
}

$(window).load(function() {
  var f = (function() {
    if ('https:' == document.location.protocol) {
        var base_url = 'https://redditstatic.s3.amazonaws.com'
    } else {
        var base_url = 'http://www.reddit.com/static'
    }

    var write_string="<iframe src=\"" + base_url + "/button/button1.html?width=120&url=";

    if (window.reddit_url)  {
        write_string += encodeURIComponent(reddit_url);
    }
    else {
        write_string += encodeURIComponent(window.location.href);
    }
    if (window.reddit_title) {
         write_string += '&title=' + encodeURIComponent(window.reddit_title);
    }
    if (window.reddit_target) {
         write_string += '&sr=' + encodeURIComponent(window.reddit_target);
    }
    if (window.reddit_css) {
        write_string += '&css=' + encodeURIComponent(window.reddit_css);
    }
    if (window.reddit_bgcolor) {
        write_string += '&bgcolor=' + encodeURIComponent(window.reddit_bgcolor);
    }
    if (window.reddit_bordercolor) {
        write_string += '&bordercolor=' + encodeURIComponent(window.reddit_bordercolor);
    }
    if (window.reddit_newwindow) {
        write_string += '&newwindow=' + encodeURIComponent(window.reddit_newwindow);}
    write_string += "\" height=\"22\" width=\"120\" scrolling='no' frameborder='0'></iframe>";
    $("div.reddit.sharer").append($(write_string));
  });

  run_once("reddit", f);
});
</script>

</div></div>
            <div style="clear:both;"></div>
          </div>
  

  

  
  
      <script type="text/template" id="stats-template">
        <div class='stats-box'>
  <div class='stats-col-1-of-3'>
    
        <h4>Numbers</h4>
    <dl>
      
      <dt>Total payments:</dt>
      <dd class='total_contributed'></dd>
      <dt>Number of purchases:</dt>
      <dd class='total_contributions'></dd>
      <dt>Average purchase:</dt>
      <dd class='average_contribution'></dd>

    </dl>
    <p class='pubnub-promo'><i class="hb hb-info"></i> Real-time updating by <a href='http://www.pubnub.com/' target='_blank' title="This is our humble estimate for payments that are coming in. It does not account for merchant fees, canceled payments, or other merchant related issues.">PubNub</a></p>
  </div>
  <div class='stats-col-2-of-3'>
    <h4>Top Contributors</h4>
    <dl class='contributor-list short'>
<% for (var ii = 0; ii < Math.min(5, leaderboard_data.length); ii++ ) { %>
      <dt title='<%= leaderboard_data[ii].name %>'>
        <span class='number'><%= ii + 1 %>.</span>
        <span class='contributor-name'><%= leaderboard_data[ii].name %></span>
      </dt>
      <dd><%= leaderboard_data[ii].amount %></dd>
<% } %>
    </dl>
  </div>
  <div class='stats-col-3-of-3'>
    <dl class='contributor-list short noheading'>
<% for (var ii = 5; ii < leaderboard_data.length; ii++ ) { %>
      <dt title='<%= leaderboard_data[ii].name %>'>
        <span class='number'><%= ii + 1 %>.</span>
        <span class='contributor-name'><%= leaderboard_data[ii].name %></span>
      </dt>
      <dd><%= leaderboard_data[ii].amount %></dd>
<% } %>
    </dl>
  </div>
</div>
      </script>
      <script type="application/json" id="leaderboard-data">
        [{"amount": "$100.00", "name": "Green Arrow"}, {"amount": "$50.00", "name": "Anonymous"}, {"amount": "$50.00", "name": "Anonymous"}, {"amount": "$50.00", "name": "Anonymous"}, {"amount": "$50.00", "name": "I&#39;m not doing this for bragging rights"}, {"amount": "$38.00", "name": "Anonymous"}, {"amount": "$32.00", "name": "Anonymous"}, {"amount": "$30.00", "name": "Anonymous"}, {"amount": "$30.00", "name": "Anonymous"}, {"amount": "$30.00", "name": "Lenni"}]
      </script>
      <div class="whitebox">
        <div class="whitetop"></div>
        <div class="whitemid"></div>
        <div class="whitebottom"></div>
        <div class="whitecontent">
          <a name="stats"></a>
          <div id="stats-holder">
        <div class="stats-box">
  <div class="stats-col-1-of-3">
    
        <h4>Numbers</h4>
    <dl>
      
      <dt>Total payments:</dt>
      <dd class="total_contributed">$95,103.67</dd>
      <dt>Number of purchases:</dt>
      <dd class="total_contributions">7,957</dd>
      <dt>Average purchase:</dt>
      <dd class="average_contribution">$11.95</dd>

    </dl>
    <p class="pubnub-promo"><i class="hb hb-info"></i> Real-time updating by <a href="http://www.pubnub.com/" target="_blank" title="This is our humble estimate for payments that are coming in. It does not account for merchant fees, canceled payments, or other merchant related issues.">PubNub</a></p>
  </div>
  <div class="stats-col-2-of-3">
    <h4>Top Contributors</h4>
    <dl class="contributor-list short">

      <dt title="Green Arrow">
        <span class="number">1.</span>
        <span class="contributor-name">Green Arrow</span>
      </dt>
      <dd>$100.00</dd>

      <dt title="Anonymous">
        <span class="number">2.</span>
        <span class="contributor-name">Anonymous</span>
      </dt>
      <dd>$50.00</dd>

      <dt title="Anonymous">
        <span class="number">3.</span>
        <span class="contributor-name">Anonymous</span>
      </dt>
      <dd>$50.00</dd>

      <dt title="Anonymous">
        <span class="number">4.</span>
        <span class="contributor-name">Anonymous</span>
      </dt>
      <dd>$50.00</dd>

      <dt title="I'm not doing this for bragging rights">
        <span class="number">5.</span>
        <span class="contributor-name">I'm not doing this for bragging rights</span>
      </dt>
      <dd>$50.00</dd>

    </dl>
  </div>
  <div class="stats-col-3-of-3">
    <dl class="contributor-list short noheading">

      <dt title="Anonymous">
        <span class="number">6.</span>
        <span class="contributor-name">Anonymous</span>
      </dt>
      <dd>$38.00</dd>

      <dt title="Anonymous">
        <span class="number">7.</span>
        <span class="contributor-name">Anonymous</span>
      </dt>
      <dd>$32.00</dd>

      <dt title="Anonymous">
        <span class="number">8.</span>
        <span class="contributor-name">Anonymous</span>
      </dt>
      <dd>$30.00</dd>

      <dt title="Anonymous">
        <span class="number">9.</span>
        <span class="contributor-name">Anonymous</span>
      </dt>
      <dd>$30.00</dd>

      <dt title="Lenni">
        <span class="number">10.</span>
        <span class="contributor-name">Lenni</span>
      </dt>
      <dd>$30.00</dd>

    </dl>
  </div>
</div>
      </div>
        </div>
      </div>
  

      
        
      

      </div>
    </div>
    <div class="clear"></div>
  </div>

  <script type="text/javascript">
  $(function () { ga('send', 'pageview', '/downloadpage'); })
  </script>
</div>
    </div><script id="asm-switcher-template" type="text/template">
  <h1 class="heading">Humble asm.js Games</h1>
  <img src="https://humblebundle-a.akamaihd.net/static/hashed/47c1990235eb2e1f62be175ae3d6cf187f8ad457.png" alt="expand" class="js-toggle-collapsable toggle-collapsable visible"/>
  <img src="https://humblebundle-a.akamaihd.net/static/hashed/6681e6d3b3e00fbf9d3142767002d6420f1af623.png" alt="collapse" class="js-toggle-collapsable toggle-collapsable "/>

  
  <i class="js-do-confirm-close do-confirm-close hb hb-times"></i>
  <div class="collapsable">
    <div class="player-panel">
      <%= playerPanel %>
    </div>
<% if (recFirefoxUpdate) { %>
    <div class="rec-firefox-update">
      <a href="https://www.getfirefox.com/">Get the latest version of Mozilla Firefox to get the best browser gaming experience possible.</a>
    </div>
<% } %>
    <div class="game-button-panel"></div>
  </div>
</script>


<script id="asm-switcher-player-panel" type="text/template">
    <div class="modal-holder"></div>
    <div class="curtain"></div>
    <div class="dialogs">
      <img class='dialog spinner' src="https://humblebundle-a.akamaihd.net/static/hashed/2de55388a5f1201232a4c2b6a8d4f83b5006f418.gif" alt=""/>
    </div>
    <div class="iframe-holder" style="background: #000"></div>
</script>

<script id="asm-switcher-game-list" type="text/template">
  <div class="game-list">
    <% for(var game_machine_name in games) { %>
      <% var gameDict = games[game_machine_name]; %>
    <div class="game-button asm-switch <% if (machineName === game_machine_name) { %>selected<% } %>" data-machine-name="<%- game_machine_name %>">
      <p title="<%- gameDict.human_name %>"><%- gameDict.human_name %></p>
      <div class='progress-bar'>
        <div class='progress-done'></div>
      </div>
    </div>
    <% } %>
  </div>
</script>


<script id="js-download-list-template" type="text/template">
  <div class="js-platform-chooser-holder"></div>
<div class="js-pre-downloads-holder"></div>
<div class="js-progress-bar-holder"></div>
<div class="js-all-downloads-holder"></div>
<div class="error-holder js-error-holder"></div>
</script>

<script id="js-download-row-template" type="text/template">
  <div class='row <%- subproduct.machine_name %>' data-human-name='<%- subproduct.human_name %>'>
  <div class='icn'>
<% if (subproduct.url) { %>
    <a href='<%- subproduct.url %>' class='afulllink' target='_blank'>
      <img src='<%- subproduct.icon %>'/>
    </a>
<% } else { %>
    <img src='<%- subproduct.icon %>'/>
<% } %>
  </div>
  <div class='gameinfo'>
<% if (subproduct.url) { %>
    <div class='title'>
      <a href='<%- subproduct.url %>' target='_blank'>
        <%- subproduct.human_name %>
      </a>
      <div class="js-subproduct-admin-edit" data-entity-kind="subproduct" data-machine-name="<%- subproduct.machine_name %>"></div>
    </div>
    <div class='subtitle'>
      <a href='<%- subproduct.url %>' target='_blank'>
        <%- subproduct.payee.human_name %>
      </a>
    </div>
<% } else { %>
    <div class='title'><%- subproduct.human_name %></div>
    <div class='subtitle'><%- subproduct.payee.human_name %></div>
<% } %>
  </div>
<% for (var platform in allPlatforms) { %>
  <div class='js-platform downloads <%- platform %><% if (platform == activePlatform) { %> show <% } %>'>
    <div class='download-buttons'>

    </div>
  <% if (platform == 'linux') { %>
    <div class='arc-toggle'>
      <label><input type='radio' name='<%- subproduct.machine_name %>' value='32' checked> 32-bit</label><br/>
      <label><input type='radio' name='<%- subproduct.machine_name %>' value='64'> 64-bit</label>
    </div>
  <% } %>
  </div>
<% } %>
</div>
</script>

<script id="js-download-button-template" type="text/template">
  <div
    data-order-gamekey="<%= order.id %>"
    data-subproduct="<%= subproduct.machine_name %>"
    data-download="<%= download.machine_name %>"
    data-download_struct_index="<%= download_struct_index %>"
    class='download<% if (download_struct.small) { %> small<% } %><% if (options_dict.is64bittoggle) { %> arc<% if (download_struct.arch == '64') { %> arc64<% } else { %> arc32<% } %><% } %><% if (recommend_bittorrent) { %> recommendbittorrent<% } %><% if (fat32_warning) { %> warnfat32<% } %>''
    data-md5="<%= download_struct.md5 %>"
>
  <div class='flexbtn active noicon<% if (!download_struct.external_link) { %> js-start-download<% } %>'>
    <div class='right'></div>
    <span class='label'><%- download_struct.name %></span>
    <% var url = download_struct.url || {} %>
    <% var is_streaming_video = Boolean(download_struct.sd_stream_url) %>
    <% if (download_struct.external_link) { %>
    <%  url['web'] = download_struct.external_link %>
    <% } %>
    <% var force_download = download_struct.force_download || download_struct.name.match(/pdf/i) %>
    <% if (is_streaming_video) { %>
      <a class='a js-stream-video'
         data-sd-stream-url='<%- download_struct.sd_stream_url %>'
         data-hd-stream-url='<%- download_struct.hd_stream_url %>'
         data-name='<%- subproduct.human_name %>'
         data-web='<%= subproduct.machine_name %>' href='#streaming-video-<%= subproduct.machine_name %>'>
        <%- download_struct.name %>
      </a>
    <% } else { %>
      <a class='a' <% if (force_download) { %>download<% } %> href='<%= url.web %>' data-web='<%= url.web %>'<% if (url.bittorrent) { %> data-bt='<%= url.bittorrent %>'<% } %> target='_blank'>
        <%- download_struct.name %>
      </a>
    <% } %>
  </div>
  <% if (!is_streaming_video) { %>
  <div class='dldetails'>
    <div class='dlsize'>
    <% if (!download_struct.external_link) {  %>
      <span class='mbs'><%= download_struct.human_size %></span>
    <% }  %>
      <% if (download_struct.md5) { %><a href='#<%= download_struct.md5 %>' class='dlmd5'>md5</a><br class='datebr'/><% } %>
      <% if (download_struct.timestamp) { %>
        <a href='#' title="<%= longdate %>" class='dldate' data-shortdate="<%= datestr %>"><%= datestr %></a>
        <% if (is_new) { %>
          <% if (download_struct.small) { %>
            <span class="newdate">**</span>
          <% } else { %>
            <span class="newdate">(new!)</span>
          <% } %>
        <% } %>
      <% } %>
    </div>
  </div>
  <% } %>
</div>
</script>

<script id="js-download-button-app-only-template" type="text/template">
  <div class='download'>
  <div class='flexbtn active noicon'>
    <div class='right'></div>
    <span class='label'>Install with our app</span>
    <a class='a' href='/app' target='_blank'>
      Install with our app
    </a>
  </div>
</div>
</script>

<script id="js-gamelist-message-template" type="text/template">
  <div class="custom-download-text">
  <%= download_struct.message %>
</div>
</script>

<script id="js-platform-chooser-template" type="text/template">
  <div class="js-platform-chooser platform-chooser">
  <div class="dlplatform">
    <div class='textlabel'>Choose platform:</div>
    <div class='dlplatform-list'>
  <% for (var i in platforms) { %>
      <% var platform = platforms[i] %>
      <% var platform_obj = allPlatforms[platform] %>
      <div data-platform='<%= platform %>' class='flexbtn<% if (platform == activePlatform) { %> active<% } %> <%= platform %>'>
        <div class='icon'></div>
        <div class='right'></div>
        <span class='label'><%= platform_obj.human_name %></span><a class='a' href='#'><%= platform_obj.human_name %></a>
      </div>
  <% } %>
    </div>
  </div>
  <div style='clear:both;padding:4px;'></div>
<% if (hasBittorrent) { %>
  <div class='dltype'>
    <div class='textlabel'>Choose download type:
    </div>
    <div data-type='direct' class='flexbtn direct active'>
      <div class='icon'></div>
      <div class='right'></div>
      <span class='label'>Direct link</span><a class='a' href='#'>Direct link</a>
    </div>
    <div data-type='bittorrent'
         class='flexbtn bittorrent'>
      <div class='icon'></div>
      <div class='right'></div>
      <span class='label'>BitTorrent</span><a class='a' href='#'>BitTorrent</a>
    </div>
  </div>
  <div style='clear:both;padding:4px;'></div>
<% } %>
</div>
<div class="clear-fix"></div>
</script>

<script id="js-gamelist-loading-template" type="text/template">
  <div class="loading">
  <h1>Loading...</h1>
  <img src="https://humblebundle-a.akamaihd.net/static/hashed/26faf55c6e36ba3b1a57f9001942059fe05050f2.gif" alt=""/>
</div>
</script>

<script id="js-progress-bar-template" type="text/template">
  <div id="download-page-progress-bar">
  <div id="download-page-outer-progress">
    <div id="download-page-inner-progress"></div>
  </div>
  <div id="download-page-progress-text"></div>
</div>
</script>

<script id="js-android-instructions-template" type="text/template">
  <div class='custominstructions instructionsteps android hide_downloads'>
  
    

<h3>Android Installation Instructions</h3>

<p>Follow these instructions to <a href="/app" target="_blank">install the Humble Bundle app.</a></p>

<p>You can also access your downloads by opening your order page on your mobile device.</p>

<p>Enter your phone number below and we will send you the link via SMS:</p>
  



<form id="sms-form" class="sms-form" method="POST" action="/util/sms" >
  <input type="hidden" name="channel" value="JcpOESobr8Gvik7f">

  
  <input type="hidden" name="key" value="kUn6uX6dSUrhH5V8">
  

  <label class="form-label country-code-label" for="country-code">country code</label>
  <label class="form-label phone-number-label" for="phone-number">phone number <span class="area-code">(including area code)</span></label>
  <span class="plus-sign">+</span>
  <input id="country-code" class="country-code-field classy-input" type="number" name="countrycode" value="1">
  <input id="phone-number" class="phone-number-field classy-input" type="tel" name="number" value="">
  <input id="send-sms" class="send-sms-button green-button" type="submit" value="Send SMS">

  <p class="sms-disclaimer">Standard SMS rates may apply.</p>

  <p id="sms-message" class="sms-message"></p>
</form>
  <div class='clear'></div>
  <p>Or, use the widget below to re-send the link to your email address:</p>
  <form id='send-email-form' method='POST' action='/util/sendemail' class='sms-form'>
    <input type='hidden' name='key' value='kUn6uX6dSUrhH5V8'>
    <label for='email-truncated'>The email will be sent to the address you entered when you purchased the bundle.</label>
    <div class='clearfix'></div>
    
    <input class='classy-input' id='email-truncated' disabled='disabled' type='text' name='number' value='wa...@...il.com'>
    <input type='submit' id='send-email' class='button-link green-button' value='Send Email'>
    <div class='clearfix'></div>
    <div id='send-email-message'></div>
    <div class='clearfix'></div>
  </form>

<p>If you would like to install the games using another method, you
  can use the links below to download the APK files to your computer:</p>

<div id='show_android_binaries'>
<a href='#' class='expandkeys'>Show Android Binaries</a>
<div class='clear'></div>
</div>

<script type='text/javascript'>
  $(document).ready(function () {
  function isValidPhoneNumber(numberStr) {
    var rePattern = /[^\d]/;
    return numberStr && (numberStr.length > 3) && !numberStr.match(rePattern);
  }

  function getFullNumber() {
    var localnumber = $('#phone-number').val().toString().replace(/[\-\s\(\)]/g, '');
    var countrycode = $('#country-code').val().toString().replace(/[\-\s\(\)]/g, '');
    return countrycode + localnumber;
  }

  var $smsForm = $('#sms-form');
  var INVALID_PHONE = 'Please enter your phone number using only the digits 0 through 9.';

  $smsForm.submit(function(e) {
    e.preventDefault();

    $('#sms-message').text('').hide();
    var assembled = getFullNumber();
    if (isValidPhoneNumber(assembled)) {
      $('#sms-message').text('Sending...').show();

      $.ajax({
        url: $smsForm.attr('action'),
        dataType: 'json',
        type: 'POST',
        data: $smsForm.serialize(),
        success: function(data) {
          if (data && !data.success) {
            var message = '';
            if (data.error === 'noorder') {
              message = 'Your key(s) are invalid.';
            } else if (data.error === 'nonumber') {
              message = INVALID_PHONE;
            } else if (data.error === 'ratelimited') {
              message = 'You are sending too many SMS messages. Please try again in 24 hours.';
            } else {
              message = 'Unknown error';
            }
            $('#sms-message').text('Error: ' + message).show();
          } else {
            $('#sms-message').text('').hide();
          }
        },
        error: function(data) {
          $('#sms-message').text('There was an unknown error while sending the SMS.').show();
        }
      });
    }
  });

  var $smsMessage = $('#sms-message');
  pubnub_client.subscribe({
    'channel': 'JcpOESobr8Gvik7fsmsresult',
    'callback': function(message) {
      if (console) console.log('got a message');
      var assembled = getFullNumber();

      $smsMessage.css('padding-top', '10px');
      if (message.success) {
        $smsMessage.text('Success! The link was sent to +' + assembled  +' and should be arriving shortly.');
      } else {
        $smsMessage.text('We are having trouble sending the message, but will keep trying.');
      }
    }
  });
});
  var $emailForm = $('#send-email-form');

$emailForm.submit(function (e) {
  e.preventDefault();
  $('#send-email-message').text('').css('padding-top','0');
  $.post(
    $emailForm.attr('action'),
    $emailForm.serialize(),
    function(data) {
      data = $.parseJSON(data);
      if (!data.success) {
        var message = '';
        if (data.error === 'noorder') {
          message = 'Your key(s) are invalid.';
        } else if (data.error == 'noemail') {
          message = 'Your email address is invalid.';
        } else if (data.error == 'ratelimited') {
          message = 'You are sending emails too quickly. Please try again in 24 hours.';
        } else {
          message = 'Unknown error';
        }
        $('#send-email-message').text('There was an error: ' + message).css('padding-top','10px');
      } else {
        $('#send-email-message').text('Email sent!').css('padding-top','10px');
      }
    }
  );
});

$('#send-email').click(function(e) {
  e.preventDefault();
  $emailForm.submit();
});
</script>
  

</div>


<script id="js-canonical-template" type="text/template">
  <div class='custominstructions linux' id='ubuntuinstructions'>
  <h2>Click the button below to redeem your bundle on the Ubuntu Software Center.</h2>
  <a href='https://software-center.ubuntu.com/coupons/<%= product_machine_name %>/?key=<%= gamekey %>&utm_source=humblebundle&utm_medium=download&utm_campaign=<%= product_machine_name %>'>
    <img src='https://humblebundle-a.akamaihd.net/static/hashed/b40b894cf171bca8af0a30601d41d59425d4b6ba.png' alt='Download for Ubuntu'/>
  </a>
</div>
</script>

<script id="js-android-gamerow-template" type="text/template">
  <a class='androidDownload row' data-human-name="<%- subproduct.human_name %>"
   <% var url = download_struct.url || {} %>
<% if (download_struct.external_link) { %>
  <%  url['web'] = download_struct.external_link %>
<% } %>
   href='<%- url.web %>'>
  <div class='androidGame'>
    <img class='gameIcon' src='<%- subproduct.icon %>' alt=''>

    <div class='textHolder'>
      <h3><%= download_struct.name %></h3>

      <h1>
        <% if (download.options_dict && download.options_dict.override_name) { %>
          <%= download.options_dict.override_name %>
        <% } else { %>
          <%- subproduct.human_name %>
        <% } %>
      </h1>
      <p class='dlsize'>File size: <%= download_struct.human_size %></p>
    </div>
    <div class='clearfix'></div>
  </div>
</a>
</script>

<script id="js-android-gamerow-app-only-template" type="text/template">
  <a class='androidDownload row' href='/app'>
  <div class='androidGame'>
    <img class='gameIcon' src='<%- subproduct.icon %>' alt=''>
    <div class='textHolder'>
      <h3>Install with our app</h3>
      <h1>
        <% if (download.options_dict && download.options_dict.override_name) { %>
          <%= download.options_dict.override_name %>
        <% } else { %>
          <%- subproduct.human_name %>
        <% } %>
      </h1>
      <p class='dlsize'>File size: <%= download_struct.human_size %></p>
    </div>
    <div class='clearfix'></div>
  </div>
</a>
</script>

<script id="js-custom-whitebox-template" type="text/template">
  <div class='whitebox'>
  <div class='whitetop'></div>
  <div class='whitemid'></div>
  <div class='whitebottom'></div>
  <div class='whitecontent'>
    <%= custom_html %>
  </div>
</div>
</script>

<script id="js-coupon-box-template" type="text/template">
  <div class="whitebox-redux coupon">
    <div class="coupon-info">

      <div class="column">
        <div class="media-object">
          <div class="avatar">
<% if (coupon.storefront_product) { %>
            <img class="coupon-icon" src="<%- coupon.storefront_product.icon %>">
<% } else { %>
            <img class="coupon-icon" src="<%= humble_icon %>">
<% } %>
          </div>

          <div class="details">
            <div class="coupon-name"> <%- coupon.coupon_human_name %> <div class="js-coupon-admin-edit" data-entity-kind="coupon" data-machine-name="<%- coupon.coupon_machine_name %>"></div>
          </div>
<% if (coupon.coupon_status == 'used') { %>
            <div>*Already redeemed*</div>
<% } else if (coupon.coupon_status == 'expired') { %>
            <div class="expired">*This coupon expired on <%= couponModel.get_expiration_date_as_string() %>*</div>
<% } else if (coupon.coupon_status == 'unused' && coupon.coupon_expiration) { %>
            <div>Expires <%= couponModel.get_expiration_date_as_string() %></div>
<% } %>
            <a href="#" class="coupon-terms js-show-coupon-terms">Coupon Details</a>
          </div>
        </div>
      </div>

      <div class="column">
<% if (coupon.storefront_product) { %>
  <% if (coupon.coupon_status == 'used') { %>
        <a href="/home/purchases">View purchase</a>
  <% } else if (coupon.coupon_status == 'expired') { %>
        <a href="<%- '/store/' + coupon.storefront_product.human_url %>">View game in store</a>
  <% } else if (coupon.coupon_status == 'unused') { %>
    <% if (!_.isEmpty(coupon.storefront_product.platform_icon_dict)) { %>
        <%= render_platform_icons(coupon.storefront_product.platform_icon_dict) %>
    <% } %>
    <% if (coupon.coupon_type == 'discount-percentage') { %>
        <span class="discount-amount">
          -<%= coupon.coupon_discount %>%
        </span>
    <% } else if (coupon.coupon_type == 'credit-amount') { %>
        <span class="discount-amount">
          -<%= moneyfmt(coupon.coupon_credit, coupon.storefront_product.currency) %>
        </span>
    <% } %>
        <span class="discount-price">
        <% // BTW, Discount price is calculated differently depending on coupon type
        %>
          <%= moneyfmt(coupon.storefront_product.discount_price, coupon.storefront_product.currency) %>
        </span>
  <% } %>

<% } else { %>
  <% if (coupon.coupon_status == 'used') { %>
        <a href="/home/purchases">View purchase</a>
  <% } else if (coupon.coupon_status == 'expired') { %>
        <a href="/store">View store</a>
  <% } else if (coupon.coupon_status == 'unused') { %>
        <a href="<%= coupon.coupon_storefront_link %>" class="round-active-button" target="_blank">View store</a>
  <% } %>
<% } %>
      </div>

    </div>

<% if (coupon.storefront_product && coupon.coupon_status == 'unused') { %>
    <div class="redeem-product">
      <span class="redeem-callout">
        Apply your coupon and go straight to checkout:
        <a href="<%- '/store/' + coupon.storefront_product.human_url + '/coupon' + coupon.coupon_key %>" class="round-active-button" target="_blank">
          Redeem now!
        </a>
      </span>
    </div>
<% } %>

  </div>
</script>

<script id="js-credit-box-template" type="text/template">
  <div class="whitebox-redux credit">
    <div class="credit-info">
<% if (settled) { %>
      <p>This order added <%- moneyfmt(amount, currency) %> to your <a href='/user/wallet'>Humble Wallet</a>.</p>
<% } else if (claimed) { %>
  <% if (has_wallet) { %>
      <p>This order grants <strong><%- moneyfmt(amount, currency) %></strong> worth of credit for the Humble Store. Add it to your Humble Wallet now: <button class='button blue js-redeem-humblewallet-credit' data-gamekey='<%= gamekey %>'>Add to my Wallet</button></p>
  <% } else { %>
      <p>Set up your <a href='/user/wallet/create?goto=%2Fdownloads%3Fkey%3D<%= page_gamekey %>'>Humble Wallet</a> and return to this page to redeem <%- moneyfmt(amount, currency) %> worth of credit for the Humble Store.</p>
  <% } %>
<% } else { %>
  <% if (signed_in) { %>
      <p>This order grants <strong><%- moneyfmt(amount, currency) %></strong> worth of credit for the Humble Store. To add it to your Humble Wallet: <button class='button blue js-claim-page' href='#' data-gamekey='<%= gamekey %>'>Claim this order</button></p>
  <% } else { %>
      <p><a class='a account-login' data-target-popup='#account-login' href='/bundle/claim?claimkey=<%= page_gamekey %>'>Sign in to claim this page</a> and redeem <%- moneyfmt(amount, currency) %> worth of credit for the Humble Store.</p>
  <% } %>
<% } %>
    
    <div class="js-credit-admin-edit" data-entity-kind="product" data-anchor-name="#row_pricing" data-machine-name="<%- machine_name %>"></div>
    </div>
  </div>
</script>

<script id="js-credit-redeem-message" type="text/template">
  <div class="whitebox-redux credit">
    <div class="credit-info">
<% if (success) { %>
      Success! The credit has been added to <a href='/user/wallet'>your Humble Wallet</a>.
<% } else { %>
      Error: There was a problem adding the credit to your Humble Wallet.
<% } %>
    </div>
  </div>
</script>

<div id="large-download-warning" class="download-popup">
  <h2>This is a very large download</h2>

  <p class="bittorrent-warning">
    We recommend the BitTorrent option for this file, to ensure that there are no interruptions or risks of data
    corruption during the download.
  </p>

  <p class="bittorrent-warning">
    Our BitTorrent files contains a "webseed" from the same content delivery network that powers our regular downloads,
    which means that it will be downloaded over both HTTP and from BitTorrent users who share their bandwidth for the
    fastest experience possible.
  </p>

  <p class="warning-text fat32-warning">
    Warning: This file cannot be downloaded on FAT32 file systems (commonly found on USB thumb drives) due to its large
    size.
    <a href="https://support.humblebundle.com/hc/en-us/articles/202421414" target="_blank">Click here</a>
    for additional details.
  </p>

  <p class="bittorrent-warning">Are you sure you want to do a direct download?</p>

  <div class="buttonHolder">
    <a href="#" class="button-link use-http bittorrent-warning"><span class="green-button">Download anyway</span></a>
    <a href="#" class="button-link use-bittorrent bittorrent-warning"><span class="green-button">Use BitTorrent</span></a>
    <a href="#" class="button-link use-http not-bittorrent-warning"><span class="green-button">Download</span></a>
    <a href="#" class="button-link use-bittorrent not-bittorrent-warning"><span class="green-button">Download</span></a>
    <a href="#" class="button-link cancel"><span class="gray-button">Cancel</span></a>
  </div>
</div>
<div id="confirm-apk" class="download-popup" style="display:none">
  <h2>You are not on an Android device</h2>
  <p>This package is intended to be downloaded and installed on an Android device.</p>
  <p>Are you sure you want to download it even though you are not using an Android device?</p>
  <div class="buttonHolder">
    <a href="#" class="download-anyway button-link"><span class="green-button">Download anyway</span></a>
    <a href="#" class="cancel"><span class="gray-button">Cancel</span></a>
  </div>
</div>
<script type="text/javascript">
  $(function(){
    $('#regular_download_list .android .download .flexbtn').click(function(e){
      e.preventDefault();
      var $dialog = $('#confirm-apk');
      $('.grayout').fadeIn();
      $dialog.find('.download-anyway').attr('href', $(e.target).attr('href'));
      $dialog.fadeIn();
    })
    $('.download-anyway').click(function(e){
      $('.grayout').fadeOut();
      $('#confirm-apk').fadeOut();
    })
  });
</script>




<div class="grayout">
  <div class="grayout-inner">
  </div>
</div>

<div id="site-modal"></div>

<script>
/* v1.0.1 */(function(b){b.fn.mailcheck=function(a,b){var d="yahoo.com,google.com,hotmail.com,gmail.com,me.com,aol.com,mac.com,live.com,comcast.net,googlemail.com,msn.com,hotmail.co.uk,yahoo.co.uk,facebook.com,verizon.net,sbcglobal.net,att.net,gmx.com,mail.com".split(",");if("object"===typeof a&&void 0===b)a.domains=a.domains||d;else{var e=a,a=b;a.domains=e||d}(d=Kicksend.mailcheck.suggest(encodeURI(this.val()),a.domains))?a.suggested&&a.suggested(this,d):a.empty&&a.empty(this)}})(jQuery);
var Kicksend={mailcheck:{threshold:3,suggest:function(b,a){var b=b.toLowerCase(),c=this.splitEmail(b),d=this.findClosestDomain(c.domain,a);return d?{address:c.address,domain:d,full:c.address+"@"+d}:!1},findClosestDomain:function(b,a){for(var c,d=99,e=null,f=0;f<a.length;f++){if(b===a[f])return!1;c=this.stringDistance(b,a[f]);c<d&&(d=c,e=a[f])}return d<=this.threshold&&null!==e?e:!1},stringDistance:function(b,a){if(null==b||0===b.length)return null==a||0===a.length?0:a.length;if(null==a||0===a.length)return b.length;
for(var c=0,d=0,e=0,f=0;c+d<b.length&&c+e<a.length;){if(b[c+d]==a[c+e])f++;else for(var g=e=d=0;5>g;g++){if(c+g<b.length&&b[c+g]==a[c]){d=g;break}if(c+g<a.length&&b[c]==a[c+g]){e=g;break}}c++}return(b.length+a.length)/2-f},splitEmail:function(b){b=b.split("@");if(2>b.length)return!1;for(var a=0;a<b.length;a++)if(""===b[a])return!1;return{domain:b.pop(),address:b.join("@")}}}};
</script>
<script>
require(['account/accountModals'], function (accountModals) {
  window.modal_attributes = {
    request_reason: "",
    base_url_secure: "https://www.humblebundle.com",
    goto: null,
    qs: null,
    csrf_token_input: "<input type='hidden' class='csrftoken' name='_le_csrf_token' value='5_NSuAqJhQsSsdPT-1-1499367199' />"
  };
  accountModals.bindCancelDialog();
  accountModals.bindAccountModalHandling({
    debug: false,
    attributes: window.modal_attributes
  });
});
</script>
<div ssl="on" id="pubnub"></div>
<script>
// log all calls and be able to play them back on another object
// sort of like a more generic version of the _gaq object
function Replayer(methods) {
  this._log = [];
  var self = this;

  methods.forEach(function(method) {
    self[method] = function() {
      self._log.push([method, Array.prototype.slice.call(arguments)]);
    };
  });

  this._playback = function (obj) {
    self._log.forEach(function(entry) {
      methodname = entry[0];
      args = entry[1];
      method = obj[methodname];
      method.apply(obj, args);
    });
  };
}

window.pubnub_client = new Replayer(['subscribe', 'history']);

var pubnub_async_loader = function(PUBNUB) {
  if (typeof PUBNUB === "string") {
    PUBNUB = window.PUBNUB;
  }

  var pubnub_callbacks = {};
  /* {
   'stats': [callback1, callback2]
   'thanks': [thankscallback]
   }
   */

  var register_pubnub_handler = function (channel, callback) {
    var channel_callbacks = pubnub_callbacks[channel];
    if (channel_callbacks == undefined) {
      channel_callbacks = [];
    }
    channel_callbacks.push(callback);
    pubnub_callbacks[channel] = channel_callbacks;
  };

  var pubnub_delegator = function (message, envelope, channel) {
    var callbacks = pubnub_callbacks[channel];
    for (var i = 0; i < callbacks.length; i++) {
      callbacks[i](message);
    }
  };

  var original_pubnub_client = PUBNUB.init({
    noleave: true,
    ssl: true,
    subscribe_key: '6b5eeae3-796b-11df-8b2d-ef048cc31d2e'
  });

  var multiplexed_pubnub_client = {};
  $.extend(multiplexed_pubnub_client, original_pubnub_client);
  multiplexed_pubnub_client.subscribe = function(options) {
    var callback = options['callback'];
    var channel = options['channel'];
    delete options['callback'];
    register_pubnub_handler(channel, callback);
    options['callback'] = pubnub_delegator;
    return original_pubnub_client.subscribe(options);
  };
  multiplexed_pubnub_client.ready();  // since we fire after the ready event, trigger it on the pubnub object
  window.pubnub_client._playback(multiplexed_pubnub_client);
  window.pubnub_client = multiplexed_pubnub_client;
};
// Using requirejs instead of require because it appears that the ACE editor has some sort of conflict.
if (typeof requirejs === 'function') {
  requirejs(['https://humblebundle-a.akamaihd.net/static/hashed/998cdf8d471fa4ae7935c0bc267cae547fa8826e.js'], pubnub_async_loader)
} else {
  async_js('https://humblebundle-a.akamaihd.net/static/hashed/998cdf8d471fa4ae7935c0bc267cae547fa8826e.js', pubnub_async_loader);
}
</script>


<div id="flash"></div>

  <script>
  $(window).ready(function() {
    // 
    var urls = [
      'https://connect.facebook.net/en_US/all.js',
      'https://apis.google.com/js/platform.js',
      'https://platform.twitter.com/widgets.js'
    ];
    _(urls).each(function(url) {
      async_js(url);
    });
  });
</script>

  <script id="js-google-analytics"> 
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-467050-6', 'auto');
  ga('require', 'displayfeatures');
  ga('require', 'ecommerce');
  ga('require', 'linkid', 'linkid.js');

  function _hbga(verb){
    ga.apply(this, arguments);
  }
  _hbga('set', 'metric1', 11.95);
  _hbga('set', 'dimension1', 11.95);

  _hbga('send', 'pageview');
</script> 
<script> 
  function _gaTrackEvent(category, action, opt_label, opt_value, opts) {
    category = category || ('/' + window.location.pathname.split('/')[1]);
    _hbga('send', 'event', category, action, opt_label, opt_value, opts);
  }
  function _gaTrackPageview(page) {
    _hbga('send', 'pageview', page);
  }
  function _gaTrackEventNoninteractive(category, action, opt_label, opt_value) {
    _gaTrackEvent(category, action, opt_label, opt_value, {'nonInteraction': 1})
  }
</script> 


<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window,document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '1658430177760250');
  fbq('track', 'PageView');
</script>
<noscript>
 &lt;img height="1" width="1" src="https://www.facebook.com/tr?id=1658430177760250&amp;ev=PageView&amp;noscript=1"/&gt;
</noscript>
<!-- End Facebook Pixel Code -->


  <script async="" src="https://checkout.stripe.com/checkout.js"></script>
  <script>
    var _user_id = "gUvcpuCHdh8jZxlFpmsmUy5J2uQ08tMR1oGFVJVFtGdglpXfEXKLqJzJtUN32lag6S";
var _session_id = "H1mwZpCNBd";

var _sift = _sift || [];
_sift.push(['_setAccount', 'fa5602386c']);
_sift.push(['_setUserId', _user_id]);
_sift.push(['_setSessionId', _session_id]);
_sift.push(['_trackPageview']);
(function () {
  function ls() {
    var e = document.createElement('script');
    e.type = 'text/javascript';
    e.async = true;
    e.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.siftscience.com/s.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(e, s);
  }

  if (window.attachEvent) {
    window.attachEvent('onload', ls);
  } else {
    window.addEventListener('load', ls, false);
  }
})();
  </script>
  
    <script type="text/javascript">
  (function(s,m,y,t,e){s._smyte=s._smyte||[];t=m.createElement(y);t.async=1;t.src='//ping.smyte.com/p.js';e=m.getElementsByTagName(y)[0];e.parentNode.insertBefore(t,e);})(window,document,'script');
  _smyte.push(['_setClientKey', '90d681dbb6997b4dfd2be21919378c00']);
  _smyte.push(['_setSession', {
    id: 'H1mwZpCNBd',
    actor: {
      
        id: 'gUvcpuCHdh8jZxlFpmsmUy5J2uQ08tMR1oGFVJVFtGdglpXfEXKLqJzJtUN32lag6S',
      
      type: 'user'
    }
  }]);
  _smyte.push(['_log']);
</script>
  <script>
  
//timer

(function(){
  var TIMER_FREQUENCY = 500;

  var drawsimpleclock = function(t, $element) {
    for (var i=0;i<t.length;i++) {
      var d = '' + Math.floor(t[i]);
      if (d.length == 1) d = '0' + d;
      $element.find('.digit.' + i).text(d);
    }
  };

  var drawclock = function(t, $element) {
    for (var i=0;i<t.length;i++) {
      var d = '' + Math.floor(t[i]);
      if (d.length == 1) d = '0' + d;
      for (var j=0;j<2;j++) {
        $element.find('.c' + (2*i + j)).find('.top-cutter .heading-num').text(d.substr(j,1));
      }
   }
 };

  var count = function(d, element) {
    var s = Math.max((new Date(d - new Date())).valueOf(),0),
        digits = $.map([s / 86400000,s / 3600000 % 24,s / 60000 % 60,s / 1000 % 60],function(a) {return parseInt(a);}),
        $el = $(element);
    if ($el.hasClass('simple-timer')) {
      drawsimpleclock(digits, $el);
    } else {
      drawclock(digits, $el);
    }
  };

  var timers = [];
  var timerIntervals = [];

  window.start_countdown_timer = function(d, element){
    var timer_callback = function(){
      count(d, element);
    };
    timers.push(timer_callback);
    timerIntervals.push(setInterval(timer_callback, TIMER_FREQUENCY));
    timer_callback();
  };

  window.start_countdown_timers = function() {
    $('.js-countdown-timer').each(function(i, el) {
      var $el = $(el);
      var end_time = $el.data('end-time');
      var timer = function() {
        $el.text(render_time_remaining_until(end_time));
      };

      timers.push(timer);
      timerIntervals.push(setInterval(timer, TIMER_FREQUENCY));
    });
  };

  window.pause_timers = function(){
    for(var i = timerIntervals.length - 1; i >= 0; i--){
      clearInterval(timerIntervals.pop());
    }
  }

  window.resume_timers = function(){
    for(var i = 0; i < timers.length; i++){
      timerIntervals.push(setInterval(timers[i], TIMER_FREQUENCY));
    }
  }

})();

var timing = {};

var enddate = new Date(timing.end * 1000);
start_countdown_timer(enddate, 'heading-time-remaining');



/* popups.js */

(function() {
  if ($('div.youtube-embed, div.youtube-embed-forceload').length > 0) {
    // 2. This code loads the IFrame Player API code asynchronously.
    async_js('//www.youtube.com/player_api');
  }

  function onPlayerStateChange(e) {
    if (e.data == YT.PlayerState.PLAYING) {
      // For now, just fire a coarse-grained global notification whenever a
      // video starts playing. This should be cleaned up to fire a more specific
      // notification.
      $(window).trigger('youtube-play');
    }
  }

  window.players = [];
  function activateEmbeddedPlayer($elem) {
    if (typeof YT === 'undefined') {
      return;
    }
    var data = $elem.data();
    if (!('playerVars' in data)) {
      // each video must have a unique id -- randomly generate one here
      var random_id = 'yt-' + Math.random().toString(36).substr(2, 5);
      $elem.attr('id', random_id);
      data.playerVars = {};
      for (var i in data) {
        if (data.hasOwnProperty(i) && i.indexOf('playervar') === 0) {
          data.playerVars[i.substring(9).toLowerCase()] = data[i];
          delete data[i];
        }
      }
      data.events = {
        'onStateChange': onPlayerStateChange
      };
      var player = new YT.Player($elem.attr('id'), data);
      // Set the index data on the iframe
      $(player.getIframe()).data('index', window.players.length);
      window.players.push(player);
    }
  }

  // make clicking a product icon show the popup
  $('a.gamelinks, a.gamelinks-nostyle, a.minigame-link, .charitylinks a, .soundlink, .popup-links a').click(function(e) {
    var popupHash = $(this).attr('href'); // action
    if (popupHash.indexOf('#popup-') >= 0) {
      e.preventDefault();
      popupHash = popupHash.substr(popupHash.indexOf('#'));
    } else {
      return;  // the href should always start with #popup-
    }

    var $popup = $(popupHash);
    if ($popup.length === 0) {
      return;
    } else {
      // Setting overflow-y: hidden will hide the scroll bar, which changes the
      // width, which causes the content to shift. To counteract this effect, add
      // a margin-right where the scroll bar used to be.
      var old_width = $('body').width();
      $('body').css('overflow-y', 'hidden');
      var new_width = $('body').width();
      $('body').css('margin-right', new_width - old_width);
      $popup.show().addClass('active-popup');
      $('#dark-cover-inner').css('min-height', $popup.outerHeight());

      $popup.find('div.youtube-embed').each(function() {
        var $elem = $(this);
        activateEmbeddedPlayer($elem);
      });
    }
    $('#dark-cover').fadeIn('fast');

    
    var productName = $('#contribute').find('input[name=product]').val();
    _gaTrackEvent(undefined, 'Popup action: ' + popupHash, 'Product: ' + productName);
    
  });

  function closePopup() {
    var $videoFrame = $('.active-popup .game-movie iframe');
    var $activePopup = $('.active-popup');
    if ($activePopup.data('closeCallback')) {
      $activePopup.data('closeCallback')($activePopup);
    }
    $activePopup.hide().removeClass('active-popup');
    $('#dark-cover').fadeOut('fast');
    $('body').css('overflow-y', 'auto');
    $('body').css('margin-right', '0');
    if (!$videoFrame.length) {
      return;
    }
    // stop playing by removing the iframe
    var $frameParent = $videoFrame.parent(),
        $frameClone = $videoFrame.clone();
    $videoFrame.remove();
    $frameClone.appendTo($frameParent);
  }

  // Close the popup if the user presses escape.
  $(document).keyup(function(e) {
    if (e.keyCode == 27) {
      closePopup();
    }
  });
  // Close the popup when the user clicks the close button or clicks outside the popup.
  $('#dark-cover,.game-popup .close-popup').click(function(e) {
    e.preventDefault();
    closePopup();
  });
  // ...but make sure clicking inside the popup doesn't close it.
  $('.game-popup').click(function(e) {
    e.stopPropagation();
  });

  $(window).on('onYouTubeIframeAPIReady', function() {
    // Only load forceloaded embeds. Other embeds will be loaded when their containing popup is opened.
    $('div.youtube-embed-forceload').each(function() {
      var $elem = $(this);
      activateEmbeddedPlayer($elem);
    });
  });

  /*
   * eBook preview font controls.
   */
  $(document).ready(function () {
    var font_size = 14;

    $('.font-size .larger').click(function(e) {
      e.preventDefault();
      font_size += 2;
      $('.book-preview').css('font-size', font_size + 'px');
    });
    $('.font-size .smaller').click(function(e) {
      e.preventDefault();
      font_size -= 2;
      $('.book-preview').css('font-size', font_size + 'px');
    });
    $('.font-style .sans').click(function(e) {
      e.preventDefault();
      $('.ebook-popup').addClass('sans');
    });
    $('.font-style .serif').click(function(e) {
      e.preventDefault();
      $('.ebook-popup').removeClass('sans');
    });
  });

  /*
   * Subtab navigation
   */
  $('#active-subtab').click(function (e) {
    e.preventDefault();
    var target = $(this).attr('href');
    $('body').animate({'scrollTop': $(target).offset().top}, 800);
  });
})();

$('.steaminfo').click(function(e) {
  e.preventDefault();
  $('#keysinfotext').toggleClass('displaying');
});

/* show grayscale pie chart on hover for colorblind users */
var $chartLegendColors = $('#chartlegend').find('.chartcolor');
$('#chartgloss').hover(function() {
  $('#googlechart').attr('src', $('#googlechart').data('grayscalesrc'));
  $chartLegendColors.each(function() {
    $(this).css('background-color', $(this).data('grayscaleColor'));
  });
},function() {
  $('#googlechart').attr('src', $('#googlechart').data('colorsrc'));
  $chartLegendColors.each(function() {
    $(this).css('background-color', $(this).data('color'));
  });
});
$chartLegendColors.each(function() {
  $(this).data('color', $(this).css('background-color'));
});


$(document).ready(function() {
  var cookiedata = $.cookie('androidapp');
  if (cookiedata == 'expanded') {
    $('#androidappbox').click();
  }
  $('#androidappbox').click(function(e) {
    $.cookie('androidapp', 'expanded');
  });
});
  
</script>

  <script>
    var active_platform = "ebook";
var humbleIcon = "https://humblebundle-a.akamaihd.net/static/hashed/703cddaea1919f4b3840a4527dbbd0a0c4dc160c.png";


var gamekeys = ['kUn6uX6dSUrhH5V8'];
var single_key_page = true;
var android_version = false;

var hasAdminAccess = false;

require([
  'downloadPages/initDownloadList'
], function (
  initDownloadList
) {

  initDownloadList(gamekeys, {
    el: $('.js-gamelist-holder'),
    activePlatform: active_platform,
    singleKeyPage: single_key_page,
    androidVersion: android_version,
    humbleIcon: humbleIcon,
    hasAdminAccess: hasAdminAccess
  })
});

var runanalytics = function() {
  var analyze = function(id) {
    if (!id) return;
    var storage = getLocalStorage();
    var previds = storage.getItem('hbprevids') || '';
    if (previds.match(id)) return;

    $.post('/analytics', {'id':id}, function(data) {
      var gaData;

      if (data.complete) {
        storage.setItem('hbprevids', previds + ',' + id);
      }

      if (!data.uid) {
        return;
      }

      gaData = {
        id: data.uid,
        revenue: data.amount
      };
      ga('ecommerce:addTransaction', gaData);
      ga('send', {
        hitType: 'event',
        eventCategory: 'Purchase',
        eventAction: data.category,
        eventLabel: data.product,
        eventValue: data.pennies
      });
      for (var i = 0; i < data.items.length; i++) {
        var item = data.items[i];

        gaData = {
          id: data.uid,
          name: item.kind,
          sku: data.product,
          category: item.kind,
          price: item.amount,
          quantity: '1'
        };
        ga('ecommerce:addItem', gaData);
      }

      ga('ecommerce:send');
    },'json');
  };


  analyze('kUn6uX6dSUrhH5V8');

  var partnerId = $.cookie('partner_id');
  if (partnerId) {
    ga('set', 'dimension2', partnerId);
  }
};
runanalytics();

/*
 *	TypeWatch 2.0 - Original by Denny Ferrassoli / Refactored by Charles Christolini
 *
 *	Examples/Docs: www.dennydotnet.com
 *
 *  Copyright(c) 2007 Denny Ferrassoli - DennyDotNet.com
 *  Coprright(c) 2008 Charles Christolini - BinaryPie.com
 *
 *  Dual licensed under the MIT and GPL licenses:
 *  http://www.opensource.org/licenses/mit-license.php
 *  http://www.gnu.org/licenses/gpl.html
 */

(function(jQuery) {
  jQuery.fn.typeWatch = function(o) {
    // Options
    var options = jQuery.extend({
      wait : 750,
      callback : function() {
      },
      highlight : true,
      captureLength : 2
    }, o);

    function checkElement(timer, override) {
      var elTxt = jQuery(timer.el).val();

      // Fire if text > options.captureLength AND text != saved txt OR if override AND text > options.captureLength
      if ((elTxt.length > options.captureLength && elTxt.toUpperCase() != timer.text)
              || (override && elTxt.length > options.captureLength)) {
        timer.text = elTxt.toUpperCase();
        timer.cb(elTxt);
      }
    };

    function watchElement(elem) {
      // Must be text or textarea
      if (elem.type.toUpperCase() == "TEXT" || elem.nodeName.toUpperCase() == "TEXTAREA") {

        // Allocate timer element
        var timer = {
          timer : null,
          text : jQuery(elem).val().toUpperCase(),
          cb : options.callback,
          el : elem,
          wait : options.wait
        };

        // Set focus action (highlight)
        if (options.highlight) {
          jQuery(elem).focus(
                  function() {
                    this.select();
                  });
        }

        // Key watcher / clear and reset the timer
        var startWatch = function(evt) {
          var timerWait = timer.wait;
          var overrideBool = false;

          if (evt.keyCode == 13 && this.type.toUpperCase() == "TEXT") {
            timerWait = 1;
            overrideBool = true;
          }

          var timerCallbackFx = function() {
            checkElement(timer, overrideBool)
          }

          // Clear timer
          clearTimeout(timer.timer);
          timer.timer = setTimeout(timerCallbackFx, timerWait);

        };

        jQuery(elem).keydown(startWatch);
        // HTML5 adds an "input" event which is a more reliable way of telling
        // when the field has changed -- it fires for things like browser
        // autofill (where there is no keydown event). For browsers that support
        // it, we bind startWatch to fire here too.
        jQuery(elem).bind('input', startWatch);
      }
    }

    ;

    // Watch Each Element
    return this.each(function(index) {
      watchElement(this);
    });

  };

})(jQuery);
var MAILCHECK_DOMAINS = ['gmail.com', 'hotmail.com', 'yahoo.com', 'hotmail.co.uk', 'googlemail.com', 'gmx.de', 'live.com', 'live.ca', 'web.de', 'aol.com', 'msn.com', 'comcast.net', 'me.com', 'gmx.net', 'hotmail.fr', 'mail.ru', 'yahoo.co.uk', 'live.co.uk', 'yandex.ru', 'mac.com', 'yahoo.de', 'yahoo.fr'];



function isValidEmail(e) {
  return (e != '') && /.+@.+\..+/.test(e);
}

function live_email_check($field, setEmailMessage) {
  var emailValid = false;
  $field.mailcheck({
    domains: MAILCHECK_DOMAINS,
    suggested: function($input, suggestion) {
      // set the error text to the suggested correction
      var message = 'Did you mean <a href="#" class="suggested-email" data-email="' + suggestion['full'] + '">' + suggestion['address'] + '@<strong>' + suggestion['domain'] + '</strong></a>?'
      var $msgField = setEmailMessage($field, message);
      $msgField.find('.suggested-email').click(function(e) {
        e.preventDefault();
        $input.val($(this).data('email'));
        live_email_check($field, setEmailMessage, false);
      });
      emailValid = true;
    },
    empty: function($input) {
      // no suggested domain correction, check if the email address looks valid
      var email = $input.val();
      emailValid = isValidEmail(email);
      if (emailValid) {
        setEmailMessage($field, false);
      } else {
        setEmailMessage($field, 'Email address is not valid', true);
      }
    }
 });
  return emailValid;
}
// this method will set up email "validation" and error correction.
// Parameters:
//   $field is the input field to bind to
//   setEmailMessage is a function that takes the input field the error is related to and a message to set.
//     It sets the message then returns the error holder.
function bindEmailField($field, setEmailMessage){
  function bound_live_email_check () {
    live_email_check($field, setEmailMessage);
  }
  $field.typeWatch({
    callback: bound_live_email_check,
    captureLength: -1,
    highlight: false,
    wait: 500
  });
}
var flash = $('#flash');

function show_flash(message){
  flash.text(message)
  flash.show();

  setTimeout(function() {
    flash.fadeOut();
  },5000);
}

function set_flash(message) {
  $.cookie('hbflash', message, {path: '/'});
}

$(function(){
  function show_flash(message){
    flash.text(message)
    flash.show();

    setTimeout(function() {
      flash.fadeOut();
    },5000);
  }

  var flashmessage = $.cookie('hbflash');
  if (flashmessage == 'None') {
    flashmessage = '';
  }

  if (flashmessage) {
    show_flash(flashmessage);
    $.cookie('hbflash', 'None', {path: '/'});
  }

  flash.click(function(){
    flash.fadeOut();
  });
});
// When CSS4 is widely-supported by all the modern browsers, detecting touch support may not be necessary depending on the usage of the touch.
$(function(){
  // Class assignment can be used for touch screen problems. Such as :hover.
  if ('ontouchstart' in window) {
    $('body').addClass('touch-support');
  }
});
require([
    'lib/require-domReady',
    'search/search',
    'lib/algolia'
], function(domReady, SiteSearchView, algoliasearch) {
  var public_key ='AYSZEWDAZ2';
  var search_key ='e287f1da94f143ba1c4a5ec357135623';
  var index_name ='slave_product_query_site_search';
  var algolia_client = algoliasearch(public_key, search_key).initIndex(index_name);
  var options = {
    'pricing_constants': {
      'current_country': "US",
      'currencies': ["USD", "EUR", "GBP"],
      'exchange_rates': {"USD": 1.0, "IDR": 13305.999325918436, "BGN": 1.6479609032692957, "ILS": 3.6180485338725985, "GBP": 0.76070104482642398, "DKK": 6.2679474216380182, "CAD": 1.2571621166161107, "JPY": 110.10279743849006, "HUF": 256.45433097404788, "RON": 3.8452140208965284, "MYR": 4.2784799460734746, "SEK": 8.093444556791372, "SGD": 1.3563363667003707, "HKD": 7.8178294573643408, "AUD": 1.2544657903606335, "CHF": 0.96848668688911355, "KRW": 1124.1321199865183, "CNY": 6.7203404111897536, "TRY": 3.5307549713515334, "HRK": 6.241152679474216, "NZD": 1.3420963936636332, "THB": 33.244860128075494, "EUR": 0.84260195483653522, "NOK": 7.8882709807886755, "RUB": 60.220003370407817, "INR": 63.61939669700034, "MXN": 17.807886754297272, "CZK": 21.9649477586788, "BRL": 3.1101280754971352, "PLN": 3.5734748904617457, "PHP": 50.208965284799461, "ZAR": 13.335608358611392},
      'euro_countries': ["BE", "FR", "BG", "DK", "HR", "DE", "HU", "FI", "BA", "NL", "PT", "NO", "LI", "LV", "LT", "LU", "RO", "PL", "VA", "CH", "GR", "EE", "IT", "AL", "CZ", "CY", "AT", "AD", "IE", "ES", "ME", "EUROPE_EURO", "MC", "RS", "MK", "SK", "MT", "SI", "SM", "SE"],
      'gbp_countries': ["GS", "GG", "SH", "IM", "GB", "UK", "JE", "EUROPE_GBP", "BQ"]
    },
    'bundle_icon': "https://humblebundle-a.akamaihd.net/static/hashed/40f0b827c9d1c12cfc3dfd358ec39cc34e5dd3a7.jpg",
    'monthly_icon': "https://humblebundle-a.akamaihd.net/static/hashed/ac7ab70a9a2116ba9fae8feead3ba35fe1c609f5.jpg",
    'algolia_client': algolia_client
  };
  domReady(function() {
    var searchBars = $('.site-minisearch-view');
    for (var idx = 0; idx < searchBars.length; idx++) {
      options.$el = $(searchBars[idx]);
      new SiteSearchView(options);
    }
  });
});
$(document).ready(function() {
  var Dropdown = (function() {
    function Dropdown(options) {
      var that = this;
      
      this.el = {
        $toggle: options.toggleEl,
        $container: options.containerEl
      };

      this.events = {
        toggleClick: function(event) {
          event.stopPropagation();
          event.preventDefault();
          that.toggleState();
          that.render();
          if (that.visible) {
            return that.bindToDocument();
          } else {
            return that.unbindToDocument();
          }
        },
        hide: function() {
          that.visible = false;
          that.render();
          return that.unbindToDocument();
        }
      };

      if (_.has(options, 'visible')) {
        this.visible = options.visible;
      } else {
        this.visible = true;
      }
      if (options.hiddenClass) {
        this.hiddenClass = options.hiddenClass;
      } else {
        this.hiddenClass = 'is-hidden';
      }
      this.validateOptions().bind().render();
    }

    Dropdown.prototype.validateOptions = function() {
      var messages;
      messages = {
        toggleNotFound: 'Toggle element not found',
        containerNotFound: 'Container element not found'
      };
      if (!this.el.$toggle.length) {
        throw new Error(messages.toggleNotFound);
      }
      if (!this.el.$container.length) {
        throw new Error(messages.containerNotFound);
      }
      return this;
    };

    Dropdown.prototype.remove = function() {
      this.unbind();
      delete this.el;
      delete this.events;
      return this;
    };


    // Ctrl: Event handling
    Dropdown.prototype.bind = function() {
      this.el.$toggle.on('click', this.events.toggleClick);
      return this;
    };

    Dropdown.prototype.unbind = function() {
      this.el.$toggle.off('click', this.events.toggleClick);
      return this;
    };

    Dropdown.prototype.bindToDocument = function() {
      $(document).on('click', this.events.hide);
      return this;
    };

    Dropdown.prototype.unbindToDocument = function() {
      $(document).off('click', this.events.hide);
      return this;
    };

    // Ctrl: State handling
    Dropdown.prototype.toggleState = function() {
      this.visible = !this.visible;
      return this;
    };


    // View: DOM manipulation
    Dropdown.prototype.render = function() {
      if (this.visible) {
        this.$show();
      } else {
        this.$hide();
      }
      return this;
    };

    Dropdown.prototype.$hide = function() {
      if (!this.el.$container.hasClass(this.hiddenClass)) {
        this.el.$container.addClass(this.hiddenClass);
      }
      return this;
    };

    Dropdown.prototype.$show = function() {
      if (this.el.$container.hasClass(this.hiddenClass)) {
        this.el.$container.removeClass(this.hiddenClass);
      }
      return this;
    };

    return Dropdown;

  })();

  $('.navbar-item-dropdown-toggle').each(function() {
    var $toggle = $(this),
        d = new Dropdown({
          toggleEl: $toggle,
          containerEl: $toggle.siblings('.navbar-item-dropdown-container'),
          fadeTime: 200,
          visible: false
        })
    ;
    d.render();
  });
});


(function(){
  var TIMER_FREQUENCY = 500;

  var drawsimpleclock = function(t, $element) {
    for (var i=0;i<t.length;i++) {
      var d = '' + Math.floor(t[i]);
      if (d.length == 1) d = '0' + d;
      $element.find('.digit.' + i).text(d);
    }
  };

  var drawclock = function(t, $element) {
    for (var i=0;i<t.length;i++) {
      var d = '' + Math.floor(t[i]);
      if (d.length == 1) d = '0' + d;
      for (var j=0;j<2;j++) {
        $element.find('.c' + (2*i + j)).find('.top-cutter .heading-num').text(d.substr(j,1));
      }
   }
 };

  var count = function(d, element) {
    var s = Math.max((new Date(d - new Date())).valueOf(),0),
        digits = $.map([s / 86400000,s / 3600000 % 24,s / 60000 % 60,s / 1000 % 60],function(a) {return parseInt(a);}),
        $el = $(element);
    if ($el.hasClass('simple-timer')) {
      drawsimpleclock(digits, $el);
    } else {
      drawclock(digits, $el);
    }
  };

  var timers = [];
  var timerIntervals = [];

  window.start_countdown_timer = function(d, element){
    var timer_callback = function(){
      count(d, element);
    };
    timers.push(timer_callback);
    timerIntervals.push(setInterval(timer_callback, TIMER_FREQUENCY));
    timer_callback();
  };

  window.start_countdown_timers = function() {
    $('.js-countdown-timer').each(function(i, el) {
      var $el = $(el);
      var end_time = $el.data('end-time');
      var timer = function() {
        $el.text(render_time_remaining_until(end_time));
      };

      timers.push(timer);
      timerIntervals.push(setInterval(timer, TIMER_FREQUENCY));
    });
  };

  window.pause_timers = function(){
    for(var i = timerIntervals.length - 1; i >= 0; i--){
      clearInterval(timerIntervals.pop());
    }
  }

  window.resume_timers = function(){
    for(var i = 0; i < timers.length; i++){
      timerIntervals.push(setInterval(timers[i], TIMER_FREQUENCY));
    }
  }

})();

$(function() {
  function start_timer (element) {
    var timing = $(element).data('timing');
    var enddate = new Date(timing.end * 1000);
    start_countdown_timer(enddate, element);
  };

  var $timers = $('.tabbar .tabbar-timer');
  $timers.each(function (i, el) {
    start_timer($(el));
  });
});
  function expandOrderForm() {
    var $addOrder = $('#addorder');
    if (!$addOrder.hasClass('small')) return;
    $addOrder.removeClass('small');
    $addOrder.find('.whitecontent').animate({height: $('#keysizer').height()}, function () {
      $addOrder.find('.whitecontent').css('height', 'auto');
      $addOrder.find('#orderwrapper').css('position', 'static');
    });
    $('#expandorder').animate({opacity: 0, height: 0});
  }

  $('#expandorder').click(function (e) {
    expandOrderForm();
    e.preventDefault();
  });

  $('.header-purchase').click(function(e) {
    e.preventDefault();
    _gaTrackEventNoninteractive(undefined, 'Pay What You Want! clicked');
  });

  require(['orderform/main', 'charity/bundle'], function(main, charity) {
    var $extra_data_el = $('script#order-form-extra-data');
    var extra_data = ($extra_data_el.length > 0) ? JSON.parse($extra_data_el.html()) : {};
    main(
      $('#order-form-holder'),
      window.models,
      false,  // not redesign
      extra_data.has_admin_access,
      extra_data.streamlabs_enabled,
      extra_data.charity_constants,
      extra_data.allowed_payment_processors
    );
    new charity.CharityOrderAdder(extra_data.charity_constants);
  });
$(function () {
  var $emailForm = $('#ebook-email-form');

  $emailForm.submit(function(e) {
  console.log($emailForm.attr('action'));
    e.preventDefault();
    $.post(
      $emailForm.attr('action'),
      $emailForm.serialize(),
      function(data) {
        console.log(data);
        data = $.parseJSON(data);
        if (!data.success) {
          $('#send-email-message').text('Error: ' + data.message).css('padding-top','10px').addClass('error');
        } else {
          $('#send-email-message').text(data.message).css('padding-top','10px').removeClass('error');
        }
      }
    );
  });

  $('.js-slide-down-trigger').click(function (event) {
    event.preventDefault();
    $customInstruct = $(event.target);
    $customInstruct.siblings('.slide-down').slideToggle();
  });
});
  </script>

   
  <!--[if lte IE 9]><style>.site-footer-col, .site-footer-cols, .site-footer-social-widget-list { display: inline-block; }
.site-footer-col section, .site-footer-cols section, .site-footer-social-widget-list section, .site-footer-col div, .site-footer-cols div, .site-footer-social-widget-list div, .site-footer-col .site-footer-social-widget-list-item, .site-footer-cols .site-footer-social-widget-list-item, .site-footer-social-widget-list .site-footer-social-widget-list-item { display: inline-block; }

.site-footer { text-align: center; }</style><![endif]-->
<div class="site-footer-padding"></div>
<footer class="site-footer-container">
  <div class="site-footer">
    <nav class="site-footer-cols">
      <div class="site-footer-col site-footer-col-links">
        <section>
          <ul class="site-footer-list">
            <li class="site-footer-list-item">
              <a href="https://support.humblebundle.com" target="_blank">
                Support
              </a>
            </li>
            <li class="site-footer-list-item">
              <a href="http://blog.humblebundle.com" target="_blank">
                Blog
              </a>
            </li>
            <li class="site-footer-list-item">
              <a href="/developer" target="_blank">
                Developer
              </a>
            </li>
            <li class="site-footer-list-item">
              <a href="/publishing" target="_blank">
                Publishing
              </a>
            </li>
          </ul>
        </section>

        <section>
          <ul class="site-footer-list">
            <li class="site-footer-list-item">
              <a href="/terms" target="_blank">
                Terms of Service
              </a>
            </li>
            <li class="site-footer-list-item">
              <a href="/privacy" target="_blank">
                Privacy Policy
              </a>
            </li>
            <li class="site-footer-list-item">
              <a href="/resender" target="_blank">
                Order Resender
              </a>
            </li>
            <li class="site-footer-list-item">
              <a href="https://jobs.humblebundle.com" target="_blank">
                Careers
              </a>
            </li>
          </ul>
        </section>
      </div>

      <div class="site-footer-col site-footer-col-social">
        <ul class="site-footer-social-widget-list">
          <li class="site-footer-social-widget-list-item">
            <a href="https://www.facebook.com/humblebundle" target="_blank">Facebook</a>
            <div class="site-footer-facebook-widget">
              <div id="fb-root" class=" fb_reset"><div style="position: absolute; top: -10000px; height: 0px; width: 0px;"><div></div></div><div style="position: absolute; top: -10000px; height: 0px; width: 0px;"><div><iframe name="fb_xdm_frame_https" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" id="fb_xdm_frame_https" aria-hidden="true" title="Facebook Cross Domain Communication Frame" tabindex="-1" src="https://staticxx.facebook.com/connect/xd_arbiter/r/XBwzv5Yrm_1.js?version=42#channel=f3dc07c33710fb&amp;origin=https%3A%2F%2Fwww.humblebundle.com" style="border: none;"></iframe></div></div></div>
              <fb:like href="https://www.facebook.com/humblebundle" send="false" layout="button_count" width="90" show_faces="false" font="arial" class=" fb_iframe_widget" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=101146256651042&amp;container_width=0&amp;font=arial&amp;href=https%3A%2F%2Fwww.facebook.com%2Fhumblebundle&amp;layout=button_count&amp;locale=en_US&amp;sdk=joey&amp;send=false&amp;show_faces=false&amp;width=90"><span style="vertical-align: bottom; width: 102px; height: 20px;"><iframe name="f181e72668be74" width="90px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" title="fb:like Facebook Social Plugin" src="https://www.facebook.com/plugins/like.php?app_id=101146256651042&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FXBwzv5Yrm_1.js%3Fversion%3D42%23cb%3Df10daf19244748%26domain%3Dwww.humblebundle.com%26origin%3Dhttps%253A%252F%252Fwww.humblebundle.com%252Ff3dc07c33710fb%26relation%3Dparent.parent&amp;container_width=0&amp;font=arial&amp;href=https%3A%2F%2Fwww.facebook.com%2Fhumblebundle&amp;layout=button_count&amp;locale=en_US&amp;sdk=joey&amp;send=false&amp;show_faces=false&amp;width=90" style="border: none; visibility: visible; width: 102px; height: 20px;" class=""></iframe></span></fb:like>
            </div>
          </li>
          <li class="site-footer-social-widget-list-item">
            <a href="https://twitter.com/humble" target="_blank">Twitter</a>
            <div class="site-footer-twitter-widget">
              <iframe id="twitter-widget-1" scrolling="no" frameborder="0" allowtransparency="true" class="twitter-follow-button twitter-follow-button-rendered" style="position: static; visibility: visible; width: 200px; height: 20px;" title="Twitter Follow Button" src="https://platform.twitter.com/widgets/follow_button.85cf65311617c356fe9237c3e6c10afb.en.html#dnt=false&amp;id=twitter-widget-1&amp;lang=en&amp;screen_name=humble&amp;show_count=true&amp;show_screen_name=false&amp;size=m&amp;time=1502139056088" data-screen-name="humble"></iframe>
            </div>
          </li>
          <li class="site-footer-social-widget-list-item">
            <a href="https://plus.google.com/+HumbleBundle" target="_blank">Google+</a>
            <div class="site-footer-gplus-widget">
              <div id="___follow_1" style="text-indent: 0px; margin: 0px; padding: 0px; background: transparent; border-style: none; float: none; line-height: normal; font-size: 1px; vertical-align: baseline; display: inline-block; width: 166px; height: 20px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position: static; top: 0px; width: 166px; margin: 0px; border-style: none; left: 0px; visibility: visible; height: 20px;" tabindex="0" vspace="0" width="100%" id="I1_1502139057352" name="I1_1502139057352" src="https://apis.google.com/u/0/_/widget/render/follow?usegapi=1&amp;annotation=bubble&amp;height=20&amp;rel=author&amp;origin=https%3A%2F%2Fwww.humblebundle.com&amp;url=https%3A%2F%2Fplus.google.com%2F%2BHumbleBundle&amp;gsrc=3p&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.en.xh47SggJVmI.O%2Fm%3D__features__%2Fam%3DAQ%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCNnAKKXzFeIiJTiMA4Bq29frxjzuA#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I1_1502139057352&amp;parent=https%3A%2F%2Fwww.humblebundle.com&amp;pfname=&amp;rpctoken=16329861" data-gapiattached="true"></iframe></div>
            </div>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</footer><!-- /.site-footer -->
<div id="diigo-video-capture" style="display: none;"><div id="diigo-video-capture-container"><div id="diigo-video-capture-logo"></div>Capture</div></div><div id="diigo-video-capture-wrapper"><div id="diigo-video-capture-wrapper-tip">Drag to outliner or <span id="diigo-video-capture-upload">Upload</span></div><div id="diigo-video-capture-wrapper-close">Close</div></div><div class="diigolet notice" id="diigolet-notice" style="display: none;"><div><b>&nbsp;</b><p>Ok, done!</p><span id="close"></span></div></div><div id="diigolet-dlg-sticky" style="position: absolute; left: 100px; top: 100px; display: none;" class="diigolet diigoletFN yellow"><div id="diigolet-dlg-sticky-top" class="_dragHandle" style="cursor: move;"><span id="diigolet-dlg-sticky-close"></span><span id="diigolet-dlg-sticky-color"><div id="diigolet-dlg-sticky-currentColor" title="change color"></div><div id="diigolet-dlg-sticky-colorPicker" style="display: none;"><b color="yellow" id="diigolet-dlg-yellow" class="dlg-colorItem colorchecked"><b></b></b><b color="blue" id="diigolet-dlg-blue" class="dlg-colorItem"><b></b></b><b color="green" id="diigolet-dlg-green" class="dlg-colorItem"><b></b></b><b color="pink" id="diigolet-dlg-pink" class="dlg-colorItem"><b></b></b></div></span><span id="diigolet-dlg-sticky-addTab"></span></div><div id="diigolet-dlg-sticky-content" class="private"><div id="diigolet-dlg-sticky-switcher"><span class="FN-switcher" id="FN-switcher-private"><b></b>Private</span><span class="FN-switcher" id="FN-switcher-group"><b></b>Group</span></div><div class="FN-content-wrapper private"><textarea id="FN-private-editor" placeholder="Input here..."></textarea><div id="FN-content-footer"><div id="editDone"><span id="FN-private-delete"><b></b></span><span id="FN-private-datetime"></span></div><div id="editing"><a href="javascript:void(0)" id="FN-private-saveBtn">Save</a><a href="javascript:void(0)" id="FN-private-cancelBtn">Cancel</a></div></div></div><div class="FN-content-wrapper group"><div><div id="FN-group-content-nav"><span id="FN-current-group"><span>+Share to a new group</span><b></b></span><div id="FN-group-menu" style="display: none;"><ul id="FN-group-ul"></ul><ul id="FN-group-share-new-ul"><li id="FN-group-share-new">+Share to a new group</li></ul></div></div><div id="FN-post-form" class=""><div><textarea id="FN-group-post" placeholder="write a comment..."></textarea></div><div><select id="FN-group-share"></select><button><span class="button-label">Post</span><span class="button-spinner"></span></button><a href="javascript:void(0)">Cancel</a></div></div><div id="FN-group-content"><div id="FN-group-content-container"></div><div id="FN-group-content-postform"><textarea placeholder="Write a comment..."></textarea><div class="post-action"><button><span class="button-label">Post</span><span class="button-spinner"></span></button><a href="javascript:void(0)">Cancel</a></div></div></div></div></div></div></div><div id="diigolet-csm" class="yellow" style="position: absolute; display: none;"><div id="diigolet-csm-research-mode"></div><div id="diigolet-csm-highlight-wrapper" class="csm-btn"><a id="diigolet-csm-highlight" class="csm-action" href="javascript:void(0);"></a><div class="diigolet-csm-color small hidden" style="overflow: hidden; height: 0px;"><a class="diigolet-csm-coloritem yellow" data-color="yellow" style="overflow: hidden; height: 0px;"></a><a class="diigolet-csm-coloritem blue" data-color="blue" style="overflow: hidden; height: 0px;"></a><a class="diigolet-csm-coloritem green" data-color="green" style="overflow: hidden; height: 0px;"></a><a class="diigolet-csm-coloritem pink" data-color="pink" style="overflow: hidden; height: 0px;"></a></div></div><div id="diigolet-csm-highlightAndComment-wrapper" class="csm-btn"><a id="diigolet-csm-highlightAndComment" class="csm-action" href="javascript:void(0);"></a><div class="diigolet-csm-color small hidden" style="overflow: hidden; height: 0px;"><a class="diigolet-csm-coloritem yellow" data-color="yellow" style="overflow: hidden; height: 0px;"></a><a class="diigolet-csm-coloritem blue" data-color="blue" style="overflow: hidden; height: 0px;"></a><a class="diigolet-csm-coloritem green" data-color="green" style="overflow: hidden; height: 0px;"></a><a class="diigolet-csm-coloritem pink" data-color="pink" style="overflow: hidden; height: 0px;"></a></div></div><a id="diigolet-csm-search" class="csm-action" href="javascript:void(0);"></a></div><div id="diigo-chrome-installed" style="display: none;"></div><script type="text/template" id="platform-icons-template">
<% if (platforms) { %>
  <ul class="platforms <%= css_class %>">
  <% for (delivery_method in platforms) { %>
    <% var method_definition = DELIVERY_DEFINITION[delivery_method]; %>
    <% if (method_definition) { %>
    <li>
      <i class="hb <%- method_definition.icon %>" title=""></i>
      <aside class="platform-info">
      <% for (var i = 0; i < platforms[delivery_method].available.length; i++) { %>
        <% var platform = platforms[delivery_method].available[i]; %>
        <% var platform_definition = PLATFORM_DEFINITION[platform]; %>
        <% if (platform_definition) { %>
        <p>
          <i class="hb <%- platform_definition.icon %>"></i><em><%- method_definition.preamble || 'Get it via' %> <%= platform_definition.human_name %></em>
        </p>
        <% } %>
      <% } %>
    <% } %>
      </aside>
    </li>
  <% } %>
  </ul>
<% } %>
</script>

<script type="text/template" id="operating-systems-icons-template">
<% if (operating_systems) { %>
  <ul class="platforms <%= css_class %>">
  <% for (var os in operating_systems) { %>
    <% var platform_definition = PLATFORM_DEFINITION[os]; %>
    <% if (platform_definition) { %>
    <li>
      <i class="hb <%- platform_definition.icon %>" title=""></i>
      <aside class="platform-info">
        <p>
          <i class="hb <%- platform_definition.icon %>"></i><em>Play it on <span itemprop="gamePlatform operatingSystem"><%= platform_definition.human_name %></span></em>
        </p>
      </aside>
    </li>
    <% } %>
  <% } %>
  </ul>
<% } %>
</script>


<script type="text/template" id="platforms-and-operating-systems-icons-template">
<% if (platforms) { %>
  <ul class="product-platforms product-icon-list <%= css_class %>">
  <% _.each(platforms, function(platform) { %>
    <% if (DELIVERY_DEFINITION[platform]) { %>
    <li>
      <i class="hb <%- DELIVERY_DEFINITION[platform].icon %>" title=""></i>
    </li>
    <% } %>
  <% }); %>
  </ul>
<% } %>
<% if (operating_systems) { %>
  <ul class="product-operating-systems product-icon-list <%= css_class %>">
  <% _.each(operating_systems, function(os){ %>
    <% if (PLATFORM_DEFINITION[os]) { %>
    <li>
      <i class="hb <%- PLATFORM_DEFINITION[os].icon %>" title=""></i>
    </li>
    <% } %>
  <% }); %>
  </ul>
<% } %>
<% if (above_limit > 0) { %>
  <ul class="product-icon-list <%= css_class %>">
    <li>
      +<%- above_limit %>
    </li>
  </ul>
<% } %>
</script><iframe name="easyXDM_default9148_provider" id="easyXDM_default9148_provider" src="https://connect.ubi.com/Xdm/Index?appId=a297a492-7e6a-4833-9e59-ec902e10ed29&amp;xdm_e=https%3A%2F%2Fwww.humblebundle.com&amp;xdm_c=default9148&amp;xdm_p=1" frameborder="0" style="position: absolute; top: -2000px; left: 0px;"></iframe><script type="text/template" id="modal-settings">
  <div class="bbm-modal__topbar">
    <i class="hb hb-gear"></i>Settings
  </div>
  <div class="bbm-modal__section">
    <p>
      <label>
        <input class="js-auto-download auto-download" type="checkbox" <%= autoDownload ? "checked" : "" %>/>
        Auto-download games when possible
      </label>
      <label>
        <input class="js-hide-fullscreen-rec hide-fullscreen-rec" type="checkbox" <%= hideFullscreenRec ? "checked" : "" %>/>
        Don't recommend full-screen
      </label>
    </p>

    <p>Total space used: <span class="js-space-used">calculating...</span> <a href="#" class="js-clear-database">clear all</a></p>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button gray js-dismiss">Close</button>
  </div>
</script>

<script type="text/template" id="modal-cleared">
  <div class="bbm-modal__topbar">
    Game data cleared.
  </div>
  <div class="bbm-modal__section">
    <p>Local game data has been removed.</p>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button green js-dismiss">Ok</button>
  </div>
</script>

<script type="text/template" id="modal-unstable">
  <div class="bbm-modal__topbar">
    <i class="hb hb-exclamation-triangle"></i>Potentially unstable
  </div>
  <div class="bbm-modal__section">
    <p>This game may slow down your current browser. For better performance, use Mozilla Firefox.</p>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button gray js-dismiss js-load js-load-anyway">Play anyway</button>
    <button class="button green js-get-supported-browser" data-url="https://www.getfirefox.com">Get Firefox</button>
  </div>
</script>

<script type="text/template" id="modal-rec-fullscreen">
  <div class="bbm-modal__topbar">
    <i class="hb hb-exclamation-triangle"></i>Switch to fullscreen
  </div>
  <div class="bbm-modal__section">
    <p>It looks like this game will run best in full-screen</p>
    <label>
      <input class="js-hide-fullscreen-rec hide-fullscreen-rec" type="checkbox" <%= hideFullscreenRec ? "checked" : "" %>/>
      Don't show this again
    </label>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button gray js-dismiss">Play windowed</button>
    <button class="button green" onclick="asmPlayer.userRequestsFullscreen()">Fullscreen</button>
  </div>
</script>


<script type="text/template" id="modal-unsupported">
  <div class="bbm-modal__topbar">
    <i class="hb hb-exclamation-triangle"></i>Please install a supported browser
  </div>
  <div class="bbm-modal__section">
    <p>This browser is not optimized for these games. We recommend downloading Mozilla Firefox for the best browser gaming experience.</p>
    <img src="https://affiliates.mozilla.org/media/uploads/image_banners/2099b34508931a9744058af46bc05632f74fefff.png" class="js-get-supported-browser get-supported-browser" data-url="https://www.getfirefox.com" alt="Get Firefox"/>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button gray js-dismiss js-load js-load-anyway">Try anyway</button>
  </div>
</script>
<script type="text/template" id="modal-out-of-date">
  <div class="bbm-modal__topbar">
    <i class="hb hb-exclamation-triangle"></i>Please update your browser
  </div>
  <div class="bbm-modal__section">
    <p>This browser is not optimized for these games</p>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button green js-update-browser">Update my browser</button>
    <button class="button gray js-dismiss js-load load">Play anyway</button>
  </div>
</script>

<script type="text/template" id="modal-demo-expired-img">
  <div class="demo-ended-image" style="background-image: url('<%- STATIC_URL %><%- demoOverImage %>');"></div>
</script>

<script type="text/template" id="modal-demo-expired">
  <div class="bbm-modal__topbar">
  <% if (asmConfig.demoText) { %>
    <%= asmConfig.demoText.overHeading %>

    <div class="bbm-modal__section">
    <p><%= asmConfig.demoText.overBody %></p>
  <% } else { %>
    Purchase now to unlock the full game
  <% }%>
    </div>
    <div class="bbm-modal__bottombar">
      <button class="button green js-contribute">Contribute</button>
    </div>
</script>

<script type="text/template" id="modal-log-in">
  <div class="bbm-modal__topbar">
    <i class="hb hb-exclamation-triangle"></i>Cloud syncing disabled
  </div>
  <div class="bbm-modal__section">
    <p>You must be logged in to save your progress.</p>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button gray js-dismiss js-load js-load-anyway">Play anyway</button>
    <button class="button green js-log-in">Log in</button>
  </div>
</script>

<script type="text/template" id="modal-error">
  <div class="bbm-modal__topbar">
    <i class="hb hb-exclamation-circle"></i>Error loading game
  </div>
  <div class="bbm-modal__section">
    <p>Sorry, we were unable to load the game!</p>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button green js-load">Try again</button>
  </div>
</script>

<script type="text/template" id="modal-confirm-switch">
  <div class="bbm-modal__topbar">
    <i class="hb hb-exclamation-triangle"></i>Any unsaved progress will be lost!
  </div>
  <div class="bbm-modal__section">
    <p>Are you sure you want to leave this game?</p>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button gray js-dismiss">Cancel</button>
    <button class="button green js-dismiss js-do-switch">Leave the game</button>
  </div>
</script>

<script type="text/template" id="modal-confirm-close">
  <div class="bbm-modal__topbar">
    <i class="hb hb-exclamation-triangle"></i>Any unsaved progress will be lost!
  </div>
  <div class="bbm-modal__section">
    <p>Are you sure you want to leave this game?</p>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button gray js-dismiss">Cancel</button>
    <button class="button green js-dismiss js-do-close">Leave the game</button>
  </div>
</script>

<script type="text/template" id="modal-share">
  <div class="bbm-modal__topbar">
    Share <%= humanName %>
  </div>
  <div class="bbm-modal__section sharing-modal-body">
    <input type="text" value="<%= link %>"/>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button green js-dismiss">Ok</button>
  </div>
</script>


<script type="text/template" id="modal-screen-shot-dialog">
  <div class="bbm-modal__topbar">
    <i class="hb hb-camera"></i>Screenshots
  </div>
  <p class="js-modal-message"></p>
  <div class="modal-gallery-wrapper">
    <div class="grid-item take-screenshot js-take-screenshot">
      <div class="content">
        <i class="hb hb-camera"></i> New screenshot
      </div>
    </div><div class="grid-item pending-image-spinner js-pending-image-spinner">
      <img src="https://humblebundle-a.akamaihd.net/static/hashed/2de55388a5f1201232a4c2b6a8d4f83b5006f418.gif" alt=""/>
    </div>
  </div>
  <div class="bbm-modal__bottombar">
    <button class="button green js-dismiss js-do-close">Ok</button>
  </div>
</script>

<script id="modal-single-screen-shot" type="text/template">
  <div class="grid-item screenshot-item" id="<%= id %>">
    <img class="content" src="<%= url %>" alt=""/>
    <div class="hover-wrapper">
      <div class="shares">
        <a href="#" class="js-twitter-share"><i class="hb hb-twitter"></i></a>
        <a href="#" class="js-facebook-share"><i class="hb hb-facebook"></i></a>
        <a href="https://www.imgur.com/<%= id %>" target="_blank" >imgur</a>
      </div>
      <div class="delete-screenshot js-delete-screenshot">
        <i class="hb hb-trash-o"></i>
      </div>
    </div>
  </div>
</script><iframe name="oauth2relay1436880240" id="oauth2relay1436880240" src="https://accounts.google.com/o/oauth2/postmessageRelay?parent=https%3A%2F%2Fwww.humblebundle.com&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.en.xh47SggJVmI.O%2Fm%3D__features__%2Fam%3DAQ%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCNnAKKXzFeIiJTiMA4Bq29frxjzuA#rpctoken=624980742&amp;forcesecure=1" tabindex="-1" aria-hidden="true" style="width: 1px; height: 1px; position: absolute; top: -100px;"></iframe><iframe id="rufous-sandbox" scrolling="no" frameborder="0" allowtransparency="true" allowfullscreen="true" style="position: absolute; visibility: hidden; display: none; width: 0px; height: 0px; padding: 0px; border: none;" title="Twitter analytics iframe"></iframe></body></html>