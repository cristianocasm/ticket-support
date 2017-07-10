class TicketSystem.Routers.Tickets extends Backbone.Router
  routes:
    "": "index"
    "tickets/:ticket_id/messages": "show"

  initialize: ->
    @collection = new TicketSystem.Collections.Tickets()

  index: ->
    @collection.fetch()

    view = new TicketSystem.Views.TicketsIndex(collection: @collection)
    $("#container").html(view.render().el);

  show: (id) ->
    alert(id)
