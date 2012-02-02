# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  list = new LiveList(
    global:
      resourceName: 'users'
      resourceNameSingular: 'user'
    list:
      httpMethod: 'post'
      urlPrefix: '/users/filter'
      renderTo: 'ul#users'
      listItemTemplate: $('#users_list_item_template').html()
    filters:
      renderTo: 'form#filters'
      template: $('#users_filters_template').html()
    pagination:
      renderTo: 'div#pagination'
      template: $('#pagination_template').html()
  )
