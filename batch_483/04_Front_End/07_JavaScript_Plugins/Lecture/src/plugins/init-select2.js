import $ from 'jquery';
import 'select2';

const initSelect = () => {
  $('.select2').select2({
    width: '100%'
  });
};

export { initSelect };
