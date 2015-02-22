class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png">'


  initialize: -> @render()

  render: ->
    console.log @$el
    @$el.children().detach()
    # @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    if @model.get 'revealed'
      rank = @model.get 'rankName'
      suit = @model.get 'suitName'
      @$el.css background: "url(img/cards/#{rank}-#{suit}.png)"
               background-size: "100%"
    else
      @$el.css background: "url(img/card-back.png)"
               background-size: "100%"
    # var backgroundImageStyleProperty = background-image: url('template')
    #
    # @$el[0].classList[1].css({
    #   background: url("img/card-back.png")
    # })
    # @$el.css({
    #   background: url("img/cards/<%=rankName %>-<%= suitName %>.png")
    # })
