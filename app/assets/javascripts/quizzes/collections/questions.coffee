#= require quizzes/models/question

class PictureQuiz.Quizzes.Questions extends Backbone.Collection
  model: PictureQuiz.Quizzes.Question
  nextUnansweredQuestion: ->
    @detect((question) -> !question.get('selectedAnswer'))
  serializeForSubmit: ->
    responses = {}
    @each((question) ->
      if question.get('selectedAnswer')
        responses[question.get('question')] = question.get('selectedAnswer')
    )
    responses