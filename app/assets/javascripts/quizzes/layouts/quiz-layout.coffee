#= require quizzes/collections/questions
#= require quizzes/views/question-view
#= require quizzes/views/timer-view

class PictureQuiz.Quizzes.QuizLayout extends Backbone.Marionette.Layout
  template: 'quizzes/templates/quiz-layout'
  regions:
    question: '.question'
    timer:    '.timer'
  ui:
    start:    '.start'
    email:    'input.email'
    infoText: '.info-text'
  events:
    'click .start-button': 'onStartButtonClick'

  initialize: ->
    @collection = new PictureQuiz.Quizzes.Questions()

  onRender: ->
    timerView = new PictureQuiz.Quizzes.Timer(seconds: 120)
    @timer.show timerView
    @loadQuestions()

  loadQuestions: ->
    $.ajax
      url: 'questions'
      success: @onLoadQuestionSuccess

  onLoadQuestionSuccess: (data) =>
    @collection.reset(data)
    @ui.start.removeClass 'hidden'

  onStartButtonClick: ->
    @ui.start.addClass 'hidden'
    @ui.infoText.text('')
    @timer.currentView.startTimer()
    @listenTo(@timer.currentView, 'timeUp', @onQuizEnd)
    @email = @ui.email.val()
    @showNextQuestion()

  showNextQuestion: ->
    if question = @collection.nextUnansweredQuestion()
      questionView = new PictureQuiz.Quizzes.QuestionView(model: question)
      @question.show questionView
      @listenTo(questionView, 'submit', @showNextQuestion)
    else
      @onQuizEnd()

  onQuizEnd: ->
    @timer.currentView.close()
    @question.currentView?.close()
    @ui.infoText.text('Submitting...')
    @submit()

  submit: ->
    $.ajax
      url: 'quizzes'
      method: 'post'
      data:
        email: @email
        responses: @collection.serializeForSubmit()
      success: @onSubmitSuccess

  onSubmitSuccess: =>
    @ui.infoText.text('Quiz Submission was successful. You will hear back from us soon')