import 'package:flutter/cupertino.dart';
import 'package:resource/resource.dart';

class DpCompanyLogo extends StatelessWidget {
  const DpCompanyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Resource.image('ic_company_logo', width: 88, boxFit: BoxFit.fitWidth);
  }
}
