$.fn.bind_auto_submit = ->
  input = $(@)
  form = (if input.length > 0 then $(input[0].form) else $())
  input.on
    change: ->
      form.submit()

  link = $("<a href=\"#\" class=\"auto_submit_clear\"><i class='fa fa-times-circle'></i></a>")
  $(@).after link
  link.on
    click: ->
      input.val ""
      form.submit()

$ ->

  $(".datetimepicker").datetimepicker
    pickSeconds: false

  $("a[rel^='prettyPhoto']").prettyPhoto
    social_tools: ""

  $("[data-auto-submit]").each ->
    $(@).bind_auto_submit()
