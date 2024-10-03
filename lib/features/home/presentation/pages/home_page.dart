import 'package:flutter/material.dart';
import 'package:netflix_app/core/configs/assets/app_images.dart';
import 'package:netflix_app/features/movies/presentation/widgets/movies_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTabBar(),
            _buildTrendingSection(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: Image.asset(AppImages.smallLogo),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      dividerHeight: 0,
      indicatorColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      labelColor: const Color(0xffF5F5F5),
      unselectedLabelColor: const Color(0xff818385),
      padding: const EdgeInsets.symmetric(vertical: 20),
      tabs: [
        _buildTabItem('Films'),
        _buildTabItem('Séries'),
      ],
    );
  }

  Widget _buildTabItem(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff818385)),
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('Tendances actuelles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        MovieSection(), // ! This is the movie section widget
      ],
    );
  }
}
