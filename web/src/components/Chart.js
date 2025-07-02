import React, { useEffect, useRef } from "react";
import Plot from "plotly.js-dist";

export default function Chart() {
  const ref = useRef(null);
  useEffect(() => {
    const trace = { x: [], y: [], type: "scatter" };
    Plot.newPlot(ref.current, [trace]);
  }, []);
  return <div ref={ref} style={{ height: "400px" }} />;
}
