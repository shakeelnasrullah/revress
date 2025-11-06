import 'package:flutter/material.dart';
import 'package:revress/inspection/new_appointment_screen.dart';

import '../../inspection/user_detail/dummy_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _scrollController = ScrollController();
  final double _appBarExpandedHeight = 250.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    setState(() {}); // Trigger rebuild for animations
  }

  final Gradient blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF3A3A3A), // Orange
      Color(0xFF1D1D1D), // Light Orange
    ],
  );

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery
        .of(context)
        .platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: _appBarExpandedHeight,
            floating: true,
            pinned: true,
            snap: false,
            stretch: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double visibleHeight = constraints.maxHeight;
                final double collapseFraction = 1 -
                    (visibleHeight / _appBarExpandedHeight);
                final double opacity = 1 - collapseFraction.clamp(0.0, 1.0);

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image
                    _buildBackgroundImage(),

                    // Gradient overlay for better text visibility
                    _buildGradientOverlay(),

                    // Main content that disappears when scrolling
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 60,
                      // Space for the toolbar at bottom
                      child: Opacity(
                        opacity: opacity,
                        child: _buildAppBarContent(),
                      ),
                    ),

                    // Search toolbar that stays at bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: customToolBar(),
                    ),
                  ],
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,
                int index,) {
              return _buildCustomCardItem(index, isDarkMode);
            }, childCount: 50),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      'assets/images/top_content_bg.png',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
          Container(color: Colors.blue[100]),
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withAlpha((255 * 0.5).round()),
            Colors.transparent,
            Colors.white.withAlpha((255 * 0.3).round()),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }

  Widget _buildAppBarContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // User profile and stats
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://picsum.photos/100?portrait'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sarah Johnson',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '@sarah',
                      style: TextStyle(
                        color: Colors.white.withAlpha((255 * 0.8).round()),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Post stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('128', 'Posts'),
              _buildStatItem('2.4K', 'Followers'),
              _buildStatItem('356', 'Following'),
              _buildStatItem('12.5K', 'Likes'),
            ],
          ),

          SizedBox(height: 20),

          // Bio/Description
          Text(
            'Digital creator • Photographer • Travel enthusiast • Exploring the world one photo at a time 📸✨',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 10),

        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withAlpha((255 * 0.8).round()),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget customToolBar() {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        //color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black),
                hintText: "Search inspection here ..",
                hintStyle: TextStyle(
                    color: Colors.white.withAlpha((255 * 0.7).round())),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12, horizontal: 16),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              onPressed: () {
                print('Filter button pressed');
              },
              icon: Icon(Icons.filter_alt, color: Colors.black),
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCardItem(int index, bool isDarkMode) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Stack(
          children: [
          InkWell(
          onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewAppointmentScreen()));},

      child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: blueGradient
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular Avatar with better styling
            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red

                  ),
                  child: Image.asset(
                    "assets/images/car_logo.png", fit: BoxFit.contain,),
                ),
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/vertical_pin.png", fit: BoxFit.scaleDown,
                  height: 60,
                  width: 60,),
              ],

            ),

            SizedBox(width: 16),

            // Content section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name ${index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isDarkMode ? Colors.white : Colors.grey[800],
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    '@username${index + 1}',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.grey[800],
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'This is a detailed description for item number ${index +
                        1}. '
                        'It can contain more information about the user or content.',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.grey[800],
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 12),

                  // Additional info or actions
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '4.${index % 10}',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),

                      SizedBox(width: 16),

                      Icon(Icons.access_time,
                          color: isDarkMode ? Colors.white : Colors.grey[500],
                          size: 16),
                      SizedBox(width: 4),
                      Text(
                        '${index + 1}h ago',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),

                      Spacer(),

                      Icon(
                        Icons.favorite_border,
                        color: isDarkMode ? Colors.white : Colors.grey[500],
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Icon(
              Icons.more_vert,
              color: isDarkMode ? Colors.white : Colors.grey[500],
              size: 20,
            ),
          ],
        ),
      ),
    ),
    ),
    Positioned(bottom: 3, right: 3, top: -8,
    child: Image.asset("assets/images/tire.png", fit: BoxFit.contain,))
    ]
    ),
    );
  }
}