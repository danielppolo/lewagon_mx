const button = document.getElementById('show-hint');
const handleButtonClick = (event) => {
  const hint = document.querySelector('.hint');
  hint.classList.add('active');
}
button.addEventListener('click', handleButtonClick);

const canMove = (current, empty) => {
  // Current tile coordinates in table
  const columnIndex = current.cellIndex;
  const rowIndex = current.parentElement.rowIndex;
  
  // Empty tile coordinates in table
  const emptyColumnIndex = empty.cellIndex;
  const emptyRowIndex = empty.parentElement.rowIndex;
  
  const canMoveLeft = (rowIndex == emptyRowIndex) && (emptyColumnIndex == columnIndex - 1);
  const canMoveRight = (rowIndex == emptyRowIndex) && (emptyColumnIndex == columnIndex + 1);
  const canMoveUp = (rowIndex - 1 == emptyRowIndex) && (emptyColumnIndex == columnIndex);
  const canMoveDown = (rowIndex + 1 == emptyRowIndex) && (emptyColumnIndex == columnIndex);
  return (canMoveLeft ||  canMoveRight || canMoveUp || canMoveDown)
}

const moveTile = (current, empty) => {
  // From the empty
  // 1. Add the content from the current
  empty.innerText = current.innerText;
  // 2. Remove the .empty
  empty.classList.remove('empty');
  // From the current
  // 1. Remove the content
  current.innerText = ''
  // 2. Add the .empty
  current.classList.add('empty');
}

const isWinner = () => {
  // SOLUTION 1 - HAZIM
  // 1row.sum() => 10
  // 2row.sum() => 25
  // 3row.sum() => ?
  // 4row.sum() => ?

  // SOLUTION 2 - LUIS
  // {
  //   1: [0,0],
  //   2: [0,1],
  // }

  // SOLUTION 3 - DARIEN
  const correctGrid = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15, NaN]
  const tiles = document.querySelectorAll('table td');  // Not an array, it's a NodeList.
  const arrayTiles = Array.from(tiles) // This is an Array
  const grid = arrayTiles.map(tile => Number.parseInt(tile.innerText, 10));
  return grid.join() === correctGrid.join();

  // SOLUTION 4 - HAZIM

  // SOLUTION 5 - ANDREW
  // Iterate through the cells and ALL need to be -1 from the current

}


const handleTileClick = (event) => {
  const currentTile = event.target;
  const emptyTile = document.querySelector('table .empty');
  // 3. Find out the empty space around the tile (clicked).
  if (canMove(currentTile, emptyTile)) {
  // 4. Swap clicked tile into empty space. (Number <=> .empty)
    moveTile(currentTile, emptyTile);
    // 5. Check the numbers to declare if it wins/loses
    if (isWinner()) {
      alert('You won!');
      // shakeTiles() Random numbers for the cells
    }
  }
}


// 1. Get all the tiles.
const tiles = document.querySelectorAll('table td');
// 2. Add listeners for Tile clicks (<td>).
// shakeTiles()
tiles.forEach(tile => {
  tile.addEventListener('click', handleTileClick);
})

