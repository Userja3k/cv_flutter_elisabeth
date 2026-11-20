import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchUrl(BuildContext context, Uri uri) async {
    try {
      final launched = await launchUrl(uri);
      if (!launched && context.mounted) {
        _showLaunchError(context);
      }
    } on PlatformException {
      if (context.mounted) {
        _showLaunchError(context);
      }
    }
  }

  void _showLaunchError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Impossible d’ouvrir ce lien.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contactez-moi')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF00ACC1),
              child: Icon(Icons.contact_mail, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 28),
          _buildContactTile(
            icon: Icons.phone,
            title: 'Téléphone',
            subtitle: '+243 974 522 797',
            onTap: () =>
                _launchUrl(context, Uri(scheme: 'tel', path: '+243974522797')),
          ),
          _buildContactTile(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'mudahamaelisabeth@gmail.com',
            onTap: () => _launchUrl(
              context,
              Uri(scheme: 'mailto', path: 'mudahamaelisabeth@gmail.com'),
            ),
          ),
          _buildContactTile(
            icon: Icons.location_on,
            title: 'Adresse',
            subtitle: 'Q. Himbi 1, C. Goma, Nord-Kivu, RDC',
            onTap: () => _launchUrl(
              context,
              Uri.https('maps.google.com', '/', {'q': 'Goma,Nord-Kivu,RDC'}),
            ),
          ),
          _buildContactTile(
            icon: Icons.link,
            title: 'LinkedIn',
            subtitle: 'Elisabeth Mudahama',
            onTap: () =>
                _launchUrl(context, Uri.https('www.linkedin.com', '/')),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F7FA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF00ACC1)),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
