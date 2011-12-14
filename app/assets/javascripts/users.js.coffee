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
      listItemTemplate: '''
        <li id="patient_{{id}}">
          <div>{{first_name}} {{last_name}} ({{status}})</div>
          <div>{{street}}</div>
          <div>{{city}}, {{state}} {{zip_code}}</div>
        </li>
      '''
    filters:
      renderTo: 'div#filters'
    pagination:
      renderTo: 'div#pagination'
  )
