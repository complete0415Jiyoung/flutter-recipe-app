import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/buttons/buttons.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class ShareDialog extends StatefulWidget {
  final String url;
  final void Function(String) onClick;

  const ShareDialog({super.key, required this.url, required this.onClick});

  @override
  State<ShareDialog> createState() => _ShareDialogState();
}

class _ShareDialogState extends State<ShareDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ColorStyle.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Recipe Link', style: AppTextStyles.mediumBold()),
            const SizedBox(height: 8),
            Text(
              'Copy recipe link and share your recipe link with friends and family.',
              style: AppTextStyles.smallRegular().copyWith(
                color: ColorStyle.gray4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: ColorStyle.gray4,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.url,
                      style: AppTextStyles.smallRegular().copyWith(
                        color: ColorStyle.gray4,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Buttons(
                    text: 'Copy Link',
                    size: ButtonSize.small,
                    onPressed: () {
                      // Clipboard.setData(ClipboardData(text: url));
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('링크가 복사되었습니다!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
