class TicketSystem.Routers.Tickets extends Backbone.Router
  routes:
    "": "index"

  initialize: ->
    @collection = new TicketSystem.Collections.Tickets()

  index: ->
    @collection.fetch()

    view = new TicketSystem.Views.TicketsIndex(collection: @collection)
    $("#container").html(view.render().el)
