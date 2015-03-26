_ = require 'underscore'
window.$ = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = $
{Promise} = require "es6-promise"

$.wait = (delay) ->
  d = new $.Deferred
  setTimeout (-> d.resolve()), delay
  d.promise()

$.fn.imagesLoaded = ->
  deferreds = $.map @, (el, i) ->
    d = new $.Deferred
    img = new Image()
    if "onreadystatechange" in el
      el.onreadystatechange = (e) -> d.resolve() if el.readyState is "loaded" or el.readyState is "complete"
    else
      img.onload  = -> d.resolve()
      img.onerror = -> d.resolve()
    img.src = el.src
    d.promise()
  $.when deferreds...

#$('body').find('img').imagesLoaded().then ->
#  $('img').each -> console.log $(@).height()

