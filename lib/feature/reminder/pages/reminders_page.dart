import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pill_time/feature/reminder/pages/create_reminder_page.dart';
import 'package:pill_time/feature/reminder/pages/reminder_details_page.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation _animation;
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    _initValues();
    _scrollController.addListener(() {
      bool isTop = _scrollController.position.pixels == 0;
      if (_scrollController.position.atEdge && isTop) {
        _animationController.forward();
        _showFab = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _disposeValues();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) => _scrollListener(notification),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Visibility(
          visible: _showFab,
          child: ScaleTransition(
            scale: _animation,
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _navigateToCreate(),
            ),
          ),
        ),
        body: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.lightGreen[300],
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        "Hi, Walter!",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightGreen[800],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Text(
                        "We remember\nyour meds for you",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reminders",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) {
                  return Container(
                    height: 120,
                    width: 200,
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 0,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                      BoxShadow(
                        color: Colors.grey[100]!,
                        blurRadius: 32,
                        spreadRadius: 0,
                        offset: const Offset(0, 16),
                      ),
                    ]),
                    child: Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _navigateToDetails(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 28),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Flexible(
                                    child: Text(
                                      "Medicine",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Description",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Text(
                                "08:00",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToDetails() {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ReminderDetailsPage();
        },
      ),
    );
  }

  Future<void> _navigateToCreate() {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const CreateReminderPage();
        },
      ),
    );
  }

  bool _scrollListener(UserScrollNotification scroll) {
    if (scroll.direction == ScrollDirection.reverse && _showFab) {
      _animationController.reverse();
      _showFab = false;
    } else if (scroll.direction == ScrollDirection.forward && !_showFab) {
      _animationController.forward();
      _showFab = true;
    }

    return true;
  }

  void _initValues() {
    _showFab = true;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn);
  }

  void _disposeValues() {
    _animation.dispose();
    _animationController.dispose();
  }
}
