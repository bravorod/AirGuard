import React, { useEffect } from "react";
import L from "leaflet";

export default function Map() {
  useEffect(() => {
    const map = L.map("map").setView([51.505, -0.09], 13);
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png").addTo(map);
  }, []);
  return <div id="map" style={{ height: "400px", margin: "1rem 0" }}></div>;
}
