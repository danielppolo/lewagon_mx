import { getGarageCars, createCar } from './cars';

getGarageCars();


const form = document.getElementById('new-car');
form.addEventListener('submit', createCar);
