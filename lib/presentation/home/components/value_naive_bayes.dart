import '../../../../../domain/core/core.dart';

class ValueNaiveBayes extends GetView<HomeController> {
  const ValueNaiveBayes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => SizedBox(
        height: 230.0,
        child: CardNaiveBayes(
          naiveBayesModel: state!,
        ),
      ),
      onEmpty: const Center(child: Text("Masih Kosong")),
      onLoading: const SizedBox(height: 230, child: LoadingState()),
      onError: (e) {
        return Center(child: Text("pesan error : $e"));
      },
    );
  }
}
