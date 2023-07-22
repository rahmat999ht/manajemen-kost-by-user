import '../../domain/core/core.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<PenghuniModel>>(
        stream: controller.methodApp.penghuni(ConstansApp.idLogin).snapshots(),
        builder: (context, s) {
          if (s.hasData) {
            final data = s.data?.data();
            return StreamProfile(
              penghuniModel: data,
              c: controller,
            );
          }
          return StreamProfile.nullValue(
            c: controller,
          );
        },
      ),
    );
  }
}

class StreamProfile extends StatelessWidget {
  const StreamProfile({
    super.key,
    required this.penghuniModel,
    required this.c,
  }) : isStream = true;

  const StreamProfile.nullValue({
    super.key,
    required this.c,
  })  : isStream = false,
        penghuniModel = null;

  final PenghuniModel? penghuniModel;
  final bool isStream;
  final ProfileController c;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizeApp.h60,
              isStream
                  ? HeaderProfile(
                      foto: penghuniModel?.image,
                      nama: penghuniModel?.nama,
                      status: penghuniModel?.status,
                    )
                  : const SizedBox(
                      height: 167,
                      width: 167,
                      child: LoadingState(),
                    ),
              SizeApp.h30,
              const Divider(
                height: 10,
                thickness: 1.5,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: c.listItem.length,
                itemBuilder: (context, index) {
                  List<void Function()> listTapItem = [
                    () {
                      c.toPersonalDetails(penghuniModel!);
                    },
                    c.toPembayaran,
                  ];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CardProfile(
                        onTap: listTapItem[index],
                        title: c.listItem[index],
                        icon: c.listAssetsItem[index],
                      ),
                      SizeApp.h20,
                    ],
                  );
                },
              ),
              SizeApp.h10,
              const Divider(
                height: 10,
                thickness: 1.5,
              ),
            ],
          ),
          Column(
            children: [
              CardProfile(
                onTap: c.toTentangApp,
                title: 'Tentang',
                icon: Assets.tentang,
              ),
              SizeApp.h20,
              ButtonPrymary(
                onPressed: c.alertLogOut,
                text: 'Log-out',
              ),
              SizeApp.h16,
            ],
          ),
        ],
      ),
    );
  }
}
