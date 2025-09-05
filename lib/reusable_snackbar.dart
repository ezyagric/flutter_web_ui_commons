part of "web_ui_commons.dart";



enum SnackbarType { success, info, error, warning }

class ReusableSnackbar {
  static void show({
    required String title,
    required String message,
    required SnackbarType type,
    Duration? duration,
  }) {
    if (kIsWeb) {
      _showWebSnackbar(title, message, type, duration);
    } else {
      _showMobileSnackbar(title, message, type, duration);
    }
  }

  static void _showWebSnackbar(
    String title,
    String message,
    SnackbarType type,
    Duration? duration,
  ) {
    Get.rawSnackbar(
      title: null,
      message: null,
      backgroundColor: Colors.transparent,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      duration: duration ?? _getDefaultDuration(type),
      overlayBlur: 0,
      snackStyle: SnackStyle.FLOATING,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.fastOutSlowIn,
      animationDuration: const Duration(milliseconds: 500),
      messageText: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.only(right: 20, bottom: 20),
          width: 350,
          constraints: const BoxConstraints(minHeight: 70),
          decoration: BoxDecoration(
            color: _getBackgroundColor(type),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: _getShadowColor(type),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Left accent bar
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: _getAccentColor(type),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 50, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: _getAccentColor(type).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: _getIcon(type),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (message.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 42),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: 0.1,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Close button
              Positioned(
                right: 8,
                top: 8,
                child: InkWell(
                  onTap: () => Get.back(),
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.white.withOpacity(0.8),
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _showMobileSnackbar(
    String title,
    String message,
    SnackbarType type,
    Duration? duration,
  ) {
    Get.snackbar(
      '',
      '',
      titleText: _buildTitle(title, type),
      messageText: _buildMessage(message, type),
      backgroundColor: _getBackgroundColor(type),
      borderRadius: 12,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      duration: duration ?? _getDefaultDuration(type),
      isDismissible: true,
      dismissDirection: DismissDirection.endToStart,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.fastOutSlowIn,
      animationDuration: const Duration(milliseconds: 500),
      snackPosition: SnackPosition.BOTTOM,
      boxShadows: [
        BoxShadow(
          color: _getShadowColor(type),
          blurRadius: 20,
          spreadRadius: 0,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          spreadRadius: 0,
          offset: const Offset(0, 2),
        ),
      ],
      overlayBlur: 0,
      snackStyle: SnackStyle.FLOATING,
      mainButton: TextButton(
        onPressed: () => Get.back(),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(8),
          minimumSize: const Size(32, 32),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Icon(
          Icons.close_rounded,
          color: Colors.white.withOpacity(0.8),
          size: 16,
        ),
      ),
      leftBarIndicatorColor: _getAccentColor(type),
    );
  }

  static Widget _buildTitle(String title, SnackbarType type) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: _getAccentColor(type).withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: _getIcon(type),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  static Widget _buildMessage(String message, SnackbarType type) {
    if (message.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(left: 42, top: 4),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.3,
          letterSpacing: 0.1,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Duration _getDefaultDuration(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return const Duration(seconds: 3);
      case SnackbarType.info:
        return const Duration(seconds: 4);
      case SnackbarType.error:
        return const Duration(seconds: 6);
      case SnackbarType.warning:
        return const Duration(seconds: 5);
    }
  }

  static void success({
    required String title,
    required String message,
    Duration? duration,
  }) {
    show(
      title: title,
      message: message,
      type: SnackbarType.success,
      duration: duration,
    );
  }

  static void info({
    required String title,
    required String message,
    Duration? duration,
  }) {
    show(
      title: title,
      message: message,
      type: SnackbarType.info,
      duration: duration,
    );
  }

  static void error({
    required String title,
    required String message,
    Duration? duration,
  }) {
    show(
      title: title,
      message: message,
      type: SnackbarType.error,
      duration: duration,
    );
  }

  static void warning({
    required String title,
    required String message,
    Duration? duration,
  }) {
    show(
      title: title,
      message: message,
      type: SnackbarType.warning,
      duration: duration,
    );
  }

  static Color _getBackgroundColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return const Color(0xFF0F766E); // Modern teal
      case SnackbarType.info:
        return const Color(0xFF1E40AF); // Modern blue
      case SnackbarType.error:
        return const Color(0xFFDC2626); // Modern red
      case SnackbarType.warning:
        return const Color(0xFFEA580C); // Modern orange
    }
  }

  static Color _getAccentColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return const Color(0xFF10B981); // Bright teal
      case SnackbarType.info:
        return const Color(0xFF3B82F6); // Bright blue
      case SnackbarType.error:
        return const Color(0xFFEF4444); // Bright red
      case SnackbarType.warning:
        return const Color(0xFFF59E0B); // Bright amber
    }
  }

  static Color _getShadowColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return const Color(0xFF0F766E).withOpacity(0.3);
      case SnackbarType.info:
        return const Color(0xFF1E40AF).withOpacity(0.3);
      case SnackbarType.error:
        return const Color(0xFFDC2626).withOpacity(0.3);
      case SnackbarType.warning:
        return const Color(0xFFEA580C).withOpacity(0.3);
    }
  }

  static Widget _getIcon(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return Icon(
          Icons.check_circle_rounded,
          color: _getAccentColor(type),
          size: 18,
        );
      case SnackbarType.info:
        return Icon(
          Icons.info_rounded,
          color: _getAccentColor(type),
          size: 18,
        );
      case SnackbarType.error:
        return Icon(
          Icons.cancel_rounded,
          color: _getAccentColor(type),
          size: 18,
        );
      case SnackbarType.warning:
        return Icon(
          Icons.warning_rounded,
          color: _getAccentColor(type),
          size: 18,
        );
    }
  }
}
