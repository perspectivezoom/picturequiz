class PictureQuiz.Quizzes.Timer extends Backbone.Marionette.ItemView
  template: "quizzes/templates/timer-view"
  initialize: ->
    @seconds = @options.seconds || 60
  serializeData: ->
    seconds: @seconds
  startTimer: ->
    @timer = setInterval(=>
      @seconds--
      @render()
      if @seconds == 0
        clearInterval(@timer)
        @trigger('timeUp')
    , 1000)
  onClose: ->
    clearInterval(@timer)

