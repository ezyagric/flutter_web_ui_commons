part of '../web_ui_commons.dart';

class AppModal extends StatelessWidget {
  final String? title;
  final Widget body;
  final List<Widget>? actions;
  final double? width;
  final double? height;
  final VoidCallback? onClose;

  const AppModal({
    Key? key,
    this.title,
    required this.body,
    this.actions,
    this.width=570,
    this.height,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        height: height,
      
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            if (title != null)
              Padding(padding:const  EdgeInsets.symmetric(horizontal:24, vertical:16), child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text:title??"Modal Title",
                    fontSize: AppDimens.h3,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      if (onClose != null) {
                        onClose!();
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),),
           

            // Body
            Flexible(child:
              SingleChildScrollView(
                
                child: Container(color: AppColors.light, padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),  child: body,
                ),
              ),
            ),

            // Footer
            if (actions != null) ...[
             
             Padding(padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,))
            ],
          ],
        ),
      ),
    );
  }
}
  
