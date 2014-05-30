class PictureQuiz.Quizzes.QuestionView extends Backbone.Marionette.ItemView
  template: "quizzes/templates/question-view"
  events:
    "click .submit": "onSubmitClick"
    "click .question-choice": "onQuestionChoiceClick"
  ui:
    submit: ".submit"
    images: ".question-choice"
  
  onQuestionChoiceClick: (e) ->
    @ui.images.removeClass('selected')
    $(e.currentTarget).addClass('selected')
    @ui.submit.removeClass('disabled')
    @selectedAnswer = $(e.currentTarget).attr('src')

  onSubmitClick: ->
    return false if @ui.submit.hasClass('disabled')
    @model.set('selectedAnswer', @selectedAnswer)
    @trigger('submit', @model)