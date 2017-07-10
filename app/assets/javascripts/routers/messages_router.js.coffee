class TicketSystem.Routers.Messages extends Backbone.Router
  routes:
    "tickets/:ticket_id/messages": "index"

  initialize: ->
    @collection = new TicketSystem.Collections.Messages()

  index: (id) ->
    @collection.fetch

    view = new TicketSystem.Views.MessagesIndex(collection: @collection)
    $("#container").html(view.render().el)
