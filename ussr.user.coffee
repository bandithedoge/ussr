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

ussr = ->
    $('#logo').after '<img id=ussr>'
    $ '#ussr'
        .attr
            src: icon
            alt: 'Download tab'
        .click ->
            url = window.location.href
            id = /s\d+/.exec(url)[0].slice 1

            $.getJSON "https://www.songsterr.com/api/meta/#{id}/revisions", (json) ->
                window.open json[0].source

# we have to wait half a second before placing anything
# otherwise the ui reloads and overwrites our coconut doggy :(
$(document).ready setTimeout ussr, 500
