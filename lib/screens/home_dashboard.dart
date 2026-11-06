
import 'package:flutter/material.dart';
import 'package:scholarship_app/utils/app_colors.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  static const blue = Color(0xFF3980F5);
  static const pageGrey = Color(0xFFF0F1F5);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Rianne',
                            style: TextStyle(
                              fontSize: 35,
                              color: blue,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Good morning.',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blue, width: 2.5),
                      ),
                      child: const CircleAvatar(
                        radius: 32,
                        backgroundColor: Color(0xFFE0E5EC),
                        child: Icon(
                          Icons.person,
                          size: 42,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: pageGrey,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(38),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Scholarships for you',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),

                    const ScholarshipCard(
                      name: 'Terry Fox',
                      description:
                          'Terry Fox Award Recipients are eligible to receive the Award until they graduate with their first university degree or diploma...',
                      amount: '\$1,500',
                      deadline: '8/31/2027',
                      logo: 'TERRY\nFOX',
                      logoSubtitle: 'HUMANITARIAN\nAWARD PROGRAM',
                    ),

                    const SizedBox(height: 13),

                    const Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        _category('Athletics'),
                        const SizedBox(width: 10),
                        _category('Financial Need'),
                        const SizedBox(width: 10),
                        Container(
                          width: 38,
                          height: 38,
                          decoration: const BoxDecoration(
                            color: blue,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    const ScholarshipCard(
                      name: 'Schulich Leader',
                      description:
                          'Schulich Leader Scholarships are Canada’s most coveted undergraduate STEM scholarships. One hundred are awarded to entrepreneurial...',
                      amount: '\$1,500',
                      deadline: '10/12/2027',
                      logo: 'SCHULICH\nLEADER',
                      logoSubtitle: 'SCHOLARSHIPS',
                    ),

                    const SizedBox(height: 12),

                    const ScholarshipCard(
                      name: 'Academic Excellence',
                      description:
                          'Recognizing students who demonstrate academic achievement, leadership, and involvement in their communities...',
                      amount: '\$2,000',
                      deadline: '11/15/2027',
                      logo: 'ACADEMIC',
                      logoSubtitle: 'EXCELLENCE AWARD',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _category(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ScholarshipCard extends StatelessWidget {
  final String name;
  final String description;
  final String amount;
  final String deadline;
  final String logo;
  final String logoSubtitle;

  const ScholarshipCard({
    super.key,
    required this.name,
    required this.description,
    required this.amount,
    required this.deadline,
    required this.logo,
    required this.logoSubtitle,
  });

  static const blue = Color(0xFF3980F5);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 80,
                height: 95,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.bookmark,
                        color: blue,
                        size: 21,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            logo,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            logoSubtitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 6,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Award',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      amount,
                      style: const TextStyle(
                        fontSize: 12,
                        color: blue,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deadline',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      deadline,
                      style: const TextStyle(
                        fontSize: 12,
                        color: blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 82,
                height: 37,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Details',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
