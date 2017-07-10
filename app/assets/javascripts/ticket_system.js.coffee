# Creates namespace for Backbone objects AND
# instantiates needed classes
window.TicketSystem =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new TicketSystem.Routers.Tickets
    new TicketSystem.Routers.Messages
    # routes de initial URL path
    Backbone.history.start()

$(document).ready ->
  TicketSystem.initialize()
