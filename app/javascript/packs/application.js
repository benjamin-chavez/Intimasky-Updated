import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();
import { loadDynamicBannerText } from '../components/banner';
//Sanitized
loadDynamicBannerText();

import { toggleDateInputs } from '../plugins/flatpickr'
toggleDateInputs();

// import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
