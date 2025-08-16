import 'package:flutter/material.dart';

class AppDropdownMenu extends StatelessWidget {
  const AppDropdownMenu({
    super.key,
    required this.controller,
    required this.hintText,
    required this.dropdownMenuEntry,
    this.onSelected,
    this.leadingIcon
  });
  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntry;
  final TextEditingController controller;
  final String hintText;
  final void Function(dynamic)? onSelected;
  final Widget? leadingIcon;


  @override
  Widget build(BuildContext context) {
    return DropdownMenu(

  
      leadingIcon: leadingIcon,
      onSelected: onSelected,
      menuHeight: 200,
      hintText: hintText,
      width: 370,
      controller: controller,
      enableSearch: true,
      requestFocusOnTap: true,
      enableFilter: true,
      dropdownMenuEntries: dropdownMenuEntry,
    );
  }
}
