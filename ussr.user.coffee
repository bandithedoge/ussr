`
// ==UserScript==
// @name        User-friendly Simple Songsterr Receiver
// @description Stupidly simple userscript that downloads GP5 tabs from Songsterr
// @match       https://www.songsterr.com/*
// @version     1.0.0
// @author      bandithedoge
// @require     https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js
// ==/UserScript==
`

icon = 'https://68.media.tumblr.com/eb4cc353565d8431e7b35d92338c5708/tumblr_mwilksxZ8y1qaqscoo1_500.png'
url = window.location.href

id = /s\d+/.exec(url)[0].slice 1

$.getJSON "https://www.songsterr.com/api/meta/#{id}/revisions", (json) ->
    $('#revisions').after '<a id=download></a>'

    $ '#download'
        .attr href: json[0].source
        .append '<img id=coconut-doggy>'

    $('#coconut-doggy').attr
        src: icon
        alt: 'Download tab'
        width: 300

    return