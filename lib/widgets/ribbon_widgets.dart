part of '../web_ui_commons.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                  margin: const EdgeInsets.only(left: appPadding),
                  padding: const EdgeInsets.symmetric(
                    horizontal: appPadding,
                    vertical: appPadding / 2,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/refresh.svg",
                        height: 16,
                        width: 16,
                        color: color1,
                      ),
                      // if (!ResponsiveWidget.isMobile(context))
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: appPadding / 2),
                          child: Text(
                            'Refresh',
                            style: TextStyle(
                              color: color1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                    ],
                  ),
                );
  }
}


class PrintWidget extends StatelessWidget {
  const PrintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: const EdgeInsets.only(left: appPadding),
                    padding: const EdgeInsets.symmetric(
                      horizontal: appPadding,
                      vertical: appPadding / 2,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/printer.svg",
                          height: 16,
                          width: 16,
                          color: color1,
                        ),
                        // if (!ResponsiveWidget.isMobile(context))
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: appPadding / 2),
                            child: Text(
                              'Print',
                              style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                      ],
                    ),
                  );
  }
}

class ExportWidget extends StatelessWidget {
  const ExportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: appPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/export.svg",
            height: 16,
            width: 16,
            color: color1,
          ),
          // if (!ResponsiveWidget.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: appPadding / 2),
              child: Text(
                'Export',
                style: TextStyle(
                  color: color1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
        ],
      ),
    );
  }
}
