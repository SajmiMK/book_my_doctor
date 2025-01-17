import 'package:book_my_doc/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () async {
                // Clear session and navigate to Login Page
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          'assets/images/jas.jpg'), // Replace with your image path
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' HI, Mohamed',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'How are you today?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Search Bar
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search for 'Doctor'",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                const SizedBox(height: 20),

                // Welcome Text
                const Text(
                  ' Our Services',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Two Equal-size Buttons with Icons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Action for button 1
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.home, size: 30), // Icon first
                            SizedBox(height: 10),
                            Text(
                              'Clinic Appointment',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ), // Text below
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16), // Space between buttons
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Action for button 2
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.home_max_outlined,
                                size: 30), // Icon first
                            SizedBox(height: 10),
                            Text(
                              'Online Appointment',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ), // Text below
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Offers Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Offers',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to all offers
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200, // Height of the horizontal list
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildOfferCard(
                        title: 'Hello Doctor!',
                        description:
                            'Exclusive offer for medical professionals.Get discounts on medical equipment.',
                      ),
                      const SizedBox(width: 10),
                      buildOfferCard(
                        title: 'Hello Doctor!',
                        description:
                            'Save big on health and fitness products.\nLimited time offer!',
                      ),
                      const SizedBox(width: 10),
                      buildOfferCard(
                        title: 'Premium Services!',
                        description:
                            'Sign up for premium and get exclusive\nhealth benefits.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Categories Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to all offers
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    buildCategoryButton(Icons.heart_broken, 'Cardiology'),
                    buildCategoryButton(Icons.lightbulb_outlined, ' Neurology'),
                    buildCategoryButton(Icons.health_and_safety, 'Dermatology'),
                    buildCategoryButton(Icons.person, 'Pulmonology'),
                    buildCategoryButton(Icons.spa, 'Surgery'),
                    buildCategoryButton(Icons.thermostat_auto, 'Nephrology'),
                  ],
                ),
                const SizedBox(height: 30),

                // Top Doctors Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Top Doctors',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to all offers
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // List of Doctor Cards
                Column(
                  children: [
                    buildDoctorCard(
                      profileImage: 'book_my_doc_v2/assets/images/d1.jpg',
                      name: 'Dr. Samira Ali',
                      specialization: 'Dermatologist',
                      location: 'Zamalek-Mohandessin',
                      rating: '4.8',
                      note: '(1987 Reviews)',
                    ),
                    const SizedBox(height: 10),
                    buildDoctorCard(
                      profileImage: 'assets/doctor2.png',
                      name: 'Dr. Hassan Mahmoud',
                      specialization: 'Orthopedic Surgeon',
                      location: 'New Cairo-Nasr City',
                      rating: '4.7',
                      note: '(1756 Reviews)',
                    ),
                    const SizedBox(height: 10),
                    buildDoctorCard(
                      profileImage: 'assets/doctor3.png',
                      name: 'Dr. Ahmed Khan',
                      specialization: 'Cardiologist',
                      location: 'Giza-Dokki-Maadi',
                      rating: '4.9',
                      note: '(2435 Reviews)',
                    ),
                    const SizedBox(height: 10),
                    buildDoctorCard(
                      profileImage: 'assets/doctor4.png',
                      name: 'Dr. Omar Khalefa',
                      specialization: 'Pediatrician',
                      location: '6th of October City',
                      rating: '4.9',
                      note: '(2150 Reviews)',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create category buttons
  Widget buildCategoryButton(IconData icon, String label) {
    return ElevatedButton(
      onPressed: () {
        // Action for category button
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        backgroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create offer cards
  Widget buildOfferCard({required String title, required String description}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Action for Get Offer
              },
              child: const Text('Get Offer'),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 8)),
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create doctor cards
  Widget buildDoctorCard({
    required String profileImage,
    required String name,
    required String specialization,
    required String location,
    required String rating,
    required String note,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(profileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    specialization,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 14, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.yellow[700]),
                      const SizedBox(width: 5),
                      Text(
                        '$rating',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    note,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
