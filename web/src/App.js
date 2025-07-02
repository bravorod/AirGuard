import React, { useState, useEffect } from "react";
import axios from "axios";
import Map from "./components/Map";
import Chart from "./components/Chart";
import "./App.css";

function App() {
  const [health, setHealth] = useState("loading…");

  useEffect(() => {
    axios.get("http://localhost:8000/health")
      .then(res => setHealth(res.data.status))
      .catch(err => setHealth("unreachable"));
  }, []);

  return (
    <div className="container">
      <h1>AirGuard Dashboard</h1>
      <p>API health: <strong>{health}</strong></p>
      <Map />
      <Chart />
    </div>
  );
}

export default App;
