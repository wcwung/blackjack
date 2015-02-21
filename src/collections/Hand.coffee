class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    playerScore = 0

  hit: ->
    @add(@deck.pop())
    @blackJack()
    @calcHand()

    console.log "player score: ", @minScore()


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
    while @minScore() < 17
      @hit()
      @blackJack()
      @calcHand()
    if $('.player-hand-container').find('.score').text() > $('.dealer-hand-container').find('.score').text()
      alert 'player wins'
    if $('.player-hand-container').find('.score').text() < $('.dealer-hand-container').find('.score').text() && $('.dealer-hand-container').find('.score').text() <= 21
      alert 'dealer wins'
    if $('.player-hand-container').find('.score').text() == $('.dealer-hand-container').find('.score').text()
      alert 'push'

  blackJack: ->
    if @scores()[0] == 21 || @scores()[1] == 21
      console.log @
      if @.isDealer == true
        alert 'dealer got black jack!'
      else
        alert 'player got black jack!'

    # console.log minScore()
    # if @minScore() < 17
    #   @hit()
    # else @minScore() > 21
    # console.log @minScore == 10
    # console.log @minScore() == @minScore
    # console.log('dealer')
    # return

  calcHand: ->
   if @minScore() > 21
         alert 'busted son!'
       else if @scores()[1] > 21 && @scores()[0] > 21
         console.log @scores()[1], @scores()[0]
         alert 'busted boy!'



