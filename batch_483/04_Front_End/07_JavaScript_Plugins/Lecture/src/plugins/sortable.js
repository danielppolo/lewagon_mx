import Sortable from 'sortablejs';


const handleMovieEnd = (event) => {
  alert(`${event.oldIndex} moved to ${event.newIndex}`);
};

const initSortable = () => {
  const list = document.getElementById('results');
  Sortable.create(list, {
    dragClass: 'ghost',
    onEnd: handleMovieEnd
  });
};

export { initSortable };
