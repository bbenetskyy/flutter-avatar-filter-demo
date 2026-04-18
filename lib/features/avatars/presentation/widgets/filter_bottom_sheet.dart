import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_checkbox.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.spaceL),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.backgroundPrimary,
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.radiusL)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.sheetPadH, vertical: AppDimens.sheetPadV),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _Header(title: widget.title, onClose: _onClose),
                const SizedBox(height: AppDimens.spaceM),
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
                const SizedBox(height: AppDimens.spaceXL),
                SizedBox(
                  width: double.infinity,
                  height: AppDimens.buttonHeight,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textPrimary,
                      foregroundColor: AppColors.textSecondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.radiusFull)),
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
            width: AppDimens.iconSize,
            height: AppDimens.iconSize,
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
      borderRadius: BorderRadius.circular(AppDimens.radiusM),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.spaceM),
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
