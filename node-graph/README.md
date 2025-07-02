# Node Graph Module

This package exports tools for building and querying sensor-network graphs:

- `graph.js` — simple in-memory directed graph class
- `schema.graphql` — GraphQL type definitions for nodes & edges
- `index.js` — exports public API

## Install

```bash
cd node-graph
npm install
```

## Usage

```js
const { DirectedGraph } = require('node-graph');

const g = new DirectedGraph();
g.addNode('A');
g.addNode('B');
g.addEdge('A','B');

console.log(g.outEdges('A')); // ['B']
```