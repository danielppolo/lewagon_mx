import {insertMovies } from './movies/insert-movies'

const fetchMovies = (query) => {
  fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
    .then(response => response.json())
    .then(insertMovies);
};

const updateResultList = (event) => {
  event.preventDefault();
  const list = document.querySelector('#results');
  list.innerHTML = '';
  const input = document.querySelector('#search-input');
  fetchMovies(input.value);
}

export { fetchMovies, updateResultList }