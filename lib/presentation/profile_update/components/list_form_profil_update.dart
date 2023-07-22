import '../../../../../../../domain/core/core.dart';

class ListFormProfilUpdate extends GetView<ProfileUpdateController> {
  const ListFormProfilUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextForm.border(
          controller: controller.namaC,
          titel: 'Nama lengkap',
          color: ColorApp.gray,
          isCheck: true,
        ),
        SizeApp.h12,
        TextForm.border(
          controller: controller.noHpC,
          titel: 'No. HP',
          color: ColorApp.gray,
          isCheck: true,
          isPhone: true,
        ),
        SizeApp.h12,
        TextForm.border(
          onTap: controller.alertJK,
          controller: controller.jkC,
          titel: 'Jenis kelamin',
          color: ColorApp.gray,
          isCheck: true,
          suffixIcon: const Icon(
            Icons.arrow_drop_down_rounded,
            color: ColorApp.gray,
          ),
        ),
        SizeApp.h12,
        TextForm.border(
          onTap: controller.alertStatus,
          controller: controller.statusC,
          titel: 'Status',
          color: ColorApp.gray,
          isCheck: true,
          suffixIcon: const Icon(
            Icons.arrow_drop_down_rounded,
            color: ColorApp.gray,
          ),
        ),
      ],
    );
  }
}
