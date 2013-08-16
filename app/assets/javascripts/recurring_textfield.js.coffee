//= require recurring_select_dialog
//= require_self

$ = jQuery

methods =
  open_custom: ->
    @data "recurring-select-active", true
    new RecurringSelectDialog(@)
    @blur()

  save: (new_rule) ->
    new_json_val = JSON.stringify(new_rule.hash)
    $('#schedule_rule').val(new_json_val)
    $('#schedule_desc').html(new_rule.str)

  current_rule: ->
    str:  @data("initial-value-str")
    hash: $.parseJSON(@data("initial-value-hash"))

  cancel: ->
    @val @data("initial-value-hash")
    @data "recurring-select-active", false
    @.trigger "recurring_select:cancel"

  methods: ->
    methods

$.fn.recurring_select = (method) ->
  if method of methods
    return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ) );
  else
    $.error( "Method #{method} does not exist on jQuery.recurring_select" );

$.fn.recurring_select.texts = {
  repeat: "Repeat"
  last_day: "Last Day"
  frequency: "Frequency"
  daily: "Daily"
  weekly: "Weekly"
  monthly: "Monthly"
  yearly: "Yearly"
  every: "Every"
  days: "day(s)"
  weeks_on: "week(s) on"
  months: "month(s)"
  years: "year(s)"
  day_of_month: "Day of month"
  day_of_week: "Day of week"
  cancel: "Cancel"
  ok: "OK"
  summary: "Summary"
  first_day_of_week: 0
  days_first_letter: ["S", "M", "T", "W", "T", "F", "S" ]
  order: ["1st", "2nd", "3rd", "4th"]
}
