import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _accentColor = Color(0xFF00ACC1);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Mon Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage('assets/moi.jpeg'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Elisabeth Mudahama',
                    textAlign: TextAlign.center,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Professionnelle, autonome et motivée',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            _buildSectionTitle('Profil'),
            _buildCard(
              child: const Text(
                "Professionnelle, autonome et motivée, je démontre une capacité à travailler dans divers environnements et j'apprécie le travail en équipe. Organisée et minutieuse, je planifie les missions qui me sont confiées.",
              ),
            ),
            _buildSectionTitle('Formation'),
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExpItem(
                    'Informatique de gestion des entreprises',
                    'ISIG Goma',
                    'Oct 2024 - Juil 2027',
                  ),
                  const Divider(),
                  _buildExpItem('Anglais', 'CFPI Goma', 'Oct 2024 - Juin 2025'),
                ],
              ),
            ),
            _buildSectionTitle('Expériences professionnelles'),
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExpItem(
                    'Ingénieur son et caissière',
                    'Creative Impact, Goma',
                    'Août 2025 - Présent',
                  ),
                  const Divider(),
                  _buildExpItem(
                    'Dessinatrice',
                    'Academia la Renaissance, Bujumbura',
                    'Mai 2022 - Déc 2023',
                  ),
                ],
              ),
            ),
            _buildSectionTitle('Compétences'),
            _buildCard(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildChip('Systèmes de sonorisation'),
                  _buildChip('Gestion de caisse'),
                  _buildChip('Dessin technique'),
                  _buildChip('Développement d’applications'),
                  _buildChip('Bases de données'),
                ],
              ),
            ),
            _buildSectionTitle('Langues'),
            _buildCard(
              child: Column(
                children: [
                  _buildLanguageItem('Swahili', 1),
                  _buildLanguageItem('Français', 0.8),
                  _buildLanguageItem('Anglais', 0.6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: _accentColor,
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildExpItem(String title, String subtitle, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
          Text(
            date,
            style: const TextStyle(
              color: _accentColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFFE0F7FA),
      side: BorderSide.none,
      labelStyle: const TextStyle(color: Color(0xFF00838F), fontSize: 12),
    );
  }

  Widget _buildLanguageItem(String language, double level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(language)),
          Expanded(
            child: LinearProgressIndicator(
              value: level,
              backgroundColor: Colors.black12,
              color: _accentColor,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
