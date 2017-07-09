class TicketSystem.Views.Ticket extends Backbone.View
  template: JST['tickets/show']
  tagName: "tr"

  events:
    "click button.show": "showMessages"

  initialize: ->
    @model.on("change", @render)

  render: =>
    @$el.html(@template(ticket: @model))
    this

  showMessages: ->
    # "true" as the second argument triggers the route
    Backbone.history.navigate("tickets/#{@model.get("id")}/messages", true)
