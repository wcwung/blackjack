class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    # console.log(scores());
    [@minScore(), @minScore() + 10 * @hasAce()]

    # console.log "Bust!"

  stand: ->
    # when player stands
      # dealer flips the card
      # check if score is less than 17
        # if less, dealer hit
        # else, compare player and dealer score
        #
    @.models[0].flip()
    console.log 'dealer has: ', @minScore()
    while @minScore() < 17
      @hit()


    # if @minScore() < 17
    #   @hit()
    # else @minScore() > 21
    # console.log @minScore == 10
    # console.log @minScore() == @minScore
    # console.log('dealer')
    # return

  calcDealer: ->
    # console.log @minScore()

