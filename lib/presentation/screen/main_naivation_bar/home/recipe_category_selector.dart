import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';

class RecipeCategorySelector extends StatelessWidget {
  final Function(Category category) onCategorySelected; // 카테고리 선택 콜백
  final Category selectedCategory; // 현재 선택된 카테고리

  const RecipeCategorySelector({
    super.key,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // 수평 스크롤 활성화
      child: Row(
        mainAxisSize: MainAxisSize.min, // 콘텐츠 크기에 맞게 Row 크기 조정
        children:
            Category.values.asMap().entries.map((entry) {
              final int index = entry.key; // 현재 index
              final Category category = entry.value; // 현재 카테고리
              return Padding(
                // 첫 번째 아이템일 경우 좌측에 30의 여백 추가
                padding: EdgeInsets.only(
                  left: index == 0 ? 30 : 0, // 첫 번째 아이템만 좌측 여백
                  right: 10, // 기본 간격
                ),
                child: GestureDetector(
                  onTap: () {
                    onCategorySelected(category); // 선택된 카테고리를 부모로 전달
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20, // 버튼 내부 간격 (너비)
                      vertical: 7, // 버튼 내부 간격 (높이)
                    ),
                    decoration: BoxDecoration(
                      color:
                          selectedCategory == category
                              ? ColorStyle.primary100
                              : Colors.white, // 선택된 카테고리 배경색
                      borderRadius: BorderRadius.circular(10), // 둥근 테두리
                      border: Border.all(
                        color:
                            selectedCategory == category
                                ? ColorStyle
                                    .primary100 // 활성화된 버튼 테두리
                                : Colors.transparent, // 비활성화 테두리
                        width: 1.5, // 테두리 두께
                      ),
                    ),
                    child: Text(
                      category.name[0].toUpperCase() +
                          category.name.substring(1), // 카테고리 이름
                      style: AppTextStyles.smallBold(
                        color:
                            selectedCategory == category
                                ? Colors
                                    .white // 활성화 텍스트 색상
                                : ColorStyle.primary100, // 기본 텍스트 색상
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
