import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../home.dart';

class CompanyWidget extends StatelessWidget {
  final CompanyEntity company;
  final VoidCallback onTap;
  const CompanyWidget({super.key, required this.company, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(8);

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 5),
            color: Colors.black.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: radius),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        leading: Image.asset(CustomAssets.companyIcon),
        title: Text(
          company.name,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
