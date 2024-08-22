import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/blocs/issues_bloc.dart';
import 'package:comics/blocs/issues_events.dart';
import 'package:comics/blocs/issues_state.dart';
import 'package:comics/views/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Add a listener to the scroll controller
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        // We're at the bottom, trigger a Bloc event
        context.read<IssuesBloc>().add((IssuesFechEvent()));
      }
    }
  }

  @override
  void dispose() {
    // Dispose of the ScrollController to prevent memory leaks
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IssuesBloc, IssuesState>(
      listener: (context, state) {
        if (state.isLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Dialog(
                backgroundColor: Colors.transparent,
                child: Center(child: CircularProgressIndicator()),
              );
            },
          );
        }
        if (!state.isLoading && Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
        if (state.fetchStatus == IssuesStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to fetch, please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView.separated(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics()
                    .applyTo(const BouncingScrollPhysics()),
                padding: const EdgeInsets.all(18),
                itemBuilder: (context, index) => CachedNetworkImage(
                    placeholder: (context, imageProvider) => const Center(
                        child: AspectRatio(
                            aspectRatio: 4 / 5,
                            child: Center(child: CircularProgressIndicator()))),
                    imageBuilder: (context, imageProvider) => AspectRatio(
                        aspectRatio: 2 / 3,
                        child: GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (contextDetails) {
                            return BlocProvider.value(
                                value: BlocProvider.of<IssuesBloc>(context),
                                child: DetailsPage(id: state.issues[index].id));
                          })),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: imageProvider,
                                )),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[700]!.withOpacity(0.6),
                                ),
                                padding: const EdgeInsets.all(12),
                                width: double.infinity,
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${state.issues[index].volume.name} #${state.issues[index].issueNumber}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      Text(state.issues[index].storeDate ?? '',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    imageUrl: state.issues[index].image.mediumUrl),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
                itemCount: state.issues.length),
          ),
        );
      },
    );
  }
}
