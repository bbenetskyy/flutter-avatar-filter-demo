import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';
import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';

class FilterBottomSheet<T> extends StatefulWidget {
  final String title;
  final List<T> options;
  final List<T> initialValues;
  final Widget Function(T item) labelBuilder;

  const FilterBottomSheet({
    super.key,
    required this.title,
    required this.options,
    required this.labelBuilder,
    this.initialValues = const [],
  });

  @override
  State<FilterBottomSheet<T>> createState() => _FilterBottomSheetState<T>();

  static Future<List<T>?> show<T>({
    required BuildContext context,
    required String title,
    required List<T> options,
    required Widget Function(T item) labelBuilder,
    List<T> initialValues = const [],
  }) {
    return showModalBottomSheet<List<T>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FilterBottomSheet<T>(
        title: title,
        options: options,
        labelBuilder: labelBuilder,
        initialValues: initialValues,
      ),
    );
  }
}

class _FilterBottomSheetState<T> extends State<FilterBottomSheet<T>> {
  late List<T> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = List.from(widget.initialValues);
  }

  void _onSave() {
    Navigator.of(context).pop(_selectedValues);
  }

  void _onClose() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundPrimary,
            borderRadius: const BorderRadius.all(Radius.circular(AppDimens.radius_28)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_20, vertical: AppDimens.padding_32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _Header(title: widget.title, onClose: _onClose),
                const SizedBox(height: AppDimens.height_12),
                ...widget.options.map(
                  (item) => _FilterOptionTile(
                    title: widget.labelBuilder(item),
                    selected: _selectedValues.contains(item),
                    onTap: () {
                      setState(() {
                        if (_selectedValues.contains(item)) {
                          _selectedValues.remove(item);
                        } else {
                          _selectedValues.add(item);
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: AppDimens.height_24),
                SizedBox(
                  width: double.infinity,
                  height: AppDimens.height_62,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textPrimary,
                      foregroundColor: AppColors.textSecondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.radius_100)),
                    ),
                    child: Text(AppLocalizations.of(context)!.save, style: Style.text16w600SecondaryStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final VoidCallback onClose;

  const _Header({required this.title, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Style.text26w700PrimaryStyle),
        GestureDetector(
          onTap: onClose,
          child: SvgPicture.asset(
            'assets/svg/close.svg',
            width: AppDimens.width_24,
            height: AppDimens.height_24,
            colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}

class _FilterOptionTile extends StatelessWidget {
  final Widget title;
  final bool selected;
  final VoidCallback onTap;

  const _FilterOptionTile({required this.title, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimens.radius_12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.padding_12),
        child: Row(
          children: [
            Expanded(child: title),
            AppCheckbox(selected: selected),
          ],
        ),
      ),
    );
  }
}

class AppCheckbox extends StatelessWidget {
  final bool selected;

  const AppCheckbox({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: AppDimens.width_18,
      height: AppDimens.height_18,
      decoration: BoxDecoration(
        color: selected ? AppColors.textPrimary : AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(AppDimens.radius_5),
        border: Border.all(color: selected ? AppColors.textPrimary : AppColors.borderGrayMid, width: 1.5),
      ),
      child: selected
          ? Center(
              child: SvgPicture.asset(
                'assets/svg/check.svg',
                width: AppDimens.width_12,
                height: AppDimens.height_12,
                colorFilter: const ColorFilter.mode(AppColors.textSecondary, BlendMode.srcIn),
              ),
            )
          : null,
    );
  }
}
