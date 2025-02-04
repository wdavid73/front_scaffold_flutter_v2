import 'package:flutter/material.dart';

/// A customizable text form field widget.
///
/// This widget provides a styled text form field with various options for
/// customization, including labels, hints, error messages, icons, password
/// visibility toggling, and more.
class CustomTextFormField extends StatelessWidget {
  /// The label text to display above the text field.
  final String? label;

  /// The hint text to display inside the text field when it's empty.
  final String? hint;

  /// The error message to display below the text field when validation fails.
  final String? errorMessage;

  /// The decoration to apply to the container surrounding the text field.
  final BoxDecoration? decoration;

  /// Whether the text field should obscure the entered text (e.g., for passwords).
  final bool obscureText;

  /// An optional icon to display at the beginning of the text field.
  final Icon? iconPrefix;

  /// Whether the text field is enabled for user interaction.
  final bool enabled;

  /// A list of autofill hints to help the operating system autofill the field.
  final Iterable<String>? autofillHints;

  /// The type of keyboard to display for text input.
  final TextInputType? keyboardType;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// The focus node for the text field.
  final FocusNode? focusNode;

  /// The type of action button to display on the keyboard.
  final TextInputAction? textInputAction;

  /// A callback function that is called when the text field's value changes.
  final Function(String)? onChanged;

  /// A callback function that is called to validate the text field's value.
  final String? Function(String?)? validator;

  /// A callback function that is called when the user submits the text field.
  final Function(String)? onFieldSubmitted;

  /// A callback function that is called to toggle password visibility.
  final void Function()? showPassword;

  /// Creates a [CustomTextFormField].
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.showPassword,
    this.decoration,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.iconPrefix,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.enabled = true,
    this.autofillHints,
  });

  /// Returns true if the text field is a password field.
  bool get isPassword {
    return obscureText == true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        enabled: enabled,
        autofillHints: autofillHints,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          errorText: errorMessage,
          prefixIcon: iconPrefix,
          suffixIcon: isPassword
              ? IconButton(
                  onPressed:
                      showPassword != null ? () => showPassword!() : null,
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : const SizedBox.shrink(),
        ),
        textAlign: TextAlign.start,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
      ),
    );
  }
}