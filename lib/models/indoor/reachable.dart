abstract class Reachable implements Comparable<Reachable> {
  List<Reachable> pathTo(Reachable _);

  @override
  int compareTo(Reachable _);
}