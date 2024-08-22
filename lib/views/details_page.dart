import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/blocs/issues_bloc.dart';
import 'package:comics/blocs/issues_events.dart';
import 'package:comics/blocs/issues_state.dart';
import 'package:comics/components/image_icon_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart' as html_parser;

class DetailsPage extends StatelessWidget {
  final int id;
  const DetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<IssuesBloc>().add(IssuesFechDetailEvent(id: id));
    return BlocBuilder<IssuesBloc, IssuesState>(
      builder: (context, state) {
        return Scaffold(
            extendBody: true,
            body: !state.isLoading && state.issueDetails != null
                ? ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        color: Colors.black,
                        child: Text(
                          '${state.issueDetails?.volume.name} #${state.issueDetails?.issueNumber}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                      CachedNetworkImage(
                          imageUrl: state.issueDetails!.image.mediumUrl),
                      Container(
                        padding: const EdgeInsets.all(18),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                html_parser
                                    .parse(state.issueDetails!.description)
                                    .body!
                                    .text,
                                style: const TextStyle(fontSize: 20)),
                            const Text(
                              'Creators',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const Divider(),
                            GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                children: state.issueDetails!.personCredits
                                    .map((e) => Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ImageIconBuilder(
                                                route: 'person',
                                                code: 4040,
                                                id: e.id),
                                            Expanded(
                                              child: Text(e.name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  )),
                                            ),
                                            Expanded(
                                              child: Text(e.role,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.grey[600])),
                                            )
                                          ],
                                        ))
                                    .toList()),
                            const Text(
                              'Characters',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const Divider(),
                            GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                children: state.issueDetails!.characterCredits
                                    .map((e) => Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ImageIconBuilder(
                                                route: 'character',
                                                code: 4005,
                                                id: e.id),
                                            const SizedBox(width: 10),
                                            Expanded(
                                                child: Text(e.name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 18,
                                                    )))
                                          ],
                                        ))
                                    .toList()),
                            const Text(
                              'Teams',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const Divider(),
                            GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                children: state.issueDetails!.teamCredits
                                    .map((e) => Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ImageIconBuilder(
                                                route: 'team',
                                                code: 4060,
                                                id: e.id),
                                            const SizedBox(width: 10),
                                            Expanded(
                                                child: Text(e.name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    )))
                                          ],
                                        ))
                                    .toList()),
                            const Text(
                              'Locations',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const Divider(),
                            GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                children: state.issueDetails!.locationCredits
                                    .map((e) => Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ImageIconBuilder(
                                                route: 'location',
                                                code: 4020,
                                                id: e.id),
                                            const SizedBox(width: 10),
                                            Expanded(
                                                child: Text(e.name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    )))
                                          ],
                                        ))
                                    .toList()),
                            const Text(
                              'Concepts',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const Divider(),
                            GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                children: state.issueDetails!.conceptCredits
                                    .map((e) => Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ImageIconBuilder(
                                                route: 'concept',
                                                code: 4015,
                                                id: e.id),
                                            const SizedBox(width: 10),
                                            Expanded(
                                                child: Text(e.name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    )))
                                          ],
                                        ))
                                    .toList())
                          ],
                        ),
                      )
                    ],
                  )
                : const SizedBox());
      },
    );
  }
}
