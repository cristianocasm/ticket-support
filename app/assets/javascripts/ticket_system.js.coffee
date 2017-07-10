# Creates namespace for Backbone objects AND
# instantiates needed classes
window.TicketSystem =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new TicketSystem.Routers.Tickets
    # routes de initial URL path
    Backbone.history.start()

$(document).ready ->
  TicketSystem.initialize()
