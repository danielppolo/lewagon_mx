const insertCar = (car) => {
  const carContainer = document.querySelector(".cars-list");

  const carHTML = `<div class="car">
          <div class="car-image">
            <img src="http://loremflickr.com/280/280/${car.brand} ${car.model}" />
          </div>
          <div class="car-info">
            <h4>${car.brand}</h4>
            <p><strong>Owner:</strong> ${car.owner}</p>
            <p><strong>Plate:</strong> ${car.plate}</p>
          </div>
        </div>`;
  // Insert the HTML into the  DOM.
  carContainer.insertAdjacentHTML('beforeend', carHTML);
};


const getGarageCars = () => {
  // 1. Create an array to hold the cars. Empty.
  const cars = [];
  // 2. Fetch the API to get the cars
  fetch('https://wagon-garage-api.herokuapp.com/batch544/cars') // => Promise
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      const carContainer = document.querySelector(".cars-list");
      carContainer.innerHTML = '';
      // Iterate the cars
      data.forEach((car) => {
        // Create the corresponding HTML for the car.
        insertCar(car);
      });
    });
  // 3. List/display the cars.
};

// 0. Get the form.
// 1. Add the eventListener to the form submit.

const createCar = (event) => {
  event.preventDefault();
  // Get the data from the form.
  const brandValue = document.getElementById('brand').value;
  const modelValue = document.getElementById('model').value;
  const ownerValue = document.getElementById('owner').value;
  const plateValue = document.getElementById('plate').value;
  // Make a POST to the API.
  fetch('https://wagon-garage-api.herokuapp.com/batch544/cars', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      brand: brandValue,
      model: modelValue,
      owner: ownerValue,
      plate: plateValue
    })
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      // window.location.reload();
      // getGarageCars();
      insertCar(data);
      document.getElementById('brand').value = '';
      document.getElementById('owner').value = '';
      document.getElementById('plate').value = '';
      document.getElementById('model').value = '';
    });
  // Clear the form.
  // Show the car in the Garage
};


export {
  getGarageCars,
  createCar
};
