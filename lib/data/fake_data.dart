class Craftsman {
  const Craftsman({
    required this.id,
    required this.name,
    required this.location,
    required this.phone,
    required this.lastSeen,
    required this.memberSince,
    required this.bio,
    required this.rating,
    required this.reviewCount,
    required this.specialties,
    required this.avatarUrl,
    required this.portfolioUrls,
    required this.ratingDistribution,
  });

  final String id;
  final String name;
  final String location;
  final String phone;
  final String lastSeen;
  final String memberSince;
  final String bio;
  final double rating;
  final int reviewCount;
  final List<String> specialties;
  final String avatarUrl;
  final List<String> portfolioUrls;
  final Map<int, int> ratingDistribution;
}

class UserProfile {
  const UserProfile({
    required this.name,
    required this.memberSince,
    required this.avatarUrl,
    required this.reservations,
  });

  final String name;
  final String memberSince;
  final String avatarUrl;
  final List<Reservation> reservations;
}

class Reservation {
  const Reservation({required this.craftsman, required this.dateTime});

  final Craftsman craftsman;
  final String dateTime;
}

const _bio =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
    'nisi ut aliquip ex ea commodo consequat.';

const fakeCraftsmen = [
  Craftsman(
    id: '1',
    name: 'Klaus Van Der Stein',
    location: 'Onex, Genève',
    phone: '+41 22 756 43 21',
    lastSeen: '10 minutes ago',
    memberSince: 'Mar. 2023',
    bio: _bio,
    rating: 4.3,
    reviewCount: 45,
    specialties: ['Woodworking', 'Electricity'],
    avatarUrl:
        'https://images.unsplash.com/photo-1564429238961-bf8bb78af776?w=400&h=400&fit=crop',
    portfolioUrls: [
      'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1504148455328-c376907d081c?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1581858726788-75bc0f6a952d?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1513694203232-719a280e022f?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1540518614846-7eded433c457?w=400&h=300&fit=crop',
    ],
    ratingDistribution: {1: 2, 2: 1, 3: 5, 4: 15, 5: 22},
  ),
  Craftsman(
    id: '2',
    name: 'Gérard Lambert',
    location: 'Carouge, Genève',
    phone: '+41 22 889 65 42',
    lastSeen: '2 days ago',
    memberSince: 'Aug. 2024',
    bio: _bio,
    rating: 4.7,
    reviewCount: 13,
    specialties: ['Plumbing', 'Appliances', 'Bicycles'],
    avatarUrl:
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400&h=400&fit=crop',
    portfolioUrls: [
      'https://images.unsplash.com/photo-1585704032915-c3400ca199e7?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1556909172-54557c7e4fb7?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=400&h=300&fit=crop',
    ],
    ratingDistribution: {1: 0, 2: 0, 3: 1, 4: 4, 5: 8},
  ),
  Craftsman(
    id: '3',
    name: 'Nikata Solomné',
    location: 'Satigny, Genève',
    phone: '+41 22 341 98 76',
    lastSeen: '1 week ago',
    memberSince: 'Jan. 2025',
    bio: _bio,
    rating: 5.0,
    reviewCount: 2,
    specialties: ['Furniture', 'Heating'],
    avatarUrl:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
    portfolioUrls: [
      'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1538688525198-9b88f6f53126?w=400&h=300&fit=crop',
    ],
    ratingDistribution: {1: 0, 2: 0, 3: 0, 4: 0, 5: 2},
  ),
  Craftsman(
    id: '4',
    name: 'Amélie Fontaine',
    location: 'Lancy, Genève',
    phone: '+41 22 412 67 89',
    lastSeen: '3 hours ago',
    memberSince: 'Jun. 2022',
    bio:
        'Spécialiste en réparation électroménager depuis plus de 15 ans. '
        'Passionnée par la lutte contre l\'obsolescence programmée. '
        'Je répare tout type d\'appareil avec des pièces de qualité.',
    rating: 4.9,
    reviewCount: 87,
    specialties: ['Appliances', 'Electrical', 'Locks'],
    avatarUrl:
        'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=400&h=400&fit=crop',
    portfolioUrls: [
      'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1540518614846-7eded433c457?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1556909172-54557c7e4fb7?w=400&h=300&fit=crop',
    ],
    ratingDistribution: {1: 0, 2: 1, 3: 3, 4: 12, 5: 71},
  ),
];

final fakeUser = UserProfile(
  name: 'Lucas Sinclair',
  memberSince: 'Sep. 2022',
  avatarUrl:
      'https://images.unsplash.com/photo-1519345182560-3f2917c472ef?w=400&h=400&fit=crop',
  reservations: [
    Reservation(
      craftsman: fakeCraftsmen[1],
      dateTime: 'Monday September 16th at 15h00',
    ),
    Reservation(
      craftsman: fakeCraftsmen[3],
      dateTime: 'Wednesday October 2nd at 10h30',
    ),
  ],
);
