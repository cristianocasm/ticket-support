class TicketSystem.Views.TicketsIndex extends Backbone.View

  template: JST['tickets/index']

  events:
    "el-set": "setup"

  initialize: ->
    @collection.on("reset", @render)
    @collection.on("add", @appendEntry)

  render: =>
    @$el.html(@template()).trigger("el-set")
    @collection.each(@appendEntry)
    this

  setup: ->
    @$list = @$("#tickets")

  appendEntry: (ticket) =>
    view = new TicketSystem.Views.Ticket(model: ticket)
    @$list.append(view.render().el)
