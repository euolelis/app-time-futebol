import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatar a data

class HomeScreen extends StatelessWidget {
  final String teamId;
  const HomeScreen({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    // Usaremos dados de exemplo por enquanto. Depois, vamos buscar do Firebase.
    final proximoJogo = {
      'opponent': 'Dragões FC',
      'championship': 'Copa Kids 2024 - Rodada 5',
      'date': DateTime.now().add(const Duration(days: 5, hours: 3)),
      'location': 'Arena Kids - Campo 2',
    };

    return Scaffold(
      // Não precisamos de AppBar aqui, pois criaremos nosso próprio cabeçalho
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- 1. Cabeçalho Visual ---
            _buildHeader(context),

            // --- 2. Card do Próximo Jogo ---
            _buildNextGameCard(context, proximoJogo),

            // --- 3. Grid de Navegação ---
            _buildNavigationGrid(context),
          ],
        ),
      ),
    );
  }

  // Widget para o Cabeçalho
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary, // Vermelho/Vinho
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/moreirassport.jpeg', // Caminho para o seu logo
            height: 100,
          ),
          const SizedBox(height: 16),
          Text(
            "MOREIRA'S SPORT",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary, // Amarelo/Dourado
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // Widget para o Card do Próximo Jogo
  Widget _buildNextGameCard(BuildContext context, Map<String, dynamic> jogo) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PRÓXIMO JOGO',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Moreira\'s', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('VS', style: TextStyle(fontSize: 14, color: Colors.grey)),
              ),
              Text(jogo['opponent'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Center(child: Text(jogo['championship'], style: const TextStyle(color: Colors.grey))),
          const Divider(color: Colors.white24, height: 32),
          _infoRow(Icons.calendar_today, DateFormat('dd/MM/yyyy \'às\' HH:mm').format(jogo['date'])),
          const SizedBox(height: 8),
          _infoRow(Icons.location_on, jogo['location']),
        ],
      ),
    );
  }

  // Helper para as linhas de informação (data, local)
  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 16),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }

  // Widget para o Grid de Navegação
  Widget _buildNavigationGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5, // Ajusta a proporção altura/largura dos botões
      children: [
        _menuGridItem(context, icon: Icons.groups, label: 'Elenco', onTap: () {}),
        _menuGridItem(context, icon: Icons.sports_soccer, label: 'Jogos', onTap: () {}),
        _menuGridItem(context, icon: Icons.bar_chart, label: 'Estatísticas', onTap: () {}),
        _menuGridItem(context, icon: Icons.photo_library, label: 'Galeria', onTap: () {}),
        _menuGridItem(context, icon: Icons.star, label: 'Patrocinadores', onTap: () {}),
        _menuGridItem(context, icon: Icons.admin_panel_settings, label: 'Admin', onTap: () {}),
      ],
    );
  }

  // Helper para cada item do grid
  Widget _menuGridItem(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.secondary),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}