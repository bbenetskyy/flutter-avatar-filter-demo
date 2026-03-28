import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterBottomSheet<T> extends StatefulWidget {
  final String title;
  final List<T> options;
  final List<T> initialValues;
  final String Function(T item) labelBuilder;

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
    required String Function(T item) labelBuilder,
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
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundPrimary,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _Header(title: widget.title, onClose: _onClose),
                const SizedBox(height: 20),
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
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textPrimary,
                      foregroundColor: AppColors.textSecondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                    ),
                    child: Text('Save', style: Style.text16w600SecondaryStyle),
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
      children: [
        Expanded(child: Text(title, style: Style.text26w700PrimaryStyle)),
        IconButton(onPressed: onClose, icon: const Icon(Icons.close), splashRadius: 20),
      ],
    );
  }
}

class _FilterOptionTile extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _FilterOptionTile({required this.title, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Style.text16w600PrimaryStyle.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
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
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: selected ? AppColors.textPrimary : AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: selected ? AppColors.textPrimary : AppColors.textAdditional, width: 1.5),
      ),
      child: selected
          ? Center(
              child: SvgPicture.asset(
                'assets/svg/check.svg',
                width: 12,
                height: 12,
                colorFilter: const ColorFilter.mode(AppColors.textSecondary, BlendMode.srcIn),
              ),
            )
          : null,
    );
  }
}
