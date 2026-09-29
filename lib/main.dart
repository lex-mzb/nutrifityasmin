import 'package:flutter/material.dart';

void main() {
  runApp(const NutriFitApp());
}

class NutriFitApp extends StatelessWidget {
  const NutriFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriFit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          primary: const Color(0xFF2E7D32),
          secondary: const Color(0xFF4CAF50),
          surface: const Color(0xFFF4F7F4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7F4),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class ServiceItem {
  final String title;
  final IconData icon;
  final String description;

  const ServiceItem({
    required this.title,
    required this.icon,
    required this.description,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<ServiceItem> services = const [
    ServiceItem(
      title: 'Consulta Nutricional',
      icon: Icons.medical_services_outlined,
      description: 'Avaliação completa do seu perfil e hábitos alimentares.',
    ),
    ServiceItem(
      title: 'Plano Alimentar Personalizado',
      icon: Icons.restaurant_menu_rounded,
      description: 'Cardápios sob medida alinhados aos seus objetivos.',
    ),
    ServiceItem(
      title: 'Acompanhamento Semanal',
      icon: Icons.calendar_month_rounded,
      description: 'Suporte constante para manter sua motivação e foco.',
    ),
    ServiceItem(
      title: 'Bioimpedância',
      icon: Icons.monitor_weight_outlined,
      description: 'Análise detalhada de massa magra, gordura e hidratação.',
    ),
    ServiceItem(
      title: 'Receitas Fit',
      icon: Icons.menu_book_rounded,
      description: 'Opções saudáveis, práticas e saborosas para o dia a dia.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 1. Top Bar / Visual Brand Identity Header (using Stack, Positioned, Row, Container)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Decorative background accent using Positioned
                  Positioned(
                    right: -10,
                    top: -10,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32).withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  // Brand Visual Representation (Logo + Name)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Visual Symbol / Logo Icon Container
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E7D32),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x332E7D32),
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.eco_rounded,
                              color: Colors.white,
                              size: 26,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Brand Typography using Row
                      const Row(
                        children: [
                          Text(
                            'Nutri',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B5E20),
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            'Fit',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4CAF50),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Main Content Area using Column and Expanded ListView.builder
            Expanded(
              child: Column(
                children: [
                  // 2. Dish Image & Positioning Tagline Section (Container, Stack, Positioned, Image, Column, Row)
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x12000000),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Stack for Dish Image and Floating Badge using Positioned
                        Stack(
                          children: [
                            // Dish Image
                            Container(
                              height: 190,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&auto=format&fit=crop&q=80',
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      color: const Color(0xFFE8F5E9),
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xFF2E7D32),
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: const Color(0xFFE8F5E9),
                                      child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.restaurant_rounded,
                                            size: 48,
                                            color: Color(0xFF2E7D32),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'NutriFit Gastronomia Saudável',
                                            style: TextStyle(
                                              color: Color(0xFF1B5E20),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            // Floating Tagline Badge on top of image using Positioned
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2E7D32),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '100% Natural & Saudável',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Positioning Tagline Text Container
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.format_quote_rounded,
                                    color: Color(0xFF2E7D32),
                                    size: 24,
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      'Sua jornada para uma vida mais saudável começa no prato.',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1B5E20),
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Comida de verdade, preparada com cuidado para transformar a sua rotina com saúde, equilíbrio e sabor.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Services Header Container
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.verified_outlined,
                              color: Color(0xFF2E7D32),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Nossos Serviços',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1B5E20),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: const Text(
                            '5 Serviços',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2E7D32),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 3. ListView.builder for Services
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFE0EAE0),
                              width: 1,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0A000000),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Icon container using Container
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8F5E9),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Icon(
                                    service.icon,
                                    color: const Color(0xFF2E7D32),
                                    size: 24,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),

                              // Text details using Column
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      service.title,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF122C15),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      service.description,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        height: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 8),

                              // Trailing arrow indicator inside Container
                              Container(
                                width: 28,
                                height: 28,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF4F7F4),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Color(0xFF2E7D32),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
