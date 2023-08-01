import '../../domain/core/core.dart';

class ProfileUpdateScreen extends GetView<ProfileUpdateController> {
  const ProfileUpdateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ImageProfileUpdateController>(
      () => ImageProfileUpdateController(),
    );
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBatal('Edit profil', Get.back),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizeApp.h36,
                  WrapperImageUpdateProfil(
                    image: controller.penghuniModel.image,
                  ),
                  SizeApp.h36,
                  const ListFormProfilUpdate(),
                  SizeApp.h50,
                  Obx(
                    () => ButtonPrymary.isBlack(
                      isLoading: controller.isLoading.value,
                      text: 'Simpan',
                      onPressed: controller.updateProfil,
                    ),
                  ),
                  SizeApp.h30,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
