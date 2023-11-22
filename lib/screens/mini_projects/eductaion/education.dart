import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/consts/data.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';


class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentState>(
      builder: (context, currentState, _) {
        return Scaffold(
          backgroundColor: currentState.isDarkMode
              ? const Color(0xFF1B1C16)
              : Colors.white,
          body: ListView(
            children: [
              Center(
                child: Icon(
                  Icons.school,
                  color: currentState.isDarkMode
                      ? const Color(0xFFC7C8B9)
                      : const Color(0xFF1B1C16),
                  size: 100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...List.generate(education.length, (index) {
                JobExperience experience = education[index];
                return ExpansionTile(
                  tilePadding: const EdgeInsets.all(20),
                  childrenPadding: const EdgeInsets.all(10),
                  leading: Container(
                    width: 2,
                    height: 100,
                    color: experience.color,
                  ),
                  title: Text(
                    experience.title,
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold,
                      color: currentState.isDarkMode
                          ? const Color(0xFFC7C8B9)
                          : const Color(0xFF1B1C16),),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      '${experience.company}\n${experience.startDate} - ${experience.endDate} | ${experience.location}',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: currentState.isDarkMode
                            ? const Color(0xFFC7C8B9)
                            : const Color(0xFF1B1C16),
                      ),
                    ),
                  ),
                  children: experience.bulletPoints.map((bulletPoint) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                      title: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: currentState.isDarkMode
                                  ? const Color(0xFFC7C8B9)
                                  : const Color(0xFF1B1C16),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              bulletPoint,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: currentState.isDarkMode
                                    ? const Color(0xFFEDEEE4)
                                    : const Color(0xFF1B1C16),
                              ),
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
