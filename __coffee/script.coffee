 # Copyright (c) 2013 NAOTONE (Naoto Yoshimoto) Licensed under the MIT license. 

$ ->
  y = 0
  if $('html').hasClass('on')
     yPosition = ->
      y = Math.abs $("article").offset().top
      $("#scrollPosition").text "SCROLL POSITION：" + y
    
    # scrollEvent = ->
    $("#wrap").scroll ->
      do yPosition
      # console.log y
      if  y > 700 and y < 900
        $(".rect.scroll").stop().animate
          # marginLeft: 500
          marginLeft: 500
        ,1000,'linear'
      else if y > 900 or y < 700
        $(".rect.scroll").stop().animate
          # marginLeft: 20
          marginLeft: 0
        ,1000,'linear'

    # do scrollEvent
    window.addEventListener "touchstart", yPosition, false
    window.addEventListener "touchmove", yPosition, false
    window.addEventListener "touchend", yPosition, false

  #-------------------------------------------------------------------------------
    rectMove = ->
      $(".rect.move").animate
        marginLeft: 500
      ,1000,->
        $(".rect.move").animate
          marginLeft: 0
        ,1000

    setInterval rectMove, 1000, 1000

    $(".toggle").click ->
      $(".rect.toggle").animate
          opacity: "toggle"
      ,2000

  if $('html').hasClass('off')
    $(window).scroll ->
      y = $(window).scrollTop()
      $("#scrollPosition").text "SCROLL POSITION：" + y

