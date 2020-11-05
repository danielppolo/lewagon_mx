import { fetchMovies, updateResultList } from './movies';
import { initSortable } from './plugins/sortable';
import { initMarkdownConverter } from './plugins/init-markdown';
import { initSelect } from './plugins/init-select2';
// Sortable implementation
// fetchMovies('harry potter'); // on 1st page load
// initSortable();
// const form = document.querySelector('#search-form');
// form.addEventListener('submit', updateResultList);

initMarkdownConverter();
initSelect();
