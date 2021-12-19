abstract class Query<Model> {
  Future<Model> read();
  Future insert(Model model);
  Future clear();
}
