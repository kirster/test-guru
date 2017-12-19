document.addEventListener('turbolinks:load', function() {
  var progress = document.querySelector('.progress-bar')
  if (progress) { document.addEventListener("DOMContentLoaded", calculateProgress(progress)) }
})

function calculateProgress(progress) {
  var questions = progress.dataset.questions
  var currentQuestion = progress.dataset.questionIndex
  var ratio = Math.round(100 * currentQuestion / questions)

  progress.setAttribute('value', ratio)

} 