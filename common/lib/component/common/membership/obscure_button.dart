import 'package:flutter/cupertino.dart';
import 'package:resource/resource_constants.dart';
import 'package:resource/resource_manager.dart';

class ObscureButton extends StatelessWidget {
  final Function() function;
  final bool obscure;

  const ObscureButton(
      {super.key, required this.function, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Resource.icon(obscure ? 'ic_obscure_close' : 'ic_obscure_open',
          width: 24, height: 24),
    );
  }
}
