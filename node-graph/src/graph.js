class DirectedGraph {
  constructor() {
    this._nodes = new Set();
    this._edges = new Map(); // key: from, value: Set of to
  }

  addNode(id) {
    this._nodes.add(id);
    if (!this._edges.has(id)) this._edges.set(id, new Set());
  }

  addEdge(from, to) {
    if (!this._nodes.has(from) || !this._nodes.has(to)) {
      throw new Error('Both nodes must exist before adding an edge');
    }
    this._edges.get(from).add(to);
  }

  nodes() {
    return Array.from(this._nodes);
  }

  outEdges(node) {
    return this._edges.has(node)
      ? Array.from(this._edges.get(node))
      : [];
  }

  inEdges(node) {
    return Array.from(this._nodes).filter(n =>
      this._edges.get(n).has(node)
    );
  }
}

module.exports = DirectedGraph;