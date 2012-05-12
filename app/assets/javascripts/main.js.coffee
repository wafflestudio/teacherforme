# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  # for teachers
  # variables 
  t_new_password_box = $('#teacher_new_password_box')
  t_login_password_box = $('#teacher_login_password_box')
  t_contact_info = $('#teacher_contact_info')
  t_email_field = $('#teacher_email')
  t_email_fieldset = $('#teacher_email_fieldset')
  t_password_fieldset = $('#teacher_password_fieldset')

  # detach password field
  t_new_password_box.detach()
  t_login_password_box.detach()

  # trigger change for check email
  t_email_field.keyup ->
    $.getJSON '/check_email', {email: t_email_field.val()}, (data)->
      if data.res == "exists"
        t_new_password_box.detach()
        t_contact_info.after(t_login_password_box)
        t_email_fieldset.addClass('success')
      else if data.res == "non"
        t_email_fieldset.removeClass('success')
        t_login_password_box.detach()
        t_contact_info.after(t_new_password_box)
      else
        alert "error"
      return true
    return true

  # check password and password_confirmation
  $('#teacher_password_confirmation').live 'change', ->
    if $('#teacher_new_password').val() == $('#teacher_password_confirmation').val()
      t_password_fieldset.removeClass('error')
      t_password_fieldset.addClass('success')
    else
      t_password_fieldset.removeClass('success')
      t_password_fieldset.addClass('error')
    return true

  # for students
  # variables 
  s_new_password_box = $('#student_new_password_box')
  s_login_password_box = $('#student_login_password_box')
  s_contact_info = $('#student_contact_info')
  s_email_field = $('#student_email')
  s_email_fieldset = $('#student_email_fieldset')
  s_password_fieldset = $('#student_password_fieldset')

  # detach password field
  s_new_password_box.detach()
  s_login_password_box.detach()

  # trigger change for check email
  s_email_field.keyup ->
    $.getJSON '/check_email', {email: s_email_field.val()}, (data)->
      if data.res == "exists"
        s_new_password_box.detach()
        s_contact_info.after(s_login_password_box)
        s_email_fieldset.addClass('success')
      else if data.res == "non"
        s_email_fieldset.removeClass('success')
        s_login_password_box.detach()
        s_contact_info.after(s_new_password_box)
      else
        alert "error"
      return true
    return true

  # check password and password_confirmation
  $('#student_password_confirmation').live 'change', ->
    if $('#student_new_password').val() == $('#student_password_confirmation').val()
      s_password_fieldset.removeClass('error')
      s_password_fieldset.addClass('success')
    else
      s_password_fieldset.removeClass('success')
      s_password_fieldset.addClass('error')
    return true
