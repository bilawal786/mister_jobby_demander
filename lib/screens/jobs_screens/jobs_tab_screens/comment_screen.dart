import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/jobs_screen_widgets/comment_input_widget.dart';
import '../../../widgets/jobs_screen_widgets/comments_item_widget.dart';
import '../../../providers/jobs_provider/single_job_comments_provider.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  var isInit = true;
  String? jobId;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    jobId = routeArgs['jobId'];
    if (isInit) {
      Provider.of<SingleJobCommentsProvider>(context)
          .getSingleJobComments(context, jobId);
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 25,
        ),
        title: Text(
          "Comments",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<SingleJobCommentsProvider>(
              builder: (_, commentsData, child) =>
                  (commentsData.singleJobComments != null)
                      ? commentsData.singleJobComments!.isEmpty ? Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 100,
                      ),
                      Icon(
                        Icons.find_in_page_rounded,
                        size: 150,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "No_Comments",
                        style: Theme.of(context).textTheme.titleSmall,
                      ).tr(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                    ],
                  ) :ListView.builder(
                          itemCount: commentsData.singleJobComments!.length,
                          itemBuilder: (ctx, index) => ChangeNotifierProvider.value (
                            value: commentsData.singleJobComments![index],
                            child: const CommentsItemWidget(),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
            ),
          ),
          CommentInputWidget(jobId: int.parse(jobId!)),
        ],
      ),
    );
  }
}
