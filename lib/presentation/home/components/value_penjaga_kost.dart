import '../../../../../domain/core/core.dart';

class ValuePenjagaKost extends StatelessWidget {
  const ValuePenjagaKost({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final PenjagaKostController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeApp.h20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorApp.blackText,
              fontSize: 18,
            ),
          ),
        ),
        controller.obx(
          (state) => CardPenjagaKost(adminModel: state),
          onEmpty: const Center(child: Text("Masih Kosong")),
          onLoading: const SizedBox(height: 130, child: LoadingState()),
          onError: (e) {
            return Center(child: Text("pesan error : $e"));
          },
        )
      ],
    );
  }
}
