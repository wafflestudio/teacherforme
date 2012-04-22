# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.sendContact').click (e) =>
    id = $(e.target).attr('data-id')
    container = $(e.target).parent()
    contact_div = $('<div class="contact_form"><textarea rows="3"></textarea></div>')
    $(container).append contact_div
    $target = $(e.target)
    $target.text '보내기'
    $target.unbind 'click'
    $target.click =>
      console.log id
    false
