document.addEventListener('turbolinks:load', function() {
  document.getElementById('user_password_confirmation').addEventListener('input', passwordComparison)
}) 

function passwordComparison() {
  var password = document.getElementById('user_password').value

  if (this.value != "" && this.value === password) {
    if (document.querySelector('.octicon-check').classList.contains('hide')) {
      document.querySelector('.octicon-check').classList.remove('hide')
      document.querySelector('.octicon-x').classList.add('hide')
    }
  } else if (this.value != password && this.value.length != 0 ) {
      if (document.querySelector('.octicon-x').classList.contains('hide')) {
        document.querySelector('.octicon-x').classList.remove('hide')
        document.querySelector('.octicon-check').classList.add('hide')
      }
  }
}
