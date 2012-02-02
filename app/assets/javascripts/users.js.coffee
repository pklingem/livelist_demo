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
          <address>
            <strong>{{first_name}} {{last_name}}</strong><span class="label">{{status}}</span>
            <br />
            {{street}}
            <br />
            {{city}}, {{state}} {{zip_code}}
          </address>
        </li>
      '''
    filters:
      renderTo: 'form#filters'
      template: '''
        {{#filters}}
        <fieldset class='filter'>
          <legend>{{name}}</legend>
          <div class="control-group">
            <ul id='{{filter_slug}}_filter_options'>
              {{#options}}
                <li>
                  <label class="checkbox">
                    <input {{#selected}}checked='checked'{{/selected}}
                           class='left filter_option'
                           id='filter_{{slug}}'
                           name='filters[]'
                           type='checkbox'
                           value='{{value}}' />
                    <div class='left filter_name'>{{name}}</div>
                    <div class='right filter_count'>{{count}}</div>
                    <div class='clear'></div>
                  </label>
                </li>
              {{/options}}
            </ul>
          </div>
        </fieldset>
        {{/filters}}
      '''
    pagination:
      renderTo: 'div#pagination'
  )
