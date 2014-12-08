$ ->
  $(".form-vertical").removeClass("form-horizontal")

  $(".datetimepicker").datetimepicker
    pickSeconds: false

  $("a[rel^='prettyPhoto']").prettyPhoto
    social_tools: ""