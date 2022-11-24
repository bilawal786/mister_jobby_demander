import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../helpers/routes.dart';
import '../../models/jobs_models/job_reservations_model.dart';
import '../../providers/jobs_provider/rating_reviews_provider.dart';
import '../../widgets/const_widgets/custom_button.dart';

class RatingReviewsScreen extends StatelessWidget {
  final JobReservationsModel? reservation;
  const RatingReviewsScreen({Key? key, required this.reservation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Give Reviews",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width / 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "${MyRoutes.IMAGEURL}${reservation!.jobberProfile.image}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 25,
                ),
                Text(
                  "How was Client performance?",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<RatingProvider>(
                  builder: (_,rating,child) => RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {
                      rating.getRating(value);
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "Please select a rating",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Give Reviews",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Consumer<RatingProvider>(
                      builder: (_,rating,child) => TextField(
                        decoration: const InputDecoration(
                          hintText: 'Aa...',
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          rating.getMessage(value);
                        },
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                Consumer<RatingProvider>(
                  builder: (_,rating,child) => CustomButton(onPress: () {
                    FocusScope.of(context).unfocus();
                    rating.postRating(context, rating.ratingValue, rating.message, reservation!.job.id.toString());
                  }, buttonName: "Confirm"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
