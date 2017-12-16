document.addEventListener('turbolinks:load', function() {
  var pass_confirm = document.getElementById('user_password_confirmation')
  if (pass_confirm) { pass_confirm.addEventListener('input', passwordComparison) }
}) 

function passwordComparison() {
  var password = document.getElementById('user_password').value
  var confirm = this.value

  if (confirm != password.substr(0, confirm.length)) {
    document.querySelector('.octicon-x').classList.remove('hide')
    document.querySelector('.octicon-check').classList.add('hide')
  } else {
      document.querySelector('.octicon-x').classList.add('hide')

      if (confirm.length == password.length) {
        document.querySelector('.octicon-check').classList.remove('hide')
      } else {
        document.querySelector('.octicon-check').classList.add('hide')
    }
  }
}
