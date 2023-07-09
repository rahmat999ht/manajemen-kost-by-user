import '../../../domain/core/core.dart';

class Fab extends GetView<DashboardController> {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.toPenbayaran,
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.orange,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 50.0,
        width: 50.0,
        padding: const EdgeInsets.all(10),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          child: SvgPicture.asset(
            Assets.pengeluaran,
            // size: 60,
          ),
        ),
      ),
    );
  }
}
