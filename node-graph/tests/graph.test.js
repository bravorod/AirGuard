const DirectedGraph = require('../src/graph');

describe('DirectedGraph', () => {
  let g;
  beforeEach(() => {
    g = new DirectedGraph();
    g.addNode('A');
    g.addNode('B');
    g.addNode('C');
    g.addEdge('A', 'B');
  });

  test('nodes() returns all nodes', () => {
    expect(g.nodes().sort()).toEqual(['A','B','C']);
  });

  test('outEdges() for A returns B', () => {
    expect(g.outEdges('A')).toEqual(['B']);
  });

  test('inEdges() for B returns A', () => {
    expect(g.inEdges('B')).toEqual(['A']);
  });

  test('adding edge between non-existent nodes throws', () => {
    expect(() => g.addEdge('X','Y')).toThrow();
  });
});