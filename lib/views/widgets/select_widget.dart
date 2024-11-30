import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:salfa_game/core/extensions/assetss_widgets.dart';
import 'package:salfa_game/core/utilities/app_color.dart';
import 'package:salfa_game/views/widgets/main_text.dart';
import 'package:salfa_game/views/widgets/main_textfield.dart';

class SelectWidget<T> extends StatefulWidget {
  const SelectWidget({
    super.key,
    required this.items,
    this.currentValue,
    this.title,
    this.hint,
    this.validatorText,
    this.onChanged,
    this.valueToStringFunc,
    this.icon,
    this.validator,
    this.fillColor,
    this.contentPadding,
    this.nullFirstValue,
    this.height,
    this.isSearchable = false,
    this.searchMatchFn,
  });
  final T? currentValue;
  final String? title;
  final String? hint;
  final String? validatorText;
  final void Function(T? value)? onChanged;
  final String? Function(T? value)? valueToStringFunc;
  final List<T> items;
  final Widget? icon;
  final String? Function(T?)? validator;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final bool isSearchable;
  final String? nullFirstValue;
  final bool Function(DropdownMenuItem<T> item, String searchValue)?
      searchMatchFn;

  @override
  State<SelectWidget<T>> createState() => _SelectWidgetState<T>();
}

class _SelectWidgetState<T> extends State<SelectWidget<T>> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color color = widget.currentValue == null ? Colors.black26 : Colors.black87;
    String? Function(T?)? valueToString =
        widget.valueToStringFunc ?? (v) => v?.toString();
    if (widget.nullFirstValue != null) {
      widget.items.insertAll(0, [widget.nullFirstValue! as T]);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((widget.title ?? '').isNotEmpty) ...{
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 4,
              right: 8,
            ),
            child: MainText.title(
              widget.title ?? '',
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          2.hSize,
        },
        SizedBox(
          height: widget.height,
          child: DropdownButtonFormField2<T>(
            isExpanded: true,
            value: widget.currentValue,
            decoration: InputDecoration(
              fillColor: AppColors.buttonColor,
              filled: true,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.buttonColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            hint: MainText(
              widget.hint ?? widget.title ?? '',
              color: color,
              maxLines: 1,
            ),
            items: widget.items.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: SizedBox(
                  child: MainText(
                    valueToString.call(value) ?? '',
                    fontSize: 11,
                    color: value == widget.currentValue
                        ? Colors.black87
                        : Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }).toList(),
            validator: widget.validator,
            onChanged: widget.onChanged,
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down_outlined,
                color: widget.items.isEmpty
                    ? Colors.grey
                    : Colors.black.withOpacity(0.8),
              ),
              iconSize: 22,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              offset: const Offset(0, -2),
              elevation: 1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            // Search
            dropdownSearchData: widget.isSearchable
                ? DropdownSearchData(
                    searchController: search,
                    searchInnerWidgetHeight: 35,
                    searchInnerWidget: Container(
                      padding: 8.aEdge,
                      child: MainTextField(
                        maxLines: 1,
                        hint: 'بحث',
                        contentPadding: 6.aEdge + 6.hEdge,
                        controller: search,
                      ),
                    ),
                    searchMatchFn: widget.searchMatchFn ??
                        (item, searchValue) {
                          return item.value
                              .toString()
                              .toLowerCase()
                              .contains(searchValue.toLowerCase());
                        },
                  )
                : null,
            onMenuStateChange: widget.isSearchable
                ? (isOpen) {
                    if (!isOpen) {
                      search.clear();
                    }
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
