import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class ProductReportScreen extends StatefulWidget {
  const ProductReportScreen({Key? key}) : super(key: key);

  @override
  State<ProductReportScreen> createState() => _ProductReportScreenState();
}

class _ProductReportScreenState extends State<ProductReportScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text (
          '물품 신고하기'
        ),
      ),
      body: Column (
        children: [
          const Padding (
            padding: EdgeInsets.only(top: 40.0),
            child: Text (
              '해당 물품을 신고할려고 하는 이유가 무엇인가요?',
              style: TextStyle (
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row (
            children: [
              Padding (
                padding: const EdgeInsets.only(left: 28.0, top: 50),
                child: MSHCheckbox (
                  size: 40,
                  value: isChecked,
                  colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: Colors.blue,
                  ),
                  style: MSHCheckboxStyle.stroke,
                  onChanged: (selected) {
                    setState(() {
                      isChecked = selected;
                    });
                  },
                ),
              ),

              const Padding (
                padding: EdgeInsets.only(top: 50.0, left: 16.0),
                child: Text (
                  '판매가 금지된 물품인거 같습니다.',
                  style: TextStyle (
                    fontSize: 14.0,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
