import 'dart:collection';

class BreadthFirstSearch<T> {
  final Map<T, List<T>> graph;
  final T start;
  final T end;

  const BreadthFirstSearch(this.start, this.end, this.graph);

  // returns { node: parent }
  List<T> getShortestPath() {
    final parents = getAllParents();
    final path = findPath(parents);
    return path;
  }

  Map<T, T> getAllParents() {
    final q = Queue<T>();
    final visited = <T>{};

    q.add(start);
    visited.add(start);

    final parents = <T, T>{};

    while (q.isNotEmpty) {
      final node = q.removeFirst();
      final neighbours = graph[node]!;

      for (final neighbour in neighbours) {
        if (!visited.contains(neighbour)) {
          q.addLast(neighbour);
          visited.add(neighbour);
          parents[neighbour] = node;
        }
      }
    }

    return parents;
  }

  List<T> findPath(Map<T, T> parents) {
    final path = <T>[];

    T? node = end;

    while (node != null) {
      path.insert(0, node);
      node = parents[node];
    }

    if (path.isNotEmpty) {
      return path;
    }
    return [];
  }
}