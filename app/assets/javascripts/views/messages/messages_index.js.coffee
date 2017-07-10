class TicketSystem.Views.MessagesIndex extends Backbone.View

  template: JST['messages/index']

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
    @$list = @$("#messages")

  appendEntry: (message) =>
    view = new TicketSystem.Views.Message(model: message)
    @$list.append(view.render().el)
