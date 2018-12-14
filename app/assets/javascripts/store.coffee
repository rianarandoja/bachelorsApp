# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@allPowerfulSearchEngine = ->
  input = document.getElementById('search_input')
  filter = input.value.toUpperCase().replace /^\s+|\s+$/g, ""
  entryd = document.getElementsByClassName('entry')
  i = 0
  while i < entryd.length
    entry_div = entryd[i].getElementsByTagName('a')[0].innerHTML
    if entry_div.toUpperCase().indexOf(filter) > -1
      entryd[i].style.display = ''
    else
      entryd[i].style.display = 'none'
    i++
  return
