import 'package:flutter/material.dart';
import 'package:mister_jobby/widgets/jobs_screen_widgets/complete_item_widget.dart';

import '../../../widgets/jobs_screen_widgets/no_data_found_widget.dart';

class CompletedTab extends StatelessWidget {
  const CompletedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = 2;
    return length < 1
        ? const NoDataFoundWidget()
        : ListView.builder(
            itemCount: length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => const CompleteItemWidget(),
          );
  }
}
