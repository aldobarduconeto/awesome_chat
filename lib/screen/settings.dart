import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = true;
  String selectedStatus = 'Online';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Perfil do usuário
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue[400],
                    child: const Text(
                      'U',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Usuário',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'usuario@example.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Editando perfil...'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: const Text('Editar Perfil'),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Configurações de notificações
            ListTile(
              title: const Text('Notificações'),
              subtitle: const Text('Gerenciar notificações de chats'),
              trailing: Switch(
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ),
            const Divider(),
            // Status online
            ListTile(
              title: const Text('Status'),
              subtitle: Text('Atual: $selectedStatus'),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('Online'),
                          leading: const Icon(Icons.circle, color: Colors.green),
                          onTap: () {
                            setState(() {
                              selectedStatus = 'Online';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Ausente'),
                          leading: const Icon(Icons.circle, color: Colors.orange),
                          onTap: () {
                            setState(() {
                              selectedStatus = 'Ausente';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Não Disponível'),
                          leading: const Icon(Icons.circle, color: Colors.red),
                          onTap: () {
                            setState(() {
                              selectedStatus = 'Não Disponível';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Divider(),
            // Modo escuro
            ListTile(
              title: const Text('Modo Escuro'),
              subtitle: const Text('Aparência do aplicativo'),
              trailing: Switch(
                value: darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    darkModeEnabled = value;
                  });
                },
              ),
            ),
            const Divider(),
            // Privacidade
            ListTile(
              title: const Text('Privacidade'),
              subtitle: const Text('Gerenciar privacidade e bloqueios'),
              leading: const Icon(Icons.lock),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Abrindo configurações de privacidade...'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
            const Divider(),
            // Armazenamento
            ListTile(
              title: const Text('Armazenamento'),
              subtitle: const Text('Gerenciar arquivos e mídia'),
              leading: const Icon(Icons.storage),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Abrindo gerenciador de armazenamento...'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
            const Divider(),
            // Sobre
            ListTile(
              title: const Text('Sobre'),
              subtitle: const Text('Versão do aplicativo'),
              leading: const Icon(Icons.info),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Sobre Awesome Chat'),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Versão: 1.0.0'),
                          SizedBox(height: 8),
                          Text('Um aplicativo moderno de chat em tempo real'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Divider(),
            // Logout
            ListTile(
              title: const Text('Sair'),
              leading: const Icon(Icons.logout, color: Colors.red),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Sair'),
                      content: const Text('Tem certeza que deseja sair?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Saindo do aplicativo...'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: const Text('Sair', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
