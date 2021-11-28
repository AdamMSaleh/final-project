import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';

class SimpleFiled extends StatelessWidget {
  const SimpleFiled(
      {Key? key,
      TextEditingController? controller,
      String? initValue,
      TextInputType? keyboardType,
      bool? isObscureText,
      void Function(String)? onChanged,
      String? Function(String?)? onValidator,
      void Function(String?)? onSaved,
      String? hint,
      Widget? pIcon,
      Widget? sIcon,
      void Function()? onSIcon})
      : _initValue = initValue,
        _keyboardType = keyboardType,
        _isObscureText = isObscureText,
        _onChanged = onChanged,
        _onValidator = onValidator,
        _onSaved = onSaved,
        _hint = hint,
        _pIcon = pIcon,
        _sIcon = sIcon,
        _onSIcon = onSIcon,
        _controler = controller,
        super(key: key);

  final String? _initValue;
  final TextInputType? _keyboardType;
  final bool? _isObscureText;
  final void Function(String)? _onChanged;
  final String? Function(String?)? _onValidator;
  // decoration
  final String? _hint;
  final Widget? _pIcon;
  final Widget? _sIcon;
  final void Function()? _onSIcon;
  final void Function(String?)? _onSaved;
  final TextEditingController? _controler;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controler,
      initialValue: _initValue,
      cursorColor: AppColors.blue,
      keyboardType: _keyboardType,
      obscureText: _isObscureText ?? false,
      onChanged: _onChanged,
      validator: _onValidator,
      onSaved: _onSaved,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: _hint?.tr(),
        prefixIcon: _pIcon,
        suffixIcon: _sIcon != null
            ? InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: _onSIcon,
                child: _sIcon,
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
        //*Border normal
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: AppColors.blue, width: 2),
        ),
        //* focuse border normal
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: AppColors.blue, width: 3),
        ),
        //*border error
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: AppColors.red,
            width: 2,
          ),
        ),
        //*focuse border error
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: AppColors.red, width: 3),
        ),
      ),
    );
  }
}
