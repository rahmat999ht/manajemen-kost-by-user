import '../../core/core.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final void Function()? onTap;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CardIcon(icon: icon),
              SizeApp.w20,
              Text(
                title,
                style: const TextStyle(
                  color: ColorApp.blackText,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: ColorApp.blackText,
          ),
        ],
      ),
    );
  }
}
