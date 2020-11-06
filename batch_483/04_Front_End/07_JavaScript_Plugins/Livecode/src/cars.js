const BASE_URL = 'https://wagon-garage-api.herokuapp.com/cdmx';
const GET_LIST_URL = '/cars';
// const GET_CAR_URL = `/cars/${id}`;

const getCarList = () => {
  fetch(BASE_URL + GET_LIST_URL) // Promise => Success
    .then((response) => {
      console.log(response);
      return response.json();
    })
    .then((data) => {
      const carContainer = document.querySelector('.cars-list');
      carContainer.innerHTML = '';
      data.forEach((car) => {
        carContainer.insertAdjacentHTML('beforeend', `<div class="car">
      <div class="car-image">
        <img src="http://loremflickr.com/280/280/Ferrari 308 GTS" />
      </div>
      <div class="car-info">
        <h4>${car.brand} ${car.model}</h4>
        <p><strong>Owner:</strong> ${car.owner}</p>
        <p><strong>Plate:</strong> ${car.plate}</p>
      </div>
    </div>`);
      });
    });
};


const addCar = () => {
  const brand = document.getElementById('brand');
  const model = document.getElementById('model');
  const owner = document.getElementById('owner');
  const plate = document.getElementById('plate');
  const form = document.getElementById('new-car');
  form.addEventListener('submit', async (event) => {
    event.preventDefault();
    // WHEN FORM SUBMITTED
    // GET THE VALUES FROM THE FORM
    // CREATE BODY FROM THE FORM
    const body = {
      plate: plate.value,
      brand: brand.value,
      owner: owner.value,
      model: model.value,
    };
    // POST WITH BODY (FETCH)
    const response = await fetch(BASE_URL + GET_LIST_URL, {
      method: 'post',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(body),
    });
    if (response.ok) {
      // await response.json();
      getCarList();
    }
  });
};

export { getCarList, addCar };
