library web_ui_commons;

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


/**
 * theme
 */
part 'theme.dart';
/** helper functions */
part 'utils.dart';


part 'constants/color.dart';
part 'constants/dimens.dart';
part 'constants/typography.dart';

/** widgets */
part 'widgets/forms/button.dart';
part 'widgets/forms/file_input.dart';
part 'widgets/forms/select.dart';
part 'widgets/forms/datepicker.dart';

part 'widgets/container.dart';
part 'widgets/text.dart';
part 'widgets/link.dart';

/**components */
part 'components/shadow.dart';
part 'components/modal.dart';
part 'components/alert.dart';
part 'components/dialog.dart';
part 'components/progress_dialog.dart';
part 'components/empty_message.dart';
