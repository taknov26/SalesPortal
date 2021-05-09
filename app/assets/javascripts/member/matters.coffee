# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "change", "#matter_client_company_id", ->
  $.ajax(
    type: "get"
    url: "/member/matters/get_clients"
    data: {
      client_company_id: $(this).val()
    }
  ).done (data) ->
    $("#client-area").html(data)
    # 1、ボックスごとnone
    # 2、企業名選ばれたら、データ持ってきて、表示

$(document).on "change", "#matter_client_id", ->
  $.ajax(
    type: "get"
    url: "/member/matters/get_client_people"
    data: {
      client_id: $(this).val()
    }
  ).done (data) ->
    $("#client-person-area").html(data)