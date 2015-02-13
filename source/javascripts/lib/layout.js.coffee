$(document).ready () ->
  # Add Date to footer
  now = new Date()
  currentYear = now.getFullYear()
  $("#year").text currentYear


  $('.btn-disabled').prop('disabled', true)

  # Add headroom to Nav
  # nav = document.querySelector("nothing")
  # nav.classList.add "slide--up"  if window.location.hash
  # new Headroom(nav,
  #   tolerance: 10
  #   offset: 350

  # ).init()
  # return