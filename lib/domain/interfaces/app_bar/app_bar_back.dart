import '/domain/core/core.dart';

PreferredSizeWidget appBarBack(
  String title,
) {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorApp.white,
    title: Text(
      title,
      style: const TextStyle(
        color: ColorApp.blackText,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
