import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log(this.element)
    console.log(this.apiKeyValue)
    console.log(this.markersValue)
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.markersValue)
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    // this.map.addControl(new MapboxGeocoder({ accessToken: this.apiKeyValue, mapboxgl: mapboxgl }))
    this.map.addControl(
      new MapboxDirections({
        accessToken: this.apiKeyValue
      }),
      'top-left'
      );
  }

  // 1. tu caches la recherche de droite
  // quand je me connecte
  // après avoir loadé la map
  // récupérer l'adresse de départ & l'adresse d'arrivée
  // les mettre dans les input de départ & d'arrivée de la carte
  // document.querySelector('.mapboxgl-ctrl-geocoder input')
  // document.querySelector('.mapbox-directions-destination input')

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      this.markersValue.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window_html) // Add this
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
      });
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
