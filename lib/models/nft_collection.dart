
// Add these to your NFTCollection model
class NFTCollection1 {
  final String name;
  final List<NFTItem1> items;
  // ... other properties

  NFTCollection1({
    required this.name,
    required this.items,
    // ... other parameters
  });
}

class NFTItem1 {
  final String id;
  final String imagePath;
  final double price;
  final double change;

  NFTItem1({
    required this.id,
    required this.imagePath,
    required this.price,
    required this.change,
  });
}

NFTCollection1 myCollection = NFTCollection1(
  name: 'CryptoArt',
  items: [
    NFTItem1(id: 'CryptoPunk #001', imagePath: 'assets/images/bid_1.png', price: 0.75, change: 5.3),
    NFTItem1(id: 'CryptoPunk #002', imagePath: 'assets/images/bid_2.png', price: 0.85, change: -3.2),
    // Add more items as needed
  ],
);

