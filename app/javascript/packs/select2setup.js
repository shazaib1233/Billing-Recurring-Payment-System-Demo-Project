import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

window.addEventListener('turbolinks:load', () => {
  $('.select2').select2({
    tags: true,
    tokenSeparators: [',', ' ']
  });
})
