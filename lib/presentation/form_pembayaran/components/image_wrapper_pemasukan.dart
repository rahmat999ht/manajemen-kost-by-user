import '../../../../domain/core/core.dart';
import '../controllers/image_pemasukan.controller.dart';

class WrapperImagePickerPembayaran extends GetView<ImagesPembayaranController>
    with ImageState {
  const WrapperImagePickerPembayaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => imageSuccess(
        state!,
        (index) => controller.removeImage(index),
      ),
      onEmpty: imageEmpty(controller.getImage),
    );
  }
}
