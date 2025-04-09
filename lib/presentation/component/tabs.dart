import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class Tabs extends StatelessWidget {
  final List<String> lables;
  final int selectIndex;
  final void Function(int) onValueChange;

  const Tabs({
    super.key,
    required this.lables,
    required this.selectIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorStyle.white),
      height: 58,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            lables.map((lable) {
              final int lableIndex = lables.indexOf(lable);
              return GestureDetector(
                onTap: () {
                  onValueChange(lableIndex);
                },
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 700),
                  width: 375 / lables.length,
                  height: 33,
                  decoration: BoxDecoration(
                    color:
                        lableIndex == selectIndex
                            ? ColorStyle.primary100
                            : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      lable,
                      style:
                          lableIndex == selectIndex
                              ? AppTextStyles.smallBold(color: ColorStyle.white)
                              : AppTextStyles.smallBold(
                                color: ColorStyle.primary80,
                              ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
