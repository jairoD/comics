import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/models/response_model.dart';
import 'package:comics/repositories/issues_repository.dart';
import 'package:flutter/material.dart';

class ImageIconBuilder extends StatelessWidget {
  final String route;
  final int code;
  final int id;
  const ImageIconBuilder(
      {super.key, required this.route, required this.code, required this.id});

  Future<ResponseModel?> fetchIssueImages() async {
    // Simulate a network delay
    IssuesRepository issuesRepository = IssuesRepository();
    return issuesRepository.getExtraData(route, code, id);

    // Replace with your API ca
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchIssueImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Colors.white);
          }
          return CachedNetworkImage(
              placeholder: (context, url) => const SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              errorWidget: (context, url, error) => Center(
                    child: Icon(Icons.error),
                  ),
              imageUrl: snapshot.data!.data['results']['image']['icon_url'],
              imageBuilder: (context, imageProvider) => Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider))));
        });
  }
}
