document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')
  if (timer) { elapseTime(timer) }
})

function elapseTime(timer) {

  setInterval(function() {

    var timeRemain = new Date(timer.dataset.endTime) - new Date()

    var secondsRemain = timeRemain / 1000
    var minutes = Math.floor(secondsRemain / 60)
    var seconds = Math.floor(secondsRemain - minutes * 60)

    document.querySelector('.minutes').textContent = minutes
    document.querySelector('.seconds').textContent = seconds

    if (timeRemain <= 0) {
      document.querySelector('.minutes').textContent = 0
      document.querySelector('.seconds').textContent = 0
      
      var passageId = timer.dataset.passageId
      window.location.replace("/test_passages/" + passageId + "/result")
    }

  }, 1000)

} 