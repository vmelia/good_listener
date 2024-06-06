import 'package:get_it/get_it.dart';

import 'contracts.dart';
import 'view.dart';

export "view/pages/home_page.dart";
export "view/theme/app_theme_impl.dart";
export "view/widgets/text_with_border.dart";

void configureView() {
  GetIt.I.registerSingleton<AppTheme>(AppThemeImpl());
}
