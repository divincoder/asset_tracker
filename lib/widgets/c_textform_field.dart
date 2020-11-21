import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helper_widgets/string_utils/string_utils.dart';
import 'package:spending_tracker/app_colors.dart';

class CTextFormField extends StatelessWidget {
  CTextFormField(
      {this.hintText,
      this.labelText,
      this.initialValue,
      this.controller,
      this.onSaved,
      this.validator,
      this.obscureText = false,
      this.autoValidate = false,
      this.isLastTextField = false,
      this.onChanged,
      this.maxLength,
      this.textAlign = TextAlign.left,
      this.inputFormatters,
      this.keyboardType,
      this.multiLine = false,
      this.enabled = true,
      this.minLines = 5,
      this.trailingIcon,
      this.onTap});

  final List<TextInputFormatter> inputFormatters;
  final int minLines;
  final int maxLength;
  final bool multiLine;
  final bool isLastTextField;
  final bool obscureText;
  final bool autoValidate;
  final bool enabled;
  final String initialValue;
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final Function(String) onSaved;
  final Function(String) validator;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final Function() onTap;
  final TextAlign textAlign;
  final Widget trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
            visible: StringUtils.isNotEmpty(labelText),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('$labelText', style: TextStyle(fontSize: 13, fontFamily: 'TitilliumWeb')),
            )),
        SizedBox(
//          height: !multiLine ? 58.0 : null,
//          decoration: BoxDecoration(
//              color: Pallet.textFieldLightGrey, borderRadius: BorderRadius.circular(4)),
//          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            enabled: enabled,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            obscureText: obscureText,
            onTap: onTap,
            initialValue: initialValue,
            controller: controller,
            autovalidate: autoValidate,
            validator: validator,
            onSaved: onSaved,
            onChanged: onChanged,
            keyboardType: keyboardType,
            textAlign: textAlign,
            minLines: multiLine ? minLines : 1,
            maxLines: multiLine ? minLines * 2 : 1,
            textInputAction:
                isLastTextField ? TextInputAction.done : TextInputAction.next,
            onFieldSubmitted: (_) =>
                isLastTextField ? null : FocusScope.of(context).nextFocus(),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  )),
              suffixIcon: trailingIcon,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.primary)),
            ),
          ),
        ),
      ],
    );
  }
}

class CDropdownField extends StatelessWidget {
  CDropdownField(
      {this.hintText, this.labelText, this.items, this.onChanged, this.value});

  String hintText;
  String labelText;
  List<DropdownItemDTO> items;
  String value;
  Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    print("value => $value");

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
            visible: StringUtils.isNotEmpty(labelText),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('$labelText', style: TextStyle(fontSize: 13)),
            )),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primary)),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: DropdownButton<String>(
            underline: SizedBox(),
            isExpanded: true,
            value: value,
            hint: Text(hintText),
            // selectedItemBuilder: ,
            items: items
                .map((e) => DropdownMenuItem<String>(
                      child: Text(e.title),
                      value: e.id,
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}

class DropdownItemDTO<T> {
  T value;
  String title;
  String id;

  DropdownItemDTO(this.value, this.title);
}
