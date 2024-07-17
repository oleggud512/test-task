import 'dart:collection';

class BredthFirstSearch<T> {
  final Map<T, List<T>> graph;
  final T start;
  final T end;

  const BredthFirstSearch(this.start, this.end, this.graph);

  // returns { node: parent }
  List<T> getShortestPath() {
    final parents = getAllParents();
    final path = findPath(parents);
    return path;
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

  Map<T, T> getAllParents() {
    final q = Queue<T>();
    final visited = <T>{};

    q.add(start);
    visited.add(start);

    final parents = <T, T>{};

    while (q.isNotEmpty) {
      final node = q.removeLast();
      final neighbours = graph[node]!;

      for (final neighbour in neighbours) {
        if (!visited.contains(neighbour)) {
          q.add(neighbour);
          visited.add(neighbour);
          parents[neighbour] = node;
        }
      }
    }

    return parents;
  }
}