class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png">'


  initialize: -> @render()

  render: ->
    console.log @$el.text()
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    # var backgroundImageStyleProperty = background-image: url('template')
    #
    # @.$el.css({
    #   background: url('"' + @template + '.png"')
    # })
