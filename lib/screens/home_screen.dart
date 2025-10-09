import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_futebol_app/providers/user_data_provider.dart';
import 'package:time_futebol_app/services/auth_service.dart';
import 'package:time_futebol_app/services/database_seeder.dart';
import 'package:time_futebol_app/screens/categorias_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _signOut(BuildContext context) async {
    final authService = AuthService();
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<UserDataProvider>(context).usuario;
    final bool isAdmin = usuario?.role == 'admin';

    return Scaffold(
      // ===================================================================
      // A CORREÇÃO ESTÁ AQUI DENTRO DA APPBAR
      // ===================================================================
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("MOREIRA'S SPORT"),
        centerTitle: true,
        actions: [
          // Botão para popular o banco (só para admin)
          if (isAdmin)
            IconButton(
              icon: const Icon(Icons.data_saver_on),
              tooltip: 'Popular Banco',
              onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Popular Banco de Dados?'),
                    content: const Text('Isso irá adicionar dados de teste. Deseja continuar?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
                      TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Confirmar')),
                    ],
                  ),
                );
                if (confirm == true && context.mounted) {
                  await DatabaseSeeder().seedInitialData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Banco de dados populado com sucesso!')),
                  );
                }
              },
            ),
          
          // Botão de Sair (Logout)
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      // ===================================================================
      // FIM DA CORREÇÃO
      // ===================================================================
      floatingActionButton: isAdmin
          ? FloatingActionButton.extended(
              onPressed: () {
                // TODO: Navegar para a tela de gerenciamento
              },
              label: const Text('Gerenciar'),
              icon: const Icon(Icons.settings),
              backgroundColor: Colors.amber,
              foregroundColor: const Color(0xFF4A0404),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildHomeButton(
              context,
              icon: Icons.people_outline,
              label: 'ELENCO',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoriasScreen()),
                );
              },
            ),
            _buildHomeButton(context, icon: Icons.calendar_today_outlined, label: 'JOGOS', onTap: () {}),
            _buildHomeButton(context, icon: Icons.bar_chart_outlined, label: 'ESTATÍSTICAS', onTap: () {}),
            _buildHomeButton(context, icon: Icons.handshake_outlined, label: 'PATROCINADORES', onTap: () {}),
            _buildHomeButton(context, icon: Icons.photo_library_outlined, label: 'GALERIA', onTap: () {}),
            _buildHomeButton(context, icon: Icons.play_circle_outline, label: 'VÍDEOS', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeButton(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.amber.withAlpha(128)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.amber),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}