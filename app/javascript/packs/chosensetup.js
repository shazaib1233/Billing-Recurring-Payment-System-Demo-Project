import $ from 'jquery';
import 'chosen-js/chosen.css';
import 'chosen-js';

window.addEventListener('turbolinks:load', () => {
  $('.chosen').chosen();
});
