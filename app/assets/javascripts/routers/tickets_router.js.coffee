class TicketSystem.Routers.Tickets extends Backbone.Router
  routes:
    "tickets": "index"

  initialize: ->
    @collection = new TestBackbone.Collections.Tickets()
    @collection.reset($("#container").data("tickets"))

  index: ->
    # views accepts collection as parameter
    view = new TestBackbone.Views.TicketsIndex(collection: @collection)
    $("#container").html(view.render().el);
