const insertMovies = (data) => {
  data.Search.forEach((result) => {
    const movie = `<li>
      <img src="${result.Poster}" alt="" />
      <p>${result.Title}</p>
    </li>`;
    const list = document.querySelector('#results');
    list.insertAdjacentHTML('beforeend', movie);
  });
};


export { insertMovies };
