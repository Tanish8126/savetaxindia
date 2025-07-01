import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/constants.dart';
import 'components/case_laws/case_laws.dart';
import 'components/income_tax_act/income_tax_act.dart';

class ResourcesScreen extends StatelessWidget {
  static String routeName = '/resouces_screen';
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Resources", style: tsPW(22, FontWeight.bold)),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          backgroundColor: kWhite,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorWeight: 2,
            indicatorColor: kPrimary,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelStyle: tsCommonW(
              16,
              FontWeight.w700,
              const Color(0xFF272727),
            ),
            labelStyle: tsPW(16, FontWeight.w700),
            tabs: const [
              Tab(text: "Income Tax Act"),
              Tab(text: "Case Laws"),
            ],
          ),
        ),
        body: TabBarView(children: [IncomeTaxAct(), CaseLaws()]),
      ),
    );
  }
}
